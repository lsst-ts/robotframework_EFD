#!/usr/bin/env python

import typing
import asyncio
import pandas
import re
import math
import time
import datetime
from typing import Any
from utils import dataframe
from utils import state_enums
from utils import csc_lists
from utils import config_applied_event_subset

from robot.api.deco import library, keyword, not_keyword
from lsst_efd_client import EfdClient


@library(scope="GLOBAL", version="0.1", doc_format="reST", auto_keywords=False)
class QueryEfd:
    """Define the Keywords used to query the EFD to verify the integration
    tests. This library is a wrapper of the lsst_efd_client to convert
    those methods into Robot-Framework Keywords.

    Attributes
    ----------
    tai_offset : `int`
        Defines the offset, in seconds, between UTC and TAI.
    INDEX_DELIM : `str`
        Defines the delimiter used in specifying indexed CSCs.
    time_format : `str`
        Defines the format for time strings.
    version_regex : `str`
        Defines the Regular Expression for the software versions.
        Starts from the Semantic Version definition, but allows for
        slight deviations to accommodate Conda versioning standards.
    pattern : `re.Pattern`
        Converts version_regex string to an re.Pattern object.
        This is used for the actual version validation.

    Notes
    -----
    The lsst_efd_client is defined in
    https://github.com/lsst-sqre/lsst-efd-client

    The integration tests are defined in
    https://github.com/lsst-ts/ts_IntegrationTests
    """

    tai_offset: int = 37
    INDEX_DELIM: str = ":"
    time_format: str = "%Y-%m-%dT%H:%M:%S.%f"
    version_regex = "".join(
        [
            "^v?(0|[1-9]\d*)\.(0|[1-9]\d*)\.(0|[1-9]\d*)",
            "(?:[.-]?((?:0|[1-9]\d*|\d*[a-zA-Z-][0-9a-zA-Z-]*)",
            "(?:\.(?:0|[1-9]\d*|\d*[a-zA-Z-][0-9a-zA-Z-]*))*))?",
            "(?:\+([0-9a-zA-Z-]+(?:\.[0-9a-zA-Z-]+)*))?$",
        ]
    )
    pattern = re.compile(version_regex)

    def __init__(
        self,
        salver: str,
        xmlver: str,
        osplver: str,
        efd_name: str = "tucson_teststand_efd",
    ) -> None:
        """
        Parameters
        ----------
        efd_name : `str`
            The name of the EFD instance (default is tucson_teststand_efd).
        salver : `str`
            The SAL version.
        xmlver : `str`
            The XML version.
        osplver : `str`
            The OSPL version.
        """
        self.efd_name = efd_name
        self.sal_version = salver
        self.xml_version = xmlver
        self.ospl_version = osplver

    @keyword
    def get_efd_names(self) -> list:
        """Return the set of EFD names.

        Returns
        -------
        efd_list : `list`
        """
        efd_client = EfdClient(self.efd_name)
        efd_list = efd_client.list_efd_names()
        return efd_list

    @keyword
    def get_efd_topics(self) -> list:
        """Returns the set of all topics in the EFD.

        Returns
        -------
        topics_list : `list`
        """
        efd_client = EfdClient(self.efd_name)
        loop = asyncio.get_event_loop()
        topics_list = loop.run_until_complete(efd_client.get_topics())
        return topics_list

    @keyword
    def get_topic_fields(self, csc: str, topic: str) -> list:
        """Returns the field list for the given CSC and Topic.

        Parameters
        ----------
        csc : `str`
            The name of the CSC.
        topic : `str`
            The name of the topic of which to get the field list.

        Returns
        -------
        fields : `list`
            The list of fields for the given topic.

        Notes
        -----
        This function calls the topic_name function to construct the
        fully-qualified topic name.
        """
        efd_client = EfdClient(self.efd_name)
        loop = asyncio.get_event_loop()
        fields = loop.run_until_complete(
            efd_client.get_fields(topic_name=self._efd_topic(csc, topic))
        )
        return fields

    @keyword
    def get_topic_sent_time(self, csc: str, topic: str) -> str:
        """Returns the most recent published time of the given topic.

        Parameters
        ----------
        csc : `str`
            The name of the CSC.
        topic : `str`
            The name of the topic.

        Returns
        -------
        event_sent_time : `str`
            The event time in the Class-defined time_format.
        """
        csc, index = self._split_indexed_csc(csc)
        # Since this is only returning the most recent sent time of the
        # givent topic, only the private_sndStamp field is needed.
        fields = "private_sndStamp"
        num = 1
        recent_samples = self.get_recent_samples(
            csc=csc, topic=topic, fields=fields, num=num, index=index
        )
        try:
            event_sent_time = recent_samples.private_sndStamp.iloc[0]
        except AttributeError:
            raise AttributeError(
                "'DataFrame' object has no attribute 'private_sndStamp'"
            )
        return event_sent_time

    @keyword
    def get_recent_samples(
        self, csc: str, topic: str, fields: list, num: int, index=None
    ) -> pandas.core.frame.DataFrame:
        """Returns the <num> most recent samples of the given topic and
        fields for the given CSC.

        Parameters
        ----------
        csc : `str`
            The name of the CSC.
        topic : `str`
            The name of the topic of which to get the field list.
        fields : `list`
            The list of fields for the given topic.
        num : `int`
            The number of recent samples to return.
        index : `int`
            The index of the CSC, if applicable (default is None).

        Returns
        -------
        recent_samples : `pandas.core.frame.DataFrame`
            The DataFrame of the most recent samples.
        """
        efd_client = EfdClient(self.efd_name)
        loop = asyncio.get_event_loop()
        recent_samples = loop.run_until_complete(
            efd_client.select_top_n(
                topic_name=self._efd_topic(csc, topic),
                fields=fields,
                num=num,
                index=index,
            )
        )
        # If the DataFrame has the private_sndStamp field,
        # convert it to the Class-defined time_format.
        if hasattr(recent_samples, "private_sndStamp"):
            recent_samples = dataframe.convert_timestamps(
                recent_samples, ["private_sndStamp"]
            )
        return recent_samples

    @keyword
    def verify_version(self, version: str) -> None:
        """Fails if the version does not conform to SemVer syntax.
        The version_regex is defined as a Class attribute.

        Parameters
        ----------
        version : `str`
            The version string.
        """
        if not self.pattern.match(version):
            raise AssertionError(f"Version '{version}' is not SemVer compliant.")

    @keyword
    def verify_summary_state(
        self, expected_state: int, csc_str: str, auto_enable: bool = False
    ) -> None:
        """Fails if the current State of the CSC does not match the
        expected_state.

        Parameters
        ----------
        expected_state : `int`
            The numeric value of the expected State.
            The choices are
            1 (disabled), 2 (enabled), 3 (fault),
            4 (offline), 5 (standby)
        csc_str : `str`
            The string consisting of the CSC name and
            index, if applicable, in the form CSC:INDEX.
        auto_enable : `bool`
            Indicate if the CSC is auto-enabled (default is False).
        """
        # Ensure the expected_state is an integer.
        if not isinstance(expected_state, int):
            raise TypeError("Expected State must be an integer.")
        csc, index = self._split_indexed_csc(csc_str)
        # Auto-Enabled CSCs automatically go into the Enabled State,
        # MTAirCompressors automatically go into the Disabled State,
        # remaining CSCs go through States manually.
        # As such, grab the 3 most recent samples and define the
        # row index, in order to properly test the SummaryState.
        full_df = self.get_recent_samples(
            csc,
            "logevent_summaryState",
            [
                "private_sndStamp",
                "summaryState",
            ],
            3,
            index,
        )
        # Log the full dataframe.
        print(f"*TRACE*dataframe:\n{full_df}")
        # Which row of the DataFrame is needed depends on the expected_state.
        if auto_enable and csc != "MTAirCompressor" and expected_state != 1:
            row_index = 2
        elif auto_enable and csc != "MTAirCompressor" and expected_state == 1:
            row_index = 1
        elif auto_enable and csc == "MTAirCompressor" and expected_state == 5:
            row_index = 1
        else:
            row_index = 0
        ss_df = full_df.iloc[[row_index]]
        # Log dataframe.
        print(f"*TRACE*dataframe:\n{ss_df}")
        if not self._check_attribute(ss_df, "summaryState"):
            raise AttributeError("SummaryState Event Not Found.")
        # Get the States.
        expected_state_str = state_enums.as_state(int(expected_state)).name
        actual_state_str = state_enums.as_state(int(ss_df.summaryState.iloc[0])).name
        event_sent_time = ss_df.private_sndStamp.iloc[0].strftime(self.time_format)
        # Pass if CSC is in expected_state and raise AssertionError if not.
        if str(actual_state_str) == str(expected_state_str):
            print(f"{csc_str} in {expected_state_str} State")
            print(f"Time of Summary State: {event_sent_time}")
        else:
            raise AssertionError(
                f"{csc_str} is not in the {expected_state_str} state."
                f"\n{csc_str} is in the {actual_state_str} state."
            )

    @keyword
    def verify_shutdown_process(self, csc: str, index: int = None) -> None:
        """Fails if the sequence of SummaryStates does not match
        the expected sequence.

        Parameters
        ----------
        csc : `str`
            The name of the CSC.
        index : `int`
            The index of the CSC, if applicable (default is None).
        """
        # Define the expected shutdown sequence.
        # NOTE: The EFD returns data in descending time order,
        # so the sequence is "reversed."
        shutdown_sequence = [
            "offline",
            "standby",
            "disabled",
            "enabled",
        ]
        # Get the last four SummaryState events.
        fields = [
            "private_sndStamp",
            "summaryState",
        ]
        dataframe = self.get_recent_samples(
            csc, "logevent_summaryState", fields, 4, index
        )
        print(f"*TRACE*dataframe:\n{dataframe}")
        if dataframe.empty:
            raise ValueError("Dataframe is empty")
        # Get the sequence of summaryStates and convert
        # the list to human-readable for the error message.
        states = [
            state_enums.as_state(x).name.lower() for x in dataframe.summaryState.values
        ]
        # Assert lists are equal.
        print(
            f"*TRACE*The SummaryState sequence: {states} should match {shutdown_sequence}"
        )
        if states != shutdown_sequence:
            raise AssertionError(
                f"Incorrect Shutdown Order: {states} does not match {shutdown_sequence}"
            )

    @keyword
    def verify_configuration_applied(self, csc: str, index: int = None) -> None:
        """Fails if additional configuration events were not published.

        Parameters
        ----------
        csc : `str`
            The name of the CSC.
        index : `int`
            The index of the CSC, if applicable (default is None).
        """
        ca_topic = "logevent_configurationApplied"
        ca_fields = [
            "private_sndStamp",
            "configurations",
            "version",
            "url",
            "otherInfo",
        ]
        dataframe = self.get_recent_samples(csc, ca_topic, ca_fields, 1, index)
        print(f"*TRACE*dataframe:\n{dataframe}")
        # If the CSC is non-configurable, the ConfigurationApplied event
        # is not applicable.
        if csc in csc_lists.non_config:
            if not dataframe.empty:
                raise ValueError("Dataframe should be empty")
        else:
            # Get the various field values.
            configurations = dataframe.configurations.iloc[0]
            version = dataframe.version.iloc[0].strip("tags/")
            url = dataframe.url.iloc[0]
            print(
                f"*TRACE*Configurations: {configurations}, Version: {version}, URL: {url}"
            )
            # Test the field values, as much as possible.
            error_list = []
            if not configurations:
                error_list.append("The configuration field should not be empty.")
            if not version:
                error_list.append("The version field should not be empty.")
            if "https://" not in str(url) and "file://" not in str(url):
                error_list.append(
                    f"The url should start with 'https://' or 'file://' - URL: {url}"
                )
            # Test that the configurable CSCs published the additional set
            # of events, as defined in the otherInfo field of the
            # ConfigurationApplied event.
            try:
                self.verify_version(version)
            except AssertionError as e:
                error_list.append("Config " + str(e))
            if len(dataframe.otherInfo.iloc[0]) > 0:
                events = dataframe.otherInfo.iloc[0].split(",")
                for event in events:
                    if (
                        csc.lower() in ("atcamera", "cccamera", "mtcamera")
                        and self.efd_name != "summit_efd"
                        and event
                        not in config_applied_event_subset.config_applied_subset
                    ):
                        # The ATCamera, CCCamera and MTCamera CSCs only send a subset of the
                        # total number of configurationApplied.otherInfo Events for the test stands.
                        # Ignore the Events that are not expected.
                        pass
                    else:
                        # Only make this query if the Event is expected.
                        fq_event = "logevent_" + event
                        event_df = self.get_recent_samples(csc, fq_event, "*", 1, index)
                        if event_df.empty:
                            error_list.append(
                                f"Expected Event {event} was not published."
                            )
            # If any errors raised, print them all.
            if len(error_list) > 0:
                raise AssertionError("\n".join(error_list))

    @keyword
    def verify_configurations_available(self, csc: str, index: int = None) -> None:
        """Fails if ConfigurationsAvailable event was not published properly.

        Parameters
        ----------
        csc : `str`
            The name of the CSC.
        index : `int`
            The index of the CSC, if applicable (default is None).
        """
        cav_topic = "logevent_configurationsAvailable"
        cav_fields = [
            "private_sndStamp",
            "overrides",
            "version",
            "url",
            "schemaVersion",
        ]
        dataframe = self.get_recent_samples(csc, cav_topic, cav_fields, 1, index)
        print(f"*TRACE*dataframe:\n{dataframe}")
        if csc in csc_lists.non_config:
            if not dataframe.empty:
                raise ValueError("Dataframe should be empty")
        else:
            # Get the various field values.
            version = dataframe.version.iloc[0].strip("tags/")
            url = dataframe.url.iloc[0]
            schema_version = dataframe.schemaVersion.iloc[0]
            overrides = dataframe.overrides.iloc[0]
            # Verify field values.
            print(
                f"*TRACE*Overrides: '{overrides}', Version: '{version}', URL: '{url}', SchemaVersion: '{schema_version}'"
            )
            error_list = []
            if not schema_version:
                error_list.append("The schemaVersion field should not be empty.")
            if "https://" not in str(url) and "file://" not in str(url):
                error_list.append(
                    f"The url should start with 'https://' or 'file://' - URL: {url}"
                )
            try:
                self.verify_version(version)
            except AssertionError as e:
                error_list.append("Config " + str(e))
            # The Camera CSCs handle schemaVersion uniquely, so skip those tests.
            if csc not in csc_lists.camera:
                schema_version_expected = url.split("/")[-1]
                if schema_version != schema_version_expected:
                    raise AssertionError(
                        f"The schemaVersion '{schema_version}' does not match the expected value '{schema_version_expected}'"
                    )
            # If any errors raised, print them all.
            if len(error_list) > 0:
                raise AssertionError("\n".join(error_list))

    @keyword
    def verify_software_versions(
        self,
        csc: str,
        index: int = None,
        csc_salver: str = None,
        csc_xmlver: str = None,
    ) -> None:
        """Fails if the dependency versions used to build the package
        do not match the expected versions.

        Parameters
        ----------
        csc : `str`
            The name of the CSC.
        index : `int`
            The index of the CSC, if applicable (default is None).
        csc_salver : `str`
            OPTIONAL: The SAL version used to build the CSC. Only needed if different from the default value.
        csc_xmlver : `str`
            OPTIONAL: The XML version used to build the CSC. Only needed if different from the default value.
        """
        if csc_salver is None:
            csc_salver = self.sal_version
        if csc_xmlver is None:
            csc_xmlver = self.xml_version
        swv_topic = "logevent_softwareVersions"
        swv_fields = [
            "private_sndStamp",
            "cscVersion",
            "openSpliceVersion",
            "salVersion",
            "xmlVersion",
        ]
        dataframe = self.get_recent_samples(csc, swv_topic, swv_fields, 1, index)
        print(f"*TRACE*dataframe:\n{dataframe}")
        if dataframe.empty:
            raise ValueError("Dataframe is empty")
        # Get the dependency versions.
        sal_ver = dataframe.salVersion.iloc[0]
        xml_ver = dataframe.xmlVersion.iloc[0]
        ospl_ver = dataframe.openSpliceVersion.iloc[0]
        csc_ver = dataframe.cscVersion.iloc[0]
        print(
            f"*TRACE*Expected: SALVersion: {csc_salver}, XMLVersion: {csc_xmlver}, OSPLVersion: {self.ospl_version}",
            f"\n  Actual: SALVersion: {sal_ver}, XMLVersion: {xml_ver}, OSPLVersion: {ospl_ver}, CSCVersion: {csc_ver}",
        )
        # Test the various versions, collect error messages in a list,
        # and print out all errors, if present.
        error_list = []
        if sal_ver != csc_salver:
            error_list.append(f"Bad SAL Version: {sal_ver}")
        if xml_ver != csc_xmlver:
            error_list.append(f"Bad XML Version: {xml_ver}")
        if ospl_ver != self.ospl_version:
            error_list.append(f"Bad OSPL Version: {ospl_ver}")
        if not csc_ver:
            error_list.append("CSC version cannot be blank.")
        try:
            self.verify_version(csc_ver)
        except AssertionError as e:
            error_list.append("CSC " + str(e))
        # If any errors raised, print them all.
        if len(error_list) > 0:
            raise AssertionError("\n".join(error_list))

    @keyword
    def verify_topic_attribute(
        self,
        csc: str,
        topic: str,
        fields: list,
        expected_values: list,
        output: str = "dataframe",
    ) -> None:
        """Fails if the values of the given field attributes do not match
        the expected_values.

        Parameters
        ----------
        csc : `str`
            The name of the CSC.
        topic : `str`
            The name of the topic.
        fields : `list`
            The list of fields for the given topic.
        expected_values : `list`
            The list of expected values of the attributes.
        output : `str`
            The desired output format from the query.
        """
        csc, index = self._split_indexed_csc(csc)
        # The current use case only checks a single attribute.
        # If/When in the future the need arises to test multiple
        # attributes, simply update these steps to iterate over
        # the lists of fields and respective expected_values.
        attribute = fields[0]
        if output.lower() == "json":
            if attribute == "name":
                query_attribute = '"{}"'.format(attribute)
            else:
                query_attribute = attribute
            json_output = self.influxdb_query(
                csc, topic, query_attribute, limit=1, output_format=output.lower()
            )
            print(f"*TRACE*dataframe:\n{json_output}")
            actual_value = self._get_from_json(attribute, json_output)
        else:
            topic_df = self.get_recent_samples(csc, topic, fields, 1, index)
            print(f"*TRACE*dataframe:\n{topic_df}")
            actual_value = getattr(topic_df, attribute).iloc[0]
        failure = False
        if type(expected_values[0]) == int or type(expected_values[0]) == float:
            if not math.isclose(actual_value, expected_values[0], abs_tol=0.0001):
                failure = True
        else:
            if str(actual_value) != str(expected_values[0]):
                failure = True
        if failure:
            raise AssertionError(f"{actual_value} does not match {expected_values[0]}.")

    @keyword
    def verify_sequence(
        self, csc: str, topic: str, field: str, length: int, expected_values: list
    ) -> None:
        """Fails if the values of the given field attribute do not match
        the expected_values. This keyword only works for a single field.

        Parameters
        ----------
        csc : `str`
            The name of the CSC.
        topic : `str`
            The name of the topic.
        field : `list`
            The field for the given topic.
        length : `int`
            The number of iterations in the sequence.
        expected_values : `list`
            The list of expected values of the attributes.
        """
        if not isinstance(field, str):
            raise TypeError(
                f"This keyword only works for a single topic attribute (one field)."
            )
        csc, index = self._split_indexed_csc(csc)
        attribute_array = getattr(
            self.get_recent_samples(
                csc,
                topic,
                [
                    field,
                ],
                length,
                index,
            ),
            field,
        ).values
        attribute_list = attribute_array.tolist()
        attribute_list.reverse()
        print(
            f"*TRACE*Attribute sequence: {attribute_list}\nExpected sequence : {expected_values}"
        )
        if attribute_list != expected_values:
            raise AssertionError(f"{attribute_list} does not match {expected_values}.")

    @keyword
    def verify_time_delta(
         self, csc: str, topic: str, minute: int = 1, hour: int = None, day: int = None, week: int = 0
    ) -> None:
        """Fails if the publish time for the given topic is older than
           the Monday of the deployment week. A deployment will reset
           all the publish times, and the earliest it will occur is on
           a Monday. Therefore, if publish times are too old or
           non-existent, there is a problem.

        Parameters
        ----------
        csc : `str`
            The name of the CSC, in index format, i.e <CSC>[:<index>].
        topic_1 : `str`
            The name of the first topic.
        minute : `int`
            The number of minutes to go back. Default is 1.
        hour : `int`
            The number of hours to go back. Default of None gets
            set to 4, meaning four hours prior to 'now'.
        day : `int`
            The number day of the week. Default of None gets set
            to the current number day of the week.
        week : `int`
            The number of weeks to go back. Default is 0, meaning
            the current week, i.e. the most recent Monday.
        """
        # Get the timestamp for the topic.
        pub_time = self.get_topic_sent_time(f"{csc}", topic)
        # Define `today` as the execution time. Convert to TAI time.
        today = datetime.datetime.now(tz=datetime.timezone.utc) + datetime.timedelta(seconds=self.tai_offset)
        # If `day` is not defined, set it to the current
        # day number of the week (Monday is day 0).
        if day is None:
              day = today.weekday()
        # If `hour` is not defined, set to 4 hours, which
        # assumes the testing starts about four hours later in
        # the day than the deployment happened.
        if hour is None:
              hour = 4       
        # Define the target datetime.
        time0 = today - datetime.timedelta(minutes=minute, hours=hour, days=day, weeks=week)
        # Get the deltas, in seconds.
        ## Actual difference between published time and time0.
        actual_delta = (pub_time - time0).total_seconds() 
        ## The allowed difference is between today and time0, back-dated by the offset in hours, days and/or weeks.
        allowed_delta = (today - time0 - datetime.timedelta(hours=hour, days=day, weeks=week)).total_seconds()
        print(
            f"*TRACE*{csc} {topic} was sent at {pub_time}.\n"
            f"*TRACE*Today is {today}. Time0 was set to {time0}.\n"
            f"*TRACE*The time difference is {actual_delta} seconds."
            f" The allowed difference was {allowed_delta} seconds."
        )
        if actual_delta < 0:
            raise AssertionError(
                f"{topic} was published {abs(actual_delta)} seconds BEFORE {time0}."
            )

    @keyword
    def influxdb_query(
        self,
        csc: str,
        topic: str,
        fields: str,
        limit: int = 1,
        where_clause: str = "",
        output_format: str = "dataframe",
    ) -> str:
        """Returns the result of the influx_client.query in specified output format.

        Parameters
        ----------
        csc : `str`
            The name of the CSC.
        topic : `str`
            The name of the topic of which to get the field list.
        fields : `str`
            The names of the fields in the InfluxDB to query.
            Should be a single, comma-separated string.
        limit : `int`
            The number of records to return (default is 1).
        where_clause : `str`
            An optional WHERE clause to filter the records.
        output_format : `str`
            The requested format of the output.
            Should either be dataframe (default) or json.

        Returns
        -------
        output : `str`
            The return from the influx_client.query function.
        """
        efd_client = EfdClient(self.efd_name)
        efd_client.influx_client.output = output_format
        loop = asyncio.get_event_loop()
        output = loop.run_until_complete(
            efd_client.influx_client.query(
                f"""SELECT {fields} FROM "efd"."autogen"."lsst.sal.{csc}.{topic}" {where_clause} GROUP BY * ORDER BY DESC LIMIT {limit}"""
            )
        )
        return output

    @not_keyword
    def _efd_topic(self, csc: str, topic: str) -> str:
        """Returns the fully-qualified topic name
        for the given CSC and topic.

        Parameters
        ----------
        csc : `str`
            The name of the CSC.
        topic : `str`
            The name of the topic of which to get the field list.

        Returns
        -------
        f"lsst.sal.{csc}.{topic}" : `str`
        """
        return f"lsst.sal.{csc}.{topic}"

    @not_keyword
    def _split_indexed_csc(
        self, csc_str: str
    ) -> typing.Tuple[str, typing.Optional[int]]:
        """Returns the CSC name and index, if applicable,
        given a CSC:INDEX string.

        Parameters
        ----------
        csc_str : `str`
            The string consisting of the CSC name and
            index, if applicable, in the form CSC:INDEX.

        Returns
        -------
        csc_str : `str`
            The name of the CSC.
        index : `int`
            The CSC index, if applicable.
        """
        if self.INDEX_DELIM in csc_str:
            parts = csc_str.split(self.INDEX_DELIM)
            return parts[0], int(parts[1])
        else:
            return csc_str, None

    @not_keyword
    def _check_attribute(
        self, dataframe: pandas.core.frame.DataFrame, attribute: str
    ) -> bool:
        """Simple function to check if the given DataFrame contains
        the given attribute.

        Parameters
        ----------
        dataframe : `pandas.core.frame.DataFrame`
            The Pandas DataFrame from the EFD.
        attribute : `str`
            The specific field in the DataFrame.

        Returns
        -------
        `bool`
            True, if field is present in the Dataframe,
            False, otherwise.
        """
        if not hasattr(dataframe, attribute):
            return False
        else:
            return True

    @not_keyword
    def _get_from_json(self, column: str, info: dict) -> Any:
        """Simple function to return a specific value from the JSON dictionary
        returned from the EfdClient influx_client.query function.

        Parameters
        ----------
        column : str
            The field from which to get the value.
        info : dict
            The JSON dictionary to query.

        Returns
        -------
        result : Any
            The value of the given column. Could be of any datatype.
        """
        series = info["results"][0]["series"][0]
        index = series["columns"].index(column)
        result = series["values"][0][index]
        return result

#!/usr/bin/env python

import typing
import asyncio
import pandas
from utils import dataframe
from utils import state_enums

from robot.api.deco import library, keyword, not_keyword
from lsst_efd_client import EfdClient


@library(scope="GLOBAL", version="0.1", doc_format="reST", auto_keywords=False)
class QueryEfd:
    """Define the Keywords used to query the EFD to verify the integration
    tests. This library is a wrapper of the lsst_efd_client to convert
    those methods into Robot-Framework Keywords.

    Attributes
    ----------
    INDEX_DELIM : `str`
        Defines the delimiter used in specifying indexed CSCs.
    time_format : `str`
        Defines the format for time strings.

    Notes
    -----
    The lsst_efd_client is defined in
    https://github.com/lsst-sqre/lsst-efd-client

    The integration tests are defined in
    https://github.com/lsst-ts/ts_IntegrationTests
    """

    INDEX_DELIM: str = ":"
    time_format: str = "%Y-%m-%dT%H:%M:%S.%f"

    def __init__(self, efd_name: str = "tucson_teststand_efd") -> None:
        """
        Parameters
        ----------
        efd_name : `str`
            The name of the EFD instance (default is tucson_teststand_efd).
        """
        self.efd_name = efd_name

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
        # Auto-Enabled CSCs automatically go into the Enabled State.
        # As such, grab the 3 most recent samples, in order to properly
        # test the SummaryState.
        if auto_enable:
            num = 3
        else:
            num = 1
        ss_df = self.get_recent_samples(
            csc,
            "logevent_summaryState",
            [
                "private_sndStamp",
                "summaryState",
            ],
            num,
            index,
        )
        print(f"*TRACE*dataframe:\n{ss_df}")
        if not self._check_attribute(ss_df, "summaryState"):
            raise AttributeError("SummaryState Event Not Found.")
        # Which row of the DataFrame is needed depends on the expected_state.
        if num == 3 and expected_state == 5:
            ss_df = ss_df.iloc[[2]]
        if num == 3 and expected_state == 1:
            ss_df = ss_df.iloc[[1]]
        if num == 3 and expected_state == 2:
            ss_df = ss_df.iloc[[0]]
        expected_state_str = state_enums.as_state(int(expected_state)).name
        actual_state_str = state_enums.as_state(int(ss_df.summaryState[0])).name
        event_sent_time = ss_df.private_sndStamp[0].strftime(self.time_format)
        # Pass if CSC is in expected_state. Raise AssertionError is not.
        if str(actual_state_str) == str(expected_state_str):
            print(f"{csc_str} in {expected_state_str} State")
            print(f"Time of Summary State: {event_sent_time}")
        else:
            raise AssertionError(
                f"{csc_str} is not in the {expected_state_str} state."
                f"\n{csc_str} is in the {actual_state_str} state."
            )

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
            event_sent_time = recent_samples.private_sndStamp[0].strftime(
                self.time_format
            )
        except AttributeError:
            raise AttributeError(
                "'DataFrame' object has no attribute 'private_sndStamp'"
            )
        return event_sent_time

    @keyword
    def verify_topic(self, csc: str, topic: str) -> None:
        """Placeholder for the Verify Topic keyword. When the integration
        tests are inevitably expanded beyond the SummaryState tests, this
        Keyword will be greatly improved.

        Parameters
        ----------
        csc : `str`
            The name of the CSC.
        topic : `str`
            The name of the topic.
        """
        csc, index = self._split_indexed_csc(csc)
        topic_df = self.get_recent_samples(csc, topic, "*", 1, index)
        print(f"*TRACE*dataframe:\n{topic_df}")

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
    def _split_indexed_csc(self, csc_str: str) -> typing.Union[str, int]:
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

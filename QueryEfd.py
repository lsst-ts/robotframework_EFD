#!/usr/bin/env python

import asyncio
from utils import dataframe
from utils import state_enums

from robot.api.deco import library, keyword, not_keyword
from lsst_efd_client import EfdClient


@library(scope="GLOBAL", version="0.1", doc_format="reST", auto_keywords=False)
class QueryEfd:

    INDEX_DELIM = ":"
    time_format = "%Y-%m-%dT%H:%M:%S.%f"

    def __init__(self, efd_name="tucson_teststand_efd"):
        self.efd_name = efd_name

    @keyword
    def get_efd_names(self):
        efd_client = EfdClient(self.efd_name)
        efd_list = efd_client.list_efd_names()
        return efd_list

    @keyword
    def get_efd_topics(self):
        efd_client = EfdClient(self.efd_name)
        loop = asyncio.get_event_loop()
        topics_list = loop.run_until_complete(efd_client.get_topics())
        return topics_list

    @keyword
    def get_topic_fields(self, csc, topic):
        efd_client = EfdClient(self.efd_name)
        loop = asyncio.get_event_loop()
        fields = loop.run_until_complete(
            efd_client.get_fields(topic_name=self._efd_topic(csc, topic))
        )
        return fields

    @keyword
    def get_recent_samples(self, csc, topic, fields, num, index=None):
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
        if hasattr(recent_samples, "private_sndStamp"):
            recent_samples = dataframe.convert_timestamps(
                recent_samples, ["private_sndStamp"]
            )
        return recent_samples

    @keyword
    def verify_summary_state(self, expected_state, csc_str, auto_enable=False):
        csc, index = self._from_entry(csc_str)
        if auto_enable:
            num = 3
        else:
            num = 1
        ss_df = self.get_recent_samples(
            csc,
            "logevent_summaryState",
            ["private_sndStamp", "summaryState"],
            num,
            index,
        )
        print(f"*TRACE*dataframe:\n{ss_df}")
        if not self._check_attribute(ss_df, "summaryState"):
            raise AttributeError("SummaryState Event Not Found.")
        if num == 3 and expected_state == 5:
            ss_df = ss_df.iloc[[2]]
        if num == 3 and expected_state == 1:
            ss_df = ss_df.iloc[[1]]
        if num == 3 and expected_state == 2:
            ss_df = ss_df.iloc[[0]]
        expected_state_str = state_enums.as_state(int(expected_state)).name
        actual_state_str = state_enums.as_state(int(ss_df.summaryState[0])).name
        event_sent_time = ss_df.private_sndStamp[0].strftime(self.time_format)
        if str(actual_state_str) == str(expected_state_str):
            print(f"{csc_str} in {expected_state_str} State")
            print(f"Time of Summary State: {event_sent_time}")
        else:
            raise AssertionError(
                f"{csc_str} is not in the {expected_state_str} state."
                f"\n{csc_str} is in the {actual_state_str} state."
            )

    @keyword
    def get_topic_sent_time(self, csc, topic, fields, num, index=None):
        recent_samples = self.get_recent_samples(
            csc=csc, topic=topic, fields=fields, num=num, index=index
        )
        if not self._check_attribute(recent_samples, "private_sndStamp"):
            raise AttributeError(f"{topic} - Topic Not Found.")
        event_sent_time = recent_samples.private_sndStamp[0].strftime(self.time_format)
        return event_sent_time

    @keyword
    def verify_topic(self, csc, topic):
        csc, index = self._from_entry(csc)
        topic_df = self.get_recent_samples(csc, topic, "*", 1, index)
        print(f"*TRACE*dataframe:\n{topic_df}")

    @not_keyword
    def _efd_topic(self, csc, topic):
        return f"lsst.sal.{csc}.{topic}"

    @not_keyword
    def _from_entry(self, csc_str):
        if self.INDEX_DELIM in csc_str:
            parts = csc_str.split(self.INDEX_DELIM)
            return parts[0], int(parts[1])
        else:
            return csc_str, None

    @not_keyword
    def _check_attribute(self, dataframe, attribute):
        if not hasattr(dataframe, attribute):
            return False
        else:
            return True

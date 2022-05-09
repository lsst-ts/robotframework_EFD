#!/bin/bash
#  Shell script to create the Robot-Framework (RF) 
#  test report to be published to a wide audience.
#  The various switches pare-down the report to
#  only the essential information.
#
#  author: Rob Bovill
#  email:  rbovill@lsst.org

robot_outputs=(offline.xml standby.xml disabled.xml enabled.xml)
rebot --name SummaryState -r streamlined_report.html -l streamlined_log.html --reportbackground "#61C4CD:#61C4CD" --loglevel FAIL --flattenkeywords TAG:custom -e at_light_cal ${robot_outputs[@]}

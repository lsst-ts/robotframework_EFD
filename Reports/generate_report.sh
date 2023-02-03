#!/bin/bash
#  Shell script to create the Robot-Framework (RF) 
#  test report to be published to a wide audience.
#  The various switches pare-down the report to
#  only the essential information.
#
#  author: Rob Bovill
#  email:  rbovill@lsst.org

robot_outputs=(
offline.xml 
standby.xml 
disabled.xml 
enabled.xml 
housekeeping.xml 
at_shutdown.xml 
at_image_verify.xml 
cc_image_verify.xml 
at_calib.xml
at_prep_onsky.xml 
at_cwfs_align.xml 
at_acq_take_seq_pointing.xml 
at_acq_take_seq_verify.xml 
at_acq_take_seq_test.xml 
at_acq_take_seq_nominal.xml 
at_stop.xml 
at_prep_flat.xml
at_flat_calib.xml
at_ptc_calib.xml
cc_calib.xml
shutdown.xml 
)
rebot --name IntegrationTests -r full_report.html -l full_log.html --reportbackground "#61C4CD:#61C4CD" --loglevel TRACE:INFO --flattenkeywords TAG:custom -e at_light_cal ${robot_outputs[@]}
rebot --name IntegrationTests -r streamlined_report.html -l streamlined_log.html --reportbackground "#61C4CD:#61C4CD" --loglevel FAIL --flattenkeywords TAG:custom --tagstatexclude DM* -e runtime -e at_light_cal ${robot_outputs[@]}

*** Settings ***

*** Variables ***
${UserName}     saluser
${EFDUser}      efduser
${SALInstall}   /opt/sal
${SALHome}      ${SalInstall}/lsstsal
${SALWorkDir}   ${SalInstall}/test
${OSPLVersion}   6.10.4p2
${SALVersion}   6.1.0
${XMLVersion}   10.2.0
@{efd_names}    summit_efd    ncsa_teststand_efd    ldf_stable_efd    ldf_int_efd    base_efd    tucson_teststand_efd    test_efd
&{STATES}       disabled=1    enabled=2    fault=3    offline=4    standby=5

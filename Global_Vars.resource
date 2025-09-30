*** Settings ***

*** Variables ***
${UserName}     saluser
${EFDUser}      efduser
${SALInstall}   /opt/sal
${SALHome}      ${SalInstall}/lsstsal
${SALWorkDir}   ${SalInstall}/test
${OSPLVersion}  6.10.4p2
${SALVersion}   X.Y.Z
${XMLVersion}   X.Y.Z
${env_efd}      tucson_teststand_efd
${weeks_ago}    0
${days_ago}     ${None}
${hours_ago}    ${None}
${minutes_ago}    0
${seconds_ago}    0
&{STATES}       disabled=${1}    enabled=${2}    fault=${3}    offline=${4}    standby=${5}

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
&{STATES}       disabled=${1}    enabled=${2}    fault=${3}    offline=${4}    standby=${5}

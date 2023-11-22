#!/usr/bin/env bash

pid=0

# SIGTERM-handler
term_handler() {
  if [ $pid -ne 0 ]; then
    kill -SIGTERM "$pid"
    wait "$pid"
  fi
  exit 143; # 128 + 15 -- SIGTERM
}

# setup handlers
# on callback, kill the last background process and execute term_handler
trap 'kill ${!}; term_handler' SIGTERM

# Setup the LSST Science Pipeline
source /opt/lsst/software/stack/loadLSST.bash

# Setup the SAL DDS environment
source .setup_sal_env.sh 
source /opt/lsst/software/stack/ospl_env.sh

# Setup the DM Stack 
setup lsst_distrib
eups list lsst_distrib

/bin/bash --rcfile /home/saluser/.bashrc

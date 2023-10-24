FROM almalinux:latest
MAINTAINER Rob Bovill (trekkie2@gmail.com)
ARG USER=saluser
ARG HOME=/home/${USER}
ENV PYTHONPATH="$PYTHONPATH:/usr/local/lib/python3.8/site-packages/lsst_efd_client"
ENV PATH $PATH:${HOME}/bin:${HOME}/.local/bin

USER root

RUN groupadd -r -g 1003 ${USER} && \
groupadd -r -g 993 docker && \
useradd -r -u 1003 -g ${USER} -G docker -m ${USER} -d ${HOME} && \
chown ${USER}:docker ${HOME}

RUN dnf -y update
RUN dnf -y install git which mlocate gcc-c++ && \
dnf clean all && \
rm -rf /var/cache/dnf

RUN updatedb

COPY environment.yaml /home/saluser/.environment.yaml
COPY startup.sh /home/saluser/.startup.sh
RUN chown saluser:saluser /home/saluser/.environment.yaml && \
chown saluser:saluser /home/saluser/.startup.sh && \
chmod +x /home/saluser/.startup.sh

USER ${USER}
WORKDIR ${HOME}

RUN mkdir bin && mkdir repos && mkdir Reports

# Create the environment:
RUN curl https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh -o .miniconda.sh && \
chmod +x .miniconda.sh && ./.miniconda.sh -b -p miniconda3 && \
source miniconda3/bin/activate && \
conda update conda -y && \
conda install -c conda-forge python>=3.11 -y && \
conda env create -f .environment.yaml && \
conda activate test_reporting && \
pip3 install -U setuptools numpy pytest astropy requests robotframework lsst-efd-client

ENTRYPOINT ["/bin/bash", "--"]
CMD ["/home/saluser/.startup.sh"]

FROM almalinux:8
LABEL org.opencontainers.image.authors="trekkie2@gmail.com"
ARG USER=saluser
ARG HOME=/home/${USER}
ENV PYTHONPATH="$PYTHONPATH:/usr/local/lib/python3.8/site-packages/lsst_efd_client"
ENV PATH=$PATH:${HOME}/bin:${HOME}/.local/bin

USER root

# User
RUN groupadd -r -g 73006 ${USER} && \
groupadd -r -g 993 docker && \
useradd -r -u 73006 -g ${USER} -G docker -m ${USER} -d ${HOME} && \
chown ${USER}:docker ${HOME}

COPY startup.sh /home/saluser/.startup.sh
RUN chown saluser:saluser /home/saluser/.startup.sh && \
chmod +x /home/saluser/.startup.sh

# Prerequisites
RUN dnf -y update && dnf -y groupinstall "Development Tools"
RUN dnf -y install openssl-devel zlib-devel wget make git which mlocate gcc-c++ && \
dnf clean all && \
rm -rf /var/cache/dnf && \
updatedb

# Python3.11
#RUN cd /tmp && \
#wget https://www.python.org/ftp/python/3.11.9/Python-3.11.9.tgz && \
#tar xvf Python-3.11.9.tgz

#RUN cd /tmp/Python-3.11.9 && \
#./configure --enable-optimizations && \
#make altinstall && \
#ln /usr/local/bin/python3.11 /usr/local/bin/python3

# Python packages
#RUN python3 -m pip install --upgrade pip setuptools numpy && \
#python3 -m pip install pytest requests robotframework && \
#python3 -m pip install astropy gnureadline lsst-efd-client

# Cleanup
RUN chown -R ${USER}:${USER} ${HOME}

# User directories
USER ${USER}
WORKDIR ${HOME}
RUN mkdir miniconda3 bin repos Reports

# Conda
RUN wget https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh -O ~/miniconda3/miniconda.sh && \
bash ~/miniconda3/miniconda.sh -b -u -p ~/miniconda3 && \
rm ~/miniconda3/miniconda.sh

RUN source miniconda3/bin/activate && \
conda update conda -y && \
conda config --add channels defaults && \
conda install -c conda-forge 'python=3.11' 'libarchive' 'libmamba' -y && \
pip3 install -U setuptools numpy pytest requests robotframework astropy gnureadline lsst-efd-client && \
conda clean --all

# Startup
RUN echo 'source miniconda3/bin/activate' >> ${HOME}/.bashrc
ENTRYPOINT ["/bin/bash", "--"]
CMD ["/home/saluser/.startup.sh"]

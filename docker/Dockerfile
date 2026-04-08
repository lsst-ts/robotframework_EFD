FROM almalinux:9
LABEL org.opencontainers.image.authors="trekkie2@gmail.com"
ARG USER=saluser
ARG HOME=/home/${USER}
ENV PYTHONPATH="/home/saluser/miniconda3/lib/python3.13/site-packages"
ENV PATH=$PATH:${HOME}/bin:${HOME}/.local/bin
ENV CONDA_PLUGINS_AUTO_ACCEPT_TOS=true

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
conda config --add channels conda-forge && \
conda install -c conda-forge 'python=3.13' 'libarchive' 'libmamba' -y && \
conda install -y setuptools pytest requests robotframework astropy && \
conda install -y pandas aioinflux numpy kafkit PyYAML && \
conda install -c conda-forge lsst-efd-client && \
conda clean --all

# Startup
RUN echo 'source miniconda3/bin/activate' >> ${HOME}/.bashrc
ENTRYPOINT ["/bin/bash", "--"]
CMD ["/home/saluser/.startup.sh"]

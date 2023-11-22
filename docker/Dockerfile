FROM ts-dockerhub.lsst.org/deploy-sqre:c0034
MAINTAINER Rob Bovill (trekkie2@gmail.com)
ARG USER=saluser
ARG HOME=/home/${USER}
ENV PYTHONPATH="$PYTHONPATH:/usr/local/lib/python3.8/site-packages/lsst_efd_client"
ENV PATH $PATH:${HOME}/bin:${HOME}/.local/bin

USER root

RUN groupadd -r -g 993 docker && \
usermod -a -G docker ${USER} && \
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
RUN source /opt/lsst/software/stack/conda/bin/activate && \
conda update conda -y && \
conda activate /opt/lsst/software/stack/conda/envs/lsst-scipipe-7.0.1 && \
conda env update -f .environment.yaml --prune

ENTRYPOINT ["/bin/bash", "--"]
CMD ["/home/saluser/.startup.sh"]

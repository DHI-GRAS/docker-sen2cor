FROM ubuntu:latest

USER root

WORKDIR /work
RUN chmod 777 /work

RUN apt-get update && \
    apt-get -y install \
      'wget' \
      'file'

# install Sen2Cor
RUN wget http://step.esa.int/thirdparties/sen2cor/2.8.0/Sen2Cor-02.08.00-Linux64.run && \
    chmod +x Sen2Cor-02.08.00-Linux64.run && \
    ./Sen2Cor-02.08.00-Linux64.run && \
    rm Sen2Cor-02.08.00-Linux64.run

ENTRYPOINT ["/work/Sen2Cor-02.08.00-Linux64/bin/L2A_Process"]

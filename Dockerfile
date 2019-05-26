FROM debian:latest

WORKDIR /app

RUN apt-get update && apt-get -y install \
    'wget' \
    'file' \
    'gosu'
# verify that gosu works
RUN gosu nobody true

# install Sen2Cor
RUN wget http://step.esa.int/thirdparties/sen2cor/2.8.0/Sen2Cor-02.08.00-Linux64.run \
    && sh Sen2Cor-02.08.00-Linux64.run \
    && rm Sen2Cor-02.08.00-Linux64.run

COPY entrypoint.sh /app/entrypoint.sh
RUN chmod +x /app/entrypoint.sh

WORKDIR /work

ENTRYPOINT ["/app/entrypoint.sh"]
CMD ["--help"]

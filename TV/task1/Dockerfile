# For more information, please refer to https://aka.ms/vscode-docker-python
FROM ubuntu:latest
LABEL maintainer="k.evdokimova@innopolis.university"

RUN apt-get update \
    && apt-get -y install sysbench

# Creates a non-root user (TVuser) without an explicit UID (I removed "-u 5678") and adds permission to access the /TV folder
# For more info, please refer to https://aka.ms/vscode-docker-python-configure-containers
#RUN adduser --disabled-password --gecos "" TVuser && chown -R TVuser /TV
#USER TVuser

RUN mkdir -p /TV
COPY script.sh /TV
WORKDIR /TV
RUN chmod +x script.sh
RUN ./script.sh

#
# MongoDB Dockerfile
#
# https://github.com/dockerfile/mongodb
#

FROM ubuntu:18.04

MAINTAINER Régis Gaidot <regis@partlab.co>

ENV DEBIAN_FRONTEND noninteractive
ENV INITRD No
ENV LANG en_US.UTF-8

RUN apt-get update && apt-get install -y sudo mongodb

#RUN apt-get install -y gnupg2 ca-certificates && \
#    apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv 7F0CEB10 && \
#    echo 'deb http://downloads-distro.mongodb.org/repo/ubuntu-upstart dist 10gen' \
#      | tee /etc/apt/sources.list.d/10gen.list && \
#    apt-get update && \
#    apt-get install -y --no-install-recommends mongodb-org && \
#    apt-get clean && \
#    rm -rf /var/lib/apt/lists/*

VOLUME ["/data/db"]
EXPOSE 27017 28017

WORKDIR /usr/src/data

COPY ue.json /usr/src/data/ue.json
COPY setup-lasse.sh /usr/src/data/setup-lasse.sh
RUN chmod +x setup-lasse.sh

CMD ["/usr/bin/mongod"]
CMD tail -f /dev/null

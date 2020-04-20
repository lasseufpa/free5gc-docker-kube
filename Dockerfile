FROM golang:1.11-stretch

MAINTAINER Virgínia Tavares <briosovirginia@gmail.com>

RUN apt-get update && \
    apt-get upgrade -y && \
    apt-get install -y --no-install-recommends \
        apt-utils \
        autoconf \
        automake \
        libtool \
        gcc \
        flex \
        bison \
        git \
        libsctp-dev \
        libgnutls28-dev \
        libgcrypt-dev \
        libssl-dev \
        libidn11-dev \
        libmongoc-dev \
        libbson-dev \
        libyaml-dev \
        build-essential \
        iproute2 \
        ca-certificates \
        netbase \
        iptables \
        pkg-config && \
    apt-get clean

RUN go get -u -v "github.com/gorilla/mux"
RUN go get -u -v "golang.org/x/net/http2"
RUN go get -u -v "golang.org/x/sys/unix"

COPY setup.sh /root
RUN chmod 777 /root/setup.sh

RUN cd /usr/src && git clone https://bitbucket.org/nctu_5g/free5gc-stage-1.git
RUN cd /usr/src/free5gc-stage-1 && \
    autoreconf -iv && \
    ./configure --prefix=`pwd`/install && \
    make -j `nproc` && \
    make install

WORKDIR /usr/src/free5gc





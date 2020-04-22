FROM golang:1.11-stretch

MAINTAINER Virgínia Tavares <briosovirginia@gmail.com>

#Prerequisites
RUN apt-get update && \
    apt-get upgrade -y && \
    apt-get install -y --no-install-recommends \
        apt-utils \
        ifupdown \
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

#AMF, SMF, UPF, HSS, and PCRF
RUN cd /usr/src && git clone https://bitbucket.org/nctu_5g/free5gc-stage-1.git /usr/src/free5gc
RUN cd /usr/src/free5gc && \
    autoreconf -iv && \
    ./configure --prefix=`pwd`/install && \
    make -j `nproc` && \
    make install

COPY setup.sh /root/setup.sh
RUN chmod +x /root/setup.sh

CMD /root/setup.sh;

WORKDIR /usr/src/free5gc




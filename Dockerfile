FROM ubuntu:xenial
MAINTAINER sh@analogic.cz

ADD https://github.com/just-containers/s6-overlay/releases/download/v1.17.2.0/s6-overlay-amd64.tar.gz /tmp/
RUN tar xzf /tmp/s6-overlay-amd64.tar.gz -C /
ENTRYPOINT ["/init"]

RUN apt-get update && \
    apt-get install -y build-essential libssl-dev libboost-all-dev git libdb-dev libdb++-dev libevent-dev libminiupnpc-dev curl autoconf libtool bsdmainutils pkg-config nmap && \
    mkdir /tmp/litecoind && \
    curl -sL https://github.com/litecoin-project/litecoin/archive/v0.13.2.1.tar.gz | tar zx -C /tmp/litecoind --strip-components=1 && \
    cd /tmp/litecoind && \
    ./autogen.sh && \
    ./configure --with-incompatible-bdb && \
    make -j4 && \
    cp /tmp/litecoind/src/litecoind /usr/bin/litecoind && \
    cp /tmp/litecoind/src/litecoin-cli /usr/bin/litecoin-cli && \
    rm -rf /tmp/litecoind && \
    mkdir /var/run/litecoind

EXPOSE 19332 19335

VOLUME ["/data"]
ADD rootfs /

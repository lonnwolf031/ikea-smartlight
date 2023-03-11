# in development

FROM ubuntu:22.04
LABEL Description="Build environment"

ENV HOME /root

SHELL ["/bin/bash", "-c"]

RUN apt-get update && apt-get -y --no-install-recommends install \
    apt-get install automake libtool

RUN git clone --depth 1 --recursive -b dtls https://github.com/home-assistant/libcoap.git
    cd libcoap
    ./autogen.sh
    ./configure --disable-documentation --disable-shared --without-debug CFLAGS="-D COAP_DEBUG_FD=stderr"
    make
    sudo make install
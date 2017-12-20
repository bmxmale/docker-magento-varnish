FROM ubuntu:16.04
MAINTAINER Mateusz Lerczak <mlerczak@pl.sii.eu>

ARG VARNISH_VERSION="5.2.1-1~xenial"

ENV DEFAULT_VCL 1
ENV NGINX_HOST SWEETDEAL_nginx

RUN \
    apt-get update \
    && apt-get install -y \
        curl \
        supervisor

RUN \
    curl -s https://packagecloud.io/install/repositories/varnishcache/varnish5/script.deb.sh | bash \
    && apt-get install -y varnish=${VARNISH_VERSION}

RUN \
    apt-get -y clean \
    && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

COPY container /

RUN chmod 775 /start-varnish.sh

CMD ["/start-varnish.sh"]

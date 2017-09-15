FROM ubuntu:14.04

RUN apt-get update && \
    DEBIAN_FRONTEND=noninteractive apt-get install apt-transport-https curl -y && \
    apt-get -y clean && \
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

ENV DEFAULT_VCL 1
ENV VARNISH_VERSION 5.1.*
ENV NGINX_HOST SWEETDEAL_nginx

RUN curl -s -L https://packagecloud.io/varnishcache/varnish5/gpgkey | sudo apt-key add - && \
    echo "deb https://packagecloud.io/varnishcache/varnish5/ubuntu/ trusty main" >> /etc/apt/sources.list.d/varnish-cache.list && \
    echo "Explanation: : varnish5-pin-version\nPackage: varnish\nPin: version ${VARNISH_VERSION}\nPin-Priority: 1001" >> /etc/apt/preferences.d/50varnish5-pin-version && \
    apt-get update && \
    DEBIAN_FRONTEND=noninteractive apt-get install varnish supervisor -y && \
    apt-get -y clean && \
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

COPY container /

RUN chmod 775 /start-varnish.sh

CMD ["/start-varnish.sh"]

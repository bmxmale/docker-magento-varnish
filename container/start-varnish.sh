#!/bin/bash
echo "Updating default.vcl"

if [ "${DEFAULT_VCL}" == "1" ];
then
    cp /etc/varnish/default.template /etc/varnish/default.vcl
    sed -i "s/NGINX_HOST/${NGINX_HOST}/g" /etc/varnish/default.vcl
fi

echo "Starting supervisor:"
exec /usr/bin/supervisord -n -c /etc/supervisor/supervisord.conf

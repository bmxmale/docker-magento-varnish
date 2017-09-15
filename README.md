# docker-magento-varnish


    version: '3'
    services:
      app:
        image: bmxmale/docker-magento-varnish:5.1.3
    #    volumes:
    #      - ./mount/varnish/default.vcl:/etc/varnish/default.vcl
        environment:
    #      - DEFAULT_VCL=0
          - NGINX_HOST=SWEETDEAL_nginx
        deploy:
          mode: global
    networks:
        default:
            external:
                name: MAGENTO_network
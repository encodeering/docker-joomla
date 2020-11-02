FROM       nginx:alpine

MAINTAINER Michael Clausen <encodeering@gmail.com>

ENV        PHP_UPSTREAM_HOST=php
ENV        PHP_UPSTREAM_PORT=9000

WORKDIR    ${NGINX_CONFDIR}

COPY       nginx/ .

WORKDIR    /var/www/html

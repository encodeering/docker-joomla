FROM       nginx:alpine

MAINTAINER Michael Clausen <encodeering@gmail.com>

WORKDIR    ${NGINX_CONFDIR}

COPY       nginx/vconf/*.conf conf-global.d/
COPY       nginx/vhost/*.conf conf/

WORKDIR    /var/www/html

FROM       joomla:fpm

MAINTAINER Michael Clausen <encodeering@gmail.com>

ARG        KICKSTART_VERSION="6-0-1"
ARG        KICKSTART_PACKAGE="https://www.akeebabackup.com/download/akeeba-kickstart/${KICKSTART_VERSION}/kickstart-core-${KICKSTART_VERSION}-zip.zip"

ENV        KICKSTART_TYPE="bundle"

RUN        apt-get update                                             \
 &&        apt-get install -y unzip                                   \
 &&        curl -SL -o /tmp/kickstart.zip "${KICKSTART_PACKAGE}"´     \
 &&        unzip       /tmp/kickstart.zip -d /usr/local/src/kickstart \
 &&        chown -R www-data:www-data        /usr/local/src/kickstart \
 &&        apt-get remove  -y unzip                                   \
 &&        rm -rf /tmp/kickstart.zip /var/lib/apt/lists/*

COPY       bin /usr/local/bin
COPY       php/*.ini ${PHP_INI_DIR}/conf.d/

RUN        rm /makedb.php /entrypoint.sh \
 &&        chmod +x /usr/local/bin/*.sh  \
 &&        ln -s "${PHP_INI_DIR}/php.ini-production" "${PHP_INI_DIR}/php.ini"

ENTRYPOINT ["docker-entrypoint.sh"]

CMD        ["php-fpm"]

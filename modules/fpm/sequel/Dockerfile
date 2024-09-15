FROM       alpine:3.20 AS kickstarter

ARG        KICKSTART_VERSION="6-0-1"
ARG        KICKSTART_PACKAGE="https://www.akeebabackup.com/download/akeeba-kickstart/${KICKSTART_VERSION}/kickstart-core-${KICKSTART_VERSION}-zip.zip"

RUN        apk --no-cache add unzip curl \
 &&        curl -SL -o /tmp/kickstart.zip "${KICKSTART_PACKAGE}" \
 &&        mkdir -p                    /usr/local/src/kickstart  \
 &&        unzip /tmp/kickstart.zip -d /usr/local/src/kickstart


FROM       joomla:fpm

MAINTAINER Michael Clausen <encodeering@gmail.com>

ENV        KICKSTART_TYPE="bundle"

COPY       bin /usr/local/bin
COPY       php/*.ini ${PHP_INI_DIR}/conf.d/

COPY       --from=kickstarter                /usr/local/src/kickstart /usr/local/src/kickstart

RUN        chown -R www-data:www-data        /usr/local/src/kickstart \
 &&        chmod +x /usr/local/bin/*.sh  \
 &&        rm /makedb.php /entrypoint.sh \
 &&        ln -s "${PHP_INI_DIR}/php.ini-production" "${PHP_INI_DIR}/php.ini"

ENTRYPOINT ["docker-entrypoint.sh"]

CMD        ["php-fpm"]

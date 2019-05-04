#!/usr/bin/env bash

set -e

import com.encodeering.ci.config
import com.encodeering.ci.docker

docker-pull "$REPOSITORY/php-$ARCH:7.3-$BASE-$VARIANT" "php:7.3-$VARIANT"

docker-build -t "joomla:$VARIANT" "$PROJECT/php7.3/$VARIANT"
docker-build --suffix sequel sequel

check () {
    dup | contains "RELEASE = '${VERSION}"
}

docker-verify                 cat /usr/src/joomla/libraries/src/Version.php | grep RELEASE | check
docker-verify --suffix sequel cat /usr/src/joomla/libraries/src/Version.php | grep RELEASE | check

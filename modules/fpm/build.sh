#!/usr/bin/env bash

set -e

import com.encodeering.ci.config
import com.encodeering.ci.docker

docker-pull "$REPOSITORY/php-$ARCH:7.2-$BASE-$VARIANT" "php:7.2-$VARIANT" "php:7.2-$VARIANT"

docker-build -t "joomla:$VARIANT" "$PROJECT/php7.2/$VARIANT"

check () {
    dup | contains "RELEASE = '${VERSION}"
}

docker-verify                 cat /usr/src/joomla/libraries/src/Version.php | grep RELEASE | check

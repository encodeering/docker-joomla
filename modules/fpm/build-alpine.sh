#!/usr/bin/env bash

set -e

import com.encodeering.ci.config
import com.encodeering.ci.docker

docker-pull "$REPOSITORY/alpine-$ARCH:3.20" "alpine:3.20"
docker-pull "$REPOSITORY/php-$ARCH:8.2-alpine-fpm" "php:8.2-fpm-alpine"

docker-build -t "joomla:fpm" "$PROJECT/$VERSION/php8.2/fpm-alpine"
docker-build --suffix sequel sequel

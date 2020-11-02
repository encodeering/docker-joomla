#!/usr/bin/env bash

set -e

import com.encodeering.ci.config
import com.encodeering.ci.docker

docker-pull "$REPOSITORY/nginx-$ARCH:1.18-alpine-sequel" "nginx:alpine"

docker-build alpine

docker-verify -V 2>&1 | dup | contains "nginx/1.18"

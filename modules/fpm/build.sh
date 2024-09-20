#!/usr/bin/env bash

set -e

import com.encodeering.ci.config
import com.encodeering.ci.docker

./build-$BASE.sh

check () {
    dup | contains "<version>$VERSION"
}

docker-verify                 cat /usr/src/joomla/administrator/manifests/files/joomla.xml | grep '<version>' | check
docker-verify --suffix sequel cat /usr/src/joomla/administrator/manifests/files/joomla.xml | grep '<version>' | check

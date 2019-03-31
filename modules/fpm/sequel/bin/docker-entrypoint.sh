#!/usr/bin/env bash

set -e
set -o pipefail

installed () {
    test -e index.php -a \( -e libraries/cms/version/version.php -o -e libraries/src/Version.php \)
}

bundle () {
    if ! installed; then
        echo "installing joomla"
        tar cf - --one-file-system -C /usr/src/joomla . | tar xf -
    fi
}

backup () {
    if ! installed; then
        echo "installing kickstart"
        tar cf - --one-file-system -C /usr/local/src/kickstart . | tar xf -
    fi
}

case "${KICKSTART_TYPE}" in
    bundle)
        bundle
        ;;
    backup)
        backup
        ;;
    *)
        echo "KICKSTART_TYPE should be one of [bundle,backup], aborting process";
        exit 1;
        ;;
esac

exec "$@"

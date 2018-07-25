#!/bin/bash

set -ex

platform=$(jetpack config platform_family)

case $platform in
    rhel)
        yum install -y python-devel zlib-devel
        ;;
    ubuntu)
        apt-get install -y python-dev zlib-dev
        ;;
    *)
        echo "Unsupported platform."
        exit 1
esac


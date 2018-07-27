#!/bin/bash
# Copyright (c) Microsoft Corporation. All rights reserved.
# Licensed under the MIT License.

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


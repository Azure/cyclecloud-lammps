#!/bin/bash

set -ex
# Don't run if we've already expanded the LAMMPS tarball
if [ -d /shared/scratch/lammps ]; then
    exit 0
fi
LAMMPS_VERSION=$(jetpack config lammps.version)

pushd /shared/scratch
jetpack download "lammps-${LAMMPS_VERSION}.tgz"
tar xvzf lammps-${LAMMPS_VERSION}.tgz
popd

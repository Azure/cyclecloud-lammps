#!/bin/bash
# Copyright (c) Microsoft Corporation. All rights reserved.
# Licensed under the MIT License.
HOMEDIR=$(jetpack config cuser.home_dir)

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

cp ${CYCLECLOUD_SPEC_PATH}/files/run_lammps.sh ${HOMEDIR}
cp ${CYCLECLOUD_SPEC_PATH}/files/run_lammps_mpi.sh ${HOMEDIR}

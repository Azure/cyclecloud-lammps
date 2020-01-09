#!/bin/bash
# Copyright (c) Microsoft Corporation. All rights reserved.
# Licensed under the MIT License.
CLUSTER_OWNER=$( jetpack config cyclecloud.cluster.user.name ) 
HOMEDIR=$( getent passwd "$CLUSTER_OWNER" | cut -d: -f6 )

set -ex
# Don't run if we've already expanded the LAMMPS tarball
if [ ! -d /shared/scratch/lammps ]; then
    LAMMPS_VERSION=$(jetpack config lammps.version)

    pushd /shared/scratch
    jetpack download "lammps-${LAMMPS_VERSION}.tgz"
    tar xvzf lammps-${LAMMPS_VERSION}.tgz
    popd
fi

cp ${CYCLECLOUD_SPEC_PATH}/files/run_lammps.sh ${HOMEDIR}
cp ${CYCLECLOUD_SPEC_PATH}/files/run_lammps_mpi.sh ${HOMEDIR}

chown $CLUSTER_OWNER:$CLUSTER_OWNER ${HOMEDIR}/run_lammps.sh
chown $CLUSTER_OWNER:$CLUSTER_OWNER ${HOMEDIR}/run_lammps_mpi.sh

chmod +x ${HOMEDIR}/run_lammps.sh
chmod +x ${HOMEDIR}/run_lammps_mpi.sh

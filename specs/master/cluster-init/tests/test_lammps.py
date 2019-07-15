#!/opt/cycle/jetpack/system/embedded/bin/python -m pytest
# Copyright (c) Microsoft Corporation. All rights reserved.
# Licensed under the MIT License.
import os
import glob
import subprocess


def test_lammps():
    # Change directory to lammps scripts directory
    os.chdir('/mnt/cluster-init/lammps/default/files')

    # Make shell scripts executable
    shell_files = glob.glob('*.sh')
    for script in shell_files:
        os.chmod(os.path.join('.', script), 0755)

    # run_lammps_mpi.sh requires specific drivers, but
    # run_lammps.sh should run on any machine.
    subprocess.check_call([os.path.join('.', 'run_lammps.sh')])

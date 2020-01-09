#!/opt/cycle/jetpack/system/embedded/bin/python -m pytest
# Copyright (c) Microsoft Corporation. All rights reserved.
# Licensed under the MIT License.
import jetpack.config
import os
import subprocess
import tempfile
import time


def test_lammps():
    cluster_owner = str(jetpack.config.get("cyclecloud.cluster.user.name"))
    script_path = os.path.expanduser("~%s/run_lammps.sh" % cluster_owner)
    stdout = os.path.expanduser("~%s/%s.test.out" % (cluster_owner, time.time()))
    
    try:
        subprocess.check_call(["sudo", "-u", cluster_owner, "qsub", "-Wblock=true", "-l", "select=2", "-o", stdout, "--", script_path])
        # The results may take a bit to get copied back. Give it up to a minute and make sure it is not empty.
        for _ in range(60):
            if os.path.exists(stdout):
                assert os.path.getsize(stdout) > 0
                return
            time.sleep(1)
        raise AssertionError("Could not get results! {}".format(stdout))
    finally:
        if os.path.exists(stdout):
            os.remove(stdout)

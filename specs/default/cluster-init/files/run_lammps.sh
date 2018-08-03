#!/bin/bash
#PBS -j oe
LAMMPS_BIN=/shared/scratch/lammps/lmp_intel_cpu_intelmpi
INPUT=/shared/scratch/lammps/in.dipole
export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/shared/scratch/lammps/libs

cd ${PBS_O_WORKDIR}
${LAMMPS_BIN} < ${INPUT}

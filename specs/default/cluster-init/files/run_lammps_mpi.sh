#!/bin/bash
#PBS -j oe
#PBS -l select=2:ncpus=16
LAMMPS_BIN=/shared/scratch/lammps/lmp_intel_cpu_intelmpi
INPUT=/shared/scratch/lammps/in.dipole
export LD_LIBRARY_PATH=${LD_LIBRARY_PATH}:/shared/scratch/lammps/libs
source /opt/intel/compilers_and_libraries/linux/mpi/bin64/mpivars.sh

cd ${PBS_O_WORKDIR}
NP=$(wc -l ${PBS_NODEFILE} | awk '{print $1}')
mpirun -np ${NP} ${LAMMPS_BIN} < ${INPUT}

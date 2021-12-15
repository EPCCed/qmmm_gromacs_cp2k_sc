#!/bin/bash
#SBATCH -J stilbene_vacuum
#SBATCH --time=1:0:0

# Replace [budget code] below with your budget code (e.g. ta036-username)
#SBATCH --account=[budget code]
#SBATCH --partition=standard
#SBATCH --qos=standard

#SBATCH --nodes=2
#SBATCH --tasks-per-node=32
#SBATCH --cpus-per-task=4

#SBATCH --distribution=block:block 
#SBATCH --hint=nomultithread

module use /work/y07/shared/archer2-lmod/training/
module load gromacs/2021.1+cp2k

export OMP_NUM_THREADS=$SLURM_CPUS_PER_TASK
export OMP_PLACES=cores

srun mdrun_cp2k -npme 0 -s stilbene.tpr

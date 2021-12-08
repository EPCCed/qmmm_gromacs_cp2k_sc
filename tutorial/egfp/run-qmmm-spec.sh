#!/bin/bash
#SBATCH -J egfp-qmmm-spec
#SBATCH --time=00:20:00

# Replace [budget code] below with your budget code (e.g. ta036-username)
#SBATCH --account=[budget code]
#SBATCH --partition=standard
#SBATCH --qos=short
#SBATCH --reservation=shortqos

#SBATCH --nodes=1
#SBATCH --tasks-per-node=64
#SBATCH --cpus-per-task=2

#SBATCH --distribution=block:block 
#SBATCH --hint=nomultithread

module use /work/y07/shared/archer2-lmod/training/
module load gromacs/2021.1+cp2k

export OMP_NUM_THREADS=$SLURM_CPUS_PER_TASK
export OMP_PLACES=cores

srun mdrun_cp2k -npme 0 -s egfp-qmmm-spec.tpr -deffnm egfp-qmmm-spec

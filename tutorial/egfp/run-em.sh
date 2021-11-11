#!/bin/bash
#SBATCH -J egfp-em
#SBATCH --time=00:15:00

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

module load epcc-job-env
module load gromacs-cp2k

export OMP_NUM_THREADS=$SLURM_CPUS_PER_TASK
export OMP_PLACES=cores

srun mdrun_cp2k -s egfp-em.tpr -deffnm egfp-em

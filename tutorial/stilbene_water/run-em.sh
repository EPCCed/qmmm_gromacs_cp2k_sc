#!/bin/bash
#SBATCH -J stilbene_water
#SBATCH --time=00:15:00
#SBATCH --account=ta025
#SBATCH --partition=standard
#SBATCH --qos=standard
#SBATCH --reservation=ta025_166

#SBATCH --nodes=1
#SBATCH --tasks-per-node=32
#SBATCH --cpus-per-task=4

#SBATCH --distribution=block:block 
#SBATCH --hint=nomultithread

module load epcc-job-env
module load gromacs-cp2k

export OMP_NUM_THREADS=$SLURM_CPUS_PER_TASK
export OMP_PLACES=cores

srun mdrun_cp2k -npme 0 -s stilbene-sol-opt.tpr 
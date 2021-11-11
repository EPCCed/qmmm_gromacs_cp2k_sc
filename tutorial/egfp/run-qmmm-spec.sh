#!/bin/bash
#SBATCH -J egfp-qmmm-spec
#SBATCH --time=00:20:00
#SBATCH --account=ta025
#SBATCH --partition=standard
#SBATCH --qos=standard
#SBATCH --reservation=ta025_167

#SBATCH --nodes=1
#SBATCH --tasks-per-node=64
#SBATCH --cpus-per-task=2

#SBATCH --distribution=block:block 
#SBATCH --hint=nomultithread

module load epcc-job-env
module load gromacs-cp2k

export OMP_NUM_THREADS=$SLURM_CPUS_PER_TASK
export OMP_PLACES=cores

srun mdrun_cp2k -npme 0 -s egfp-qmmm-spec.tpr -deffnm egfp-qmmm-spec

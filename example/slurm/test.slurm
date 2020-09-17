#!/bin/bash
#SBATCH --job-name=test	 # create a short name for your job
#SBATCH --nodes=3	      # node count
#SBATCH --ntasks-per-node=11       # total number of tasks per node
#SBATCH --time=1:00:00          # total run time limit (HH:MM:SS)

export OMPI_MCA_btl='tcp,self,sm'
module load openmpi/gcc/2.0.2
srun Rscript example/test.R

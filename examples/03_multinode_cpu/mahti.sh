#!/bin/bash
#SBATCH --job-name=example
#SBATCH --account=project_2001659
#SBATCH --partition=medium
#SBATCH --time=00:15:00
#SBATCH --nodes=2
#SBATCH --ntasks-per-node=128
#SBATCH --cpus-per-task=1

module load julia/1.8
julia --project=. -e 'using Pkg; Pkg.instantiate()'
srun julia --project=. mpi.jl

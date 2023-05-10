#!/bin/bash
#SBATCH --job-name=example
#SBATCH --account=project_2001659
#SBATCH --partition=gpusmall
#SBATCH --time=00:15:00
#SBATCH --nodes=1
#SBATCH --ntasks-per-node=1
#SBATCH --cpus-per-task=1
#SBATCH --gres=gpu:a100:1

module load julia/1.8
julia --project=. -e 'using Pkg; Pkg.instantiate()'
srun julia --project=. cuda.jl

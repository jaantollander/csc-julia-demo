Base includes

- `Threads` for multithreading

Standard library includes

- `LinearAlgebra`, the default OpenBLAS backend has its own threading support
- `Distributed` for multiprocessing

CSC's shared installation includes

- `MPI.jl` for using MPI
- `CUDA.jl` for using Nvidia GPUs

We can query the status of the shared environment:

```bash
julia --project="$JULIA_CSC_ENVIRONMENT" -e 'using Pkg; Pkg.status()'
```


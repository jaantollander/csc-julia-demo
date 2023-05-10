Julia comes with a package manager.

We can create Julia environments to manage dependencies.

```bash
julia --project=.
```

The environment defined by two files:

```txt
Project.toml
Manifest.toml
```

We can install packages to environments.

```julia
using Pkg
Pkg.add("Example")
```

We can add compatibility requirements to julia version and packages

```julia
Pkg.compat("julia", "=1.8")
Pkg.compat("Example", "0.5.3")
```

We can query the status of an environment.

```julia
Pkg.status()
```

Base libraries are included in an environment by default.

Standard and external libraries need to included to an environment if used.

Finally, we need to instantiate environment before using them for the first time

```bash
julia --project=. -e 'using Pkg; Pkg.instantiate()'
```


Julia comes with a package manager.

We can create Julia environments to manage dependencies.

```
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

We can query the status of an environment.

```julia
Pkg.status()
```

Base libraries are included in an environment by default.
Standard libraries need to included to an environment if used.
We can specify a version compatibility to Julia version.

Other libraries can be included to environment if used.
We can specify a version compatibility for these libraries.

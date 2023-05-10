using Distributed

# We set one worker process per core.
proc_num = Sys.CPU_THREADS

# Environment variables that we pass to the worker processes.
# We set the thread count to one since each process uses one core.
proc_env = [
    "JULIA_NUM_THREADS"=>"1",
    "JULIA_CPU_THREADS"=>"1",
    "OPENBLAS_NUM_THREADS"=>"1",
    "MKL_NUM_THREADS"=>"1",
]

# We add worker processes to the local node using LocalManager.
addprocs(proc_num;
         env=proc_env,
         exeflags="--project=.")

# We use the `@everywhere` macro to include the task function in the worker processes.
# We must call `@everywhere` after adding worker processes; otherwise the code won't be included in the new processes.
@everywhere function task()
    (
        id=myid(),
        hostname=gethostname(),
        pid=getpid(),
        nthreads=Threads.nthreads(),
        cputhreads=Sys.CPU_THREADS
    )
end

# We run the task function in each worker process.
futures = [@spawnat id task() for id in workers()]

# Then, we fetch the output from the processes.
outputs = fetch.(futures)

# Remove processes after we are done.
rmprocs.(workers())

# Print the outputs of master and worker processes.
println("Master process output")
println(task())
println("Worker processes output")
println.(outputs)


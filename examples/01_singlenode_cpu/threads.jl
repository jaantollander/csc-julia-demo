# Number of threads
@show n = Threads.nthreads()

# Lets fill the id of each thread to the ids array.
thread_ids = zeros(Int, n)
Threads.@threads for i in eachindex(thread_ids)
    thread_ids[i] = Threads.threadid()
end
@show thread_ids

# Alternatively, we can use the @spawn macro to run task on threads.
thread_ids = zeros(Int, n)
@sync for i in eachindex(thread_ids)
    Threads.@spawn thread_ids[i] = Threads.threadid()
end
@show thread_ids


interface Task
    exposes [
        Task,
        ok,
        err,
    ]
    imports [
        InternalTask,
    ]

# A task represents an interaction with state outside of your Roc application.
Task ok err : InternalTask.Task ok err

# Creates a task that always succeeds with the provided value
ok : a -> Task a *
ok = \a -> InternalTask.ok a

# Creates a task that always fails with the provided value.
err : a -> Task * a
err = \a -> InternalTask.err a

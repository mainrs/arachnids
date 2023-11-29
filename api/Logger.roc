interface Logger
    exposes [
        debug,
        error,
        info,
        warn,
        verbose,
    ]
    imports [
        Effect,
        InternalTask,
        Task.{ Task },
    ]

error : Str -> Task {} *
error = \msg ->
    Effect.error msg
    |> Effect.map (\_ -> Ok {})
    |> InternalTask.fromEffect

warn : Str -> Task {} *
warn = \msg ->
    Effect.warn msg
    |> Effect.map (\_ -> Ok {})
    |> InternalTask.fromEffect

info : Str -> Task {} *
info = \msg ->
    Effect.info msg
    |> Effect.map (\_ -> Ok {})
    |> InternalTask.fromEffect

debug : Str -> Task {} *
debug = \msg ->
    Effect.debug msg
    |> Effect.map (\_ -> Ok {})
    |> InternalTask.fromEffect

verbose : Str -> Task {} *
verbose = \msg ->
    Effect.verbose msg
    |> Effect.map (\_ -> Ok {})
    |> InternalTask.fromEffect

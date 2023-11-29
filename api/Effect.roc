hosted Effect
    exposes [
        Effect,
        after,
        always,
        forever,
        loop,
        map,

        error,
        warn,
        info,
        debug,
        verbose,

        sendRequest,
    ]
    imports [
        InternalHttp.{ Request, Response },
    ]
    generates Effect with [after, always, forever, loop, map]

# Logging facilities for debugging purpose.
error : Str -> Effect {}
warn : Str -> Effect {}
info : Str -> Effect {}
debug : Str -> Effect {}
verbose : Str -> Effect {}

# HTTP facilities.
sendRequest : Box Request -> Effect Response

platform "crawler"
    requires {} { main : Task {} I32 }
    exposes [
        Logger,
        Task,
    ]
    packages {}
    imports [
        Task.{ Task },
    ]
    provides [
        mainForHost
    ]

mainForHost : Task {} I32 as Fx
mainForHost = main

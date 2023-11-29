platform "crawler"
    requires {} { main : Task {} I32 }
    exposes [
        Logger,
        Http,
        Task,
    ]
    packages {
        json: "https://github.com/lukewilliamboswell/roc-json/releases/download/v0.4.0/PJHoaxmf2rXTmGW42QZz0kPVFqQkrv8D31pRMchw2eA.tar.br",
    }
    imports [
        Task.{ Task },
    ]
    provides [
        mainForHost
    ]

mainForHost : Task {} I32 as Fx
mainForHost = main

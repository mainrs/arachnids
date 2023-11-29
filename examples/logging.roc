app "chrono-trigger-crawler"
    packages { pf: "../api/main.roc" }
    imports [ pf.Logger, pf.Http ]
    provides [ main ] to pf

main = Logger.info "Hello, world!"

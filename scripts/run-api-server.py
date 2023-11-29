#!/usr/bin/env python3

import os
import ssl

from http.server import HTTPServer, SimpleHTTPRequestHandler
from pathlib import Path


addr = ('localhost', 8000)
script_dir = os.path.dirname(os.path.realpath(__file__))
certfile = Path(script_dir).joinpath("cert.pem")
keyfile = Path(script_dir).joinpath("key.pem")

httpd = HTTPServer(addr, SimpleHTTPRequestHandler)
ctx = ssl.SSLContext(protocol=ssl.PROTOCOL_TLS_SERVER)
ctx.load_cert_chain(certfile=certfile,keyfile=keyfile)
httpd.socket = ctx.wrap_socket(httpd.socket, server_side=True)
httpd.serve_forever()

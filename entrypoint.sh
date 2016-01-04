#!/bin/bash

set -xe

# Start services
/etc/init.d/dnsmasq start
/etc/init.d/nginx start

export PATH=$PATH:/home/letsencrypt/bin

(
  # https://letsencrypt.readthedocs.org/en/latest/contributing.html#hacking
  cd /home/letsencrypt/client;
  #./bootstrap/install-deps.sh;
  test -d ./venv || ./bootstrap/dev/venv.sh;
)

$@


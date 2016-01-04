#!/bin/bash

set -x

cd /home/letsencrypt/client
source ./venv/bin/activate

letsencrypt --server http://localhost:4000/directory \
--webroot -w /var/www/html \
--no-verify-ssl --no-redirect --renew-by-default \
--http-01-port 5002 \
--agree-tos \
--email contact@letsencrypt.you -d letsencrypt.you \
--installer nginx \
--text --debug -vvvvvvv

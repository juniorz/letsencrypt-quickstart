#!/bin/bash

set -x

cd /home/letsencrypt/client
source ./venv/bin/activate

letsencrypt certonly --webroot -w /var/www/html \
--server http://localhost:4000/directory \
--agree-tos \
--email contact@letsencrypt.you -d letsencrypt.you \
--no-verify-ssl --no-redirect \
--http-01-port 5002 \
--text --debug -vvvvvvv


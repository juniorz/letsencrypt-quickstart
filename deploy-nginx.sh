#!/bin/bash

set -x

# See discussion in: https://github.com/letsencrypt/letsencrypt/issues/1736

cd /home/letsencrypt/client
source ./venv/bin/activate

letsencrypt install --installer nginx \
  -d letsencrypt.you \
  --cert-path /etc/letsencrypt/live/letsencrypt.you/cert.pem \
  --key-path /etc/letsencrypt/live/letsencrypt.you/privkey.pem \
  --chain-path /etc/letsencrypt/live/letsencrypt.you/chain.pem \
  --fullchain-path /etc/letsencrypt/live/letsencrypt.you/fullchain.pem \
  --text --debug -vvvvvvv 


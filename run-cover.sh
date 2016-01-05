#!/bin/bash

set -x

cd /home/letsencrypt/client
source ./venv/bin/activate

TOXENV=cover tox


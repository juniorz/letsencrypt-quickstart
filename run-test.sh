#!/bin/bash

set -x

cd /home/letsencrypt/client
source ./venv/bin/activate

TOXENV=py27 tox


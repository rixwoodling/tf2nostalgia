#!/usr/bin/env bash

set -euo pipefail

TF2_DIR="/srv/tf2"

cd "$TF2_DIR"

exec ./srcds_run \
    -game tf \
    -console \
    -usercon \
    +map ctf_2fort \
    +maxplayers 24

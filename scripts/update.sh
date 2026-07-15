#!/usr/bin/env bash

set -euo pipefail

steamcmd \
    +login anonymous \
    +force_install_dir /srv/tf2 \
    +app_update 232250 validate \
    +quit

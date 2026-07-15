#!/usr/bin/env bash

set -euo pipefail

steamcmd \
    +force_install_dir /srv/tf2 \
    +login anonymous \
    +app_update 232250 validate \
    +quit

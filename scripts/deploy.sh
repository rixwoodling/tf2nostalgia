#!/usr/bin/env bash

set -euo pipefail

ROOT="$(cd "$(dirname "$0")/.." && pwd)"

PLUGIN_NAME="tf2nostalgia"
BUILD_DIR="$ROOT/build"
PLUGIN_DIR="/srv/tf2/tf/addons/sourcemod/plugins"

echo "Deploying plugin..."

sudo install -m 644 \
    "$BUILD_DIR/$PLUGIN_NAME.smx" \
    "$PLUGIN_DIR/$PLUGIN_NAME.smx"

echo "Done."

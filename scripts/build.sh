#!/usr/bin/env bash
set -e

if [[ "$(uname -s)" != "Linux" ]]; then
    echo "This project officially builds on Linux x86_64."
    echo "Use a Linux machine, Docker, or your AWS build server."
    exit 1
fi

ROOT="$(cd "$(dirname "$0")/.." && pwd)"
SDK="$ROOT/vendor/sourcemod"

mkdir -p "$ROOT/build"

echo "========================================"
echo "TF2 Nostalgia Build"
echo "========================================"
echo
echo "Compiler: $SDK/spcomp"
echo

"$SDK/spcomp" \
    "$ROOT/src/tf2nostalgia.sp" \
    -i"$SDK/include" \
    -o"$ROOT/build/tf2nostalgia.smx"

echo
echo "Build complete."
echo "Output: $ROOT/build/tf2nostalgia.smx"

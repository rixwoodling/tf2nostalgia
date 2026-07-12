#!/usr/bin/env bash

set -euo pipefail

ROOT="$(cd "$(dirname "$0")/.." && pwd)"
TF2_APPID="232250"
TF2_DIR="/srv/tf2"

check_platform()
{
    [[ "$(uname -s)" == "Linux" ]] || {
        echo "ERROR: Linux is required."
        exit 1
    }
    [[ "$(uname -m)" == "x86_64" ]] || {
        echo "ERROR: Linux x86_64 is required."
        exit 1
    }
    source /etc/os-release
    echo "Detected: $PRETTY_NAME"
    if [[ "$ID" != "ubuntu" ]]; then
        echo "WARNING: This installer is developed and tested on Ubuntu."
    fi
    echo
}

install_dependencies()
{
    echo "Installing dependencies..."
    sudo dpkg --add-architecture i386
    sudo apt update
    sudo apt install -y \
        curl \
        git \
        tar \
        lib32gcc-s1 \
        lib32stdc++6
    echo
}

install_steamcmd()
{
    echo "Installing SteamCMD..."
    if command -v steamcmd >/dev/null 2>&1; then
        echo "SteamCMD already installed."
        echo
        return
    fi
    sudo apt install -y steamcmd
    echo
}

install_tf2()
{
    echo "Installing TF2 Dedicated Server..."
    if [[ -x "$TF2_DIR/srcds_run" ]]; then
        echo "TF2 already installed."
        echo
        return
    fi
    sudo mkdir -p "$TF2_DIR"
    sudo chown "$USER:$USER" "$TF2_DIR"

    steamcmd \
        +force_install_dir "$TF2_DIR" \
        +login anonymous \
        +app_update "$TF2_APPID" validate \
        +quit
    echo
}

install_metamod()
{
    exit 1
}

install_sourcemod()
{
    exit 1
}

build_plugin()
{
    exit 1
}

deploy_plugin()
{
    exit 1
}

configure_server()
{
    exit 1
}

print_summary()
{
    exit 1
}

main()
{
    echo "TF2 Nostalgia Setup"
    echo

    check_platform

    install_dependencies
    install_steamcmd
    install_tf2
    install_metamod
    install_sourcemod

    build_plugin
    deploy_plugin

    configure_server

    print_summary
}

main "$@"

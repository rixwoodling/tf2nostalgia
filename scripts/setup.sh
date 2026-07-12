#!/usr/bin/env bash

set -euo pipefail

ROOT="$(cd "$(dirname "$0")/.." && pwd)"

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
}

install_steamcmd()
{
}

install_tf2()
{
}

install_metamod()
{
}

install_sourcemod()
{
}

build_plugin()
{
}

deploy_plugin()
{
}

configure_server()
{
}

print_summary()
{
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

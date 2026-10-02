#!/usr/bin/env bash
# Optional dependency setup for Ubuntu/Debian CI workers.
set -euo pipefail
command -v apt-get >/dev/null 2>&1 || {
    echo 'This installer requires apt-get (Ubuntu/Debian).' >&2
    exit 1
}
privilege=()
if [[ $(id -u) != 0 ]]; then
    command -v sudo >/dev/null 2>&1 || {
        echo 'Run as root or install sudo.' >&2
        exit 1
    }
    privilege=(sudo)
fi
"${privilege[@]}" apt-get update
"${privilege[@]}" env DEBIAN_FRONTEND=noninteractive apt-get install -y \
    build-essential libgc-dev libgmp-dev \
    nodejs npm default-jre-headless chezscheme python3 ca-certificates

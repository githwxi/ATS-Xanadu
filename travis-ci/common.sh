#!/usr/bin/env bash
# Shared setup; source this file from the CI entry points.
set -euo pipefail

CI_DIR=$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" && pwd -P)
export XATSHOME
XATSHOME=$(cd -- "$CI_DIR/.." && pwd -P)

die() { printf 'CI error: %s\n' "$*" >&2; exit 1; }
require() {
    local tool
    for tool in "$@"; do
        command -v "$tool" >/dev/null 2>&1 || die "Missing command: $tool"
    done
}

setup_ats2() {
    PATSHOME=${PATSHOME:-"$CI_DIR/.ats2"}
    [[ -x $PATSHOME/bin/patsopt && -x $PATSHOME/bin/patscc ]] ||
        die "No ATS2 compiler in $PATSHOME; run travis-ci/install-ats2.sh or set PATSHOME."
    PATSHOME=$(cd -- "$PATSHOME" && pwd -P)
    export PATSHOME
    export PATH="$PATSHOME/bin:$PATH"
}

overall() {
    require make
    printf '\n=== Makefile_overall: %s ===\n' "$1"
    # Stages depend on their declared order. Also clear inherited make options
    # such as -j, -k, -i, and -n so CI cannot silently skip or ignore failures.
    MAKEFLAGS= MFLAGS= GNUMAKEFLAGS= MAKEOVERRIDES= \
        make -j1 -C "$XATSHOME" -f Makefile_overall "$1"
}

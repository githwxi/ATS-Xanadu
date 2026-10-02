#!/usr/bin/env bash
# Build the bundled ATS2 release without downloading ATS2.
set -euo pipefail
source "$(dirname -- "${BASH_SOURCE[0]}")/common.sh"
[[ $# -le 1 ]] || die 'Usage: install-ats2.sh [new-installation-directory]'
require tar sha256sum gcc make
archive_dir="$XATSHOME/xassets/ATS2"
archive="$archive_dir/ATS2-Postiats-gmp-0.4.2.tgz"
destination=${1:-"$CI_DIR/.ats2"}
[[ ! -e $destination && ! -L $destination ]] ||
    die "Destination already exists: $destination (choose a new installation directory)."
(cd -- "$archive_dir" && sha256sum --check SHA256SUMS)
mkdir -p -- "$destination"
destination=$(cd -- "$destination" && pwd -P)
tar -xzf "$archive" -C "$destination" --strip-components=1
export PATSHOME="$destination"
export PATH="$PATSHOME/bin:$PATH"
(
    cd -- "$PATSHOME"
    ./configure
    MAKEFLAGS= MFLAGS= GNUMAKEFLAGS= MAKEOVERRIDES= make -j1 all
)
"$PATSHOME/bin/patsopt" --version
printf '\nATS2 installed in %s\n' "$PATSHOME"
printf 'For a custom destination, export PATSHOME to this path before building Xanadu.\n'

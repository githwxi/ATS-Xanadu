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
# GCC on current Cygwin treats implicit function declarations as errors. The
# bundled ATS2-generated C predates prototypes for a few dynload functions.
gcc_wrapper_dir=
if [[ $(uname -s) == CYGWIN* ]]; then
    real_gcc=$(command -v gcc)
    gcc_wrapper_dir=$(mktemp -d "${TMPDIR:-/tmp}/ats2-gcc-wrapper.XXXXXX")
    cat > "$gcc_wrapper_dir/gcc" <<EOF
#!/usr/bin/env bash
exec "$real_gcc" -Wno-error=implicit-function-declaration "\$@"
EOF
    chmod +x "$gcc_wrapper_dir/gcc"
    trap 'rm -r -- "$gcc_wrapper_dir"' EXIT
fi
(
    cd -- "$PATSHOME"
    ./configure
    if [[ -n $gcc_wrapper_dir ]]; then
        PATH="$gcc_wrapper_dir:$PATH" MAKEFLAGS= MFLAGS= GNUMAKEFLAGS= MAKEOVERRIDES= make -j1 all
    else
        MAKEFLAGS= MFLAGS= GNUMAKEFLAGS= MAKEOVERRIDES= make -j1 all
    fi
)
"$PATSHOME/bin/patsopt" --version
printf '\nATS2 installed in %s\n' "$PATSHOME"
printf 'For a custom destination, export PATSHOME to this path before building Xanadu.\n'

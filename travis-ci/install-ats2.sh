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
# glibc exposes bsearch as a _Generic macro under _GNU_SOURCE, which conflicts
# with ATS2's legacy function declaration in this header.
sed -i '/^void \*bsearch$/i #undef bsearch' "$destination/prelude/CATS/array.cats"
export PATSHOME="$destination"
export PATH="$PATSHOME/bin:$PATH"
# Newer GCC versions treat implicit function declarations as errors. The
# bundled ATS2-generated C predates prototypes for a few dynload functions.
real_gcc=$(command -v gcc)
gcc_wrapper_dir=$(mktemp -d "${TMPDIR:-/tmp}/ats2-gcc-wrapper.XXXXXX")
cat > "$gcc_wrapper_dir/gcc" <<EOF
#!/usr/bin/env bash
exec "$real_gcc" -Wno-error=implicit-function-declaration "\$@"
EOF
chmod +x "$gcc_wrapper_dir/gcc"
trap 'rm -r -- "$gcc_wrapper_dir"' EXIT
(
    cd -- "$PATSHOME"
    ./configure
    PATH="$gcc_wrapper_dir:$PATH" MAKEFLAGS= MFLAGS= GNUMAKEFLAGS= MAKEOVERRIDES= make -j1 all
)
"$PATSHOME/bin/patsopt" --version
printf '\nATS2 installed in %s\n' "$PATSHOME"
printf 'For a custom destination, export PATSHOME to this path before building Xanadu.\n'

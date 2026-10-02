#!/usr/bin/env bash
set -euo pipefail
source "$(dirname -- "${BASH_SOURCE[0]}")/common.sh"
[[ $# -eq 0 || ( $# -eq 1 && $1 == --bootstrap ) ]] ||
    die 'Usage: run.sh [--bootstrap]'
# Check test runtimes before spending time on the build.
require node scheme python3
bash "$CI_DIR/build.sh"
bash "$CI_DIR/test.sh"
if [[ ${1:-} == --bootstrap ]]; then
    bash "$CI_DIR/bootstrap.sh"
fi
printf '\nATS-Xanadu CI completed successfully.\n'

#!/usr/bin/env bash
set -euo pipefail
source "$(dirname -- "${BASH_SOURCE[0]}")/common.sh"
[[ $# -le 1 ]] || die 'Usage: test.sh [all|js|cm|py]'

case ${1:-all} in
    all) require node scheme python3; overall testall ;;
    js) require node; overall prelude_TEST_CATS_JS ;;
    cm) require node scheme; overall prelude_TEST_CATS_CM ;;
    py) require node python3; overall prelude_TEST_CATS_PY ;;
    *) die 'Usage: test.sh [all|js|cm|py]' ;;
esac

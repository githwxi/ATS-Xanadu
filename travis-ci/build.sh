#!/usr/bin/env bash
set -euo pipefail
source "$(dirname -- "${BASH_SOURCE[0]}")/common.sh"
setup_ats2
require gcc ar node npm npx
# Makefile_overall invokes npx for the optimized compiler variants.
# Permit package acquisition without an interactive CI prompt.
export npm_config_yes=true
overall all

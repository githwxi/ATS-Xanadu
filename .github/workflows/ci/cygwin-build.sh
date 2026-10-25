#!/usr/bin/env bash

set -euo pipefail

repo_root=$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")/../../.." && pwd -P)
cd "$repo_root"

# GitHub's Windows Node setup provides npx.cmd. Expose it to Cygwin Makefiles
# through a small Cygwin shell wrapper because Cygwin does not package Node.js.
npx_wrapper_dir=$(mktemp -d)
trap 'rm -r -- "$npx_wrapper_dir"' EXIT
cat > "$npx_wrapper_dir/npx" <<'EOF'
#!/usr/bin/env bash
exec cmd.exe /d /c npx.cmd "$@"
EOF
chmod +x "$npx_wrapper_dir/npx"
export PATH="$npx_wrapper_dir:$PATH"

command -v node >/dev/null

bash travis-ci/install-ats2.sh
bash travis-ci/build.sh
bash travis-ci/test.sh js

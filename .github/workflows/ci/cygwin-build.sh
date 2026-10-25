#!/usr/bin/env bash

set -euo pipefail

repo_root=$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")/../../.." && pwd -P)
cd "$repo_root"

# GitHub's Windows Node setup provides node.exe and npx.cmd. Wrap both for
# Cygwin Makefiles: convert POSIX absolute file arguments before invoking
# node.exe, and use cmd.exe to run npx.cmd.
node_wrapper_dir=$(mktemp -d)
trap 'rm -r -- "$node_wrapper_dir"' EXIT
real_node=$(type -P node)
cat > "$node_wrapper_dir/node" <<EOF
#!/usr/bin/env bash
args=()
for arg in "\$@"; do
    if [[ \$arg == /* && -e \$arg ]]; then
        args+=("\$(cygpath -w "\$arg")")
    else
        args+=("\$arg")
    fi
done
exec "$real_node" "\${args[@]}"
EOF
cat > "$node_wrapper_dir/npx" <<'EOF'
#!/usr/bin/env bash
exec cmd.exe /d /c npx.cmd "$@"
EOF
chmod +x "$node_wrapper_dir/node" "$node_wrapper_dir/npx"
export PATH="$node_wrapper_dir:$PATH"

command -v node >/dev/null

bash travis-ci/install-ats2.sh
bash travis-ci/build.sh
bash travis-ci/test.sh js

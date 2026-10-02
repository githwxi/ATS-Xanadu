# ATS-Xanadu CI scripts

These Bash scripts drive the root `Makefile_overall`. They can be invoked
from any working directory, on Travis CI or another CI service.

On an Ubuntu/Debian worker:

```sh
bash travis-ci/install-deps.sh
bash travis-ci/install-ats2.sh
bash travis-ci/run.sh
```

`install-deps.sh` changes system packages and uses sudo when necessary.
It installs Node.js/npm, Java, Chez Scheme,
Python 3, C build tools, and GC/GMP development libraries. It is optional
when the worker already has these dependencies. Package versions follow
the worker's configured repositories.

`install-ats2.sh` verifies the checksum of the bundled
`xassets/ATS2/ATS2-Postiats-gmp-0.4.2.tgz`, extracts it, and builds ATS2
in `travis-ci/.ats2/` (ignored by Git). It does not download ATS2.
An optional directory argument selects a different destination; the
destination must not already exist. A failed installation is left in
place for inspection; use a new destination when retrying.

For an existing ATS2 installation, export `PATSHOME` before building.
Otherwise the build uses `travis-ci/.ats2/`. The installer always uses its
directory argument or default, independently of an inherited `PATSHOME`.
`XATSHOME` is always set to this checkout's root.

| Script | Operation |
| --- | --- |
| `install-ats2.sh [directory]` | Verify, extract, and build the bundled ATS2 release. |
| `build.sh` | Run `Makefile_overall all`: ATS2-based compiler, ATS3 tools, and optimized JavaScript variants. |
| `test.sh [all\|js\|cm\|py]` | Compile and execute prelude tests; defaults to all three backends. Requires built emitters. |
| `bootstrap.sh` | Run `Makefile_overall bootall` to build the BOOTJS1, BOOTCM1, and BOOTPY1 libraries. |
| `run.sh [--bootstrap]` | Build, test, and optionally build bootstrap libraries, stopping on the first failure. |

The build's `_opt1` targets invoke `npx google-closure-compiler`.
The build enables noninteractive npm package acquisition; network access
is needed unless the package is already available. The Makefiles do not
pin that package's version. For reproducible CI, provision a fixed compiler
package and toolchain in the worker image.

Builds run serially because the overall Makefile relies on stage order.
Inherited make flags are cleared to prevent parallel execution or ignored
errors. Output goes directly to the CI log. No cleanup is automatic;
use a fresh checkout for a clean CI run. Build/test outputs are written
in the source tree, so concurrent jobs need separate checkouts.

`bootall` builds libraries; it does not execute the resulting bootstrap
compilers. `testall` runs the prelude suites selected by `Makefile_overall`,
not every test directory in the repository.

The GitHub Actions workflow in `.github/workflows/main.yml` runs these
scripts on Ubuntu 24.04 for pushes and pull requests. It selects Node.js 24
after installing system dependencies. Manual runs through the Actions tab
also offer a `bootstrap` checkbox to build the bootstrap libraries after
the normal build and tests. Commit the workflow, this directory, and `xassets/ATS2/`
to enable the new setup. The workflow replaces the older Windows/macOS
jobs; the dependency installer currently supports Ubuntu/Debian.

A Travis configuration can also call `bash travis-ci/install-deps.sh`
and `bash travis-ci/install-ats2.sh` during installation, then
`bash travis-ci/run.sh` as its build script.

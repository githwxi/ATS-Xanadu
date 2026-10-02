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
scripts on Ubuntu 24.04. A daily check at 2:00 a.m. `America/New_York` time
builds the latest commit on the default branch only if that commit has not
already passed this workflow on that branch. Failed builds are retried on
the next scheduled run. Pushes and pull requests do not trigger builds.
The check uses read-only access to the workflow run history; an API error
fails the check instead of silently skipping a needed build.

Scheduled builds include the bootstrap libraries on alternating New York
calendar dates (every two days, continuing across month boundaries).
Bootstrap runs only when the normal build is needed; it does not force a
rebuild of an unchanged commit that already passed CI. A commit built on
a non-bootstrap day is therefore not rebuilt just for bootstrap the next
day. To retry bootstrap independently of this schedule, use a manual run
with the `bootstrap` checkbox selected.

The schedule follows daylight saving time; when 2:00 a.m. is skipped in
spring, GitHub advances it to the next valid time. Scheduled runs may be
delayed by GitHub. The workflow must be committed to the default branch
for the schedule to take effect.

The build selects Node.js 24 after installing system dependencies and has
a six-hour timeout. Manual runs through the Actions tab always build,
even for an unchanged commit, and offer a `bootstrap` checkbox to build
the bootstrap libraries after the normal build and tests.
Commit the workflow, this directory, and `xassets/ATS2/`
to enable the new setup. The workflow replaces the older Windows/macOS
jobs; the dependency installer currently supports Ubuntu/Debian.

A Travis configuration can also call `bash travis-ci/install-deps.sh`
and `bash travis-ci/install-ats2.sh` during installation, then
`bash travis-ci/run.sh` as its build script.

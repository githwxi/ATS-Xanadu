# Bundled ATS2 bootstrap compiler

`ATS2-Postiats-gmp-0.4.2.tgz` is the gzip-compressed ATS2/Postiats 0.4.2
GMP release source archive used by CI. It contains generated C sources
so building it does not require an existing ATS compiler.

Copied unchanged from the local ats-lang website archive:
`FROZEN000/ATS-Postiats/ATS2-Postiats-gmp-0.4.2.tgz`.
`SHA256SUMS` records the bundled file's checksum for integrity checking.
The archive includes its upstream license files.

The archive's `VERSION` file says `0.4.2`; its built `patsopt --version`
still prints `0.4.1`. This is the version string in the bundled upstream
sources, which are preserved unchanged.

Build with `bash travis-ci/install-ats2.sh` from the repository root.
CI reads this archive directly; it does not download or install an ATS2
distribution package. System build dependencies are still installed by apt.

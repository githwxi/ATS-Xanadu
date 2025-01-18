An interpreter for brainfxxk written in ATS3.

## Instructions to Run

The following assumes you're in the root directory of the
git repository, NOT in
`contrib/gavinz/brainfxxk`.

1. `make -f Makefile_overall` to compile ATS3
   compilers and prelude.

2. `make -C contrib/gavinz/xatslib` to compile my `xatslib` which provides
   additional functions
   that are
   not yet merged into `prelude`.

3. `make -C contrib/gavinz/brainfxxk` to compile the brainfxxk interpreter.

4. `bun run contrib/gavinz/brainfxxk/BUILD/main.js <input-file>` to interpret a
   brainfxxk program. For example,
   `bun run contrib/gavinz/brainfxxk/BUILD/main.js
   contrib/gavinz/brainfxxk/hello.bf`

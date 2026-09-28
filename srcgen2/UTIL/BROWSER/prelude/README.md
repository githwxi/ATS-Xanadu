# ATS3 prelude snapshot

This directory contains an embedded snapshot of the ATS3 prelude. Open
`index.html` directly in your browser to browse its files; no HTTP server or
network connection is needed.

JavaScript on that page (including the browser console) can call:

```js
const text = readFile("SATS/char000.sats"); // synchronous UTF-8 string
const bytes = readFileBytes("README.md"); // Uint8Array for exact bytes
const paths = listFiles(); // sorted relative paths
```

Paths use forward slashes and are relative to the original ATS3 prelude root,
so `SATS/char000.sats` refers to a file inside that prelude. Missing files and
paths escaping the snapshot root throw errors. The HTML is a snapshot; it does
not read subsequent filesystem changes.

## Use by the compiler page

The builder at `../build.py` reads the embedded files from this directory's
`index.html` and includes them in the standalone compiler page at `../index.html`.
From the parent directory (`BROWSER`), run:

```sh
python3 build.py
```

This repackages the existing prelude snapshot; it does not refresh it from the
ATS3 source tree. The resulting compiler page needs no separate prelude files
at runtime.

## Snapshot sources

`template.html` is the source template for the snapshot browser.

The local `build.py` reads the repository's top-level `prelude/` source directory,
located relative to the script, independently of your working directory. From
`BROWSER`, refresh the snapshot and rebuild the compiler page with:

```sh
python3 prelude/build.py
python3 build.py
```

To use a different ATS3 prelude source tree:

```sh
python3 prelude/build.py --source /path/to/ATS-Xanadu/prelude
```

The builder validates the source directory before writing `prelude/index.html`.
It embeds regular files (including hidden files) as Base64, skips symlink files
and directories, and excludes `.git`, `.agents`, `.codex`, `__pycache__`, and the
snapshot directory itself. `template.html` and the build script are resolved
relative to this directory; the generated snapshot always goes here.

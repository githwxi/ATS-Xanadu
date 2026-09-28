# xats2js browser playground

Open **index.html** directly in a modern browser.
It is a standalone, offline page with the same source chooser and
editor as the xatsopt browser page.

1. Choose a file, Manual Input, Factorial, or Fibonacci.
2. Click **Compile** (Ctrl/Command + Enter).
3. Review **Compiler output** and **Generated JavaScript**.
4. Click **Run JavaScript** and read **Program output**.

**Stop** interrupts either compilation or execution, including
infinite loops.  Changing source or filename cancels active work and
invalidates generated code.  Manual Input preserves its draft when
switching sources. **Save source** saves the editor; **Save
JavaScript** includes the runtime and a final ATS print flush.

The emitter accepts dynamic ATS source (`.dats`). The repository
prelude is embedded; sibling files and project dependencies are not
automatically loaded.  The compiler reports raw diagnostics, not a
structured success flag. It may emit JavaScript even after errors:
“Compilation finished” is not a guarantee that the program is
valid. Execution is always a separate, explicit action.

Each compile and run uses a fresh Blob Web Worker. Console messages
are shown as they arrive; buffered ATS `prints` output is flushed at
completion or a runtime exception. Stopping discards buffered
output. Runs are synchronous; callbacks scheduled after the top-level
program finishes are not awaited.  Workers have no page DOM or Node.js
APIs. They keep the editor responsive but are not a security sandbox
for untrusted JavaScript. The page itself makes no network requests;
generated programs can use worker browser APIs.

## Build and test

```sh
make          # Refresh prelude/runtime snapshots and build the page
make test     # Node.js integration and UI-state tests
```

The builder embeds the compiler bundle in
`xassets/xats2js_jsemit01_ats2.js`, the local `prelude/index.html`
snapshot, and the four browser-compatible runtime files stored in
`xshared/index.html`, along with the UI and worker scripts. It does
not depend on the xatsopt page being built.  The copied snapshot tools
in `prelude/` build a browsable, standalone snapshot from the
repository's top-level `prelude/`. Run `python3 prelude/build.py` to
refresh it, then `python3 build.py` to package it into the compiler
page. Run `python3 xshared/build.py` to refresh the runtime snapshot
from `../../xshared/runtime/`. Both snapshot pages can be opened
directly to browse their embedded files.  Running only `python3
build.py` reuses the existing snapshots, including one built with
`python3 prelude/build.py --source /path/to/another/prelude`.

The resulting HTML is about 100 MB because the compiler is
unoptimized; opening it and starting compilation can take a few
seconds.

To rebuild the compiler bundle itself, use the existing build under
`xassets/` with `XATSHOME` configured. Changes to the UI, runtime,
compiler, or prelude require rebuilding `index.html`. Python and Node
are development dependencies; using the generated page requires only a
browser with JavaScript and workers.

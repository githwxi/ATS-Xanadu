# ATS3 in-browser compiler

Open **index.html directly in your browser**. No server, installation, or network
connection is needed. The HTML file is standalone and can be copied elsewhere.

1. Open **Choose Source** and select **Choose File…**, **Manual Input**, or a canned
   example (including factorial and Fibonacci). Manual Input starts with a blank
   editor and preserves its draft when you switch to a file or example.
2. Edit **Filename** above the source to choose its name. Use `.sats` for static
   declarations or `.dats` for dynamic source. This name appears in compiler
   diagnostics and is used by **Save source**.
3. Click **Type-check** or press Ctrl/Command + Enter.
4. Read the compiler diagnostics. **Stop** cancels a running check.

Source stays inside the browser. The compiler only type-checks; it does not
execute your ATS3 program. Opening a file preserves its filename in the editor. New examples default to
`xtmp001.dats` or `xtmp001.sats`. The embedded prelude is available;
sibling files and other project dependencies are not automatically imported.

The compiler prints raw diagnostics rather than returning a structured pass/fail
status. “Check finished” means it completed; inspect the diagnostics, including
`F3PERR0_D3PARSED:`, for reported errors.

## Rebuilding the standalone page

After editing the UI or updating the compiler/prelude assets, run:

```sh
python3 build.py
```

The builder embeds `app.js`, `compiler-worker.js`, the optimized compiler at
`xassets/xatsopt_tcheck01_ats2_opt1.js`, and the snapshot from
`prelude/index.html` into `template.html`, producing `index.html`.
Python is needed only to rebuild the page, not to use it.

Each click creates a fresh Blob Web Worker from the embedded compiler. The
worker receives the editor text and prelude files, configures the compiler's
synchronous browser filesystem and output streams, then invokes the compiler.
There are no fetches, external script loads, or server calls. Output is buffered
until completion. A modern browser with JavaScript and Web Workers is required.

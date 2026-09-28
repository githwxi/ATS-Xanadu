# xats2js runtime snapshot

Open `index.html` directly in a browser to browse the four embedded JavaScript
runtime files. The page is standalone and works offline. As with the prelude
snapshot, it exposes `readFile(name)`, `readFileBytes(name)`, and `listFiles()`.
The JavaScript files are stored as Base64 data; browsing does not execute them.

The snapshot contains these files, used in this order by the compiler page:

1. `xats2js_js1emit.js`
2. `srcgen2_precats.js`
3. `srcgen2_prelude.js`
4. `srcgen2_xatslib.js`

From `BROWSER`, run `python3 xshared/build.py` to refresh the snapshot from
`../../xshared/runtime/`, then `python3 build.py` to rebuild the compiler page.
Alternatively, `make` refreshes both the prelude and runtime snapshots and
builds the compiler page. All source paths are resolved relative to the scripts.

To snapshot another runtime directory:

```sh
python3 xshared/build.py --source /path/to/runtime
python3 build.py
```

The builder requires all four files before writing the snapshot. The main
builder reads the snapshot rather than the original runtime directory.
Node-specific runtime files are excluded because they require Node.js APIs.

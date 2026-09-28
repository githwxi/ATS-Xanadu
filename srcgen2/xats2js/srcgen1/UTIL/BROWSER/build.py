#!/usr/bin/env python3
"""Build index.html using the local prelude and runtime snapshots.

Reuse local snapshots without reading or refreshing their repository sources.
"""
import base64
import json
import re
from pathlib import Path

root = Path(__file__).resolve().parent
snapshot_path = root / 'prelude/index.html'
if not snapshot_path.is_file():
    raise SystemExit('Missing prelude/index.html; run python3 prelude/build.py first.')
snapshot = snapshot_path.read_text(encoding='utf-8')
match = re.search(r'<script id="embedded-files" type="application/json">(.*?)</script>', snapshot, re.S)
if not match:
    raise SystemExit('Prelude snapshot has no embedded-files payload')
files = json.loads(match[1])

runtime_path = root / 'xshared/index.html'
if not runtime_path.is_file():
    raise SystemExit('Missing xshared/index.html; run python3 xshared/build.py first.')
runtime_snapshot = runtime_path.read_text(encoding='utf-8')
runtime_match = re.search(r'<script id="embedded-files" type="application/json">(.*?)</script>', runtime_snapshot, re.S)
if not runtime_match:
    raise SystemExit('Runtime snapshot has no embedded-files payload')
runtime_files = json.loads(runtime_match[1])
runtime_names = ('xats2js_js1emit.js', 'srcgen2_precats.js',
                 'srcgen2_prelude.js', 'srcgen2_xatslib.js')
for name in runtime_names:
    if name not in runtime_files:
        raise SystemExit(f'Runtime snapshot is missing {name}')
runtime = '\n'.join(base64.b64decode(runtime_files[name], validate=True).decode('utf-8')
                    for name in runtime_names)

def embed(value):
    # Prevent embedded text from closing its HTML script element.
    return json.dumps(value, ensure_ascii=True).replace('<', r'\u003c')

assets = {
    'COMPILER': embed((root / 'xassets/xats2js_jsemit01_ats2.js').read_text()),
    'PRELUDE': embed(files),
    'WORKER': embed((root / 'compiler-worker.js').read_text()),
    'RUNTIME': embed(runtime),
    'RUNNER': embed((root / 'runner-worker.js').read_text()),
    'APP': (root / 'app.js').read_text(),
}
html = re.sub(r'@@(COMPILER|PRELUDE|WORKER|RUNTIME|RUNNER|APP)@@',
              lambda m: assets[m[1]], (root / 'template.html').read_text())
(root / 'index.html').write_text(html)
print(f'Embedded {len(files)} files from {snapshot_path}.')
print(f'Embedded {len(runtime_names)} runtime files from {runtime_path}.')
print(f'Built index.html ({len(html.encode()):,} bytes); open it directly in a browser.')

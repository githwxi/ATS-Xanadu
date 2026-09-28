#!/usr/bin/env python3
"""Build the standalone, offline browser compiler using local assets only."""
import json
import re
from pathlib import Path

root = Path(__file__).resolve().parent
snapshot = (root / 'prelude/index.html').read_text()
match = re.search(r'<script id="embedded-files" type="application/json">(.*?)</script>', snapshot, re.S)
if not match:
    raise SystemExit('Prelude snapshot has no embedded-files payload')

def embed(value):
    # Prevent embedded text from closing its HTML script element.
    return json.dumps(value, ensure_ascii=True).replace('<', r'\u003c')

assets = {
    'COMPILER': embed((root / 'xassets/xatsopt_tcheck01_ats2_opt1.js').read_text()),
    'PRELUDE': embed(json.loads(match[1])),
    'WORKER': embed((root / 'compiler-worker.js').read_text()),
    'APP': (root / 'app.js').read_text(),
}
html = re.sub(r'@@(COMPILER|PRELUDE|WORKER|APP)@@',
              lambda m: assets[m[1]], (root / 'template.html').read_text())
(root / 'index.html').write_text(html)
print(f'Built index.html ({len(html.encode()):,} bytes); open it directly in a browser.')

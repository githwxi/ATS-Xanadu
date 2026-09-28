#!/usr/bin/env python3
"""Build a standalone snapshot of the browser-compatible xats2js runtime."""
import argparse
import base64
import json
from pathlib import Path

HERE = Path(__file__).resolve().parent
DEFAULT_ROOT = HERE.parents[2] / 'xshared/runtime'
RUNTIME_FILES = (
    'xats2js_js1emit.js',
    'srcgen2_precats.js',
    'srcgen2_prelude.js',
    'srcgen2_xatslib.js',
)
MARKER = '/* EMBEDDED_FILES */ {}'


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument('--source', type=Path, default=DEFAULT_ROOT,
                        help='Directory containing the four JavaScript runtime files')
    source = parser.parse_args().source.resolve()
    files = {}
    for name in RUNTIME_FILES:
        path = source / name
        if not path.is_file():
            parser.error(f'Missing runtime file: {path}')
        files[name] = base64.b64encode(path.read_bytes()).decode('ascii')

    template = (HERE / 'template.html').read_text(encoding='utf-8')
    if template.count(MARKER) != 1:
        raise SystemExit('Snapshot template must contain exactly one embedded-files marker')
    payload = json.dumps(files, ensure_ascii=True).replace('<', r'\u003c')
    output = HERE / 'index.html'
    output.write_text(template.replace(MARKER, payload), encoding='utf-8')
    print(f'Embedded {len(files)} runtime files from {source} in {output}')


if __name__ == '__main__':
    main()

#!/usr/bin/env python3
"""Rebuild the browser snapshot from the repository's ATS3 prelude."""
import argparse
import base64
import json
import os
from pathlib import Path

HERE = Path(__file__).resolve().parent
DEFAULT_ROOT = HERE.parents[5] / "prelude"
EXCLUDED = {".git", ".agents", ".codex", "__pycache__"}
MARKER = "/* EMBEDDED_FILES */ {}"


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument(
        "--source", type=Path, default=DEFAULT_ROOT,
        help="ATS3 prelude source directory (default: repository-root/prelude)",
    )
    root = parser.parse_args().source.resolve()
    for required in ("basics0.sats", "fixity0.sats", "SATS/char000.sats",
                     "INIT/prelude_sats.hats"):
        if not (root / required).is_file():
            parser.error(f"Not an ATS3 prelude source directory: {root} (missing {required})")
    if root == HERE:
        parser.error("The source must not be the browser snapshot directory")

    template = (HERE / "template.html").read_text(encoding="utf-8")
    if template.count(MARKER) != 1:
        raise SystemExit("Snapshot template must contain exactly one embedded-files marker")

    files = {}
    for directory, dirs, names in os.walk(root, followlinks=False):
        parent = Path(directory)
        dirs[:] = sorted(
            name for name in dirs
            if name not in EXCLUDED
            and not (parent / name).is_symlink()
            and (parent / name).resolve() != HERE
        )
        for name in sorted(names):
            path = parent / name
            if path.is_file() and not path.is_symlink():
                relative = path.relative_to(root).as_posix()
                files[relative] = base64.b64encode(path.read_bytes()).decode("ascii")

    # Escape '<' so filenames cannot terminate the HTML script element.
    payload = json.dumps(files, ensure_ascii=True, sort_keys=True).replace("<", "\\u003c")
    output = HERE / "index.html"
    output.write_text(template.replace(MARKER, payload), encoding="utf-8")
    print(f"Embedded {len(files)} files from {root} in {output}")


if __name__ == "__main__":
    main()

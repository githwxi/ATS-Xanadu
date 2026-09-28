// Prepended to the bundled compiler inside an in-memory Blob worker.
self.onmessage = ({ data }) => {
  let stdout = '', stderr = '';
  const streams = {
    'xats2js-browser-stdin': { value: '' },
    'xats2js-browser-stdout': { write: text => { stdout += text; } },
    'xats2js-browser-stderr': { write: text => { stderr += text; } }
  };
  self.document = { getElementById: id => streams[id] ?? null };
  const cache = new Map();
  const normalize = path => {
    const parts = [];
    for (const part of path.split('/')) {
      if (!part || part === '.') continue;
      if (part === '..') parts.pop(); else parts.push(part);
    }
    return parts.join('/');
  };
  self.XATS2JS_BROWSER = {
    argv: ['browser', 'xatsopt', data.filename],
    XATSHOME: '',
    readFile(path) {
      const key = normalize(path);
      if (key === data.filename) return data.source;
      const relative = key.replace(/^(?:srcgen2\/)?prelude\//, '');
      if (!Object.hasOwn(data.files, relative)) throw new Error(`File not found: ${path}`);
      if (!cache.has(relative)) cache.set(relative,
        new TextDecoder().decode(Uint8Array.from(atob(data.files[relative]), c => c.charCodeAt(0))));
      return cache.get(relative);
    }
  };
  try {
    runCompiler();
    self.postMessage({ stdout, stderr });
  } catch (error) {
    self.postMessage({ stdout, stderr, error: String(error?.stack || error) });
  }
};

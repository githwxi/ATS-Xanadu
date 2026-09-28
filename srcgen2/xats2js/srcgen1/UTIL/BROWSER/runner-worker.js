// Each execution gets a fresh worker; Stop terminates synchronous loops too.
self.onmessage = () => {
  const send = self.postMessage.bind(self);
  const format = value => {
    if (typeof value === 'string') return value;
    try { return JSON.stringify(value) ?? String(value); }
    catch { return String(value); }
  };
  for (const level of ['log', 'info', 'warn', 'error', 'debug']) {
    console[level] = (...values) => send({ output: values.map(format).join(' ') + '\n' });
  }
  try {
    const output = runProgram();
    send({ output, done: true });
  } catch (error) {
    // Preserve buffered ATS prints even when the program throws.
    const output = typeof self.flushPrints === 'function' ? self.flushPrints() : '';
    send({ output, done: true, error: String(error?.stack || error) });
  }
};

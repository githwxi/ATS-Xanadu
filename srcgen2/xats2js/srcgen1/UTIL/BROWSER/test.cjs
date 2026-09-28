// Test the exact scripts embedded in the standalone page, without a server.
const assert = require('node:assert/strict');
const fs = require('node:fs');
const vm = require('node:vm');
const path = require('node:path');
const html = fs.readFileSync(path.join(__dirname, 'index.html'), 'utf8');
const asset = id => JSON.parse(html.match(new RegExp(`<script id="${id}" type="application/json">(.*?)</script>`, 's'))[1]);
const compiler = new vm.Script(asset('worker-source') + '\nfunction runCompiler(){\n' + asset('compiler-source') + '\n}');
const files = asset('prelude-files');
function compile(source) {
  let result;
  const context = vm.createContext({ TextDecoder, atob });
  context.self = context;
  context.postMessage = value => { result = value; };
  compiler.runInContext(context);
  context.onmessage({ data: { source, filename: 'test.dats', files } });
  return result;
}
function execute(script) {
  const messages = [];
  const context = vm.createContext({ console: {} });
  context.self = context;
  context.postMessage = value => messages.push(value);
  new vm.Script(script).runInContext(context);
  context.onmessage({ data: {} });
  return messages;
}

// Minimal DOM/Worker doubles exercise the real app's event handlers and Blob contents.
const nodes = new Map();
for (const match of html.matchAll(/\bid="([^"]+)"/g)) {
  nodes.set(match[1], { value: '', textContent: '', disabled: false,
    focus() {}, setCustomValidity(message) { this.invalid = message; },
    reportValidity() { return !this.invalid; } });
}
for (const id of ['compiler-source', 'prelude-files', 'worker-source', 'runtime-source', 'runner-source']) {
  nodes.get(id).textContent = JSON.stringify(asset(id));
}
const node = id => nodes.get(id);
const workers = [], blobs = new Map();
let nextURL = 0;
class Worker {
  constructor(url) { this.url = url; workers.push(this); }
  postMessage(data) { this.data = data; }
  terminate() { this.terminated = true; }
}
const context = vm.createContext({ Blob, Worker, performance, setTimeout,
  URL: { createObjectURL(blob) { const url = `blob:${++nextURL}`; blobs.set(url, blob); return url; },
    revokeObjectURL(url) { blobs.delete(url); } },
  document: { getElementById: node, querySelectorAll: () => [], addEventListener() {} },
  window: { addEventListener() {} }
});
const app = html.match(/<script>\s*('use strict';.*?)<\/script>/s)[1];
vm.runInContext(app, context);

(async () => {
  assert.equal(node('run').disabled, true);
  node('check').onclick();
  const first = workers.at(-1);
  assert.equal(node('check').disabled, true);
  assert.match(first.data.source, /factorial/);
  const factorial = compile(first.data.source);
  assert.equal(factorial.error, undefined);
  assert.doesNotMatch(factorial.stderr, /-ERROR:/);
  first.onmessage({ data: factorial });
  assert.equal(first.terminated, true);
  assert.equal(node('run').disabled, false);
  node('run').onclick();
  const run = workers.at(-1);
  const runnerScript = await blobs.get(run.url).text();
  const messages = execute(runnerScript);
  assert.equal(messages.at(-1).output, 'factorial(5) = 120\n');
  for (const data of messages) run.onmessage({ data });
  assert.equal(node('program-output').textContent, 'factorial(5) = 120\n');
  assert.equal(run.terminated, true);
  assert.equal(blobs.has(run.url), false);
  console.log('PASS factorial compile/run and worker lifecycle');

  const fibonacci = compile(vm.runInContext('examples.fibonacci', context));
  assert.equal(fibonacci.error, undefined);
  assert.doesNotMatch(fibonacci.stderr, /-ERROR:/);
  const runPrefix = asset('runner-source') + '\nfunction runProgram(){\n' + asset('runtime-source') + '\nself.flushPrints = XATS2JS_the_print_store_flush;\n';
  const runSuffix = '\nreturn XATS2JS_the_print_store_flush();\n}';
  assert.equal(execute(runPrefix + fibonacci.stdout + runSuffix).at(-1).output, 'fibonacci(10) = 55\n');
  console.log('PASS fibonacci compile/run');

  for (const key of ['error', 'syntax']) {
    const result = compile(vm.runInContext(`examples.${key}`, context));
    assert.match(result.stderr, /-ERROR:/);
    console.log(`PASS ${key} diagnostics`);
  }
  const failedRun = execute(runPrefix + 'XATS2JS_strn_print("before error"); throw Error("test exception");' + runSuffix);
  assert.equal(failedRun.at(-1).output, 'before error');
  assert.match(failedRun.at(-1).error, /test exception/);
  const consoleRun = execute(runPrefix + 'console.log("hello", 42);' + runSuffix);
  assert.equal(consoleRun[0].output, 'hello 42\n');
  console.log('PASS console output and runtime exceptions preserve ATS output');

  node('run').onclick();
  const stoppedRun = workers.at(-1);
  node('stop').onclick();
  assert.equal(stoppedRun.terminated, true);
  assert.equal(node('check').disabled, false);
  node('source').oninput();
  assert.equal(node('run').disabled, true);
  assert.equal(node('save-js').disabled, true);
  node('check').onclick();
  const stoppedCompiler = workers.at(-1);
  node('filename').oninput();
  assert.equal(stoppedCompiler.terminated, true);
  assert.equal(node('stop').disabled, true);
  assert.equal(node('run').disabled, true);
  vm.runInContext('setSource("manual", "draft", "draft.dats", "Manual Input")', context);
  node('source').value = 'edited draft';
  vm.runInContext('setSource("factorial", examples.factorial, "test.dats", "Factorial")', context);
  assert.equal(vm.runInContext('manualDraft', context), 'edited draft');
  node('filename').value = '../bad.dats';
  const count = workers.length;
  node('check').onclick();
  assert.equal(workers.length, count);
  console.log('PASS cancellation, stale-code prevention, manual drafts, filename validation');
})().catch(error => { console.error(error); process.exitCode = 1; });

'use strict';
const $ = id => document.getElementById(id);
const examples = {
  factorial: '// Recursive factorial (for nonnegative integers).\nfun factorial(n: sint): sint =\n  if n > 0 then n * factorial(n - 1) else 1\n\nval result: sint = factorial(5)\n',
  fibonacci: '// Recursive Fibonacci (for nonnegative integers).\nfun fibonacci(n: sint): sint =\n  if n >= 2 then fibonacci(n - 1) + fibonacci(n - 2) else n\n\nval result: sint = fibonacci(10)\n',
  valid: 'fun square(x: sint): sint = x * x\n\nval answer: sint = square(6)\n',
  error: 'val answer: sint = "hello"\n',
  syntax: 'val answer =\n'
};
// All assets are embedded in index.html; no fetch or external scripts are used.
const runtime = JSON.parse($('runtime-source').textContent);
const runner = JSON.parse($('runner-source').textContent);
let generated = '';
let compiledFilename = '';
let runURL = null;
const files = JSON.parse($('prelude-files').textContent);
const workerURL = URL.createObjectURL(new Blob([
  JSON.parse($('worker-source').textContent),
  '\nfunction runCompiler() {\n',
  JSON.parse($('compiler-source').textContent),
  '\n}\n'
], { type: 'text/javascript' }));
let worker = null;
let started = 0;
function finish(message) {
  worker?.terminate();
  worker = null;
  if (runURL) URL.revokeObjectURL(runURL);
  runURL = null;
  $('run').disabled = !generated;
  $('save-js').disabled = !generated;
  $('check').disabled = false;
  $('stop').disabled = true;
  $('status').textContent = message;
  $('elapsed').textContent = `${((performance.now() - started) / 1000).toFixed(2)} s`;
}
function sourceFilename() {
  const input = $('filename');
  const name = input.value.trim();
  const invalid = !name || name === '.' || name === '..' || /[\/\\:*?"<>|\x00-\x1f]/.test(name);
  input.setCustomValidity(invalid ? 'Enter a filename without folders or special characters such as /, \\, or :.' : '');
  if (!input.reportValidity()) return null;
  input.value = name;
  return name;
}
function check() {
  if (worker) return;
  const filename = sourceFilename();
  if (!filename) return;
  started = performance.now();
  invalidate();
  $('output').textContent = '';
  $('elapsed').textContent = '';
  $('check').disabled = true;
  $('stop').disabled = false;
  $('status').textContent = 'Compiling…';
  try {
    worker = new Worker(workerURL);
    worker.onmessage = ({ data }) => {
      $('output').textContent = [data.stderr, data.error].filter(Boolean).join('\n') || '(No compiler output)';
      generated = data.error ? '' : data.stdout;
      compiledFilename = filename;
      $('generated').textContent = generated || '(No JavaScript generated)';
      // The compiler entry point supplies diagnostics, not a structured exit status.
      finish(data.error ? 'Compiler could not finish — see output.' : 'Compilation finished — review diagnostics.');
      $('output').scrollTop = $('output').scrollHeight;
    };
    worker.onerror = event => {
      $('output').textContent = event.message || 'Could not start the in-browser compiler.';
      finish('Compiler could not finish.');
    };
    worker.postMessage({ source: $('source').value, filename, files });
  } catch (error) {
    $('output').textContent = String(error);
    finish('Compiler could not start.');
  }
}
$('check').onclick = check;
$('stop').onclick = () => finish('Stopped.');
let activeSource = 'valid';
let manualDraft = '';
let manualFilename = 'xtmp001.dats';
function setSource(key, text, filename, label) {
  if (activeSource === 'manual') {
    manualDraft = $('source').value;
    manualFilename = $('filename').value;
  }
  invalidate();
  activeSource = key;
  $('source').value = text;
  $('filename').value = filename;
  $('filename').setCustomValidity('');
  $('source-name').textContent = label;
  $('source-menu').open = false;
  $('output').textContent = 'Click Compile to view compiler diagnostics.';
  $('elapsed').textContent = '';
  $('status').textContent = 'Ready to compile.';
  $('source').focus();
}
$('choose-file').onclick = () => {
  $('source-menu').open = false;
  $('file').click();
};
for (const button of document.querySelectorAll('[data-source]')) {
  button.onclick = () => {
    const key = button.dataset.source;
    if (key === 'manual') {
      if (activeSource === 'manual') {
        $('source-menu').open = false;
        $('source').focus();
      } else setSource(key, manualDraft, manualFilename, 'Manual Input');
    } else setSource(key, examples[key], 'xtmp001.dats', button.textContent);
  };
}
document.addEventListener('click', event => {
  if (!$('source-menu').contains(event.target)) $('source-menu').open = false;
});
document.addEventListener('keydown', event => {
  if (event.key === 'Escape' && $('source-menu').open) {
    $('source-menu').open = false;
    $('source-menu').querySelector('summary').focus();
  }
});
$('source').onkeydown = event => {
  if (event.key === 'Enter' && (event.ctrlKey || event.metaKey)) { event.preventDefault(); check(); }
  if (event.key === 'Tab') {
    event.preventDefault();
    $('source').setRangeText('  ', $('source').selectionStart, $('source').selectionEnd, 'end');
    invalidate();
  }
};
$('file').onchange = async event => {
  const file = event.target.files[0];
  if (!file) return;
  try {
    setSource('file', await file.text(), file.name, file.name);
  } catch (error) { $('status').textContent = `Cannot open file: ${error.message}`; }
  event.target.value = '';
};
$('save').onclick = () => {
  const filename = sourceFilename();
  if (!filename) return;
  const url = URL.createObjectURL(new Blob([$('source').value], { type: 'text/plain;charset=utf-8' }));
  const link = document.createElement('a');
  link.href = url; link.download = filename; link.click();
  setTimeout(() => URL.revokeObjectURL(url), 1000);
};
window.addEventListener('pagehide', () => { if (worker) finish('Stopped.'); });

function invalidate() {
  if (worker) finish('Stopped — source changed.');
  generated = '';
  $('run').disabled = true;
  $('save-js').disabled = true;
  $('generated').textContent = 'Compile source to generate JavaScript.';
  $('program-output').textContent = 'Run generated JavaScript to see output.';
  $('status').textContent = 'Source changed — compile to generate JavaScript.';
}
$('source').oninput = invalidate;
$('filename').oninput = () => { $('filename').setCustomValidity(''); invalidate(); };
$('run').onclick = () => {
  if (worker || !generated) return;
  started = performance.now();
  $('program-output').textContent = '';
  $('status').textContent = 'Running JavaScript…';
  $('check').disabled = true;
  $('run').disabled = true;
  $('stop').disabled = false;
  try {
    runURL = URL.createObjectURL(new Blob([runner, '\nfunction runProgram() {\n', runtime,
      '\nself.flushPrints = XATS2JS_the_print_store_flush;\n', generated,
      '\n;return XATS2JS_the_print_store_flush();\n}\n'], { type: 'text/javascript' }));
    worker = new Worker(runURL);
    worker.onmessage = ({ data }) => {
      if (data.output) $('program-output').textContent += data.output;
      if (data.done) {
        if (data.error) $('program-output').textContent += '\n' + data.error;
        if (!$('program-output').textContent) $('program-output').textContent = '(No program output)';
        finish(data.error ? 'Program failed — see output.' : 'Program finished.');
      }
    };
    worker.onerror = event => {
      $('program-output').textContent += event.message;
      finish('Program failed — see output.');
    };
    worker.postMessage({});
  } catch (error) {
    $('program-output').textContent = String(error);
    finish('Program could not start.');
  }
};
$('save-js').onclick = () => {
  if (!generated) return;
  const url = URL.createObjectURL(new Blob([runtime, '\n', generated,
    '\nconsole.log(XATS2JS_the_print_store_flush());\n'], { type: 'text/javascript;charset=utf-8' }));
  const link = document.createElement('a');
  link.href = url;
  link.download = compiledFilename.replace(/\.[^.]*$/, '') + '.js';
  link.click();
  setTimeout(() => URL.revokeObjectURL(url), 1000);
};
const printPrelude = '#include "prelude/HATS/prelude_dats.hats"\n#include "prelude/HATS/prelude_JS_dats.hats"\n\n';
examples.factorial = printPrelude + examples.factorial + 'val () = prints("factorial(5) = ", result, "\\n")\n';
examples.fibonacci = printPrelude + examples.fibonacci + 'val () = prints("fibonacci(10) = ", result, "\\n")\n';
setSource('factorial', examples.factorial, 'xtmp001.dats', 'Factorial function');

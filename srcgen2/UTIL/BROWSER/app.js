'use strict';
const $ = id => document.getElementById(id);
const examples = {
  factorial: '// Recursive factorial (for nonnegative integers).\nfun factorial(n: sint): sint =\n  if n > 0 then n * factorial(n - 1) else 1\n\nval result: sint = factorial(5)\n',
  fibonacci: '// Recursive Fibonacci (for nonnegative integers).\nfun fibonacci(n: sint): sint =\n  if n >= 2 then fibonacci(n - 1) + fibonacci(n - 2) else n\n\nval result: sint = fibonacci(10)\n',
  valid: 'fun square(x: sint): sint = x * x\n\nval answer: sint = square(6)\n',
  error: 'val answer: sint = "hello"\n',
  syntax: 'val answer =\n',
  static: 'fun square(x: sint): sint\n'
};
// All assets are embedded in index.html; no fetch or external scripts are used.
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
$('filename').oninput = () => $('filename').setCustomValidity('');
function check() {
  if (worker) return;
  const filename = sourceFilename();
  if (!filename) return;
  started = performance.now();
  $('output').textContent = '';
  $('elapsed').textContent = '';
  $('check').disabled = true;
  $('stop').disabled = false;
  $('status').textContent = 'Type-checking…';
  try {
    worker = new Worker(workerURL);
    worker.onmessage = ({ data }) => {
      $('output').textContent = [data.stdout, data.stderr, data.error].filter(Boolean).join('\n') || '(No compiler output)';
      // The compiler entry point supplies diagnostics, not a structured exit status.
      finish(data.error ? 'Compiler could not finish — see output.' : 'Check finished — review diagnostics.');
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
$('stop').onclick = () => { finish('Check stopped.'); $('output').textContent = 'Check stopped before completion.'; };
let activeSource = 'valid';
let manualDraft = '';
let manualFilename = 'xtmp001.dats';
function setSource(key, text, filename, label) {
  if (activeSource === 'manual') {
    manualDraft = $('source').value;
    manualFilename = $('filename').value;
  }
  if (worker) finish('Check stopped — source changed.');
  activeSource = key;
  $('source').value = text;
  $('filename').value = filename;
  $('filename').setCustomValidity('');
  $('source-name').textContent = label;
  $('source-menu').open = false;
  $('output').textContent = 'Click Type-check to view compiler diagnostics.';
  $('elapsed').textContent = '';
  $('status').textContent = 'Ready to type-check.';
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
    } else setSource(key, examples[key], key === 'static' ? 'xtmp001.sats' : 'xtmp001.dats', button.textContent);
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
window.addEventListener('pagehide', () => { worker?.terminate(); });

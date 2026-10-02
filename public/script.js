const stages = {
  parse: { label: 'FROM TEXT TO STRUCTURE', title: 'Give source code a shape.', description: 'Handwritten lexing and parsing turn source text into a level-0 abstract syntax tree. Subsequent passes resolve operator fixity and name bindings.', code: '// the front end\nsource text\n    ↓ lexing + parsing\nlevel-0 AST\n    ↓ fixity + binding resolution\nlevel-2 AST' },
  types: { label: 'THE FIRST LAYER', title: 'Make sense of the types.', description: 'Pre-type-checking synthesizes information for resolving overloaded symbols. Simple type-checking then checks ML-like types; polymorphic types require explicit annotations.', code: '// checking the program\nlevel-2 AST\n    ↓ pre-type-checking\n    ↓ resolve overloaded symbols\n    ↓ simple type-checking\nlevel-3 AST' },
  templates: { label: 'TYPE-BASED METAPROGRAMMING', title: 'Find the right implementation.', description: 'The compiler normalizes template arguments and records top-level implementations. Two resolution phases handle template instances and recursively resolve templates within their bodies.', code: '// resolving templates\nnormalize template arguments\n    ↓ table implementations\nresolve template instances\n    ↓ recursively resolve bodies\ninstantiated templates' },
  generate: { label: 'FROM ATS3 TO EXECUTION', title: 'Bring the program to life.', description: 'Backend implementations translate the program to target code. JavaScript made self-hosting possible, and the repository also includes a Python backend and additional target implementations.', code: '// a self-hosted system\nATS3 source\n    ↓ ATS3 compiler\nJavaScript output\n    ↓ Node.js\ncompile the compiler itself' }
};
const tabs = [...document.querySelectorAll('[data-stage]')];
function selectStage(tab) {
  tabs.forEach(button => { const active = button === tab; button.setAttribute('aria-selected', String(active)); button.tabIndex = active ? 0 : -1; });
  const stage = stages[tab.dataset.stage];
  for (const key of ['label', 'title', 'description', 'code']) document.getElementById(`stage-${key}`).textContent = stage[key];
  document.getElementById('stage').setAttribute('aria-labelledby', tab.id);
}
tabs.forEach((tab, index) => {
  tab.addEventListener('click', () => selectStage(tab));
  tab.addEventListener('keydown', event => {
    let next;
    if (event.key === 'ArrowRight') next = (index + 1) % tabs.length;
    if (event.key === 'ArrowLeft') next = (index + tabs.length - 1) % tabs.length;
    if (event.key === 'Home') next = 0;
    if (event.key === 'End') next = tabs.length - 1;
    if (next !== undefined) { event.preventDefault(); selectStage(tabs[next]); tabs[next].focus(); }
  });
});
document.getElementById('copy').addEventListener('click', async () => {
  const button = document.getElementById('copy');
  const command = 'git clone https://github.com/githwxi/ATS-Xanadu.git\ncd ATS-Xanadu';
  try {
    if (!navigator.clipboard) throw new Error('Clipboard unavailable');
    await navigator.clipboard.writeText(command);
    button.textContent = 'Copied ✓';
    document.getElementById('copy-status').textContent = 'Clone commands copied.';
  } catch {
    const selection = window.getSelection();
    const range = document.createRange();
    range.selectNodeContents(document.querySelector('.terminal pre'));
    selection.removeAllRanges(); selection.addRange(range);
    button.textContent = 'Select & copy';
    document.getElementById('copy-status').textContent = 'Automatic copy is unavailable. The commands are selected; use your browser’s copy command.';
  }
  window.setTimeout(() => { button.textContent = 'Copy ⧉'; }, 2500);
});

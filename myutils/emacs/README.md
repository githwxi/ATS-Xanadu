# ATS3 Emacs support

This directory contains a small Emacs major mode for editing ATS3 source and
optional integrations with Emacs's Flymake and the Flycheck package. The mode
is intended to provide basic editing support; it is not a parser, compiler, or
language server.

## `ats3-mode`

`ats3-mode.el` defines `ats3-mode`, derived from `prog-mode`. It provides:

- Font locking for ATS3 keywords, preprocessor directives, selected common
  special identifiers, Boolean constants, and termination metrics.
- Syntax handling for nested `(* ... *)` comments, `//` line comments, quoted
  strings, and common bracket pairs.
- A minimal indentation command that copies the indentation of the preceding
  line. It does not calculate indentation from ATS3 expression structure.
- Automatic mode associations for `.sats`, `.dats`, and `.hats` files.

The keyword list is based on the ATS3 lexer in the current source tree. ATS3
has a large vocabulary of generated names and library-specific identifiers,
so font locking is intentionally selective and may need updates as the language
and libraries evolve. The `//` comment rule is a simple textual search; it
does not distinguish comment markers from `//` appearing inside a string.

## Installation and use

Put `ats3-mode.el` in a directory on Emacs's `load-path`, then load it from
your Emacs init file:

```elisp
(add-to-list 'load-path "~/emacs/ATS")
(autoload 'ats3-mode "ats3-mode" "Edit ATS3 source files" t)
(add-to-list 'auto-mode-alist '("\\.\\(sats\\|dats\\|hats\\)\\'" . ats3-mode))
```

The mode file also installs those file associations when it is loaded.

## Diagnostics

`flymake-ats3.el` connects the mode to Flymake, which is built into Emacs. It
uses Flymake's older checker configuration interface, so compatibility depends
on the Emacs version. It enables Flymake from `ats3-mode-hook` and binds
`C-c C-d`, `C-c C-n`, and `C-c C-p` to diagnostic display and navigation
commands: `C-c C-d` lists diagnostics, `C-c C-n` jumps to the next diagnostic,
and `C-c C-p` jumps to the previous one. `C-c C-t` starts a check manually.
Automatic checks on opening, editing, or saving are disabled. The checker runs the optimized
`xatsopt_tcheck01_ats2_opt1.js` script through Node.js. It looks for the
script under `$XATSHOME/xassets/JS/xatsopt/bin/`; if `XATSHOME` is unset, it
searches upward from the source buffer for the ATS-Xanadu tree.

If Node.js is not named `node` on your system or needs different runtime
options, set these variables before loading `flymake-ats3.el`:

```elisp
(setq flymake-ats3-command "node")
(setq flymake-ats3-command-options '("--stack-size=8801"))
(require 'flymake-ats3)
```

The checker must be available on `PATH` and accept the temporary source file
as its final argument. The diagnostic patterns target the source-position
format emitted by the ATS3 checker. Flymake maps temporary `_flymake` filenames
back to the original buffer. The checker reports columns starting at 1, while
Emacs displays columns starting at 0. Its `F3PERR0-ERROR` prefix is an internal
ATS3 diagnostic label.

`flycheck-ats3.el` provides an optional checker for the separately installed
Flycheck package. To register it:

```elisp
(with-eval-after-load 'flycheck
  (require 'flycheck-ats3)
  (flycheck-ats3-setup))
```

Flymake and Flycheck are alternative diagnostic front ends; loading the mode
alone does not require either integration.

## Files

- `ats3-mode.el` — syntax, font locking, indentation, and file associations.
- `flymake-ats3.el` — Flymake integration.
- `flycheck-ats3.el` — optional Flycheck integration.
- `ATS2/` — the earlier ATS2 Emacs mode and integrations retained for reference.

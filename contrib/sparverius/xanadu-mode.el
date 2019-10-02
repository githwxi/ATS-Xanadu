;;; xanadu-mode.el --- Major mode for editing ATS  -*- lexical-binding: t; coding: utf-8 -*-
;;; Modified By: Richard K
;;;
;;; based on Major mode for editing (Standard) ML
;;;
;;; courtesy of the following...
;;
;; Copyright (C) 1989,1999,2000,2004,2007,2010-2018  Free Software Foundation, Inc.
;;
;; Maintainer: Stefan Monnier <monnier@iro.umontreal.ca>
;; Version: 6.9
;; Keywords: SML
;; Author:	Lars Bo Nielsen
;;		Olin Shivers
;;		Fritz Knabe (?)
;;		Steven Gilmore (?)
;;		Matthew Morley <mjm@scs.leeds.ac.uk>
;;		Matthias Blume <blume@cs.princeton.edu>
;;		(Stefan Monnier) <monnier@iro.umontreal.ca>
;; Package-Requires: ((emacs "24") (cl-lib "0.5"))

;; (eval-when-compile (require 'cl-lib))
(require 'smie nil 'noerror)
(require 'electric)

(require 'cl)
(require 'compile)

(defgroup xanadu ()
  "Editing XANADU code."
  :group 'languages)

(defcustom xanadu-indent-level 2
  "Basic indentation step for XANADU code."
  :type 'integer)

(defcustom xanadu-indent-args xanadu-indent-level
  "Indentation of args placed on a separate line."
  :type 'integer)

(defcustom xanadu-rightalign-and nil
  "If non-nil, right-align `and' with its leader.
If nil:					If t:
	datatype a = A				datatype a = A
	and b = B				     and b = B"
  :type 'boolean)

(defcustom xanadu-electric-pipe-mode nil
  "If non-nil, automatically insert appropriate template when hitting |."
  :type 'boolean)

(defvar xanadu-mode-hook nil
  "Run upon entering `xanadu-mode'.
This is a good place to put your preferred key bindings.")

;; font-lock setup



;; (defvar xanadu-outline-regexp
;;   ;; `st' and `si' are to match structure and signature.
;;   "\\|s[ti]\\|[ \t]*\\(let[ \t]+\\)?\\(fun\\|and\\)\\_>"
;;   "Regexp matching a major heading.
;; This actually can't work without extending `outline-minor-mode' with the
;; notion of \"the end of an outline\".")

;;
;; Internal defines
;;

(defun kill-and-join-forward (&optional arg)
  "If at end of line, join with following; otherwise kill line.
Deletes whitespace at join."
  (interactive "P")
  (if (and (eolp) (not (bolp)))
      (delete-indentation t)
    (kill-line arg)))

(defvar my-offset 2 "My indentation offset. ")
(defun backspace-whitespace-to-tab-stop ()
  "Delete whitespace backwards to the next tab-stop, otherwise delete one character."
  (interactive)
  (if (or indent-tabs-mode
          (region-active-p)
          (save-excursion
            (> (point) (progn (back-to-indentation)
                              (point)))))
      (call-interactively 'backward-delete-char-untabify)
    (let ((movement (% (current-column) my-offset))
          (p (point)))
      (when (= movement 0) (setq movement my-offset))
      ;; Account for edge case near beginning of buffer
      (setq movement (min (- p 1) movement))
      (save-match-data
        (if (string-match "[^\t ]*\\([\t ]+\\)$" (buffer-substring-no-properties (- p movement) p))
            (backward-delete-char (- (match-end 1) (match-beginning 1)))
          (call-interactively 'backward-delete-char))))))

(defun backspace-forward-whitespace-to-tab-stop ()
  "Delete whitespace backwards to the next tab-stop, otherwise delete one character."
  (interactive)
  (if (or indent-tabs-mode
          (region-active-p)
          (save-excursion
            (> (point) (progn (back-to-indentation)
                              (point)))))
      (call-interactively 'delete-forward-char)
    (let ((movement (% (current-column) my-offset))
          (p (point)))
      (when (= movement 0) (setq movement my-offset))
      ;; Account for edge case near beginning of buffer
      (setq movement (min (+ p 1) movement))
      (save-match-data
        (if (string-match "[^\t ]*\\([\t ]+\\)$" (buffer-substring-no-properties (+ p movement) p))
            (delete-forward-char (+ (match-end 1) (match-beginning 1)))
          (call-interactively 'delete-forward-char))))))


(defun smarter-move-beginning-of-line (arg)
  "Move point back to indentation of beginning of line.

Move point to the first non-whitespace character on this line.
If point is already there, move to the beginning of the line.
Effectively toggle between the first non-whitespace character and
the beginning of the line.

If ARG is not nil or 1, move forward ARG - 1 lines first.  If
point reaches the beginning or end of the buffer, stop there."
  (interactive "^p")
  (setq arg (or arg 1))

  ;; Move lines first
  (when (/= arg 1)
    (let ((line-move-visual nil))
      (forward-line (1- arg))))

  (let ((orig-point (point)))
    (back-to-indentation)
    (when (= orig-point (point))
      (move-beginning-of-line 1))))

;; remap C-a to `smarter-move-beginning-of-line'
(global-set-key [remap move-beginning-of-line]
                'smarter-move-beginning-of-line)

(defadvice kill-line (before check-position activate)
  (if (member major-mode
              '(xanadu-mode))
      (if (and (eolp) (not (bolp)))
          (progn (forward-char 1)
                 (just-one-space 0)
                 (backward-char 1)))))

(defun shift-right (count)
  (interactive "p")
  (save-excursion
    ;; (if (end-of-line) (point)
    ;;  (shift-text count)
        (back-to-indentation)
    (shift-text count)))



(defun tab-or-else2 ()
  (interactive)
  (if (bolp) ((back-to-indentation) (tab-to-tab-stop))
  (if (current-line-empty-p)
      (tab-to-tab-stop)
    (shift-right 2)))
  )

(defun tab-or-else2 ()
  (interactive)
  (if (current-line-empty-p)
      (tab-to-tab-stop)
    (shift-right 2)))

(local-set-key (kbd "TAB") 'tab-or-else2)


(defvar xanadu-mode-map
  (let ((map (make-sparse-keymap)))
    ;; Text-formatting commands:
    ;; (define-key map "\C-c\C-m" 'xanadu-insert-form)
    ;; (define-key map "\M-|" 'xanadu-electric-pipe)
    ;; (define-key map "\M-\ " 'xanadu-electric-space)
    (define-key map [backtab] 'xanadu-back-to-outer-indent)
    ;; (define-key map "\C-h" 'xanadu-back-to-outer-indent)
    ;; The standard binding is C-c C-z, but we add this one for compatibility.
    ;; (define-key map "\C-c\C-s" 'xanadu-prog-proc-switch-to)
    map)
  "The keymap used in `xanadu-mode'.")

(defvar xanadu-mode-syntax-table
  (let ((st (make-syntax-table)))
    (modify-syntax-entry ?\* ". 23n" st)
    (modify-syntax-entry ?\( "()1" st)
    (modify-syntax-entry ?\) ")(4" st)
    (mapc (lambda (c) (modify-syntax-entry c "_" st)) "._'")
    (mapc (lambda (c) (modify-syntax-entry c "." st)) ",;")
    ;; `!' is not really a prefix-char, oh well!
    (mapc (lambda (c) (modify-syntax-entry c "'"  st)) "~#!")
    (mapc (lambda (c) (modify-syntax-entry c "."  st)) "%&$+-/:<=>?@`^|")
    (modify-syntax-entry ?\( "() 1n" st)
    (modify-syntax-entry ?\) ")( 4n" st)
    (modify-syntax-entry ?*  ". 23n" st)
    ;; Not sure how to do // for single-line comments.
    ;; The current setting means that (/ and /* start a comment as well :-(
    (modify-syntax-entry ?/  ". 12b" st)
    (modify-syntax-entry ?\n ">  b" st)
    ;; Strings.
    (modify-syntax-entry ?\" "\"" st)
    ;; Same problem as in Ada: ' starts a char-literal but can appear within
    ;; an identifier.  So we can either default it to "string" syntax and
    ;; let font-lock-syntactic-keywords correct its uses in symbols, or
    ;; the reverse.  We chose the reverse, which fails more gracefully.
    ;; Oh, and ' is also overloaded for '( '{ and '[  :-(
    (modify-syntax-entry ?\' "_ p" st)
    ;;
    (modify-syntax-entry ?\{ "(}" st)
    (modify-syntax-entry ?\} "){" st)
    (modify-syntax-entry ?\[ "(]" st)
    (modify-syntax-entry ?\] ")[" st)
    ;; Skip over @/# when going backward-sexp over @[...], #[...],
    ;; #ident and $ident.
    (modify-syntax-entry ?\@ ". p" st)
    (modify-syntax-entry ?\# ". p" st)
    (modify-syntax-entry ?\$ ". p" st)
    ;; Same thing for macro&meta programming.
    (modify-syntax-entry ?\` ". p" st)
    (modify-syntax-entry ?\, ". p" st)
    ;; Just a guess for now.
    (modify-syntax-entry ?\\ "\\" st)
    ;; Handle trailing +/-/* in keywords.
    ;; (modify-syntax-entry ?+ "_" st)
    ;; (modify-syntax-entry ?- "_" st)
    ;; (modify-syntax-entry ?* "_" st)
    ;; Symbolic identifiers are kind of like in SML, which is poorly
    ;; supported by Emacs.  Worse: there are 2 kinds, one where "!$#?" are
    ;; allowed and one where "<>" are allowed instead.  Hongwei, what's that
    ;; all about?
    (modify-syntax-entry ?% "." st)
    (modify-syntax-entry ?& "." st)
    (modify-syntax-entry ?+ "." st)
    (modify-syntax-entry ?- "." st)
    (modify-syntax-entry ?. "." st)
    ;; (modify-syntax-entry ?/ "." st)  ; Already covered above for comments.
    (modify-syntax-entry ?: "." st)
    (modify-syntax-entry ?= "." st)
    ;; (modify-syntax-entry ?@ "." st)  ; Already defined above.
    (modify-syntax-entry ?~ "." st)
    ;; (modify-syntax-entry ?` "." st)  ; Already defined above.
    (modify-syntax-entry ?^ "." st)
    (modify-syntax-entry ?| "." st)
    ;; (modify-syntax-entry ?* "." st)  ; Already covered above for comments.
    (modify-syntax-entry ?< "." st)
    (modify-syntax-entry ?> "." st)
    (modify-syntax-entry ?! "." st)
    ;; (modify-syntax-entry ?$ "." st)  ; Already defined above.
    ;; (modify-syntax-entry ?# "." st)  ; Already defined above.
    (modify-syntax-entry ?? "." st)
    ;; Real punctuation?
    (modify-syntax-entry ?:  "." st)
    (modify-syntax-entry ?\; "." st)
    st)
  "The syntax table used in `xanadu-mode'.")


(easy-menu-define xanadu-mode-menu xanadu-mode-map "Menu used in `xanadu-mode'."
  '("XANADU"
    ;; ("Process"
     ;; ["Start XANADU repl"		xanadu-run		t]
     ;; ["-" nil nil]
     ;; ["Compile the project"	xanadu-prog-proc-compile	t]
     ;; ["Send file"		xanadu-prog-proc-load-file	t]
     ;; ["Switch to XANADU repl"	xanadu-prog-proc-switch-to	t]
     ;; ["--" nil nil]
     ;; ["Send buffer"		xanadu-prog-proc-send-buffer	t]
     ;; ["Send region"		xanadu-prog-proc-send-region	t]
     ;; ["Send function"		xanadu-send-function t]
     ;; ["Goto next error"		next-error	t]
     ;; )
    ["Insert XANADU form"		xanadu-insert-form t]
    ("Forms" :filter xanadu-forms-menu)
    ["Indent region"		indent-region t]
    ["Outdent line"		xanadu-back-to-outer-indent nil]
    ["-----" nil nil]
    ["Customize XANADU-mode"  (customize-group 'xanadu)	t]
    ["XANADU mode help"       describe-mode t]))

;;
;; Regexps
;;

(defun xanadu-syms-re (syms)
  (concat "\\_<" (regexp-opt syms t) "\\_>"))

;;

(defconst xanadu-module-head-syms
  '("signature" "structure" "functor" "abstraction"))

(defconst xanadu-=-starter-syms
  `("|" "val" "fun" "and" "datatype" "type" "abstype" "eqtype" "var" "implement"
    "implmnt" "fn" "fnx" "typedef" "absvtype" "abstype" "vtypedef" "sortdef"
    "absimpl" "dataprop" "dataview" "datavtype" "dataviewtype" "staload"
    . ,xanadu-module-head-syms)
  "Symbols that can be followed by a `='.")
(defconst xanadu-=-starter-re
  (concat "\\S.|\\S.\\|" (xanadu-syms-re (cdr xanadu-=-starter-syms)))
  "Symbols that can be followed by a `='.")

(defconst xanadu-non-nested-of-starter-re
  (xanadu-syms-re '("datatype" "abstype" "exception" "overload" ))
  "Symbols that can introduce an `of' that shouldn't behave like a paren.")

(defconst xanadu-starters-syms
  (append xanadu-module-head-syms
	  '("abstype" "datatype" "exception" "fun" "local" "infix" "infixr"
	    "sharing" "nonfix" "open" "type" "val" "and" "withtype" "with"
	    "where" "dataprop" "dataview" "datavtype" "dataviewtype" "implement"
	    "implmnt" "fn" "fnx" "typedef" "val-" "val+" "val@" "absvtype"
	    "abstype" "vtypedef" "sortdef" ))
  "The starters of new expressions.")

(defconst xanadu-pipeheads
  '("|" "of" "fun" "fn" "and" "handle" "datatype" "abstype" "(" "{" "["
    "dataprop" "datavtype" "dataview" "dataviewtype" )
   "A `|' corresponds to one of these.")

(defconst xanadu-keywords-regexp
  (xanadu-syms-re '("abstraction" "abstype" "and" "andalso" "as" "before" "case"
                 "datatype" "else" "end" "eqtype" "exception" "do" "fn" "fun"
                 "functor" "handle" "if" "in" "include" "infix" "infixr" "let"
                 "local" "nonfix" "o" "of" "op" "open" "orelse" "overload"
                 "raise" "rec" "sharing" "sig" "signature" "struct" "structure"
                 "then" "type" "val" "where" "while" "with" "withtype" "sexpdef"
                 "tbox" "vtype" "endlocal" "endwhere" "endlet" "abst0ype"
                 "absprop" "absview" "absvtype" "absviewtype" "absvt0ype"
                 "absviewt0ype" "ifcase" "assume" "begin" "break" "continue"
                 "classdec" "datasort" "dataprop" "dataview" "datavtype"
                 "dataviewtype" "dynload" "extern" "extype" "extval" "fnx"
                 "prfn" "prfun" "praxi" "castfn" "infixl" "prefix" "postfix"
                 "implmnt" "imp" "implement" "primplmnt"
                 "primplement" "lam" "llam" "fix" "macdef" "macrodef" "nonfix"
                 "overload" "op" "scase" "sif" "sortdef" "sta" "stacst" "stadef"
                 "stavar" "staload" "symelim" "symintr" "try" "tkindef" ;;
                 "type" "typedef" "propdef" "viewdef" "vtypedef" "viewtypedef"
                 "prval" "var" "prvar" "when" "withprop" "withview" "withvtype"
                 "withviewtype" "#assert" "#define" "#dynload" "#elif"
                 "#elifdef" "#elifndef" "#else" "#endif" "#error" "#extern"
                 "#if" "#ifdef" "#ifndef" "#include" "#macdef" "#print"
                 "#require" "#stacst" "#staload" "#static" "#symload" "#then"
                 "#undef" ))
  "A regexp that matches any and all keywords of XANADU.")

;; (eval-and-compile
;;   (defconst xanadu-id-re "\\sw\\(?:\\sw\\|\\s_\\)*"))

;; (defconst xanadu-tyvarseq-re
;;   (concat "\\(?:\\(?:'+" xanadu-id-re "\\|(\\(?:[,' \t\n]+" xanadu-id-re
;;           "\\)+)\\)\\s-+\\)?"))

;;; Font-lock settings ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(defcustom xanadu-font-lock-symbols nil
  "Display \\ and -> and such using symbols in fonts.
This may sound like a neat trick, but be extra careful: it changes the
alignment and can thus lead to nasty surprises w.r.t layout."
  :type 'boolean)
(if (fboundp 'prettify-symbols-mode)
    (make-obsolete-variable 'xanadu-font-lock-symbols
                            'prettify-symbols-mode "24.4"))

(defconst xanadu-font-lock-symbols-alist
  '(("fn" . ?λ)
    ("andalso" . ?∧)
    ("orelse"  . ?∨)
    ;; ("as" . ?≡)
    ("not" . ?¬)
    ("div" . ?÷)
    ("*"   . ?×)
    ("o"   . ?○)
    ("->"  . ?→)
    ("=>"  . ?⇒)
    ("<-"  . ?←)
    ("<>"  . ?≠)
    (">="  . ?≥)
    ("<="  . ?≤)
    ("..." . ?⋯)
    ;; ("::" . ?∷)
    ;; Some greek letters for type parameters.
    ("'a" . ?α)
    ("'b" . ?β)
    ("'c" . ?γ)
    ("'d" . ?δ)
    ))

(defun xanadu-font-lock-compose-symbol ()
  "Compose a sequence of ascii chars into a symbol.
Regexp match data 0 points to the chars."
  ;; Check that the chars should really be composed into a symbol.
  (let* ((start (match-beginning 0))
	 (end (match-end 0))
	 (syntaxes (if (memq (char-syntax (char-after start)) '(?w ?_))
		       '(?w ?_) '(?. ?\\))))
    (if (or (memq (char-syntax (or (char-before start) ?\ )) syntaxes)
	    (memq (char-syntax (or (char-after end) ?\ )) syntaxes)
	    (memq (get-text-property start 'face)
		  '(font-lock-doc-face font-lock-string-face
		    font-lock-comment-face)))
	;; No composition for you.  Let's actually remove any composition
	;; we may have added earlier and which is now incorrect.
	(remove-text-properties start end '(composition))
      ;; That's a symbol alright, so add the composition.
      (compose-region start end (cdr (assoc (match-string 0)
                                            xanadu-font-lock-symbols-alist)))))
  ;; Return nil because we're not adding any face property.
  nil)

;; (defun xanadu-font-lock-symbols-keywords ()
;;   (when xanadu-font-lock-symbols
;;     `((,(regexp-opt (mapcar 'car xanadu-font-lock-symbols-alist) t)
;;        (0 (xanadu-font-lock-compose-symbol))))))

;; ;; The font lock regular expressions.

;; (defconst xanadu-font-lock-keywords
;;   `(;;(xanadu-font-comments-and-strings)
;;     (,(concat "\\_<\\(fun\\|and\\)\\s-+" xanadu-tyvarseq-re
;;               "\\(" xanadu-id-re "\\)\\s-+[^ \t\n=]")
;;      (1 font-lock-keyword-face)
;;      (2 font-lock-function-name-face))
;;     (,(concat "\\_<\\(\\(?:data\\|abs\\|with\\|eq\\)?type\\)\\s-+"
;;               xanadu-tyvarseq-re "\\(" xanadu-id-re "\\)")
;;      (1 font-lock-keyword-face)
;;      (2 font-lock-type-def-face))
;;     (,(concat "\\_<\\(val\\)\\s-+\\(?:" xanadu-id-re "\\_>\\s-*\\)?\\("
;;               xanadu-id-re "\\)\\s-*[=:]")
;;      (1 font-lock-keyword-face)
;;      (2 font-lock-variable-name-face))
;;     (,(concat "\\_<\\(structure\\|functor\\|abstraction\\)\\s-+\\("
;;               xanadu-id-re "\\)")
;;      (1 font-lock-keyword-face)
;;      (2 font-lock-module-def-face))
;;     (,(concat "\\_<\\(signature\\)\\s-+\\(" xanadu-id-re "\\)")
;;      (1 font-lock-keyword-face)
;;      (2 font-lock-interface-def-face))

;;     (,xanadu-keywords-regexp . font-lock-keyword-face)
;;     ,@(xanadu-font-lock-symbols-keywords))
;;   "Regexps matching standard XANADU keywords.")

(defface font-lock-type-def-face
  '((t (:bold t)))
  "Font Lock mode face used to highlight type definitions."
  :group 'font-lock-highlighting-faces)
(defvar font-lock-type-def-face 'font-lock-type-def-face
  "Face name to use for type definitions.")

(defface font-lock-module-def-face
  '((t (:bold t)))
  "Font Lock mode face used to highlight module definitions."
  :group 'font-lock-highlighting-faces)
(defvar font-lock-module-def-face 'font-lock-module-def-face
  "Face name to use for module definitions.")

(defface font-lock-interface-def-face
  '((t (:bold t)))
  "Font Lock mode face used to highlight interface definitions."
  :group 'font-lock-highlighting-faces)
(defvar font-lock-interface-def-face 'font-lock-interface-def-face
  "Face name to use for interface definitions.")

;;
;; Code to handle nested comments and unusual string escape sequences
;;

;; (defvar xanadu-syntax-prop-table
;;   (let ((st (make-syntax-table)))
;;     (modify-syntax-entry ?\\ "." st)
;;     (modify-syntax-entry ?* "." st)
;;     st)
;;   "Syntax table for text-properties.")

;; (defconst xanadu-font-lock-syntactic-keywords
;;   `(("^\\s-*\\(\\\\\\)" (1 ',xanadu-syntax-prop-table))))

;; (defconst xanadu-font-lock-defaults
;;   '(xanadu-font-lock-keywords nil nil nil nil
;;     (font-lock-syntactic-keywords . xanadu-font-lock-syntactic-keywords)))


;;; Indentation with SMIE

(defconst xanadu-smie-grammar
  ;; We have several problem areas where XANADU's syntax can't be handled by an
  ;; operator precedence grammar:
  ;;
  ;; "= A before B" is "= A) before B" if this is the
  ;;   `boolean-=' but it is "= (A before B)" if it's the `definitional-='.
  ;;   We can work around the problem by tweaking the lexer to return two
  ;;   different tokens for the two different kinds of `='.
  ;; "of A | B" in a "case" we want "of (A | B, but in a `datatype'
  ;;   we want "of A) | B".
  ;; "= A | B" can be "= A ) | B" if the = is from a "fun" definition,
  ;;   but it is "= (A | B" if it is a `datatype' definition (of course, if
  ;;   the previous token introducing the = is `and', deciding whether
  ;;   it's a datatype or a function requires looking even further back).
  ;; "functor foo (...) where type a = b = ..." the first `=' looks very much
  ;;   like a `definitional-=' even tho it's just an equality constraint.
  ;;   Currently I don't even try to handle `where' at all.
  (smie-prec2->grammar
   (smie-merge-prec2s
    (smie-bnf->prec2
     '((exp ("if" exp "then" exp "else" exp)
            ("case" exp "of" branches)
            ("let" decls "in" cmds "end")

	    ;; added
	    ;; ("#if" exp "#endif")
	    ;; end

            ;; ("struct" decls "end")
            ;; ("sig" decls "end")
            (sexp)
            (sexp "handle" branches)
            ;; ("fn" sexp "=>" exp)
	    ("lam" sexp "=>" exp)
       )

       ;; "simple exp"s are the ones that can appear to the left of `handle'.
       (sexp (sexp ":" type) ("(" exps ")") ("{" exps "}")
             (sexp "orelse" sexp)
             (marg ":>" type)
             (sexp "andalso" sexp))
       ;; (cmds (cmds ";" cmds) (exp))
       (exps (exps "," exps) (exp))     ; (exps ";" exps)
       (branches (sexp "=>" exp) (branches "|" branches))
       ;; Operator precedence grammars handle separators much better then
       ;; starters/terminators, so let's pretend that let/fun are separators.
       (decls (sexp "d=" exp)
              (sexp "d=" databranches)
              (funbranches "|" funbranches)
              (sexp "=of" type)         ;After "exception".
              ;; FIXME: Just like PROCEDURE in Pascal and Modula-2, this
              ;; interacts poorly with the other constructs since I
              ;; can't make "local" a separator like fun/val/type/...
              ("local" decls "in" decls "end")
              ;; (decls "local" decls "in" decls "end")
              ;; (decls "functor" decls)
              ;; (decls "signature" decls)
              ;; (decls "structure" decls)
              (decls "type" decls)
              (decls "open" decls)
              (decls "and" decls)
              ;; (decls "withtype" decls)
              (decls "infix" decls)
              (decls "infixr" decls)
              ;; (decls "nonfix" decls)
              (decls "abstype" decls)
              (decls "absvtype" decls)

              (decls "datatype" decls)
              (decls "datavtype" decls)

              (decls "vtypedef" decls)
	      (decls "stadef" decls)
	      (decls "viewdef" decls)
	      ;;
	      ;; (decls "datasort" decls)

              (decls "prval" decls)
              (decls "prfun" decls)

              (decls "absprop" decls)
              (decls "propdef" decls)
              (decls "dataprop" decls)
              (decls "include" decls)
              (decls "implement" decls)
              (decls "typedef" decls)

	      (decls "prefix" decls)

	      (decls "praxi" decls)
	      (decls "exception" decls)
	      (decls "castfn" decls)
	      (decls "overload" decls)

	      (decls "macdef" decls)
	      ;; #...
	      (decls "#assert" decls)
	      (decls "#define" decls)
	      (decls "#dynload" decls)
	      (decls "#elif" decls)
	      (decls "#elifdef" decls)
	      (decls "#elifndef" decls)
	      (decls "#else" decls)
	      (decls "#endif" decls)
	      (decls "#error" decls)
	      (decls "#extern" decls)
	      (decls "#if" decls)
	      (decls "#ifdef" decls)
	      (decls "#ifndef" decls)
	      (decls "#include" decls)
	      (decls "#macdef" decls)
	      (decls "#print" decls)
	      (decls "#require" decls)
	      (decls "#stacst" decls)
	      (decls "#staload" decls)
	      (decls "#static" decls)
	      (decls "#symload" decls)
	      (decls "#then" decls)
	      (decls "#undef" decls)


	      ;;
              ;; (decls "sharing" decls)
              ;; (decls "exception" decls)
              (decls "fun" decls)
              (decls "fnx" decls)
              (decls "val" decls))
       (type
	;; ("{" type ":" type)
	(type "->" type)
             (type "*" type))
       (funbranches (sexp "d=" exp))
       (databranches (sexp "=of" type) (databranches "d|" databranches))
       ;; ;; Module language.
       ;; ;; (mexp ("functor" marg "d=" mexp)
       ;; ;;       ("structure" marg "d=" mexp)
       ;; ;;       ("signature" marg "d=" mexp))
       ;; (marg (marg ":" type) (marg ":>" type))
       ;; (toplevel (decls) (exp) (toplevel ";" toplevel))
      )
     ;; '(("local" . opener))
     ;; '((nonassoc "else") (right "handle"))
     '((nonassoc "of") (assoc "|"))     ; "case a of b => case c of d => e | f"
     '((nonassoc "handle") (assoc "|")) ; Idem for "handle".
     '((assoc "->") (assoc "*"))
     '((assoc "val" "fun" "type" "datatype" "abstype" "open" "infix" "infixr"
	      "abstype" "absprop" "absview" "absvtype" "absviewtype" "absvtype"
	      "absviewtype" "ifcase" "assume" "begin" "break" "continue"
	      "classdec" "datasort" "dataprop" "dataview" "datavtype"
	      "dataviewtype" "dynload" "extern" "extype" "extval" "fnx" "prfn"
	      "prfun" "praxi" "castfn" "infixl" "prefix" "postfix" "implmnt"
	      "implement" "primplmnt" "primplement" "lam" "llam" "fix" "macdef"
	      "macrodef" "nonfix" "overload" "op" "scase" "sif" "sortdef" "sta"
	      "stacst" "stadef" "stavar" "staload" "symelim" "symintr" "try"
	      "type" "typedef" "propdef" "viewdef" "vtypedef" "viewtypedef"
	      "prval" "var" "prvar" "when" "withprop" "withview" "withvtype"
	      "withviewtype" "#assert" "#define" "#dynload" "#elif" "#elifdef"
	      "#elifndef" "#else" "#endif" "#error" "#extern" "#if" "#ifdef"
	      "#ifndef" "#include" "#macdef" "#print" "#require" "#stacst"
	      "#staload" "#static" "#symload" "#then" "#undef" "exception"
	      "include" "sharing" "local") ;; "functor" "signature" "structure"
       (assoc "withtype")
       (assoc "and"))
     '((assoc "orelse") (assoc "andalso") (nonassoc ":"))
     ;; '((assoc ";"))
      '((assoc ",")) '((assoc "d|")))

    (smie-precs->prec2
     '((nonassoc "andalso")                       ;To anchor the prec-table.
       (assoc "before")                           ;0
       (assoc ":=" "o")                           ;3
       (nonassoc ">" ">=" "<>" "<" "<=" "=")      ;4
       (assoc "::" "@")                           ;5
       (assoc "+" "-" "^")                        ;6
       (assoc "/" "*" "quot" "rem" "div" "mod")   ;7
       (nonassoc " -dummy- ")))                   ;Bogus anchor at the end.
    )))

(defvar xanadu-indent-separator-outdent 2)

(defun xanadu--rightalign-and-p ()
  (when xanadu-rightalign-and
    ;; Only right-align the "and" if the intervening code is more deeply
    ;; indented, to avoid things like:
    ;; datatype foo
    ;;   = Foo of int
    ;;      and bar = Bar of string
    (save-excursion
      (let ((max (line-end-position 0))
            (_data (smie-backward-sexp "and"))
            (startcol (save-excursion
                        (forward-comment (- (point)))
                        (current-column)))
            (mincol (current-column)))
        (save-excursion
          (search-forward "=" max t)
          (forward-line 1)
          (if (< (point) max) (setq max (point))))
        (while (and (<= (point) max) (not (eobp)))
          (skip-chars-forward " \t")
          (setq mincol (current-column))
          (forward-line 1))
        (>= mincol startcol)))))



(defun xanadu-smie-rules (kind token)
  (pcase (cons kind token)
    (`(:elem . basic) xanadu-indent-level)
    (`(:elem . args)  xanadu-indent-args)
    (`(:list-intro . "fn") t)
    (`(:close-all . ,_) t)
    (`(:after . "struct") 0)
    (`(:after . "=>") (if (smie-rule-hanging-p) 0 2))
    (`(:after . "in") (if (smie-rule-parent-p "local") 0))
    (`(:after . "of") 3)
    (`(:after . ,(or `"(" `"{" `"[")) (if (not (smie-rule-hanging-p)) 2))
    (`(:after . "else") (if (smie-rule-hanging-p) 0)) ;; (:next "if" 0)
    ;; here to remove tab after ";"
    ;; (`(:after . ,(or `"|" `"d|" `";" `",")) (smie-rule-separator kind))
    (`(:after . ,(or `"|" `"d|" `",")) (smie-rule-separator kind))
    (`(:after . "d=")
     (if (and (smie-rule-parent-p "val") (smie-rule-next-p "fn")) -3))
    (`(:before . "=>") (if (smie-rule-parent-p "fn") 3))
    (`(:before . "of") 1)
    ;; FIXME: pcase in Emacs<24.4 bumps into a bug if we do this:
    ;;(`(:before . ,(and `"|" (guard (smie-rule-prev-p "of")))) 1)
    (`(:before . "|") (if (smie-rule-prev-p "of") 1 (smie-rule-separator kind)))
    ;; here to remove tab after ";"
    ;; (`(:before . ,(or `"|" `"d|" `";" `",")) (smie-rule-separator kind))
    (`(:before . ,(or `"|" `"d|" `",")) (smie-rule-separator kind))
    ;; Treat purely syntactic block-constructs as being part of their parent,
    ;; when the opening statement is hanging.
    (`(:before . ,(or `"let" `"(" `"[" `"{")) ; "struct"? "sig"?
     (if (smie-rule-hanging-p) (smie-rule-parent)))
    ;; Treat if ... else if ... as a single long syntactic construct.
    ;; Similarly, treat fn a => fn b => ... as a single construct.
    (`(:before . ,(or `"if" `"fn"))
     (and (not (smie-rule-bolp))
          (smie-rule-prev-p (if (equal token "if") "else" "=>"))
          (smie-rule-parent)))
    (`(:before . "and")
     ;; FIXME: maybe "and" (c|sh)ould be handled as an smie-separator.
     (cond
      ((smie-rule-parent-p "datatype" "withtype")
       (if (xanadu--rightalign-and-p) 5 0))
      ((smie-rule-parent-p "fun" "val") 0)))
    (`(:before . "withtype") 0)
    (`(:before . "d=")
     (cond
      ((smie-rule-parent-p "datatype") (if (smie-rule-bolp) 2))
      ((smie-rule-parent-p "structure" "signature" "functor") 0)))
    ;; Indent an expression starting with "local" as if it were starting
    ;; with "fun".
    (`(:before . "local") (smie-indent-keyword "fun"))
    ;; FIXME: type/val/fun/... are separators but "local" is not, even though
    ;; it appears in the same list.  Try to fix up the problem by hand.
    ;; ((or (equal token "local")
    ;;      (equal (cdr (assoc token smie-grammar))
    ;;             (cdr (assoc "fun" smie-grammar))))
    ;;  (let ((parent (save-excursion (smie-backward-sexp))))
    ;;    (when (or (and (equal (nth 2 parent) "local")
    ;;                   (null (car parent)))
    ;;              (progn
    ;;                (setq parent (save-excursion (smie-backward-sexp "fun")))
    ;;                (eq (car parent) (nth 1 (assoc "fun" smie-grammar)))))
    ;;      (goto-char (nth 1 parent))
    ;;      (cons 'column (smie-indent-virtual)))))
    ))

(defun xanadu-smie-definitional-equal-p ()
  "Figure out which kind of \"=\" this is.
Assumes point is right before the = sign."
  ;; The idea is to look backward for the first occurrence of a token that
  ;; requires a definitional "=" and then see if there's such a definitional
  ;; equal between that token and ourselves (in which case we're not
  ;; a definitional = ourselves).
  ;; The "search for =" is naive and will match "=>" and "<=", but it turns
  ;; out to be OK in practice because such tokens very rarely (if ever) appear
  ;; between the =-starter and the corresponding definitional equal.
  ;; One known problem case is code like:
  ;; "functor foo (structure s : S) where type t = s.t ="
  ;; where the "type t = s.t" is mistaken for a type definition.
  (save-excursion
    (let ((res (smie-backward-sexp "=")))
      (member (nth 2 res) `(":" ":>" ,@xanadu-=-starter-syms)))))

(defun xanadu-smie-non-nested-of-p ()
  ;; FIXME: Maybe datatype-|-p makes this nested-of business unnecessary.
  "Figure out which kind of \"of\" this is.
Assumes point is right before the \"of\" symbol."
  (save-excursion
    ;; (let ((case-fold-search nil))
    ;;   (and (re-search-backward (concat "\\(" xanadu-non-nested-of-starter-re
    ;;                                    "\\)\\|\\_<case\\_>")
    ;;                            nil t)
    ;;        (match-beginning 1)))
    (and (stringp (xanadu-smie-backward-token-1))
         (let ((tok (xanadu-smie-backward-token-1)))
           (if (equal tok "=")
               (equal "d=" (xanadu-smie-forward-token))
             (member tok '("|" "exception")))))))

(defun xanadu-smie-datatype-|-p ()
  "Figure out which kind of \"|\" this is.
Assumes point is right before the | symbol."
  (save-excursion
    (forward-char 1)                    ;Skip the |.
    (let ((after-type-def
           '("|" "of" "in" "datatype" "and" "exception" "abstype" "infix"
             "infixr" "nonfix" "local" "val" "fun" "structure" "functor"
             "signature")))
      (or (member (xanadu-smie-forward-token-1) after-type-def) ;Skip the tag.
          (member (xanadu-smie-forward-token-1) after-type-def)))))

(defun xanadu-smie-forward-token-1 ()
  (forward-comment (point-max))
  (buffer-substring-no-properties
   (point)
   (progn
     (or (/= 0 (skip-syntax-forward "'w_"))
         (skip-syntax-forward ".'"))
     (point))))

(defun xanadu-smie-forward-token ()
  (let ((sym (xanadu-smie-forward-token-1)))
    (cond
     ((equal "op" sym)
      (concat "op " (xanadu-smie-forward-token-1)))
     ((member sym '("|" "of" "="))
      ;; The important lexer for indentation's performance is the backward
      ;; lexer, so for the forward lexer we delegate to the backward one.
      (save-excursion (xanadu-smie-backward-token)))
     (t sym))))

(defun xanadu-smie-backward-token-1 ()
  (forward-comment (- (point)))
  (buffer-substring-no-properties
   (point)
   (progn
     (or (/= 0 (skip-syntax-backward ".'"))
         (skip-syntax-backward "'w_"))
     (point))))

(defun xanadu-smie-backward-token ()
  (let ((sym (xanadu-smie-backward-token-1)))
    (unless (zerop (length sym))
      ;; FIXME: what should we do if `sym' = "op" ?
      (let ((point (point)))
	(if (equal "op" (xanadu-smie-backward-token-1))
	    (concat "op " sym)
	  (goto-char point)
	  (cond
	   ((string= sym "=") (if (xanadu-smie-definitional-equal-p) "d=" "="))
	   ((string= sym "of") (if (xanadu-smie-non-nested-of-p) "=of" "of"))
           ((string= sym "|") (if (xanadu-smie-datatype-|-p) "d|" "|"))
	   (t sym)))))))

;;;;
;;;; Imenu support
;;;;

(defconst xanadu-imenu-regexp
  (concat "^[ \t]*\\(let[ \t]+\\)?"
	  (regexp-opt (append xanadu-module-head-syms
			      '("and" "fun" "datatype" "abstype" "type")) t)
	  "\\_>"))

(defun xanadu-imenu-create-index ()
  (let (alist)
    (goto-char (point-max))
    (while (re-search-backward xanadu-imenu-regexp nil t)
      (save-excursion
	(let ((kind (match-string 2))
	      (column (progn (goto-char (match-beginning 2)) (current-column)))
	      (location
	       (progn (goto-char (match-end 0))
		      (forward-comment (point-max))
		      (when (looking-at xanadu-tyvarseq-re)
			(goto-char (match-end 0)))
		      (point)))
	      (name (xanadu-smie-forward-token)))
	  ;; Eliminate trivial renamings.
	  (when (or (not (member kind '("structure" "signature")))
		    (when (search-forward "=" nil t)
                      (forward-comment (point-max))
                      (looking-at "sig\\|struct")))
	    (push (cons (concat (make-string (/ column 2) ?\ ) name) location)
		  alist)))))
    alist))

;; ;;;###autoload
;; (add-to-list 'auto-mode-alist '("\\.x\\(ats\\)\\'" . xanadu-mode))

(defvar comment-quote-nested)

(defcustom xanadu-abbrev-skeletons t
  "Whether to include skeletons in `xanadu-mode's abbrev table."
  :type 'boolean)

(define-abbrev-table 'xanadu-skel-abbrev-table nil
  "Abbrev table for skeletons in `xanadu-mode.'"
  :case-fixed t
  :enable-function
  (lambda () (and xanadu-abbrev-skeletons (not (nth 8 (syntax-ppss))))))

(define-abbrev-table 'xanadu-mode-abbrev-table nil
  "Abbrevs for `xanadu-mode.'"
  :parents (list xanadu-skel-abbrev-table))

(defvar xanadu-mode-font-lock-syntax-table
  (let ((st (copy-syntax-table xanadu-mode-syntax-table)))
    (modify-syntax-entry ?_ "w" st)
    st))

;; Font-lock.

(defvar xanadu-mode-syntax-table
  (let ((st (make-syntax-table)))
    ;; (*..*) for nested comments.
    (modify-syntax-entry ?\( "() 1n" st)
    (modify-syntax-entry ?\) ")( 4n" st)
    (modify-syntax-entry ?*  ". 23n" st)
    ;; Not sure how to do // for single-line comments.
    ;; The current setting means that (/ and /* start a comment as well :-(
    (modify-syntax-entry ?/  ". 12b" st)
    (modify-syntax-entry ?\n ">  b" st)
    ;; Strings.
    (modify-syntax-entry ?\" "\"" st)
    ;; Same problem as in Ada: ' starts a char-literal but can appear within
    ;; an identifier.  So we can either default it to "string" syntax and
    ;; let font-lock-syntactic-keywords correct its uses in symbols, or
    ;; the reverse.  We chose the reverse, which fails more gracefully.
    ;; Oh, and ' is also overloaded for '( '{ and '[  :-(
    (modify-syntax-entry ?\' "_ p" st)
    ;;
    (modify-syntax-entry ?\{ "(}" st)
    (modify-syntax-entry ?\} "){" st)
    (modify-syntax-entry ?\[ "(]" st)
    (modify-syntax-entry ?\] ")[" st)
    ;; Skip over @/# when going backward-sexp over @[...], #[...],
    ;; #ident and $ident.
    (modify-syntax-entry ?\@ ". p" st)
    (modify-syntax-entry ?\# ". p" st)
    (modify-syntax-entry ?\$ ". p" st)
    ;; Same thing for macro&meta programming.
    (modify-syntax-entry ?\` ". p" st)
    (modify-syntax-entry ?\, ". p" st)
    ;; Just a guess for now.
    (modify-syntax-entry ?\\ "\\" st)
    ;; Handle trailing +/-/* in keywords.
    ;; (modify-syntax-entry ?+ "_" st)
    ;; (modify-syntax-entry ?- "_" st)
    ;; (modify-syntax-entry ?* "_" st)
    ;; Symbolic identifiers are kind of like in SML, which is poorly
    ;; supported by Emacs.  Worse: there are 2 kinds, one where "!$#?" are
    ;; allowed and one where "<>" are allowed instead.  Hongwei, what's that
    ;; all about?
    (modify-syntax-entry ?% "." st)
    (modify-syntax-entry ?& "." st)
    (modify-syntax-entry ?+ "." st)
    (modify-syntax-entry ?- "." st)
    (modify-syntax-entry ?. "." st)
    ;; (modify-syntax-entry ?/ "." st)  ; Already covered above for comments.
    (modify-syntax-entry ?: "." st)
    (modify-syntax-entry ?= "." st)
    ;; (modify-syntax-entry ?@ "." st)  ; Already defined above.
    (modify-syntax-entry ?~ "." st)
    ;; (modify-syntax-entry ?` "." st)  ; Already defined above.
    (modify-syntax-entry ?^ "." st)
    (modify-syntax-entry ?| "." st)
    ;; (modify-syntax-entry ?* "." st)  ; Already covered above for comments.
    (modify-syntax-entry ?< "." st)
    (modify-syntax-entry ?> "." st)
    (modify-syntax-entry ?! "." st)
    ;; (modify-syntax-entry ?$ "." st)  ; Already defined above.
    ;; (modify-syntax-entry ?# "." st)  ; Already defined above.
    (modify-syntax-entry ?? "." st)
    ;; Real punctuation?
    (modify-syntax-entry ?:  "." st)
    (modify-syntax-entry ?\; "." st)
    st))

(defvar xanadu-mode-font-lock-syntax-table
  (let ((st (copy-syntax-table xanadu-mode-syntax-table)))
    (modify-syntax-entry ?_ "w" st)
    st))



(defface mono-face-red    '((t (:foreground "#ff6188"))) "color")
(defface mono-face-grey   '((t (:foreground "#b2b2b2"))) "color")
(defface mono-face-gray   '((t (:foreground "#8c877e"))) "color")
(defface mono-face-green  '((t (:foreground "#a9dc76"))) "color")
(defface mono-face-yellow '((t (:foreground "#ffd866"))) "color")
(defface mono-face-orange '((t (:foreground "#fc9867"))) "color")
(defface mono-face-purple '((t (:foreground "#ab9df2"))) "color")
(defface mono-face-blue   '((t (:foreground "#78dce8"))) "color")
(defface mono-face-opt    '((t (:foreground "#fff"))) "color")
(defface mono-face-white  '((t (:foreground "#efe"))) "color")




;; One Dark                       One Light

;; Black:          #000000
;; Bright Black:   #5C6370
;; Red:            #E06C75
;; Bright Red:     #E06C75
;; Green:          #98C379
;; Bright Green:   #98C379
;; Yellow:         #D19A66
;; Bright Yellow:  #D19A66
;; Blue:           #61AFEF
;; Light Blue:     #61AFEF
;; Magenta:        #C678DD
;; Light Magenta:  #C678DD
;; Cyan:           #56B6C2
;; Light Cyan:     #56B6C2
;; White:          #ABB2BF
;; Bright White:   #FFFFFF
;; Text:           #5C6370
;; Bold Text:      #ABB2BF
;; Selection:      #3A3F4B
;; Cursor:         #5C6370
;; Background:     #1E2127



(defface solar-face-aux         '((t (:foreground "#306080"))) "color")
(defface solar-face-black       '((t (:foreground "#000000"))) "color")
(defface solar-face-brightblack '((t (:foreground "#5C6370"))) "color")
(defface solar-face-red         '((t (:foreground "#E06C75"))) "color")
(defface solar-face-green       '((t (:foreground "#98C379"))) "color")
(defface solar-face-yellow      '((t (:foreground "#D19A66"))) "color")
(defface solar-face-blue        '((t (:foreground "#61AFEF"))) "color")
(defface solar-face-magenta     '((t (:foreground "#C678DD"))) "color")
(defface solar-face-cyan        '((t (:foreground "#56B6C2"))) "color")
(defface solar-face-white       '((t (:foreground "#FFFFFF"))) "color")
(defface solar-face-brightwhite '((t (:foreground "#ABB2BF"))) "color")




;; Font-lock.

(defface xanadu-font-lock-static-face
  '(
    ;; (default :inherit font-lock-type-face)

    ;; (t (:foreground "SkyBlue" :weight normal))

    ;; (t (:foreground "#ab9df2" :weight normal))
    ;; (t (:foreground "#ff6188" :weight normal))
    ;; (t (:foreground "Cyan" :weight normal))
    (default)
    )
  "Face used for static-related parts of code."
  :group 'xanadu-font-lock-faces)
(defvar xanadu-font-lock-static-face 'xanadu-font-lock-static-face)

(defface xanadu-font-lock-metric-face
  '(
    ;; (default :inherit font-lock-type-face)
    (t (:foreground "Wheat" :weight bold))
    )
  "Face used for termination metrics."
  :group 'xanadu-font-lock-faces)
(defvar xanadu-font-lock-metric-face 'xanadu-font-lock-metric-face)

(defface xanadu-font-lock-keyword-face
  '(
    ;; (default :inherit font-lock-keyword-face)
    ;;(t (:foreground "Cyan" :weight normal))

    ;;(t (:foreground "#98C379" :weight normal))
    ;; (t (:foreground "green" :weight normal))
    (t (:foreground "cyan" :weight normal))

    ;; (t (:foreground "#ff6188" :weight normal))
    ;; (t (:foreground "#ab9df2" :weight normal))


    )
  "Face used for keywords."
  :group 'xanadu-font-lock-faces)
(defvar xanadu-font-lock-keyword-face 'xanadu-font-lock-keyword-face)

(defface xanadu-font-lock-c-face
  '(
    ;; (default :inherit font-lock-comment-face)
    (t (:foreground "Pink" :weight normal))
    )
  "Face used for C code."
  :group 'xanadu-font-lock-faces)
(defvar xanadu-font-lock-c-face 'xanadu-font-lock-c-face)


(defface xanadu-font-lock-valcase-face
  '(
    ;; (default :inherit font-lock-type-face)
    ;; (t (:foreground "SkyBlue" :weight normal))
    (t (:foreground "#ab9df2" :weight normal))
    ;; (t (:foreground "#ff6188" :weight normal))
    )
  "Face used for static-related parts of code."
  :group 'xanadu-font-lock-faces)
(defvar xanadu-font-lock-valcase-face 'xanadu-font-lock-valcase-face)



(defface xanadu-font-lock-default-face
  '(
    ;; (default :inherit font-lock-type-face)
    (t ( :weight normal))
    ;; (t (:foreground "#ab9df2" :weight normal))
    ;; (t (:foreground "#ff6188" :weight normal))
    ;; (t (:foreground "Cyan" :weight normal))
    )
  "Face used for static-related parts of code."
  :group 'xanadu-font-lock-faces)
(defvar xanadu-font-lock-default-face 'xanadu-font-lock-default-face)



(defface xanadu-font-lock-tempfun-face
  '(
    ;; (t (:foreground "SkyBlue" :weight normal))
    ;; (t (:foreground "#ab9df2" :weight normal))
    ;;(t (:foreground "#ff6188" :weight normal))

    ;;(t (:foreground "#C678DD" :weight normal))
    (t (:foreground "magenta" :weight normal))
    )
  "Face used for static-related parts of code."
  :group 'xanadu-font-lock-faces)
(defvar xanadu-font-lock-tempfun-face 'xanadu-font-lock-tempfun-face)


(defface xanadu-font-lock-builtintempfun-face
  '(
    ;; (t (:foreground "SkyBlue" :weight normal))
    ;; (t (:foreground "#ab9df2" :weight normal))
    (t (:foreground "#fc9867" :weight normal))
    )
  "Face used for static-related parts of code."
  :group 'xanadu-font-lock-faces)
(defvar xanadu-font-lock-builtintempfun-face 'xanadu-font-lock-builtintempfun-face)


(defface xanadu-font-lock-namespacefun-face
  '(
    ;; (t (:foreground "#fc9867" :weight normal))
    (t (:foreground "#a9dc7f" :weight normal))

    )
  "Face used for static loaded $ parts of code."
  :group 'xanadu-font-lock-faces)
(defvar xanadu-font-lock-namespacefun-face 'xanadu-font-lock-namespacefun-face)


(defface xanadu-font-lock-membership-face
  '((t (:foreground "#a9dc7f" :weight normal)))
  "Face used for .membership"
  :group 'xanadu-font-lock-faces)
(defvar xanadu-font-lock-membership-face 'xanadu-font-lock-membership-face)



(defface xanadu-font-lock-etc-face
  '(
    ;; (default :inherit font-lock-builtin-face)
    (t (:foreground "brightblue" :weight normal))
    )
  "Face used for C code."
  :group 'xanadu-font-lock-faces)
(defvar xanadu-font-lock-etc-face 'xanadu-font-lock-etc-face)

(defface xanadu-font-lock-q-face
  '(
    ;; (default :inherit font-lock-builtin-face)
    ;; (t (:foreground "brightblue" :weight normal))

    ;; default
    ;; (t (:foreground "#ab9df2" :weight normal))
    (default)
    )
  "Face used for quantifiers."
  :group 'xanadu-font-lock-faces)
(defvar xanadu-font-lock-q-face 'xanadu-font-lock-q-face)

(defface xanadu-font-lock-sym-face
  '(
    ;; (default :inherit font-lock-builtin-face)
    (t (:foreground "#fc9867" :weight normal))
    )
  "Face used for special symbols."
  :group 'xanadu-font-lock-faces)
(defvar xanadu-font-lock-sym-face 'xanadu-font-lock-sym-face)


(defface xanadu-font-lock-mode-face
  '((t (:foreground "#fc9867" :weight normal)))
  "Face for:   -*- mode: xanadu -*- "
  :group 'xanadu-font-lock-faces)
(defvar xanadu-font-lock-mode-face 'xanadu-font-lock-mode-face)


(defface xanadu-font-lock-arrow-face
  '(
    ;; (default :inherit font-lock-builtin-face)
    ;; (t (:foreground "color-47" :weight normal))
    (t (:foreground "#00ffff" :weight normal))
    ;; (t (:foreground "#ffaf00" :weight normal))

    )
  "Face used for C code."
  :group 'xanadu-font-lock-faces)
(defvar xanadu-font-lock-arrow-face 'xanadu-font-lock-arrow-face)


(defface xanadu-font-lock-assign-face
  '(
    ;; (default :inherit font-lock-builtin-face)
    (t (:foreground "color-47" :weight normal))
    ;; (t (:foreground "#00ffff" :weight normal))
    ;; (t (:foreground "#ffaf00" :weight normal))

    )
  "Face used for ':='"
  :group 'xanadu-font-lock-faces)
(defvar xanadu-font-lock-assign-face 'xanadu-font-lock-assign-face)


;; (defface xanadu-font-lock-vareq-face
;;   '(
;;     (t (:foreground "red" :weight bold))
;;     )
;;   "Face used for C code."
;;   :group 'xanadu-font-lock-faces)
;; (defvar xanadu-font-lock-vareq-face 'xanadu-font-lock-force-face)


(defface xanadu-font-lock-addr-face
  '(
    (t (:foreground "brightgreen" :weight normal)) ;;bold))
    )
  "Face used for '@' in addr@."
  :group 'xanadu-font-lock-faces)
(defvar xanadu-font-lock-addr-face 'xanadu-font-lock-addr-face)


(defface xanadu-font-lock-force-face
  '(
    (t (:foreground "red" :weight bold))
    )
  "Face used for C code."
  :group 'xanadu-font-lock-faces)
(defvar xanadu-font-lock-force-face 'xanadu-font-lock-force-face)


(defface xanadu-font-lock-free-face
  '(

    ;; (t (:foreground "#78dce8" :weight bold))
    ;; (t (:foreground "yellow" :weight bold))

    (t (:foreground "#5fffff" :weight bold))


    )
  "Face used for C code."
  :group 'xanadu-font-lock-faces)
(defvar xanadu-font-lock-free-face 'xanadu-font-lock-free-face)


(defface xanadu-font-lock-punc-face
  '(
    ;; (default :inherit font-lock-builtin-face)
    ;; (t (:foreground "#efe" :weight normal))
    (t (:foreground "blue" :weight normal))

    ;; (t (:foreground "#767676" :weight normal))
    ;; (t (:foreground "#ab9df2" :weight normal))

    ;; (t (:foreground "#ff6188" :weight normal))

    ;; (t (:foreground "Cyan" :weight normal))


    ;; (t (:foreground "brightblack" :weight normal))
    )
  "Face used for C code."
  :group 'xanadu-font-lock-faces)
(defvar xanadu-font-lock-punc-face 'xanadu-font-lock-punc-face)


(defface xanadu-font-lock-ide-face
  '(
    ;; (t (:foreground "#ff6188" :weight normal))
    (t (:foreground "yellow" :weight normal))

    ;; (t (:foreground "brightblack" :weight normal))
    )
  "Face used for C code."
  :group 'xanadu-font-lock-faces)
(defvar xanadu-font-lock-ide-face 'xanadu-font-lock-ide-face)


(defface xanadu-font-lock-comment-face
  '(
    (t (:foreground "black" :weight normal))
    ;; (t (:foreground "solar-black" :weight normal))
    ;; (default :inherit font-lock-comment-face)
    ;; (t (:foreground "#870000" :weight normal))
    ;; (t (:foreground "brightblack" :weight normal))

    ;; (t (:foreground "#afafd7" :weight normal))
    ;; (t (:foreground "black" :weight normal))

    )
  "Face used for C code."
  :group 'xanadu-font-lock-faces)
(defvar xanadu-font-lock-comment-face 'xanadu-font-lock-comment-face)


(defface xanadu-font-lock-match-face
  '(
    ;; (default :inherit font-lock-builtin-face)
    ;; (t (:foreground "#870000" :weight normal))
    ;; (t (:foreground "#ff005f" :weight bold))

    ;; (t (:foreground "black" :weight normal))

    ;; (t (:foreground "#d7ff00" :weight bold))
    (t (:foreground "white" :weight normal))
    )
  "Face used for C code."
  :group 'xanadu-font-lock-faces)
(defvar xanadu-font-lock-match-face 'xanadu-font-lock-match-face)


(defface xanadu-font-lock-temp-face
  '(
    ;; (default :inherit font-lock-builtin-face)
    ;; (t (:foreground "#efe" :weight normal))
    ;; (t (:foreground "#ff6188" :weight normal))
    (t (:foreground "red" :weight normal))
    )
  "Face used for C code."
  :group 'xanadu-font-lock-faces)
(defvar xanadu-font-lock-temp-face 'xanadu-font-lock-temp-face)



(defface xanadu-font-lock-arg-face
  '(
    ;; (default) ;; :inherit font-lock-builtin-face)
;'
    ;; (t (:foreground "#efe" :weight normal))
    ;; (t (:foreground "#bcbcbc" :weight normal))

    ;; (t (:foreground "#ab9df2" :weight normal))
    ;; (t (:foreground "#fc9867" :weight normal))
    ;; (t (:foreground "#ffd866" :weight normal))
;;    (t (:foreground "#a9dc76" :weight normal))
    ;; (t (:foreground "#ff6188" :weight normal))
    ;;(t (:foreground "#a9dc76" :weight normal))
     (t (:foreground "green" :weight normal))

    )
  "Face used for C code."
  :group 'xanadu-font-lock-faces)
(defvar xanadu-font-lock-arg-face 'xanadu-font-lock-arg-face)


(defun xanadu-context-free-search (regexp &optional limit)
  "Use inside a parenthesized expression to find a regexp at the same level."
  (let ((nest-lvl 0) foundp)
    (while (and (not (eobp))
                (or (null limit) (not (> (point) limit)))
                (not (minusp nest-lvl))
                (not (setq foundp
                           (and (zerop nest-lvl)
                                (looking-at regexp)))))
      (cond ((looking-at "(\\|\\[\\|{")
             (incf nest-lvl))
            ((looking-at ")\\|\\]\\|}")
             (decf nest-lvl)))
      (forward-char 1))
    foundp))

(defun xanadu-font-lock-mark-block ()
  (let ((lines 64))                     ; bit of a hack
    (set-mark (save-excursion (forward-line lines) (point)))
    (forward-line (- lines))))

(defun xanadu-font-lock-c-code-search (&optional limit)
  (interactive)
  ;; Font-lock mode works on regions that may not be large enough to
  ;; find both {% and %}.  Really, they should be treated like
  ;; comments and put into the syntax table.  Then the syntactic pass
  ;; would take care of C code.  However, there is only room for 2
  ;; kinds of comments in the table, and those are taken.  So the
  ;; keyword pass can try to get them.  But keyword pass doesn't
  ;; handle multiline keywords very well (because of region cutoff).
  ;; We can ignore the limit while searching, but coloration will not
  ;; happen outside the region anyway.  So it's going to be a little
  ;; screwy no matter what.  Not sure what to do about it.
  (setq limit nil)
  (let (begin end)
    ;; (when (re-search-forward "%{" limit t)
    (when (search-forward "%{" limit t)
      (setq begin (match-beginning 0))
      ;; (when (re-search-forward "%}" limit t)
      (when (search-forward "%}" limit t)
        (setq end (match-end 0))
        (when (and begin end)
          (store-match-data (list begin end))
          (point))))))

(defun xanadu-font-lock-static-search (&optional limit)
  (interactive)
  (when (null limit) (setq limit (point-max)))
  (let (foundp begin end (key-begin 0) (key-end 0) pt)
    (cl-flet ((store ()
             (store-match-data (list begin end key-begin key-end))))
      ;; attempt to find some statics to highlight and store the
      ;; points beginning and ending the region to highlight.  needs
      ;; to be a loop in order to handle cases like ( foo : type )
      ;; where initially it considers ( .. | .. ) but finds no '|'
      ;; char so it must then go inside and look for sub-regions like
      ;; ": type".
      ;;
      ;; Each branch of the cond must be sure to make progress, the
      ;; point must advance, or else infinite-loop bugs may arise.
      (while (and (not foundp) (< (point) limit))
        (setq key-begin 0 key-end 0)
        (cond
         ((re-search-forward "(\\|:[^=]\\|{\\|[^[:space:].:-]<" limit t)
          (setq pt (setq begin (match-beginning 0)))
          (when pt (goto-char pt))
          (cond
           ;; handle { ... }
           ;; ((looking-at "{")
           ;;  (forward-char 1)
           ;;  (cond
           ;;   ((save-excursion
           ;;      (forward-word -1)
           ;;      (looking-at "where"))
           ;;    ;; except when preceeded by "where" keyword
           ;;    (setq pt nil))
           ;;   ((re-search-forward "}" limit t)
           ;;    (setq end (match-end 0))
           ;;    (store)
           ;;    (setq pt end)
           ;;    (setq foundp t))
           ;;   (t
           ;;    (setq pt nil))))

           ((looking-at "{")
            (forward-char 1))


           ;; handle ( ... | ... )
           ((looking-at "(")
            (forward-char 1)
            (incf begin)
            (cond
             ((null (xanadu-context-free-search ")" limit))
             ;; ((null (xanadu-context-free-search ")\\||" limit))
              (setq pt nil))
             ((looking-at "|")
              (setq end (match-end 0))
              (store)
              (setq foundp t))
             ((looking-at ")")
              (setq pt nil)
              ;; no | found so scan for other things inside ( )
              (goto-char (1+ begin)))))

           ;; handle ... : ...
           ((looking-at ":[^=]")
            (forward-char 1)
            (let ((nest-lvl 0) finishedp)
              ;; emacs22 only:
              ;;(xanadu-context-free-search ")\\|\\_<=\\_>\\|," limit)
              (xanadu-context-free-search ")\\|[^=]=[^=]\\|,\\|\n\\|]\\|}\\||" limit)
              (setq begin (1+ begin)
                    end (point)
                    key-begin (1- begin)
                    key-end begin)
              (store)
              (setq foundp t)))

           ;; ((looking-at "<")
           ;;  (forward-char 1))
           ;; ((looking-at ">")
           ;;  (forward-char 1))


	   ;; otherwise
           ((looking-at "[^[:space:].:-]<")
            (forward-char 1)
            (incf begin)
            (cond
             ((search-forward ">" limit t)
              (setq end (match-end 0))
              (store)
              (setq pt end)
              (setq foundp t))
             (t
              (setq pt nil))))

           (t
            (setq pt nil)
            (forward-char 1)
            (setq foundp t))))
         (t
          (setq foundp t)
          (setq pt nil)))))
    pt))

(defvar xanadu-word-keywords '( "implfun" "implval" "implate" "implprf"
  "impltmp" "abstbox" "abstflt" "absvtflt" "absvtbox" "static" "absimpl"
  "sexpdef" "prop" "vtype" "endlocal" "endwhere" "endlet" "case" "absprop"
  "absview" "ifcase" "and" "as" "assume" "begin" "break" "continue" "classdec"
  "datasort" "datatype" "dataprop" "dataview" "datavtype" "dataviewtype" "do"
  "dynload" "else" "end" "exception" "extern" "extype" "extval" "fn" "fnx" "fun"
  "prfn" "prfun" "praxi" "castfn" "if" "in" "infix" "infixl" "infixr" "prefix"
  "postfix" "implmnt" "implement" "primplmnt" "primplement" "lam"
  "llam" "fix" "let" "local" "macrodef" "nonfix" "overload" "of" "op" "rec"
  "scase" "sif" "sortdef" "sta" "stacst" "stadef" "stavar" "symelim" "symintr"
  "then" "try" "tkindef" "typedef" "propdef" "viewdef" "vtypedef" "viewtypedef"
  "val" "prval" "var" "prvar" "when" "where" "for" "while" "with" "withtype"
  "withprop" "withview" "withvtype" "withviewtype"))


(defun wrap-word-keyword (w)
  (concat "\\<" w "\\>"))

(defvar xanadu-special-keywords '("#stacst" "#static" "#extern" "#symload"
  "$macro" "#macdef" "$static" "$arrpsz" "$arrptrsize" "$delay" "$ldelay"
  "$effmask" "$effmask_ntm" "$effmask_exn" "$effmask_ref" "$effmask_wrt"
  "$effmask_all" "$extern" "$extkind" "$extype" "$extype_struct" "$extval"
  "$lst" "$lst_t" "$lst_vt" "$list" "$list_t" "$list_vt" "$rec" "$rec_t"
  "$rec_vt" "$record" "$record_t" "$record_vt" "$tup" "$tup_t" "$tup_vt"
  "$tuple" "$tuple_t" "$tuple_vt" "$raise" "$showtype" "$myfilename"
  "$mylocation" "$myfunction" "#assert" "#define" "#elif" "#elifdef" "#elifndef"
  "#else" "#endif" "#error" "#if" "#ifdef" "#ifndef" "#print" "#then" "#undef"
  "#include" "#staload" "#dynload" "#require"))

(defun wrap-special-keyword (w)
  (concat "\\" w "\\>"))

(defvar xanadu-keywords
  (append (list "\\<\\(s\\)?case\\(+\\|*\\)?\\>")
          (mapcar 'wrap-word-keyword xanadu-word-keywords)
          (mapcar 'wrap-special-keyword xanadu-special-keywords)))

(defvar xanadu-font-lock-keywords
  (append '( (xanadu-font-lock-static-search (1 'xanadu-font-lock-keyword-face)
     (0 'xanadu-font-lock-static-face) )
    ;; for '[...] ;; list definitions
     ("'\\[.*]" (0 'xanadu-font-lock-default-face nil))
     ;; '| ... ]'
     ("|\\([^\n]*\\)]" (1 'xanadu-font-lock-static-face nil))
     ;; '| ... }'
     ("|\\([^\n{]*\\)}" (1 'xanadu-font-lock-static-face nil))
     ;; name in {name:}
     ("{\\([^:(}[:space:]]*\\)[:}]" (1 'xanadu-font-lock-q-face nil))
     ;; arguments ', x :'
     ("[|]\\([^:,|)]*\\)[:]" (1 'xanadu-font-lock-arg-face nil))
     ("[,]\\([^:,)]*\\)[:]" (1 'xanadu-font-lock-arg-face nil))
     ("[(]\\([^:,)]*\\):[^=][)]?" (1 'xanadu-font-lock-arg-face nil))
     ;; [n:int | n >= 1]
     ("\\[\\([^:,|]]*\\):[^=]" (1 'xanadu-font-lock-arg-face nil))
     ;; {} template
     ("{\\([[:alnum:]]*\\)}"  (0 'xanadu-font-lock-ide-face nil))
     ;; the '$' in foo$fwork
     ("[^[:space:]\n(]\\(\\$\\)[^[:space:]]" (1 'xanadu-font-lock-temp-face nil))
     ;; bar in foo$bar
     ("[^[:space:]\n(]$\\([^[:space:]\n.)(<{]*\\).?" (1 'xanadu-font-lock-tempfun-face nil))
     ;; ...$template_fun from namespace
     ("$\\(\\w+\\).?[\n]?\\." (1 'xanadu-font-lock-namespacefun-face nil))
     ;; ...$template_fun
     ("$\\(\\w+\\).?[\n]?" (1 'xanadu-font-lock-keyword-face nil))
     ("-<\\([[:alnum:][:space:];@!?,()]*\\)\\(:\\)?\\([[:alpha:][:space:]@!?,]*\\)>"
     (1 'xanadu-font-lock-etc-face nil))
     (">\\(<[[:alnum:][:space:];@!?,()>]*:?[[:alnum:]]*>\\)[^.]"
     (1 'xanadu-font-lock-static-face nil))
     ;; effects ':<>'
     ("[^>]<[[:alnum:][:space:];@!?,()>]*:?\\([[:alnum:]]*\\)>" (0 'xanadu-font-lock-static-face nil))
     ;; val+/-
     ("val\\(\\+\\|-\\)[[:space:][:alpha:]@~\n]" (1 'xanadu-font-lock-valcase-face nil))
     ;; case+/-
     ("case\\(\\+\\|-\\)[[:space:]\n]" (1 'xanadu-font-lock-valcase-face nil))
     ;; ?
     (":\\([[:alpha:][:space:]@!?]*\\)[=\n]+?" (1 'xanadu-font-lock-metric-face nil))
     (")[[:space:]]*:[:space:]*?\\([[:alpha:][:space:]@!?,()]*\\)[=\n]+?"
      (1 'xanadu-font-lock-metric-face nil))
     ("-\\*-.*-\\*-" (0 'xanadu-font-lock-mode-face t))
     ;; just $
     ("[\\$]" (0 'xanadu-font-lock-keyword-face))
     ("[[:alpha:]]\\(@\\)." (1 'xanadu-font-lock-etc-face))
     ("[[:alnum:][:space:]\n+-]\\(@\\)[[:alpha:]]" (1 'xanadu-font-lock-etc-face))
     (":=" (0 'xanadu-font-lock-assign-face))
     ("=>" (0 'xanadu-font-lock-arrow-face))
     ;; ! for force/reference
     ("[^[:alpha:]]\\(!\\)[[:alpha:]]" (1 'xanadu-font-lock-force-face))
     ;; ~ for freeing
     ("[^[:alpha:]]\\(~\\)[([:alpha:]]" (1 'xanadu-font-lock-free-face))
     ("[[:space:]]\\(~\\)[[:space:]]" (1 'xanadu-font-lock-free-face))
     ("[()]" (0 'xanadu-font-lock-punc-face))
     ("[{}]" (0 'xanadu-font-lock-punc-face))
     ("\\[" (0 'xanadu-font-lock-punc-face))
     ("\\]" (0 'xanadu-font-lock-punc-face))
     ("[-,<=>*+;~!]" (0 'xanadu-font-lock-punc-face))
     (":" (0 'xanadu-font-lock-punc-face t))
     ("[[-,<=>*+;~[]!:]" (0 'xanadu-font-lock-punc-face)))
   (list (list (mapconcat 'identity xanadu-keywords "\\|")
               '(0 'xanadu-font-lock-keyword-face)))))


(defvar xanadu-font-lock-syntactic-keywords
  '(("(\\(/\\)" (1 ". 1b"))             ; (/ does not start a comment.
    ("/\\(*\\)" (1 ". 3"))              ; /* does not start a comment.
    ("\\(/\\)///" (0 "< nb"))           ; Start a comment with no end.
    ;; Recognize char-literals.
    ("[^[:alnum:]]\\('\\)\\(?:[^\\]\\|\\\\.[[:xdigit:]]*\\)\\('\\)"
     (1 "\"'") (2 "\"'"))
    ))

(defun newline-and-indent-relative () (interactive) (newline) (indent-to-column
  (save-excursion (forward-line -1) (back-to-indentation) (current-column))))


(defun xanadu-mode-variables ()
  ;; (set (make-local-variable 'xanadu-prog-proc-descriptor) xanadu-pp-functions)
  (set-syntax-table xanadu-mode-syntax-table)
  (setq local-abbrev-table xanadu-mode-abbrev-table)
  ;; Setup indentation and sexp-navigation.
  (smie-setup
   xanadu-smie-grammar #'xanadu-smie-rules
   :backward-token #'xanadu-smie-backward-token
   :forward-token #'xanadu-smie-forward-token)
  (set (make-local-variable 'parse-sexp-ignore-comments) t)
  (set (make-local-variable 'comment-start) "(* ")
  (set (make-local-variable 'comment-end) " *)")
  (set (make-local-variable 'comment-start-skip) "(\\*+\\s-*")
  (set (make-local-variable 'comment-end-skip) "\\s-*\\*+)")
  ;; No need to quote nested comments markers.
  (set (make-local-variable 'comment-quote-nested) nil)
  )

(defun xanadu-funname-of-and ()
  "Name of the function this `and' defines, or nil if not a function.
Point has to be right after the `and' symbol and is not preserved."
  (forward-comment (point-max))
  (if (looking-at xanadu-tyvarseq-re) (goto-char (match-end 0)))
  (let ((sym (xanadu-smie-forward-token)))
    (forward-comment (point-max))
    (unless (or (member sym '(nil "d="))
		(member (xanadu-smie-forward-token) '("d=")))
      sym)))

(defun xanadu-find-forward (re)
  (while (progn (forward-comment (point-max))
                (not (looking-at re)))
    (or (ignore-errors (forward-sexp 1) t) (forward-char 1))))

(defun xanadu-electric-pipe ()
  "Insert a \"|\".
Depending on the context insert the name of function, a \"=>\" etc."
  (interactive)
  (unless (save-excursion (skip-chars-backward "\t ") (bolp)) (insert "\n"))
  (insert "| ")
  (unless (xanadu-post-self-insert-pipe (1- (point)))
    (indent-according-to-mode)))

(defun xanadu-post-self-insert-pipe (&optional acp)
  (when (or acp (and (eq ?| last-command-event)
                     (setq acp (electric--after-char-pos))))
    (let ((text
           (save-excursion
             (goto-char (1- acp))       ;Jump before the "|" we just inserted.
             (let ((sym (xanadu-find-matching-starter xanadu-pipeheads
                                                   ;; (xanadu-op-prec "|" 'back)
                                                   )))
               (xanadu-smie-forward-token)
               (forward-comment (point-max))
               (cond
                ((string= sym "|")
                 (let ((f (xanadu-smie-forward-token)))
                   (xanadu-find-forward "\\(=>\\|=\\||\\)\\S.")
                   (cond
                    ((looking-at "|") nil)     ; A datatype or an OR pattern?
                    ((looking-at "=>") " => ") ;`case', or `fn' or `handle'.
                    ((looking-at "=")          ;A function.
                     (cons (concat f " ")" = ")))))
                ((string= sym "and")
                 ;; Could be a datatype or a function.
                 (let ((funname (xanadu-funname-of-and)))
                   (if funname (cons (concat funname " ") " = ") nil)))
                ((string= sym "fun")
                 (while (and (setq sym (xanadu-smie-forward-token))
                             (string-match "^'" sym))
                   (forward-comment (point-max)))
                 (cons (concat sym " ") " = "))
                ((member sym '("case" "handle" "of")) " => ") ;; "fn"?
                ;;((member sym '("abstype" "datatype")) "")
                (t nil))))))
      (when text
        (save-excursion
          (goto-char (1- acp))
          (unless (save-excursion (skip-chars-backward "\t ") (bolp))
            (insert "\n")))
        (unless (memq (char-before) '(?\s ?\t)) (insert " "))
        (let ((use-region (and (use-region-p) (< (point) (mark)))))
          ;; (skeleton-proxy-new `(nil ,(if (consp text) (pop text)) _ ,text))
          (when (consp text) (insert (pop text)))
          (if (not use-region)
              (save-excursion (insert text))
            (goto-char (mark))
            (insert text)))
        (indent-according-to-mode)
        t))))


;;; Misc

(defun xanadu-mark-function ()
  "Mark the surrounding function.  Or try to at least."
  (interactive)
  ;; FIXME: Provide beginning-of-defun-function so mark-defun "just works".
  (let ((start (point)))
    (xanadu-beginning-of-defun)
    (let ((beg (point)))
      (smie-forward-sexp 'halfsexp)
      (if (or (< start beg) (> start (point)))
          (progn
            (goto-char start)
            (mark-paragraph))
        (push-mark nil t t)
        (goto-char beg)))))

(defun xanadu-back-to-outer-indent ()
  "Unindents to the next outer level of indentation."
  (interactive)
  (save-excursion
    (forward-line 0)
    (let ((start-column (current-indentation))
          indent)
      (when (> start-column 0)
        (save-excursion
          (while (>= (setq indent
                           (if (re-search-backward "^[ \t]*[^\n\t]" nil t)
                               (current-indentation)
                             0))
                     start-column))
          (skip-chars-forward " \t")
          (let ((pos (point)))
            (move-to-column start-column)
            (when (re-search-backward " \\([^ \t\n]\\)" pos t)
              (goto-char (match-beginning 1))
              (setq indent (current-column)))))
        (indent-line-to indent)))))

(defun xanadu-find-matching-starter (syms)
  (let ((halfsexp nil)
        tok)
    ;;(xanadu-smie-forward-token)
    (while (not (or (bobp)
                    (member (nth 2 (setq tok (smie-backward-sexp halfsexp)))
                            syms)))
      (cond
       ((null (car tok)) nil)
       ((numberp (car tok)) (setq halfsexp 'half))
       (t (goto-char (cadr tok)))))
    (if (nth 2 tok) (goto-char (cadr tok)))
    (nth 2 tok)))

(defun xanadu-skip-siblings ()
  (let (tok)
    (while (and (not (bobp))
                (progn (setq tok (smie-backward-sexp 'half))
                       (cond
                        ((null (car tok)) t)
                        ((numberp (car tok)) t)
                        (t nil)))))
    (if (nth 2 tok) (goto-char (cadr tok)))
    (nth 2 tok)))

(defun xanadu-beginning-of-defun ()
  (let ((sym (xanadu-find-matching-starter xanadu-starters-syms)))
    (if (member sym '("fun" "and" "functor" "signature" "structure"
		      "abstraction" "datatype" "abstype" "implement" "fnx" "fn" "extern fun"

		      ))
	(save-excursion (xanadu-smie-forward-token) (forward-comment (point-max))
			(xanadu-smie-forward-token))
      ;; We're inside a "non function declaration": let's skip all other
      ;; declarations that we find at the same level and try again.
      (xanadu-skip-siblings)
      ;; Obviously, let's not try again if we're at bobp.
      (unless (bobp) (xanadu-beginning-of-defun)))))

(defcustom xanadu-max-name-components 3
  "Maximum number of components to use for the current function name."
  :type 'integer)

(defun xanadu-current-fun-name ()
  (save-excursion
    (let ((count xanadu-max-name-components)
	  fullname name)
      (end-of-line)
      (while (and (> count 0)
		  (setq name (xanadu-beginning-of-defun)))
	(cl-decf count)
	(setq fullname (if fullname (concat name "." fullname) name))
	;; Skip all other declarations that we find at the same level.
	(xanadu-skip-siblings))
      fullname)))


;;; INSERTING PROFORMAS (COMMON XANADU-FORMS)

(defvar xanadu-forms-alist nil
  "Alist of code templates.
You can extend this alist to your heart's content.  For each additional
template NAME in the list, declare a keyboard macro or function (or
interactive command) called `xanadu-form-NAME'.
If `xanadu-form-NAME' is a function it takes no arguments and should
insert the template at point\; if this is a command it may accept any
sensible interactive call arguments\; keyboard macros can't take
arguments at all.
`xanadu-forms-alist' understands let, local, case, abstype, datatype,
signature, structure, and functor by default.")

(defmacro xanadu-def-skeleton (name interactor &rest elements)
  (declare (indent 2))
  (let ((fsym (intern (concat "xanadu-form-" name))))
    `(progn
       (add-to-list 'xanadu-forms-alist ',(cons name fsym))
       (define-abbrev xanadu-skel-abbrev-table ,name "" ',fsym :system t)
       (define-skeleton ,fsym
         ,(format "XANADU-mode skeleton for `%s..' expressions" name)
         ,interactor
         ,(concat name " ") >
         ,@elements))))

(xanadu-def-skeleton "let" nil
  @ "\nin " > _ "\nend" >)

(xanadu-def-skeleton "if" nil
  @ " then " > _ "\nelse " > _)

(xanadu-def-skeleton "local" nil
  @ "\nin" > _ "\nend" >)

(xanadu-def-skeleton "case" "Case expr: "
  str "\nof " > _ " => ")

;; (xanadu-def-skeleton "case+" "Case expr: "
;;   str "\nof " > _ " => ")


;; (xanadu-def-skeleton "signature" "Signature name: "
;;   str " =\nsig" > "\n" > _ "\nend" >)

;; (xanadu-def-skeleton "structure" "Structure name: "
;;   str " =\nstruct" > "\n" > _ "\nend" >)

;; (xanadu-def-skeleton "functor" "Functor name: "
;;   str " () : =\nstruct" > "\n" > _ "\nend" >)

(xanadu-def-skeleton "datatype" nil ;;"Datatype name and type params: "
  str " =" \n)

(xanadu-def-skeleton "abstype" nil ;;"Abstype name and type params: "
  str " =" \n _ "\nwith" > "\nend" >)

;;
;; (xanadu-def-skeleton "struct" nil
;;   _ "\nend" >)

;; (xanadu-def-skeleton "sig" nil
;;   _ "\nend" >)

(xanadu-def-skeleton "val" nil
  @ " = " > _)

(xanadu-def-skeleton "fn" nil
  @ " =>" > _)

;; (xanadu-def-skeleton "fun" nil
;;   @ " =" > _)

;;

(defun xanadu-forms-menu (_menu)
  (mapcar (lambda (x) (vector (car x) (cdr x) t))
	  xanadu-forms-alist))

(defvar xanadu-last-form "let")

(defun xanadu-electric-space ()
  "Expand a symbol into an XANADU form, or just insert a space.
If the point directly precedes a symbol for which an XANADU form exists,
the corresponding form is inserted."
  (interactive)
  (let ((abbrev-mode (not abbrev-mode))
	(last-command-event ?\s)
	;; Bind `this-command' to fool skeleton's special abbrev handling.
	(this-command 'self-insert-command))
    (call-interactively 'self-insert-command)))

(defun xanadu-insert-form (name newline)
  "Interactive short-cut to insert the NAME common XANADU form.
If a prefix argument is given insert a NEWLINE and indent first, or
just move to the proper indentation if the line is blank\; otherwise
insert at point (which forces indentation to current column).

The default form to insert is whatever you inserted last time
\(just hit return when prompted\)\; otherwise the command reads with
completion from `xanadu-forms-alist'."
  (interactive
   (list (completing-read
	  (format "Form to insert (default %s): " xanadu-last-form)
	  xanadu-forms-alist nil t nil nil xanadu-forms-alist)
	 current-prefix-arg))
  (setq xanadu-last-form name)
  (unless (or (not newline)
	      (save-excursion (beginning-of-line) (looking-at "\\s-*$")))
    (insert "\n"))
  (when (memq (char-syntax (preceding-char)) '(?_ ?w)) (insert " "))
  (let ((f (cdr (assoc name xanadu-forms-alist))))
    (cond
     ((commandp f) (command-execute f))
     (f (funcall f))
     (t (error "Undefined XANADU form: %s" name)))))

;;;###autoload
(define-derived-mode xanadu-mode fundamental-mode "XANADU"
  "\\<xanadu-mode-map>Major mode for editing ATS code.
This mode runs `xanadu-mode-hook' just before exiting.
See also (info \"(xanadu-mode)Top\").
\\{xanadu-mode-map}"
  ;; (set (make-local-variable 'font-lock-defaults) xanadu-font-lock-defaults)
  ;; (set (make-local-variable 'prettify-symbols-alist)
  ;;      xanadu-font-lock-symbols-alist)
  ;; (set (make-local-variable 'outline-regexp) xanadu-outline-regexp)
  (set (make-local-variable 'imenu-create-index-function)
       'xanadu-imenu-create-index)
  (set (make-local-variable 'add-log-current-defun-function)
       'xanadu-current-fun-name)
  ;; ;; Treat paragraph-separators in comments as paragraph-separators.
  ;; (set (make-local-variable 'paragraph-separate)
  ;;      (concat "\\([ \t]*\\*)?\\)?\\(" paragraph-separate "\\)"))
  (set (make-local-variable 'require-final-newline) t)

  (set (make-local-variable 'electric-indent-chars)
       (cons ?\; (if (boundp 'electric-indent-chars)
                     electric-indent-chars '(?\n))))
  (set (make-local-variable 'electric-layout-rules)
       `((?\; . ,(lambda ()
                   (save-excursion
                     (skip-chars-backward " \t;")
                     (unless (or (bolp)
                                 (progn (skip-chars-forward " \t;")
                                        (eolp)))
                       'after))))))
  (when xanadu-electric-pipe-mode
    (add-hook 'post-self-insert-hook #'xanadu-post-self-insert-pipe nil t))
  ;; (xanadu-mode-variables)

  (set (make-local-variable 'font-lock-defaults)
       '(xanadu-font-lock-keywords nil nil ((?_ . "w") (?= . "_")) nil
         (font-lock-syntactic-keywords . xanadu-font-lock-syntactic-keywords)
         (font-lock-mark-block-function . xanadu-font-lock-mark-block)))
  (local-set-key (kbd "RET") 'newline-and-indent-relative)
  (local-set-key (kbd "C-j") 'newline-and-indent-relative)
  (setq indent-line-function 'tab-to-tab-stop)
  (setq tab-stop-list (loop for x from 2 upto 120 by 2 collect x))
  ;; (setq tab-width 2)
  (setq indent-tabs-mode nil)
  ;; 2019-05-24
  (set-face-foreground 'font-lock-string-face "magenta")

  (local-set-key (kbd "TAB") 'tab-or-else2)
  (local-set-key (kbd "C-h") 'backspace-whitespace-to-tab-stop)
  (local-set-key (kbd "C-d") 'backspace-forward-whitespace-to-tab-stop)
;;  (local-set-key "\C-k" 'kill-and-join-forward)

  (add-hook 'before-save-hook 'delete-trailing-whitespace)

;; my additions
  (set (make-local-variable 'font-lock-comment-face)
       'xanadu-font-lock-comment-face)
  ;; default -- turqouise
  ;; (set (make-local-variable 'show-paren-match)
  ;;      'xanadu-font-lock-match-face)
  (set-face-foreground 'show-paren-match (face-foreground 'xanadu-font-lock-match-face))
  ;; (set-face-attribute 'show-paren-match nil :weight 'extra-bold)
  ;; (set-face-foreground 'show-paren-match-face (face-foreground 'xanadu-font-lock-match-face))

  ;; (unless (local-variable-p 'compile-command)
    (set (make-local-variable 'compile-command)
         (let ((file buffer-file-name))
	   (format "xatsopt -d %s" file)))


    (put 'compile-command 'permanent-local t)
    ;; )
  (local-set-key (kbd "C-c C-c") 'compile)
  (setq compilation-error-screen-columns nil)
  (cond
   ;; Emacs 21
   ((and (< emacs-major-version 22)
         (not xemacsp))
    (pushnew '("\\(syntax error: \\)?\\([^\n:]*\\): \\[?[0-9]*(line=\\([0-9]*\\), offs=\\([0-9]*\\))\\]?" 2 3 4)
    ;; (pushnew '("\\(syntax error: \\)?\\([^\n:]*\\): \\[?[0-9]*(line=\\([0-9]*\\), offs=\\([0-9]*\\))\\]?" 2 3 4)
             compilation-error-regexp-alist))
   ;; Emacs 22+ has an improved compilation mode
   ((and (>= emacs-major-version 22)
         (not xemacsp))
    (pushnew '(ats "\\(syntax error: \\)?\\([^\n:]*\\): \\[?[0-9]*(line=\\([0-9]*\\), offs=\\([0-9]*\\))\\]?\\(?: -- [0-9]*(line=\\([0-9]*\\), offs=\\([0-9]*\\))\\)?" 2 (3 . 5) (4 . 6))
             compilation-error-regexp-alist-alist)
    (pushnew 'ats compilation-error-regexp-alist))
   ; XEmacs has something different, to be contrary
   (xemacsp
    (pushnew '(ats ("\\(syntax error: \\)?\\([^\n:]*\\): \\[?[0-9]*(line=\\([0-9]*\\), offs=\\([0-9]*\\))\\]?" 2 3 4))
             compilation-error-regexp-alist-alist)
    (unless (eql 'all compilation-error-regexp-systems-list)
      (pushnew 'ats compilation-error-regexp-systems-list))
    (compilation-build-compilation-error-regexp-alist)
    (message "WARNING! XEMACS IS DEAD AND DEPRECATED.")))

  (xanadu-mode-variables)

)

;;;autoload
(add-to-list 'auto-mode-alist '("\\.*\\(ats\\)\\'" . xanadu-mode))

(provide 'xanadu-mode)

;;; xanadu-mode.el ends here

;; ats3-mode.el --- Major mode for editing ATS3 source code -*- lexical-binding: t; -*-

;; The syntax and keyword lists here follow the ATS3 lexer and sources in
;; srcgen2.  This is a lightweight editing mode; it does not invoke the
;; compiler or attempt to parse ATS expressions.

;;; Code:

(require 'prog-mode)

(defconst ats3-keywords
  '("as" "of" "in" "and" "end" "if" "sif" "then" "else"
    "when" "with" "case" "scas" "case0" "case1" "lam" "fix"
    "let" "try" "where" "local" "endif" "endcas" "endlam"
    "endlet" "endtry" "endwhr" "endloc" "endwhere" "endlocal"
    "fn0" "fn1" "fnx" "fun" "val" "vlr" "var" "prval"
    "pax" "pfx" "pvx" "prfn0" "prfn1" "prfun" "praxi" "fcast"
    "datasort" "dataprop" "dataview" "datatype" "datavwtp"
    "withtype" "withprop" "withview" "withvwtp"
    "abstype" "absprop" "absview" "absvwtp" "absimpl"
    "typedef" "propdef" "viewdef" "sexpdef" "sortdef"
    "stacst" "stadef" "stavar" "tkindef"
    "excptcon" "extern" "extype" "extval"
    "break" "continue" "begin"
    "prefix" "postfix" "infix" "infixl" "infixr" "nonfix"
    "overload" "symelim" "symintr")
  "ATS3 reserved words used by the current lexer.")

(defconst ats3-directives
  '("#assert" "#define" "#elif" "#elifdef" "#elifndef" "#else"
    "#endif" "#error" "#if" "#ifdef" "#ifndef" "#include"
    "#print" "#then" "#undef" "#staload" "#dynload" "#symload"
    "#require")
  "ATS3 preprocessor and loading directives.")

(defconst ats3-special-identifiers
  '("$arrpsz" "$arrptrsize" "$delay" "$ldelay" "$effmask"
    "$effmask_ntm" "$effmask_exn" "$effmask_ref" "$effmask_wrt"
    "$effmask_all" "$extern" "$extkind" "$extype" "$extype_struct"
    "$extval" "$lst" "$lst_t" "$lst_vt" "$list" "$list_t"
    "$list_vt" "$rec" "$rec_t" "$rec_vt" "$record" "$record_t"
    "$record_vt" "$tup" "$tup_t" "$tup_vt" "$tuple" "$tuple_t"
    "$tuple_vt" "$raise" "$showtype" "$myfilename" "$mylocation"
    "$myfunction")
  "Common ATS3 special identifiers.")

(defconst ats3-font-lock-keywords
  `((,(regexp-opt ats3-keywords 'words) . font-lock-keyword-face)
    (,(regexp-opt ats3-directives 'words) . font-lock-preprocessor-face)
    (,(regexp-opt ats3-special-identifiers 'words) . font-lock-builtin-face)
    ("\\.<[^>\n]*>\\." . font-lock-constant-face)
    ("\\_<\\(true\\|false\\|nil\\)\\_>" . font-lock-constant-face))
  "Font-lock rules for ATS3.")

(defvar ats3-mode-syntax-table
  (let ((table (make-syntax-table)))
    ;; Nested ATS comments: (* ... *).
    (modify-syntax-entry ?\( "(1n" table)
    (modify-syntax-entry ?\) ")4n" table)
    (modify-syntax-entry ?* ". 23n" table)
    ;; Strings and character literals.
    (modify-syntax-entry ?\" "\"" table)
    (modify-syntax-entry ?' "'" table)
    ;; ATS identifiers may contain apostrophes and symbolic characters.
    (modify-syntax-entry ?_ "w" table)
    (dolist (char '(?! ?$ ?% ?& ?* ?+ ?- ?. ?/ ?: ?< ?= ?> ?? ?@ ?^ ?| ?~))
      (modify-syntax-entry char "." table))
    ;; Bracket pairs.
    (modify-syntax-entry ?{ "(}" table)
    (modify-syntax-entry ?} "){" table)
    (modify-syntax-entry ?\[ "(]" table)
    (modify-syntax-entry ?\] ")[" table)
    table)
  "Syntax table for ATS3.")

(defun ats3--syntax-propertize (start end)
  "Mark ATS3 // line comments between START and END."
  (save-excursion
    ;; ATS3 line comments begin with //.  Mark them directly here; invoking
    ;; syntax-ppss from syntax-propertize can recursively trigger font-lock.
    (goto-char start)
    (while (search-forward "//" end t)
      (let ((begin (- (point) 2))
            (line-end (line-end-position)))
        (put-text-property begin (1+ begin) 'syntax-table
                           (string-to-syntax "< b"))
        (put-text-property (1+ begin) (point) 'syntax-table
                           (string-to-syntax "."))
        (when (< line-end (point-max))
          (put-text-property line-end (1+ line-end) 'syntax-table
                             (string-to-syntax "> b")))))))

(defun ats3-indent-line ()
  "Indent the current line to the previous nonblank line's indentation."
  (interactive)
  (let ((offset (- (current-column) (current-indentation)))
        (indent (save-excursion
                  (beginning-of-line)
                  (if (= (forward-line -1) 0)
                      (current-indentation)
                    0))))
    (indent-line-to indent)
    (when (> offset 0) (move-to-column (+ indent offset)))))

;;;###autoload
(define-derived-mode ats3-mode prog-mode "ATS3"
  "Major mode for editing ATS3 source files."
  :syntax-table ats3-mode-syntax-table
  (setq-local font-lock-defaults '(ats3-font-lock-keywords))
  (setq-local syntax-propertize-function #'ats3--syntax-propertize)
  (setq-local comment-start "(*")
  (setq-local comment-end "*)")
  (setq-local comment-start-skip "(\\*+\\|//+\\s-*")
  (setq-local indent-line-function #'ats3-indent-line)
  (setq-local indent-tabs-mode nil))

;;;###autoload
(add-to-list 'auto-mode-alist '("\\.\\(sats\\|dats\\|hats\\)\\'" . ats3-mode))

(provide 'ats3-mode)
;;; ats3-mode.el ends here

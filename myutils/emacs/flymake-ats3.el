;; flymake-ats3.el --- Flymake support for ATS3 -*- lexical-binding: t; -*-
;;
;; Load this file after Flymake and ATS3 support are available, for example:
;;   (require 'flymake-ats3)
;;
;; Set flymake-ats3-command and flymake-ats3-command-options to match
;; the ATS3 checker installed on your system.  The checker must accept the
;; temporary source filename as its final argument and print diagnostics to
;; standard output or standard error.

;;; Code:

(require 'flymake)

(defvar flymake-ats3-command "node"
  "Runtime used to launch the ATS3 checker script.")

(defvar flymake-ats3-command-options '("--stack-size=8801")
  "Runtime arguments passed before the ATS3 checker script.

This list defaults to the stack size used to run the optimized checker.")

(defconst flymake-ats3-script-name "xatsopt_tcheck01_ats2_opt1.js"
  "ATS3 checker script filename.")

(defun flymake-ats3--script-path ()
  "Find the requested checker under $XATSHOME or the current source tree."
  (let* ((script-name flymake-ats3-script-name)
         (xatshome (getenv "XATSHOME"))
         (root (or (and xatshome
                        (file-directory-p (expand-file-name xatshome))
                        (expand-file-name xatshome))
                   (locate-dominating-file
                    buffer-file-name
                    (lambda (directory)
                      (file-exists-p
                       (expand-file-name
                        (concat "xassets/JS/xatsopt/bin/" script-name)
                        directory))))))
         (script (and root (expand-file-name
                            (concat "xassets/JS/xatsopt/bin/" script-name)
                            root))))
    (or (and script (file-exists-p script) script)
        (error "Cannot find %s in an ATS-Xanadu source tree" script-name))))

(defun flymake-ats3-init ()
  "Prepare a temporary ATS3 source file and return the checker invocation."
  (let* ((temp-file (flymake-init-create-temp-buffer-copy
                     #'flymake-create-temp-inplace))
         (local-file (file-relative-name
                      temp-file
                      (file-name-directory buffer-file-name)))
         (script (flymake-ats3--script-path)))
    (list flymake-ats3-command
          (append flymake-ats3-command-options (list script local-file)))))

;; ATS3 uses the same source file extensions as ATS2.
(dolist (extension '("sats" "dats" "hats"))
  (push (list (concat ".+\\." extension "$")
              'flymake-ats3-init
              'flymake-simple-cleanup)
        flymake-allowed-file-name-masks))

;; The optimized checker reports locations as
;; LCSRCsome1(file)@(offset(line=ROW,offs=COL)--offset(line=ROW,offs=COL)).
(push '("^F3PERR0-ERROR:LCSRCsome1(\\([^)]*\\))@([0-9]+(line=\\([0-9]+\\),offs=\\([0-9]+\\))--[0-9]+(line=[0-9]+,offs=[0-9]+)):.*$"
        1 2 3 0)
      flymake-err-line-patterns)

(defun flymake-ats3-load ()
  "Enable Flymake and ATS3 diagnostic navigation keys in the current buffer."
  ;; Disable startup, idle, save, and file-visit checks.  Use M-x flymake-start
  ;; when an explicit check is wanted.
  (setq-local flymake-start-on-save-buffer nil)
  (setq-local flymake-no-changes-timeout nil)
  (setq-local flymake-start-on-flymake-mode nil)
  (setq-local flymake-start-syntax-check-on-find-file nil)
  (flymake-mode t)
  (local-set-key (kbd "C-c C-d") 'flymake-show-buffer-diagnostics)
  (local-set-key (kbd "C-c C-n") 'flymake-goto-next-error)
  (local-set-key (kbd "C-c C-p") 'flymake-goto-prev-error)
  (local-set-key (kbd "C-c C-t") 'flymake-start))

(add-hook 'ats3-mode-hook 'flymake-ats3-load)

(provide 'flymake-ats3)
;;; flymake-ats3.el ends here

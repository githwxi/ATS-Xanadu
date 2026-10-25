;;;
;;; beg of [.emacs]
;;;
(require 'package)
(add-to-list 'package-archives
             '("melpa" . "https://melpa.org/packages/") t)
(package-initialize)
;;;
(setq load-path
  (cons "/home/hwxi/emacs/ATS" load-path))
;;;
(setq auto-mode-alist
  (cons '("\\.sats\\'" . ats3-mode) auto-mode-alist))
(setq auto-mode-alist
  (cons '("\\.dats\\'" . ats3-mode) auto-mode-alist))
(setq auto-mode-alist
  (cons '("\\.hats\\'" . ats3-mode) auto-mode-alist))
;;;
(autoload 'ats3-mode
          "ats3-mode" "Major mode for editing ATS3 code" t)
;;;
;;; flymake for displaying highlighting source
;;;
(load-file "/home/hwxi/emacs/ATS/flymake-ats3.el")
;;;
;;;
;;; (with-eval-after-load 'flycheck (flycheck-ats3-setup))
;;;
;;; end of [.emacs]
;;;
(custom-set-variables
 '(load-home-init-file t t))
(custom-set-faces)

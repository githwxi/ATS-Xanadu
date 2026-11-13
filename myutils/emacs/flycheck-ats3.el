;;; flycheck-ats3.el --- Flycheck support for ATS3 -*- lexical-binding: t; -*-

;; This Flycheck extension runs the ATS3 source checker
;; xatsopt_tcheck01_ats3 on the current file.
;;
;; Setup:
;;   (with-eval-after-load 'flycheck
;;     (flycheck-ats3-setup))

;;; Code:

(require 'flycheck)

(flycheck-define-checker ats3
  "ATS3 checker using xatsopt_tcheck01_ats3."
  :command ("xatsopt_tcheck01_ats3" source-inplace)
  :error-patterns
  ((error
    ;; ATS3 locations are printed as:
    ;; file@(offset(line=ROW,offs=COL)--offset(line=ROW,offs=COL)): error(...)
    bol (file-name) "@(" 
    (1+ num) "(line=" line ",offs=" column ")--"
    (1+ num) "(line=" (1+ num) ",offs=" (1+ num) ")):"
    space (message (+? not-newline) ?\n)))
  :modes ats3-mode)

;;;###autoload
(defun flycheck-ats3-setup ()
  "Add the ATS3 checker to flycheck-checkers."
  (interactive)
  (add-to-list 'flycheck-checkers 'ats3))

(provide 'ats3-flycheck)
;;; flycheck-ats3.el ends here

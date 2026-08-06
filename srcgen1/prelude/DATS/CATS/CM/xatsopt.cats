;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;.
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;.
;;
;; HX-2026-08-03:
;; Scheme code for xatsopt
;; Mon Aug  3 05:45:22 PM EDT 2026
;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;.
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;.
;;
;; HX: (import (chezscheme))
(define
  (XATSOPT_argv$get)
  (list->vector (command-line)))
#|
HX-2026-08-06:
command-line: script name included
command-line-arguments: no script name
|#
;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;.
;;
(define
  (XATSOPT_XATSHOME_get)
  (or (getenv "XATSHOME") "")) ;; HX: Chez
;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;.
(define
  (XATSOPT_fpath_rexists fpx) (file-regular? fpx))
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;.
;;
(define
  (XATSOPT_fpath_full$read fpx)
  (with-exception-handler
    (lambda (exn) #f)
    (lambda ()
      (call-with-input-file fpx
        (lambda (port) (get-string-all port))))))
;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;.
;;
(define
  (XATSOPT_strn_append$uint name stmp)
  (string-append name (number->string stmp)))
;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;.
;;
(define
  (XATSOPT_strn_dflt$parse rep)
  (or (string->number rep) 0.0))
;;
(define
  (XATSOPT_strn_dflt$parse$exn rep)
  (or (string->number rep) (error 'XATSOPT_strn_dflt$parse$exn rep)))
;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;.
;; end-of-[ATS3/XANADU_srcgen1_prelude_DATS_CATS_CM_xatsopt.cats]
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;.

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
(define
  (XATSOPT_argv_get)
  (current-command-line-arguments))
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
  (XATSOPT_fpath_full_read fpx)
  (with-exception-handler
    (lambda (exn) #f)
    (lambda ()
      (call-with-input-file fpx
        (lambda (port) (get-string-all port))))))
;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;.
;;
(define
  (XATSOPT_strn_append_uint name stmp)
  (string-append name (number->string stmp)))
;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;.
;;
(define
  (XATSOPT_strn_dflt_parse rep)
  (or (string->number rep) 0.0))
;;
(define
  (XATSOPT_strn_dflt_parse rep) (string->number rep))
;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;.
;; end-of-[ATS3/XANADU_srcgen1_prelude_DATS_CATS_CM_xatsopt.cats]
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;.

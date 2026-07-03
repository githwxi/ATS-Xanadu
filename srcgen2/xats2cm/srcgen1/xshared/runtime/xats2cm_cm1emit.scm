;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;.
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;.
;;
;; HX-2026-07-03:
;; ATS3-XANADU/srcgen2/xats2cm/srcgen1
;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;.
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;.
;;
(define XATSTOP0 #f)
;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;.
;;
(define (XATSCNUL) 0)
(define (XATSCHR1) 0)
;;
(define (XATSINT0 i0) i0)
(define (XATSINT1 i0) i0)
;;
(define (XATSBTF0 b0) b0)
(define (XATSBOOL b0) b0)
;;
(define (XATSCHR0 ch)
  (char->integer (string-ref ch 0)))
(define (XATSCHR2 ch)
  (char->integer (string-ref ch 0)))
;;
(define (XATSCHR3 ch)
  (let* ((x1 (string-ref ch 1))
         (c1 (char->integer x1)))
    (cond
      ;; ord('0') = 48
      ;; ord('7') = 55
      ;; e.g. "\(" or "\)"
      ((< c1 48) c1)
      ((> c1 55) c1)
      ;; "\ddd" : octal
      (else
       (let loop ((i1 2)
                  (d1 (- c1 48)))
         (if (>= i1 (string-length ch))
             d1
             (let ((x1 (string-ref ch i1)))
               (if (char=? x1 #\')
                   d1
                   (loop (+ i1 1)
                         (+ (* 8 d1)
                            (- (char->integer x1) 48)))))))))))
;;
(define (XATSFLT0 f0) f0)
(define (XATSFLT1 f0) f0)
;;
(define (XATSSTR0 cs) cs)
(define (XATSSTRN cs) cs)
;;
(define (XATSSFLT sf) (string->number sf))
(define (XATSDFLT df) (string->number df))
;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;.
;;
(define (XATSDAPP dapp) dapp)
(define (XATSCAPP _ capp) capp)
(define (XATSCAST _ args) (vector-ref args 0))
;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;.
;;
(define (XATSPFLT pflt) pflt)
(define (XATSPROJ proj) proj)
(define (XATSP0RJ p0rj) p0rj)
(define (XATSP1RJ _ p1rj) p1rj)
(define (XATSP1CN _ p1cn) p1cn)
;;
(define (XATSPCON pcon argi) (vector-ref pcon (+ argi 1)))
;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;.
;;
(define (XATSTRCD knd0) knd0)
(define (XATSTUP0 tpl0) tpl0)
(define (XATSTUP1 _ tpl1) tpl1)
(define (XATSRCD2 _ rcd2) rcd2)
;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;.
;;
(define (XATSROOT x) (vector 0 x))
(define (XATSLPFT i x) (vector (+ 1 0) x i))
(define (XATSLPBX i x) (vector (+ 1 1) x i))
(define (XATSLPCN i x) (vector (+ 1 2) x (+ i 1)))
;;
(define (XATSVAR0) (XATSROOT (vector #f)))
(define (XATSVAR1 init) (XATSROOT (vector init)))
;;
(define (XATSADDR addr) addr)
(define (XATSFLAT addr) (XATS000_lvget addr))
;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;.
;;
(define (XATSCTAG _ t) t)
;;
(define (XATS000_inteq x y) (= x y))
(define (XATS000_chreq x y) (= x y))
(define (XATS000_btfeq x y) (eq? x y))
;;
(define (XATS000_streq x y) (string=? x y))
(define (XATS000_ctgeq v t) (= (vector-ref v 0) t))
;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;.
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;.
;;
(define (XATS2CM_optn_nil)
  (XATSCAPP "optn_nil" (vector 0)))
(define (XATS2CM_optn_cons x0)
  (XATSCAPP "optn_cons" (vector 1 x0)))
;;
(define (XATS2CM_list_nil)
  (XATSCAPP "list_nil" (vector 0)))
(define (XATS2CM_list_cons x0 xs)
  (XATSCAPP "list_cons" (vector 1 x0 xs)))
;;
(define (XATS2CM_optn_vt_nil)
  (XATSCAPP "optn_vt_nil" (vector 0)))
(define (XATS2CM_optn_vt_cons x0)
  (XATSCAPP "optn_vt_cons" (vector 1 x0)))
;;
(define (XATS2CM_list_vt_nil)
  (XATSCAPP "list_vt_nil" (vector 0)))
(define (XATS2CM_list_vt_cons x0 xs)
  (XATSCAPP "list_vt_cons" (vector 1 x0 xs)))
;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;.
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;.
;;
;; the end of
;; [ATS3-XANADU/srcgen2/xats2cm/srcgen1/xshared/runtime/xats2cm_cm1emit.cm]
;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;.
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;.

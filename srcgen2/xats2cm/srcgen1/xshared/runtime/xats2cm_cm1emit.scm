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
(define XATSVOID #f)
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
#|
(define
(XATSCAST name arg1 . args) arg1)
(define
(XATSCAPP name ctag . args) (apply vector ctag args))
|#
(define-syntax XATSCAST
  (syntax-rules () ((_ name arg1 args ...) arg1)))
(define-syntax XATSCAPP
  (syntax-rules ()
    ((_ name ctag args ...) (vector ctag args ...))))
;;
#|
(define
(XATSDAPP dfun . args) (apply dfun args))
|#
(define-syntax XATSDAPP
  (syntax-rules () ((_ dfun args ...) (dfun args ...))))
;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;.
;;
(define (XATSPFLT pflt) pflt)
(define (XATSPROJ proj) proj)
(define (XATSP0RJ p0rj) p0rj)
(define (XATSP1RJ _ p1rj) p1rj)
(define (XATSP1CN _ p1cn) p1cn)
;;
(define
(XATSPCON pcon argi) (vector-ref pcon (+ argi 1)))
;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;.
;;
(define (XATSTRCD knd0) knd0)
(define (XATSTUP0 . tpl0) (apply vector tpl0))
(define (XATSTUP1 _ . tpl1) (apply vector tpl1))
(define (XATSRCD2 _ . rcd2) (apply vector rcd2))
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
(define (XATS000_casef)
  (error "XATS000_casef" #f))
;;
(define (XATS000_patck pck)
  (if (not pck) (error "XATS000_patck" #f)))
;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;.
;;
(define (XATS000_fold pcon) #f)
(define (XATS000_free pcon) #f)
;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;.
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;.
;;
(define
  (XATS000_dp2tr p2tr)
  (XATS000_lvget p2tr))
;;
(define
  (XATS000_assgn lval rval)
  (XATS000_lvset! lval rval))
;;
(define (XATS000_l0azy lfun) (vector 0 lfun))
;;
(define (XATS000_dl0az l0az)
  (let ((t (vector-ref l0az 0)))
    (if (> t 0)
	(let ((_ (vector-set! l0az 0 (+ t 1))))
	  (vector-ref l0az 1))
	(let ((_ (vector-set! l0az 0 (+ 0 1))))
	  (let* ((res ((vector-ref l0az 1)))
		 (_ (vector-set! l0az 1 res))) res)))))
;;
(define (XATS000_l1azy lfun) lfun)
(define (XATS000_dl1az l1az) (l1az 1))
;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;.
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;.
;;
(define
(XATS000_lvget lval)
  (let ((ctag (vector-ref lval 0)))
    (cond
     ((= ctag 0)
      (vector-ref (vector-ref lval 1) 0))
     ((= ctag (+ 1 0))
      (let* (
       (val1 (vector-ref lval 1))
       (idx2 (vector-ref lval 2)))
       (vector-ref (XATS000_lvget val1) idx2)))
     ((= ctag (+ 1 1))
      (let* ((val1 (vector-ref lval 1))
	     (idx2 (vector-ref lval 2))) (vector-ref val1 idx2)))
     ((= ctag (+ 1 2))
      (let* ((val1 (vector-ref lval 1))
	     (idx2 (vector-ref lval 2))) (vector-ref val1 idx2)))
     (else (error "XATS000_lvget" lval)))))
;;
(define
(XATS000_lvset! lval rval)
  (let ((ctag (vector-ref lval 0)))
    (cond
     ((= ctag 0)
      (let (
	(val1 (vector-ref lval 1)))
	(vector-set! val1 0 rval)))
     ((= ctag (+ 1 0))
      (let* ((val1 (vector-ref lval 1))
	     (idx2 (vector-ref lval 2))
	     (lvl1 (XATS000_lvget val1)))
	(XATS000_lvset! lvl1 idx2 (XATS000_ftset lvl1 idx2 rval))))
     ((= ctag (+ 1 1))
      (let* ((val1 (vector-ref lval 1))
	     (idx2 (vector-ref lval 2))) (vector-set! val1 idx2 rval)))
     ((= ctag (+ 1 2))
      (let* ((val1 (vector-ref lval 1))
	     (idx2 (vector-ref lval 2))) (vector-set! val1 idx2 rval)))
     (else (error "XATS000_lvset!" lval rval)))))
;;
(define
(XATS000_ftset tpl0 idx1 rval)
  (let ((tpl1 (vector-copy tpl0)))
    (begin (vector-set! tpl1 idx1 rval) tpl1)))
;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;.
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;.
;;
;; the end of
;; [ATS3-XANADU/srcgen2/xats2cm/srcgen1/xshared/runtime/xats2cm_cm1emit.cm]
;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;.
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;.

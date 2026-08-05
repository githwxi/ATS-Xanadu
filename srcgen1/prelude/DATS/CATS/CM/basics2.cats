;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;.
;;
;; HX-2026-08-02:
;; Sun Aug  2 08:11:40 PM EDT 2026
;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;.
;;
;; Basics2 for XATS2CM
;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;.
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;.
;;
;; prelude/array.sats
;; For arrays of
;; various dimensions:
;;
;; Ref: 0-dimensional
;; Array: 1-dimensional
;; Matrix: 2-dimensional
;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;.
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;.
;;
;; HX: 0-dimensional
;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;.
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;.
;;
(define
  (XATS2CM_a0ref_get A0) (vector-ref A0 0))
;;
(define
  (XATSOPT_a0ref_set A0 x0) (vector-set! A0 0 x0))
(define
  (XATS2CM_a0ref_set A0 x0) (vector-set! A0 0 x0))
;;
(define
  (XATS2CM_a0ptr_alloc) (make-vector 1 #f))
(define
  (XATS2CM_a0ptr_make_1val x0) (make-vector 1 x0))
;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;.
;;
(define
  (XATS2CM_a0ref_dtget A0) (vector-ref A0 0))
(define
  (XATS2CM_UN_a0ref_dtset A0 x0) (vector-set! A0 0 x0))
;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;.
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;.
;;
;; HX: 1-dimensional
;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;.
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;.
;;
(define
  (XATS2CM_a1ptr_alloc asz) (make-vector asz #f))
;;
(define
  (XATS2CM_a1ref_get$at A0 i0) (vector-ref A0 i0))
(define
  (XATS2CM_a1ptr_get$at1 A0 i0) (vector-ref A0 i0))
;;
(define
  (XATS2CM_a1ref_set$at A0 i0 x0) (vector-set! A0 i0 x0))
(define
  (XATS2CM_a1ptr_set$at1 A0 i0 x0) (vector-set! A0 i0 x0))
;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;.
;;
(define
  (XATS2CM_a1ref_cget$at A0 i0) (vector-ref A0 i0))
(define
  (XATS2CM_a1ref_dtget$at A0 i0)  (vector-ref A0 i0))
;;
(define
(XATS2CM_a1ptr_set$at$raw A0 i0 x0) (vector-set! A0 i0 x0))
;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;.
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;.
;;
;; prelude/unsafex.sats
;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;.
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;.
;;
(define
  (XATS2CM_UN_p2tr_get ptr) (XATS2CM_lval_get ptr))
(define
  (XATS2CM_UN_p2tr_set ptr obj) (XATS2CM_lval_set ptr obj))
;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;.
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;.
;; end of [ATS3/XANADU_srcgen1_prelude_DATS_CATS_CM_basics2.cats]
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;.
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;.

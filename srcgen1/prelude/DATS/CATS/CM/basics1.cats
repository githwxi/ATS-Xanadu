;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;.
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;.
;; HX-2026-08-02:
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;.
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;.
;;
;; Basics1 for XATS2CM
;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;.
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;.
;;
;; prelude/bool000.sats
;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;.
;;
(define
  (XATS2CM_bool_neg b0)
  (not b0)) ;; negation
;;
(define
  (XATS2CM_bool_add b1 b2)
  (if b1 #t b2)) ;; conjunction
;;
(define
  (XATS2CM_bool_mul b1 b2)
  (if b1 b2 #f)) ;; disjunction
;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;.
;;
;; prelude/char000.sats
;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;.
;;
(define
  (XATS2CM_char_eq c1 c2)
  (char=? c1 c2)) ;; char!=ascii
;;
(define
  (XATS2CM_char_neq c1 c2)
  (not (XATS2CM_char_eq c1 c2))) ;; char!=ascii
;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;.
;;
(define
  (XATS2CM_char_cmp c1 c2)
  (cond ((char<? c1 c2) -1)
        ((char>? c1 c2)  1) (else 0)))
;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;.
;;
(define
  (XATS2CM_char_eqz c0)
  (= (char->integer c0) 0)) ;; char(null=0)
;;
(define
  (XATS2CM_char_neqz c0)
  (not (= (char->integer c0) 0))) ;; char(null=0)
;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;.
;;
(define
  (XATS2CM_char_equal c1 c2)
  (char=? c1 c2)) ;; char!=ascii
;;
(define
  (XATS2CM_char_noteq c1 c2)
  (not (XATS2CM_char_equal c1 c2))) ;; char!=ascii
;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;.
;;
(define
  (XATS2CM_char_lowerq ch)
  (and (char<=? #\a ch) (char<=? ch #\z)))
(define
  (XATS2CM_sint_lowerq ch)
  (XATS2CM_char_lowerq (integer->char ch)))
;;
(define
  (XATS2CM_char_upperq ch)
  (and (char<=? #\A ch) (char<=? ch #\Z)))
(define
  (XATS2CM_sint_upperq ch)
  (XATS2CM_char_upperq (integer->char ch)))
;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;.
;;
(define
  (XATS2CM_char_isdigit ch)
  (and (char<=? #\0 ch) (char<=? ch #\9)))
(define
  (XATS2CM_sint_isdigit ch)
  (XATS2CM_char_isdigit (integer->char ch)))
;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;.
;;
(define
  (XATS2CM_char_isalpha ch)
  (or (XATS2CM_char_lowerq ch) (XATS2CM_char_upperq ch)))
(define
  (XATS2CM_sint_isalpha ch)
  (or (XATS2CM_sint_lowerq ch) (XATS2CM_sint_upperq ch)))
;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;.
;;
(define
  (XATS2CM_char_isalnum ch)
  (or (XATS2CM_char_isalpha ch) (XATS2CM_char_isdigit ch)))
(define
  (XATS2CM_sint_isalnum ch)
  (or (XATS2CM_sint_isalpha ch) (XATS2CM_sint_isdigit ch)))
;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;.
;;
(define
  (XATS2CM_char_lohexq ch)
  (and (char<=? #\a ch) (char<=? ch #\f)))
(define
  (XATS2CM_sint_lohexq ch)
  (XATS2CM_char_lohexq (integer->char ch)))
;;
(define
  (XATS2CM_char_uphexq ch)
  (and (char<=? #\A ch) (char<=? ch #\F)))
(define
  (XATS2CM_sint_uphexq ch)
  (XATS2CM_char_uphexq (integer->char ch)))
;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;.
;;
(define
  (XATS2CM_char_isxdigit ch)
  (or (
       XATS2CM_char_isdigit ch
      ) (XATS2CM_char_lohexq ch) (XATS2CM_char_uphexq ch)))
(define
  (XATS2CM_sint_isxdigit ch)
  (or (
       XATS2CM_sint_isdigit ch
      ) (XATS2CM_sint_lohexq ch) (XATS2CM_sint_uphexq ch)))
;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;.
;;
;; prelude/gint000.sats
;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;.
;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
(define
  (XATS2CM_gint_neg_sint x0) (- x0)) ;; sint_neg(x0)

(define
  (XATS2CM_gint_abs_sint x0) (if (>= x0 0) x0 (- x0)))
;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;.
;;
(define
  (XATS2CM_gint_suc_sint x0) (+ x0 1)) ;; plus one
(define
  (XATS2CM_gint_suc_uint x0) (+ x0 1)) ;; plus one
;;
(define
  (XATS2CM_gint_pre_sint x0) (- x0 1)) ;; minus one
(define
  (XATS2CM_gint_pre_uint x0) (- x0 1)) ;; minus one
;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;.
;;
(define
  (XATS2CM_gint_lnot_uint x0)
  (bitwise-not x0)) ;; bitwise NEG
;;
(define
  (XATS2CM_gint_lor2_uint x0 y0)
  (bitwise-ior x0 y0)) ;; bitwise OR
;;
(define
  (XATS2CM_gint_land_uint x0 y0)
  (bitwise-and x0 y0)) ;; bitwise AND
;;
(define
  (XATS2CM_gint_lxor_uint x0 y0)
  (bitwise-xor x0 y0)) ;; bitwise XOR
;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;.
;;
(define
  (XATS2CM_gint_lsln_uint x0 n0)
  (arithmetic-shift x0 n0)) ;; logic-lshift
;;
(define
  (XATS2CM_gint_asln_sint x0 n0)
  (arithmetic-shift x0 n0)) ;; arith-lshift
(define
  (XATS2CM_gint_asrn_sint x0 n0)
  (let ((n1 (- n0)))
    (arithmetic-shift x0 n1))) ;; arith-rshift
;;
;; HX: there is no logic-rshift >>> in Scheme
;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;.
;;
(define
  (XATS2CM_gint_lt_sint_sint x1 x2)
  (< x1 x2)) ; sint_lt$sint(x1, x2)
(define
  (XATS2CM_gint_lt_uint_uint x1 x2)
  (< x1 x2)) ; uint_lt$uint(x1, x2)
;;
(define
  (XATS2CM_gint_gt_sint_sint x1 x2)
  (> x1 x2)) ; sint_gt$sint(x1, x2)
(define
  (XATS2CM_gint_gt_uint_uint x1 x2)
  (> x1 x2)) ; uint_gt$uint(x1, x2)
;;
(define
  (XATS2CM_gint_eq_sint_sint x1 x2)
  (= x1 x2)) ; sint_eq$sint(x1, x2)
(define
  (XATS2CM_gint_eq_uint_uint x1 x2)
  (= x1 x2)) ; uint_eq$uint(x1, x2)
;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;.
;;
(define
  (XATS2CM_gint_lte_sint_sint x1 x2)
  (<= x1 x2)) ; sint_lte$sint(x1, x2)
(define
  (XATS2CM_gint_lte_uint_uint x1 x2)
  (<= x1 x2)) ; uint_lte$uint(x1, x2)
;;
(define
  (XATS2CM_gint_gte_sint_sint x1 x2)
  (>= x1 x2)) ; sint_gte$sint(x1, x2)
(define
  (XATS2CM_gint_gte_uint_uint x1 x2)
  (>= x1 x2)) ; uint_gte$uint(x1, x2)
;;
(define
  (XATS2CM_gint_neq_sint_sint x1 x2)
  (not (= x1 x2))) ; sint_neq$sint(x1, x2)
(define
  (XATS2CM_gint_neq_uint_uint x1 x2)
  (not (= x1 x2))) ; uint_neq$uint(x1, x2)
;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;.
;;
(define
  (XATS2CM_gint_cmp_sint_sint x1 x2)
  (cond ((< x1 x2) -1) ((> x1 x2) 1) (else 0)))
(define
  (XATS2CM_gint_cmp_uint_uint x1 x2)
  (cond ((< x1 x2) -1) ((> x1 x2) 1) (else 0)))
;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;.
;;
(define
  (XATS2CM_gint_add_sint_sint x1 x2)
  (+ x1 x2)) ;; sint_add$sint(x1, x2)
(define
  (XATS2CM_gint_sub_sint_sint x1 x2)
  (- x1 x2)) ;; sint_sub$sint(x1, x2)
(define
  (XATS2CM_gint_mul_sint_sint x1 x2)
  (* x1 x2)) ;; sint_mul$sint(x1, x2)
(define
  (XATS2CM_gint_mod_sint_sint x1 x2)
  (modulo x1 x2)) ;; sint_mod$sint(x1, x2)
(define
  (XATS2CM_gint_div_sint_sint x1 x2)
  (floor (/ x1 x2))) ; sint_div$sint(x1, x2)
;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;.
;;
(define
  (XATS2CM_gint_add_uint_uint x1 x2)
  (+ x1 x2)) ; uint_add$uint(x1, x2)
;;
(define
  (XATS2CM_gint_sub_uint_uint x1 x2)
  (- x1 x2)) ; uint_sub$uint(x1, x2)
;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;.
;;
(define (XATS2CM_gint_sint2uint x0) x0)
(define (XATS2CM_gint_uint2sint x0) x0)
;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;.
;;
(define
  (XATS2CM_gint_parse_sint rep)
  (let ((bas 10)) (string->number rep bas)))
;;
(define
  (XATS2CM_gint_parse_uint rep)
  (let* ((exn 0)
	 (res (XATS2CM_gint_parse_sint rep)))
    (if (>= res 0) res exn)))
;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;.
;;
;; prelude/gflt000.sats
;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;.
;;
(define
  (XATS2CM_gflt_si_dflt x0)
  x0) ;; integer-to-float
;;
(define
  (XATS2CM_gflt_neg_dflt x0)
  (- x0)) ;; negation-of-float
;;
(define
  (XATS2CM_gflt_abs_dflt x0)
  (if (>= x0 0.0) x0 (- x0)))
;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;.
;;
(define
  (XATS2CM_gflt_suc_dflt x0) (+ x0 1))
(define
  (XATS2CM_gflt_pre_dflt x0) (- x0 1))
;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;.
;;
(define
  (XATS2CM_gflt_lt_dflt_dflt x1 x2)
  (< x1 x2)) ;; dflt_lt$dflt(x1, x2)
(define
  (XATS2CM_gflt_gt_dflt_dflt x1 x2)
  (> x1 x2)) ;; dflt_gt$dflt(x1, x2)
(define
  (XATS2CM_gflt_eq_dflt_dflt x1 x2)
  (= x1 x2)) ;; dflt_eq$dflt(x1, x2)
;;
(define
  (XATS2CM_gflt_lte_dflt_dflt x1 x2)
  (<= x1 x2)) ;; dflt_lte$dflt(x1, x2)
(define
  (XATS2CM_gflt_gte_dflt_dflt x1 x2)
  (>= x1 x2)) ;; dflt_gte$dflt(x1, x2)
(define
  (XATS2CM_gflt_neq_dflt_dflt x1 x2)
  (not (= x1 x2))) ;; dflt_neq$dflt(x1, x2)
;;
(define
  (XATS2CM_gflt_cmp_dflt_dflt x1 x2)
  (cond ((< x1 x2) -1) ((> x1 x2) 1) (else 0)))
;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;.
;;
(define
  (XATS2CM_gflt_add_dflt_dflt x1 x2)
  (+ x1 x2)) ; dflt_add$dflt(x1, x2)
(define
  (XATS2CM_gflt_sub_dflt_dflt x1 x2)
  (- x1 x2)) ; dflt_sub$dflt(x1, x2)
;;
(define
  (XATS2CM_gflt_mul_dflt_dflt x1 x2)
  (* x1 x2)) ; dflt_mul$dflt(x1, x2)
(define
  (XATS2CM_gflt_div_dflt_dflt x1 x2)
  (/ x1 x2)) ; dflt_div$dflt(x1, x2)
;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;.
;;
;; prelude/strn000.sats
;;
;; HX-2020-09-28:
;; Please note that:
;; A (strn)-val is a PY-string
;; A (lstrn)-val is a PY-array
;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;.
;;
(define
  (XATS2CM_strn_nilq cs)
  ;; string-length is O(1) in most Scheme implementations
  (= (string-length cs) 0))
(define
  (XATS2CM_strn_consq cs)
  ;; string-length is O(1) in most Scheme implementations
  (> (string-length cs) 0))
;;
(define
  (XATS2CM_strn_vt2t cs)
  ;; HX: [cs] is null-ended!
  (let ((n0 (vector-length cs)))
    (let* ((n1 (- n0 1))
	   (rs (make-string n1)))
      (do ((i0 0 (+ i0 1))) ((>= i0 n1) rs)
	(string-set! rs i0 (vector-ref cs i0))))))
;;
(define
  (XATS2CM_stropt_nilq opt)
  (not (XATS2CM_stropt_consq opt)))
(define
  (XATS2CM_stropt_consq opt) (string? opt))
;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;.
;;
(define
  (XATS2CM_strn_lt x1 x2) (string<? x1 x2))
(define
  (XATS2CM_strn_gt x1 x2) (string>? x1 x2))
(define
  (XATS2CM_strn_eq x1 x2) (string=? x1 x2))
;;
(define
  (XATS2CM_strn_lte x1 x2) (string<=? x1 x2))
(define
  (XATS2CM_strn_gte x1 x2) (string>=? x1 x2))
(define
  (XATS2CM_strn_neq x1 x2) (not (string=? x1 x2)))
;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;.
;;
(define
  (XATS2CM_strn_cmp x1 x2)
  (cond ((string<? x1 x2) -1) ((string>? x1 x2) 1) (else 0)))
;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;.
;;
(define
  (XATS2CM_strn_head_raw cs)
  (string-ref cs 0)) ;; HX: |cs| >= 1
;;
(define
  (XATS2CM_strn_head_opt cs)
  (let ((ln (string-length cs)))
    (if (> ln 0)
	(string-ref cs 0)) (integer->char 0)))
;;
(define
  (XATS2CM_strn_tail_raw cs)
  ;; Return the substring starting at index 1.
  (substring cs 1 (string-length cs)))
;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;.
;;
(define
  (XATS2CM_strn_length cs) (string-length cs))
;;
;; HX: The ending null is not counted!
(define
  (XATS2CM_strn_vt_length0 cs) (- (vector-length cs) 1))
(define
  (XATS2CM_strn_vt_length1 cs) (- (vector-length cs) 1))
;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;.
;;
(define
  (XATS2CM_strn_get_at cs i0) (string-ref cs i0))
;;
(define
  (XATS2CM_strn_vt_get_at cs i0) (vector-ref cs i0))
(define
  (XATS2CM_strn_vt_set_at cs i0 c0) (vector-set! cs i0 c0))
;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;.
;;
(define
  (XATS2CM_strtmp_vt_alloc bsz)
  (make-vector (+ bsz 1) (integer->char 0)))
;;
(define
  (XATS2CM_strtmp_vt_set_at cs i0 c0) (vector-set! cs i0 c0))
;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;.
;;
(define
  (XATS2CM_strn_forall_f1un cs test)
  (let loop ((i0 0)
	     (ln (string-length cs)))
    (if (< i0 ln)
	(let ((c0 (string-ref cs i0)))
          (if (test c0) (loop (+ i0 1) ln) #f)) #t)))
;;
(define
  (XATS2CM_strn_rforall_f1un cs test)
  (let loop ((i0 (string-length cs)))
    (if (> i0 0)
        (let ((i1 (- i0 1)))
          (if (test (string-ref cs i1)) (loop i1) #f)) #t)))
;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;.
;;
(define
  (XATS2CM_strn_vt_forall_f1un cs test)
  (let loop ((i0 0)
	     (ln (- (vector-length cs) 1)))
    (if (< i0 ln)
	(let ((c0 (vector-ref cs i0)))
          (if (test c0) (loop (+ i0 1) ln) #f)) #t)))
;;
(define
  (XATS2CM_strn_vt_rforall_f1un cs test)
  (let loop ((i0 (- (vector-length cs) 1)))
    (if (> i0 0)
        (let ((i1 (- i0 1)))
          (if (test (vector-ref cs i1)) (loop i1) #f)) #t)))
;;
(define
  XATS2CM_strn_vt_forall0_f1un XATS2CM_strn_vt_forall_f1un)
(define
  XATS2CM_strn_vt_forall1_f1un XATS2CM_strn_vt_forall_f1un)
;;
(define
  XATS2CM_strn_vt_rforall0_f1un XATS2CM_strn_vt_rforall_f1un)
(define
  XATS2CM_strn_vt_rforall1_f1un XATS2CM_strn_vt_rforall_f1un)
;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;.
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;.
;;
;; HX-2025-04-11:
;; For bridging [srcgen1] and [srcgen2]
;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;.
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;.
;;
(define
  (XATS2CM_sint_neg x0)
  (XATS2CM_gint_neg_sint x0))
(define
  (XATS2CM_sint_abs x0)
  (XATS2CM_gint_abs_sint x0))
;;
(define
  (XATS2CM_sint_lt_sint x0 y0)
  (XATS2CM_gint_lt_sint_sint x0 y0))
(define
  (XATS2CM_sint_gt_sint x0 y0)
  (XATS2CM_gint_gt_sint_sint x0 y0))
(define
  (XATS2CM_sint_eq_sint x0 y0)
  (XATS2CM_gint_eq_sint_sint x0 y0))
;;
(define
  (XATS2CM_sint_lte_sint x0 y0)
  (XATS2CM_gint_lte_sint_sint x0 y0))
(define
  (XATS2CM_sint_gte_sint x0 y0)
  (XATS2CM_gint_gte_sint_sint x0 y0))
(define
  (XATS2CM_sint_neq_sint x0 y0)
  (XATS2CM_gint_neq_sint_sint x0 y0))
;;
(define
  (XATS2CM_sint_add_sint x0 y0)
  (XATS2CM_gint_add_sint_sint x0 y0))
(define
  (XATS2CM_sint_sub_sint x0 y0)
  (XATS2CM_gint_sub_sint_sint x0 y0))
(define
  (XATS2CM_sint_mul_sint x0 y0)
  (XATS2CM_gint_mul_sint_sint x0 y0))
(define
  (XATS2CM_sint_div_sint x0 y0)
  (XATS2CM_gint_div_sint_sint x0 y0))
;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;.
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;.
;; end of [ATS3/XANADU_srcgen1_prelude_DATS_CATS_CM_basics1.cats]
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;.
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;.

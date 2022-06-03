(* ****** ****** *)
(*
Basics for Xinterp
*)
(* ****** ****** *)
#staload
UN = // for casting
"prelude/SATS/unsafex.sats"
(* ****** ****** *)
(*
//HX: prelude/bool000.sats
*)
(* ****** ****** *)
//
#extern
fun
XINTERP_bool_neg
{b0:bool}
( b0
: bool(b0)): bool(~b0)
= $exname((*self*))
(*
#exname
XINTERP_bool_neg = _
*)
#impltmp
bool_neg<> = XINTERP_bool_neg
//
(* ****** ****** *)
//
#extern
fun
XINTERP_bool_add
{b1,b2:bool}
( b1
: bool(b1)
, b2
: bool(b2)): bool(b1+b2)
= $exname((*self*))
#extern
fun
XINTERP_bool_mul
{b1,b2:bool}
( b1
: bool(b1)
, b2
: bool(b2)): bool(b1*b2)
= $exname((*self*))
//
#impltmp
bool_add<> = XINTERP_bool_add
#impltmp
bool_mul<> = XINTERP_bool_mul
//
(* ****** ****** *)
//
#extern
fun
XINTERP_bool_print
( b0
: bool): void = $exname()
#impltmp
bool_print<> = XINTERP_bool_print
//
(* ****** ****** *)
//
// prelude/char.sats
//
(* ****** ****** *)
//
#extern
fun
XINTERP_char_eqzq
{c:char}
( c0
: char(c)): bool(c=0)
= $exname()
#extern
fun
XINTERP_char_neqzq
{c:char}
( c0
: char(c)): bool(c>0)
= $exname()
//
#impltmp
char_eqzq<> = XINTERP_char_eqzq
#impltmp
char_neqzq<> = XINTERP_char_neqzq
//
(* ****** ****** *)
//
#extern
fun
XINTERP_char_equal
{c1,c2:char}
( c1
: char(c1)
, c2
: char(c2)): bool(c1=c2)
= $exname()
#extern
fun
XINTERP_char_noteq
{c1,c2:char}
( c1
: char(c1)
, c2
: char(c2)): bool(c1!=c2)
= $exname()
//
#impltmp
char_equal<> = XINTERP_char_equal
#impltmp
char_noteq<> = XINTERP_char_noteq
//
(* ****** ****** *)
//
#extern
fun
XINTERP_char_cmp
( c1
: char
, c2
: char): sint = $exname()
#impltmp
char_cmp<> = XINTERP_char_cmp
//
(* ****** ****** *)
//
#extern
fun
XINTERP_char_print
( c0
: char): void = $exname()
#impltmp
char_print<> = XINTERP_char_print
//
(* ****** ****** *)
//
#extern
fun
XINTERP_char_make_sint
( c0
: sint): char = $exname()
#extern
fun
XINTERP_char_make_uint
( c0
: uint): char = $exname()
//
#impltmp
char_make_sint<> = XINTERP_char_make_sint
#impltmp
char_make_uint<> = XINTERP_char_make_uint
//
(* ****** ****** *)
//
#extern
fun
XINTERP_sint_make_char
( c0
: char): sint = $exname()
//
#impltmp
sint_make_char<> = XINTERP_sint_make_char
//
(* ****** ****** *)
//
// prelude/gint.sats
//
(* ****** ****** *)
//
#extern
fun
XINTERP_gint_print_sint
( x0
: sint): void = $exname()
#extern
fun
XINTERP_gint_print_uint
( x0
: uint): void = $exname()
//
#impltmp
gint_print_sint<>(i0) =
XINTERP_gint_print_sint(i0)
#impltmp
gint_print_uint<>(u0) =
XINTERP_gint_print_uint(u0)
//
(* ****** ****** *)
//
#extern
fun
XINTERP_gint_neg_sint
{i:int}
( x0
: sint(i)): sint(-i)
= $exname()
#impltmp
gint_neg_sint<> = XINTERP_gint_neg_sint
//
(* ****** ****** *)
//
#extern
fun
XINTERP_gint_abs_sint
{i:int}
( x0
: sint(i)): sint(abs(i))
= $exname()
#impltmp
gint_abs_sint<> = XINTERP_gint_abs_sint
//
(* ****** ****** *)
//
#extern
fun
XINTERP_gint_succ_sint
{i:int}
( x0
: sint(i)): sint(i+1)
= $exname()
#extern
fun
XINTERP_gint_pred_sint
{i:int}
( x0
: sint(i)): sint(i-1)
= $exname()
//
#impltmp
gint_succ_sint<> = XINTERP_gint_succ_sint
#impltmp
gint_pred_sint<> = XINTERP_gint_pred_sint
//
(* ****** ****** *)
//
#extern
fun
XINTERP_gint_lt_sint_sint
{i,j:int}
( x
: sint(i)
, y
: sint(j)): bool(i<j)
= $exname()
#impltmp
gint_lt_sint_sint<> = XINTERP_gint_lt_sint_sint
//
#extern
fun
XINTERP_gint_gt_sint_sint
{i,j:int}
( x
: sint(i)
, y
: sint(j)): bool(i>j)
= $exname()
#impltmp
gint_gt_sint_sint<> = XINTERP_gint_gt_sint_sint
//
#extern
fun
XINTERP_gint_eq_sint_sint
{i,j:int}
( x
: sint(i)
, y
: sint(j)): bool(i=j)
= $exname()
#impltmp
gint_eq_sint_sint<> = XINTERP_gint_eq_sint_sint
//
#extern
fun
XINTERP_gint_lte_sint_sint
{i,j:int}
( x
: sint(i)
, y
: sint(j)): bool(i<=j)
= $exname()
#impltmp
gint_lte_sint_sint<> = XINTERP_gint_lte_sint_sint
//
#extern
fun
XINTERP_gint_gte_sint_sint
{i,j:int}
( x
: sint(i)
, y
: sint(j)): bool(i>=j)
= $exname()
#impltmp
gint_gte_sint_sint<> = XINTERP_gint_gte_sint_sint
//
#extern
fun
XINTERP_gint_neq_sint_sint
{i,j:int}
( x
: sint(i)
, y
: sint(j)): bool(i!=j)
= $exname()
#impltmp
gint_neq_sint_sint<> = XINTERP_gint_neq_sint_sint
//
(* ****** ****** *)

#extern
fun
XINTERP_gint_cmp_sint_sint
{i,j:int}
( x
: sint(i)
, y
: sint(j)): sint(sgn(i-j))
= $exname()
#impltmp
gint_cmp_sint_sint<> = XINTERP_gint_cmp_sint_sint

(* ****** ****** *)
//
#extern
fun
XINTERP_gint_add_sint_sint
{i,j:int}
( x
: sint(i)
, y
: sint(j)): sint( i+j )
= $exname()
#impltmp
gint_add_sint_sint<> = XINTERP_gint_add_sint_sint
#extern
fun
XINTERP_gint_sub_sint_sint
{i,j:int}
( x
: sint(i)
, y
: sint(j)): sint( i-j )
= $exname()
#impltmp
gint_sub_sint_sint<> = XINTERP_gint_sub_sint_sint
//
#extern
fun
XINTERP_gint_mul_sint_sint
{i,j:int}
( x
: sint(i)
, y
: sint(j)): sint( i*j )
= $exname()
#impltmp
gint_mul_sint_sint<> = XINTERP_gint_mul_sint_sint
#extern
fun
XINTERP_gint_div_sint_sint
{i,j:int}
( x
: sint(i)
, y
: sint(j)): sint( i/j )
= $exname()
#impltmp
gint_div_sint_sint<> = XINTERP_gint_div_sint_sint
//
#extern
fun
XINTERP_gint_mod_sint_sint
{i,j:int}
( x
: sint(i)
, y
: sint(j)): sint(mod(i,j))
= $exname()
#impltmp
gint_mod_sint_sint<> = XINTERP_gint_mod_sint_sint
//
(* ****** ****** *)
//
// prelude/gflt.sats
//
(* ****** ****** *)
//
#extern
fun
XINTERP_gflt_i_dflt
( x0: sint ): dflt = $exname()
#impltmp
gflt_i_dflt<> = XINTERP_gflt_i_dflt
//
(* ****** ****** *)
//
#extern
fun
XINTERP_gflt_neg_dflt
( x0: dflt ): dflt = $exname()
#impltmp
gflt_neg_dflt<> = XINTERP_gflt_neg_dflt
//
(* ****** ****** *)
//
#extern
fun
XINTERP_gflt_abs_dflt
( x0: dflt ): dflt = $exname()
#impltmp
gflt_abs_dflt<> = XINTERP_gflt_abs_dflt
//
(* ****** ****** *)
//
#extern
fun
XINTERP_gflt_succ_dflt
( x0: dflt ): dflt = $exname()
#impltmp
gflt_succ_dflt<> = XINTERP_gflt_succ_dflt
#extern
fun
XINTERP_gflt_pred_dflt
( x0: dflt ): dflt = $exname()
#impltmp
gflt_pred_dflt<> = XINTERP_gflt_pred_dflt
//
(* ****** ****** *)
//
#extern
fun
XINTERP_gflt_lt_dflt_dflt
( x0: dflt
, y0: dflt ): bool = $exname()
#extern
fun
XINTERP_gflt_gt_dflt_dflt
( x0: dflt
, y0: dflt ): bool = $exname()
#extern
fun
XINTERP_gflt_eq_dflt_dflt
( x0: dflt
, y0: dflt ): bool = $exname()
#extern
fun
XINTERP_gflt_lte_dflt_dflt
( x0: dflt
, y0: dflt ): bool = $exname()
#extern
fun
XINTERP_gflt_gte_dflt_dflt
( x0: dflt
, y0: dflt ): bool = $exname()
#extern
fun
XINTERP_gflt_neq_dflt_dflt
( x0: dflt
, y0: dflt ): bool = $exname()
//
#impltmp
gflt_lt_dflt_dflt<> = XINTERP_gflt_lt_dflt_dflt
#impltmp
gflt_gt_dflt_dflt<> = XINTERP_gflt_gt_dflt_dflt
#impltmp
gflt_eq_dflt_dflt<> = XINTERP_gflt_eq_dflt_dflt
#impltmp
gflt_lte_dflt_dflt<> = XINTERP_gflt_lte_dflt_dflt
#impltmp
gflt_gte_dflt_dflt<> = XINTERP_gflt_gte_dflt_dflt
#impltmp
gflt_neq_dflt_dflt<> = XINTERP_gflt_neq_dflt_dflt
//
(* ****** ****** *)
//
#extern
fun
XINTERP_gflt_cmp_dflt_dflt
( x0: dflt
, y0: dflt ): sint = $exname()
#impltmp
gflt_cmp_dflt_dflt<> = XINTERP_gflt_cmp_dflt_dflt
//
(* ****** ****** *)
//
#extern
fun
XINTERP_gflt_add_dflt_dflt
( x0: dflt
, y0: dflt ): dflt = $exname()
#extern
fun
XINTERP_gflt_sub_dflt_dflt
( x0: dflt
, y0: dflt ): dflt = $exname()
#extern
fun
XINTERP_gflt_mul_dflt_dflt
( x0: dflt
, y0: dflt ): dflt = $exname()
#extern
fun
XINTERP_gflt_div_dflt_dflt
( x0: dflt
, y0: dflt ): dflt = $exname()
//
#impltmp
gflt_add_dflt_dflt<> = XINTERP_gflt_add_dflt_dflt
#impltmp
gflt_sub_dflt_dflt<> = XINTERP_gflt_sub_dflt_dflt
#impltmp
gflt_mul_dflt_dflt<> = XINTERP_gflt_mul_dflt_dflt
#impltmp
gflt_div_dflt_dflt<> = XINTERP_gflt_div_dflt_dflt
//
(* ****** ****** *)
//
// prelude/strn000.sats
//
(* ****** ****** *)
//
(*
In Xint,
[string]
and
[string_vt]
are of the same representation!
*)
#impltmp
strn_vt2t<>(cs) = $UN.castlin01(cs)
//
(* ****** ****** *)
//
#extern
fun
XINTERP_strn_print
( x0
: strn ): void = $exname()
#impltmp
strn_print<> = XINTERP_strn_print
//
(* ****** ****** *)
//
#extern
fun
XINTERP_strn_head_opt
( x0
: strn ): char = $exname()
#impltmp
strn_head_opt<> = XINTERP_strn_head_opt
//
(* ****** ****** *)
//
#extern
fun
XINTERP_strn_head_raw
( x0
: strn ): char = $exname()
fun
XINTERP_strn_tail_raw
( x0
: strn ): strn = $exname()
//
#impltmp
strn_head_raw<> = XINTERP_strn_head_raw
#impltmp
strn_tail_raw<> = XINTERP_strn_tail_raw
//
(* ****** ****** *)
//
#extern
fun
XINTERP_strtmp_vt_alloc
{n:nat}
( len
: sint(n))
: strtmp_vt(n) = $exname()
//
#impltmp
strtmp_vt_alloc<> = XINTERP_strtmp_vt_alloc
//
(* ****** ****** *)
//
#extern
fun
XINTERP_strn_get_at
{n:nat}
{i:int|i<n}
( p0: strn(n), i0: sint(i) ): cgtz
= $exname((*self*))
#impltmp
strn_get_at<> = XINTERP_strn_get_at
//
#extern
fun
XINTERP_strtmp_vt_set_at
{n:nat}
{i:int|i<n}
( p0:
! strtmp_vt(n), i0: sint(i), c0: cgtz): void
= $exname((*self*))
#impltmp
strtmp_vt_set_at<> = XINTERP_strtmp_vt_set_at
//
(* ****** ****** *)
//
// prelude/array.sats
// (arrays of various dimensionality)
//
(* ****** ****** *)
//
// HX-2020-06-10:
// Please note that
// [a] is boxed in Xinterp
//
#extern
fun
XINTERP_a0ptr_alloc
{a:vt}
(
// argless
) : a0ptr(?a) = $exname()
//
#impltmp
{a:vt}
a0ptr_alloc<a> = XINTERP_a0ptr_alloc
//
(* ****** ****** *)
//
#extern
fun
XINTERP_a1ptr_alloc
{a:vt}
{n:i0}
( asz
: sint(n))
: a1ptr(?a) = $exname()
//
#impltmp
{a:vt}
a1ptr_alloc<a> = XINTERP_a1ptr_alloc
//
(* ****** ****** *)
//
#extern
fun
XINTERP_a0ref_get_raw
{a:vt}
( A0
: a0ref(a))
: (~a) = $exname()
#extern
fun
XINTERP_a0ref_set_raw
{a:vt}
( A0
: a0ref(a), x0: a): void
= $exname((*self*))
//
#impltmp
{a:vt}
a0ref_get0<a> = XINTERP_a0ref_get_raw{a}
#impltmp
{a:vt}
a0ref_setf<a> = XINTERP_a0ref_set_raw{a}
//
(* ****** ****** *)
//
#extern
fun
XINTERP_a1ref_head_raw
{a:vt}
{n:i0}
( A0
: a1ref(a, n))
: (~a) = $exname()
#extern
fun
XINTERP_a1ref_tail_raw
{a:vt}{n:i0}
( A0
: a1ref(a, n))
: a1ref(a, n-1)
= $exname((*self*))
//
#extern
fun
XINTERP_a1ref_get_at_raw
{a:vt}{n:int}
( A0
: a1ref(a, n)
, i0
: sint(*index*)): (~a)
= $exname((*self*))
#extern
fun
XINTERP_a1ptr_get_at_raw
{a:vt}{n:int}
( A0:
! a1ptr(a, n)
, i0
: sint(*index*)): (~a)
= $exname((*self*))
//
#extern
fun
XINTERP_a1ref_set_at_raw
{a:vt}{n:int}
( A0
: a1ref(a, n)
, i0
: sint(*index*), x0: a): void
= $exname((*self*))
#extern
fun
XINTERP_a1ptr_set_at_raw
{a:vt}{n:int}
( A0:
! a1ptr(a, n)
, i0
: sint(*index*), x0: a): void
= $exname((*self*))
//
(* ****** ****** *)
//
#impltmp
{a:t0}
a1ref_head<a>
(A0) =
XINTERP_a1ref_head_raw{a}(A0)
#impltmp
{a:vt}
a1ref_tail<a>
(A0) =
XINTERP_a1ref_tail_raw{a}(A0)
//
#impltmp
{a:t0}
a1ref_get_at<a>
(A0, i0) =
XINTERP_a1ref_get_at_raw{a}(A0, i0)
#impltmp
{a:t0}
a1ptr_get_at<a>
(A0, i0) =
XINTERP_a1ptr_get_at_raw{a}(A0, i0)
//
#impltmp
{a:vt}
a1ref_get0_at<a>
(A0, i0) =
XINTERP_a1ref_get_at_raw{a}(A0, i0)
#impltmp
{a:vt}
a1ptr_get0_at<a>
(A0, i0) =
XINTERP_a1ptr_get_at_raw{a}(A0, i0)
//
(* ****** ****** *)
//
#impltmp
{a:t0}
a1ref_set_at<a>
(A0, i0, x0) =
XINTERP_a1ref_set_at_raw{a}(A0, i0, x0)
#impltmp
{a:t0}
a1ptr_set_at<a>
(A0, i0, x0) =
XINTERP_a1ptr_set_at_raw{a}(A0, i0, x0)
#impltmp
{a:vt}
a1ptr_set_at_raw<a>
(A0, i0, x0) =
XINTERP_a1ptr_set_at_raw{a}(A0, i0, x0)
//
(* ****** ****** *)

(* end of [prelude_DATS_CATS_Xint_basics0.dats] *)

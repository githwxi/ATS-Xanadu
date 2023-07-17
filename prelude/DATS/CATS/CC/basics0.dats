(* ****** ****** *)
(*
Basics for Xats2cc
// sints
// chars, bools,
// floats, strings
*)
(* ****** ****** *)
#staload
UN = // for casting
"prelude/SATS/unsafex.sats"
(* ****** ****** *)
//
// prelude/bool.sats
//
(* ****** ****** *)
//
#extern
fun
XATS2CC_bool_neg
{b0:bool}
( b0
: bool(b0)
)
: bool(~b0) = $extnam()
//
#impltmp bool_neg<> = XATS2CC_bool_neg
//
(* ****** ****** *)
//
#extern
fun
XATS2CC_bool_add
{b1,b2:bool}
( b1
: bool(b1)
, b2
: bool(b2)
)
: bool(b1+b2) = $extnam()
#extern
fun
XATS2CC_bool_mul
{b1,b2:bool}
( b1
: bool(b1)
, b2
: bool(b2)
)
: bool(b1*b2) = $extnam()
//
#impltmp
bool_add<> = XATS2CC_bool_add
#impltmp
bool_mul<> = XATS2CC_bool_mul
//
(* ****** ****** *)
//
// prelude/char.sats
//
// [char] is a (small) number
//
(* ****** ****** *)
//
#impltmp
char_make_sint<>
( i0 ) = $UN.cast01(i0)
//
#impltmp
sint_make_char<>
( c0 ) = $UN.cast01(c0)
//
(* ****** ****** *)
//
#extern
fun
XATS2CC_char_lt
( c1: char
, c2: char): bool = $extnam()
#impltmp
char_lt< > = XATS2CC_char_lt
//
#extern
fun
XATS2CC_char_gt
( c1: char
, c2: char): bool = $extnam()
#impltmp
char_gt< > = XATS2CC_char_gt
//
#extern
fun
XATS2CC_char_eq
( c1: char
, c2: char): bool = $extnam()
#impltmp
char_eq< > = XATS2CC_char_eq
//
#extern
fun
XATS2CC_char_lte
( c1: char
, c2: char): bool = $extnam()
#impltmp
char_lte<> = XATS2CC_char_lte
//
#extern
fun
XATS2CC_char_gte
( c1: char
, c2: char): bool = $extnam()
#impltmp
char_gte<> = XATS2CC_char_gte
//
#extern
fun
XATS2CC_char_neq
( c1: char
, c2: char): bool = $extnam()
#impltmp
char_neq<> = XATS2CC_char_neq
//
(* ****** ****** *)
#extern
fun
XATS2CC_char_cmp
( c1: char
, c2: char): sint = $extnam()
#impltmp
char_cmp<> = XATS2CC_char_cmp
(* ****** ****** *)
#extern
fun
XATS2CC_char_eqz
(c0: char): bool = $extnam()
#impltmp
char_eqz<> = XATS2CC_char_eqz
#extern
fun
XATS2CC_char_neqz
(c0: char): bool = $extnam()
#impltmp
char_neqz<> = XATS2CC_char_neqz
(* ****** ****** *)
#extern
fun
XATS2CC_char_equal
( c1: char
, c2: char): bool = $extnam()
#impltmp
char_equal<> = XATS2CC_char_equal
#extern
fun
XATS2CC_char_noteq
( c1: char
, c2: char): bool = $extnam()
#impltmp
char_noteq<> = XATS2CC_char_noteq
(* ****** ****** *)
//
// prelude/gint.sats
//
(* ****** ****** *)
//
#extern
fun
XATS2CC_gint_neg_sint
{i:int}
( x0
: sint(i)): sint(-i) = $extnam()
#impltmp
gint_neg_sint<> = XATS2CC_gint_neg_sint
//
(* ****** ****** *)
//
#extern
fun
XATS2CC_gint_abs_sint
{i:int}
( x0
: sint(i)): sint(abs(i)) = $extnam()
#impltmp
gint_abs_sint<> = XATS2CC_gint_abs_sint
//
(* ****** ****** *)
//
#extern
fun
XATS2CC_gint_succ_sint
{i:int}
( x0
: sint(i)): sint(i+1) = $extnam()
#extern
fun
XATS2CC_gint_pred_sint
{i:int}
( x0
: sint(i)): sint(i-1) = $extnam()
#impltmp
gint_succ_sint<> = XATS2CC_gint_succ_sint
#impltmp
gint_pred_sint<> = XATS2CC_gint_pred_sint
//
(* ****** ****** *)
//
#extern
fun
XATS2CC_gint_lt_sint_sint
{i,j:int}
( x1
: sint(i)
, x2
: sint(j)): bool(i<j) = $extnam()
#impltmp
gint_lt_sint_sint<> = XATS2CC_gint_lt_sint_sint
//
#extern
fun
XATS2CC_gint_gt_sint_sint
{i,j:int}
( x1
: sint(i)
, x2
: sint(j)): bool(i>j) = $extnam()
#impltmp
gint_gt_sint_sint<> = XATS2CC_gint_gt_sint_sint
//
#extern
fun
XATS2CC_gint_eq_sint_sint
{i,j:int}
( x1
: sint(i)
, x2
: sint(j)): bool(i=j) = $extnam()
#impltmp
gint_eq_sint_sint<> = XATS2CC_gint_eq_sint_sint
//
#extern
fun
XATS2CC_gint_lte_sint_sint
{i,j:int}
( x1
: sint(i)
, x2
: sint(j)): bool(i<=j) = $extnam()
#impltmp
gint_lte_sint_sint<> = XATS2CC_gint_lte_sint_sint
//
#extern
fun
XATS2CC_gint_gte_sint_sint
{i,j:int}
( x1
: sint(i)
, x2
: sint(j)): bool(i>=j) = $extnam()
#impltmp
gint_gte_sint_sint<> = XATS2CC_gint_gte_sint_sint
//
#extern
fun
XATS2CC_gint_neq_sint_sint
{i,j:int}
( x1
: sint(i)
, x2
: sint(j)): bool(i!=j) = $extnam()
#impltmp
gint_neq_sint_sint<> = XATS2CC_gint_neq_sint_sint
//
(* ****** ****** *)

#extern
fun
XATS2CC_gint_cmp_sint_sint
{i,j:int}
( x1
: sint(i)
, x2
: sint(j))
: sint(sgn(i-j)) = $extnam((*self*))
#impltmp
gint_cmp_sint_sint<> = XATS2CC_gint_cmp_sint_sint

(* ****** ****** *)
//
#extern
fun
XATS2CC_gint_add_sint_sint
{i,j:int}
( x1
: sint(i)
, x2
: sint(j)): sint( i+j ) = $extnam()
#impltmp
gint_add_sint_sint<> = XATS2CC_gint_add_sint_sint
#extern
fun
XATS2CC_gint_sub_sint_sint
{i,j:int}
( x1
: sint(i)
, x2
: sint(j)): sint( i-j ) = $extnam()
#impltmp
gint_sub_sint_sint<> = XATS2CC_gint_sub_sint_sint
//
#extern
fun
XATS2CC_gint_mul_sint_sint
{i,j:int}
( x1
: sint(i)
, x2
: sint(j)): sint( i*j ) = $extnam()
#impltmp
gint_mul_sint_sint<> = XATS2CC_gint_mul_sint_sint
#extern
fun
XATS2CC_gint_div_sint_sint
{i,j:int}
( x1
: sint(i)
, x2
: sint(j)): sint( i/j ) = $extnam()
#impltmp
gint_div_sint_sint<> = XATS2CC_gint_div_sint_sint
#extern
fun
XATS2CC_gint_mod_sint_sint
{i,j:int}
( x1
: sint(i)
, x2
: sint(j)): sint(mod(i,j)) = $extnam()
#impltmp
gint_mod_sint_sint<> = XATS2CC_gint_mod_sint_sint
//
(* ****** ****** *)
//
// prelude/gflt.sats
//
(* ****** ****** *)
//
#extern
fun
XATS2CC_gflt_si_dflt
( x0: sint ): dflt = $extnam()
#impltmp
gflt_si_dflt<> = XATS2CC_gflt_si_dflt
//
(* ****** ****** *)
//
#extern
fun
XATS2CC_gflt_neg_dflt
  ( x0: dflt ): dflt = $extnam()
#impltmp
gflt_neg_dflt<> = XATS2CC_gflt_neg_dflt
//
#extern
fun
XATS2CC_gflt_abs_dflt
  ( x0: dflt ): dflt = $extnam()
#impltmp
gflt_abs_dflt<> = XATS2CC_gflt_abs_dflt
//
(* ****** ****** *)
//
#extern
fun
XATS2CC_gflt_succ_dflt
  ( x0: dflt ): dflt = $extnam()
#impltmp
gflt_succ_dflt<> = XATS2CC_gflt_succ_dflt
#extern
fun
XATS2CC_gflt_pred_dflt
  ( x0: dflt ): dflt = $extnam()
#impltmp
gflt_pred_dflt<> = XATS2CC_gflt_pred_dflt
//
(* ****** ****** *)
//
#extern
fun
XATS2CC_gflt_lt_dflt_dflt
( x1: dflt, x2: dflt ): bool = $extnam()
#extern
fun
XATS2CC_gflt_gt_dflt_dflt
( x1: dflt, x2: dflt ): bool = $extnam()
#extern
fun
XATS2CC_gflt_eq_dflt_dflt
( x1: dflt, x2: dflt ): bool = $extnam()
#extern
fun
XATS2CC_gflt_lte_dflt_dflt
( x1: dflt, x2: dflt ): bool = $extnam()
#extern
fun
XATS2CC_gflt_gte_dflt_dflt
( x1: dflt, x2: dflt ): bool = $extnam()
#extern
fun
XATS2CC_gflt_neq_dflt_dflt
( x1: dflt, x2: dflt ): bool = $extnam()
//
#impltmp
gflt_lt_dflt_dflt<> = XATS2CC_gflt_lt_dflt_dflt
#impltmp
gflt_gt_dflt_dflt<> = XATS2CC_gflt_gt_dflt_dflt
#impltmp
gflt_eq_dflt_dflt<> = XATS2CC_gflt_eq_dflt_dflt
#impltmp
gflt_lte_dflt_dflt<> = XATS2CC_gflt_lte_dflt_dflt
#impltmp
gflt_gte_dflt_dflt<> = XATS2CC_gflt_gte_dflt_dflt
#impltmp
gflt_neq_dflt_dflt<> = XATS2CC_gflt_neq_dflt_dflt
//
(* ****** ****** *)
//
#extern
fun
XATS2CC_gflt_cmp_dflt_dflt
( x1: dflt, x2: dflt ): sint = $extnam()
#impltmp
gflt_cmp_dflt_dflt<> = XATS2CC_gflt_cmp_dflt_dflt
//
(* ****** ****** *)
//
#extern
fun
XATS2CC_gflt_add_dflt_dflt
( x1: dflt, x2: dflt ): dflt = $extnam()
#extern
fun
XATS2CC_gflt_sub_dflt_dflt
( x1: dflt, x2: dflt ): dflt = $extnam()
#extern
fun
XATS2CC_gflt_mul_dflt_dflt
( x1: dflt, x2: dflt ): dflt = $extnam()
#extern
fun
XATS2CC_gflt_div_dflt_dflt
( x1: dflt, x2: dflt ): dflt = $extnam()
//
#impltmp
gflt_add_dflt_dflt<> = XATS2CC_gflt_add_dflt_dflt
#impltmp
gflt_sub_dflt_dflt<> = XATS2CC_gflt_sub_dflt_dflt
#impltmp
gflt_mul_dflt_dflt<> = XATS2CC_gflt_mul_dflt_dflt
#impltmp
gflt_div_dflt_dflt<> = XATS2CC_gflt_div_dflt_dflt
//
(* ****** ****** *)
//
#extern
fun
XATS2CC_gflt_lt_dflt_sint
( x0: dflt, y0: sint ): bool = $extnam()
#extern
fun
XATS2CC_gflt_gt_dflt_sint
( x0: dflt, y0: sint ): bool = $extnam()
#extern
fun
XATS2CC_gflt_eq_dflt_sint
( x0: dflt, y0: sint ): bool = $extnam()
#extern
fun
XATS2CC_gflt_lte_dflt_sint
( x0: dflt, y0: sint ): bool = $extnam()
#extern
fun
XATS2CC_gflt_gte_dflt_sint
( x0: dflt, y0: sint ): bool = $extnam()
#extern
fun
XATS2CC_gflt_neq_dflt_sint
( x0: dflt, y0: sint ): bool = $extnam()
#extern
fun
XATS2CC_gflt_cmp_dflt_sint
( x0: dflt, y0: sint ): sint = $extnam()
//
#impltmp
gflt_lt_dflt_sint<> = XATS2CC_gflt_lt_dflt_sint
#impltmp
gflt_gt_dflt_sint<> = XATS2CC_gflt_gt_dflt_sint
#impltmp
gflt_eq_dflt_sint<> = XATS2CC_gflt_eq_dflt_sint
#impltmp
gflt_lte_dflt_sint<> = XATS2CC_gflt_lte_dflt_sint
#impltmp
gflt_gte_dflt_sint<> = XATS2CC_gflt_gte_dflt_sint
#impltmp
gflt_neq_dflt_sint<> = XATS2CC_gflt_neq_dflt_sint
//
#impltmp
gflt_cmp_dflt_sint<> = XATS2CC_gflt_cmp_dflt_sint
//
(* ****** ****** *)
//
#extern
fun
XATS2CC_gflt_lt_sint_dflt
( x0: sint, y0: dflt ): bool = $extnam()
#extern
fun
XATS2CC_gflt_gt_sint_dflt
( x0: sint, y0: dflt ): bool = $extnam()
#extern
fun
XATS2CC_gflt_eq_sint_dflt
( x0: sint, y0: dflt ): bool = $extnam()
#extern
fun
XATS2CC_gflt_lte_sint_dflt
( x0: sint, y0: dflt ): bool = $extnam()
#extern
fun
XATS2CC_gflt_gte_sint_dflt
( x0: sint, y0: dflt ): bool = $extnam()
#extern
fun
XATS2CC_gflt_neq_sint_dflt
( x0: sint, y0: dflt ): bool = $extnam()
#extern
fun
XATS2CC_gflt_cmp_sint_dflt
( x0: sint, y0: dflt ): sint = $extnam()
//
#impltmp
gflt_lt_sint_dflt<> = XATS2CC_gflt_lt_sint_dflt
#impltmp
gflt_gt_sint_dflt<> = XATS2CC_gflt_gt_sint_dflt
#impltmp
gflt_eq_sint_dflt<> = XATS2CC_gflt_eq_sint_dflt
#impltmp
gflt_lte_sint_dflt<> = XATS2CC_gflt_lte_sint_dflt
#impltmp
gflt_gte_sint_dflt<> = XATS2CC_gflt_gte_sint_dflt
#impltmp
gflt_neq_sint_dflt<> = XATS2CC_gflt_neq_sint_dflt
//
#impltmp
gflt_cmp_sint_dflt<> = XATS2CC_gflt_cmp_sint_dflt
//
(* ****** ****** *)
//
#extern
fun
XATS2CC_gflt_add_dflt_sint
( x0: dflt, y0: sint ): dflt = $extnam()
#extern
fun
XATS2CC_gflt_sub_dflt_sint
( x0: dflt, y0: sint ): dflt = $extnam()
#extern
fun
XATS2CC_gflt_mul_dflt_sint
( x0: dflt, y0: sint ): dflt = $extnam()
#extern
fun
XATS2CC_gflt_div_dflt_sint
( x0: dflt, y0: sint ): dflt = $extnam()
//
#impltmp
gflt_add_dflt_sint<> = XATS2CC_gflt_add_dflt_sint
#impltmp
gflt_sub_dflt_sint<> = XATS2CC_gflt_sub_dflt_sint
#impltmp
gflt_mul_dflt_sint<> = XATS2CC_gflt_mul_dflt_sint
#impltmp
gflt_div_dflt_sint<> = XATS2CC_gflt_div_dflt_sint
//
(* ****** ****** *)
//
#extern
fun
XATS2CC_gflt_add_sint_dflt
( x0: sint, y0: dflt ): dflt = $extnam()
#extern
fun
XATS2CC_gflt_sub_sint_dflt
( x0: sint, y0: dflt ): dflt = $extnam()
#extern
fun
XATS2CC_gflt_mul_sint_dflt
( x0: sint, y0: dflt ): dflt = $extnam()
#extern
fun
XATS2CC_gflt_div_sint_dflt
( x0: sint, y0: dflt ): dflt = $extnam()
//
#impltmp
gflt_add_sint_dflt<> = XATS2CC_gflt_add_sint_dflt
#impltmp
gflt_sub_sint_dflt<> = XATS2CC_gflt_sub_sint_dflt
#impltmp
gflt_mul_sint_dflt<> = XATS2CC_gflt_mul_sint_dflt
#impltmp
gflt_div_sint_dflt<> = XATS2CC_gflt_div_sint_dflt
//
(* ****** ****** *)
//
(*
prelude/SATS/strn000.sats
*)
//
(* ****** ****** *)
#impltmp
strn_vt2t<> =
XATS2CC_strn_vt2t
where
{
#extern
fun
XATS2CC_strn_vt2t
(cs
:strn_vt):strn = $extnam()
}
(* ****** ****** *)

#impltmp
stropt_nilq<> =
XATS2CC_stropt_nilq
where
{
#extern
fun
XATS2CC_stropt_nilq
(opt: stropt): bool = $extnam()
}
#impltmp
stropt_consq<> =
XATS2CC_stropt_consq
where
{
#extern
fun
XATS2CC_stropt_consq
(opt: stropt): bool = $extnam()
}

(* ****** ****** *)
#impltmp
strn_lt<> =
XATS2CC_strn_lt
where
{
#extern
fun
XATS2CC_strn_lt
(x1: strn
,x2: strn): bool = $extnam()
}
#impltmp
strn_gt<> =
XATS2CC_strn_gt
where
{
#extern
fun
XATS2CC_strn_gt
(x1: strn
,x2: strn): bool = $extnam()
}
#impltmp
strn_eq<> =
XATS2CC_strn_eq
where
{
#extern
fun
XATS2CC_strn_eq
(x1: strn
,x2: strn): bool = $extnam()
}
(* ****** ****** *)
#impltmp
strn_lte<> =
XATS2CC_strn_lte
where
{
#extern
fun
XATS2CC_strn_lte
(x1: strn
,x2: strn): bool = $extnam()
}
#impltmp
strn_gte<> =
XATS2CC_strn_gte
where
{
#extern
fun
XATS2CC_strn_gte
(x1: strn
,x2: strn): bool = $extnam()
}
#impltmp
strn_neq<> =
XATS2CC_strn_neq
where
{
#extern
fun
XATS2CC_strn_neq
(x1: strn
,x2: strn): bool = $extnam()
}
(* ****** ****** *)
#impltmp
strn_cmp<> =
XATS2CC_strn_cmp
where
{
#extern
fun
XATS2CC_strn_cmp
(x1: strn
,x2: strn): sint = $extnam()
}
(* ****** ****** *)
#impltmp
strn_head_opt<> =
XATS2CC_strn_head_opt
where
{
#extern
fun
XATS2CC_strn_head_opt
(cs: strn): char = $extnam()
}
(* ****** ****** *)
#impltmp
strn_head_raw<> =
XATS2CC_strn_head_raw
where
{
#extern
fun
XATS2CC_strn_head_raw
(cs: strn): char = $extnam()
}
(* ****** ****** *)
#impltmp
strn_tail_raw<> =
XATS2CC_strn_tail_raw
where
{
#extern
fun
XATS2CC_strn_tail_raw
(cs: strn): strn = $extnam()
}
(* ****** ****** *)
#impltmp
strn_length<> =
XATS2CC_strn_length
where
{
#extern
fun
XATS2CC_strn_length
(cs : strn) : nint = $extnam()
}
//
#impltmp
strn_vt_length0<> =
XATS2CC_strn_vt_length0
where
{
#extern
fun
XATS2CC_strn_vt_length0
(cs : !strn_vt) : nint = $extnam()
}
#impltmp
strn_vt_length1<> =
XATS2CC_strn_vt_length1
where
{
#extern
fun
XATS2CC_strn_vt_length1
(cs : !strn_vt) : nint = $extnam()
}
//
(* ****** ****** *)
#impltmp
strn_get_at<> =
XATS2CC_strn_get_at
where
{
#extern
fun
XATS2CC_strn_get_at
( cs
: strn, i0: sint): char
= $extnam((*self*))
}
(* ****** ****** *)
#impltmp
strn_forall<>(cs) =
let
//
#extern
fun
XATS2CC_strn_forall_cfr
( cs: strn
, f0: (cgtz) -<cfr> bool): bool
= $extnam((*self*))
//
in
XATS2CC_strn_forall_cfr
( cs
, lam(c0) => forall$test<cgtz>(c0))
end // end of [strn_forall]
(* ****** ****** *)
#impltmp
strtmp_vt_alloc<> =
XATS2CC_strtmp_vt_alloc
where
{
#extern
fun
XATS2CC_strtmp_vt_alloc
(bsz: sint) : strtmp0_vt = $extnam()
}
(* ****** ****** *)
#impltmp
strtmp_vt_set_at<> =
XATS2CC_strtmp_vt_set_at
where
{
#extern
fun
XATS2CC_strtmp_vt_set_at
( cs:strtmp0_vt
, i0:sint, c0:char): void = $extnam()
}
(* ****** ****** *)
#impltmp
strn_vt_forall0<>(cs) =
let
//
#extern
fun
XATS2CC_strn_vt_forall_cfr
( cs: ~strn_vt
, f0: (cgtz) -<cfr> bool): bool = $extnam()
//
in
XATS2CC_strn_vt_forall_cfr
( cs
, lam(c0) =>
  forall0$test<cgtz>(c0))
end // end of [strn_vt_forall0]
(* ****** ****** *)
#impltmp
strn_vt_forall1<>(cs) =
let
//
#extern
fun
XATS2CC_strn_vt_forall_cfr
( cs: !strn_vt
, f0: (cgtz) -<cfr> bool): bool = $extnam()
//
in
XATS2CC_strn_vt_forall_cfr
( cs
, lam(c0) =>
  forall1$test<cgtz>(c0))
end // end of [strn_vt_forall1]
(* ****** ****** *)

(* end of [prelude_DATS_CATS_CC_basics0.dats] *)

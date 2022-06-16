(* ****** ****** *)
(*
Basics for Xats2js
// char, bool,
// ints, floats, string
*)
(* ****** ****** *)
#staload
UN = // for casting
"prelude/SATS/unsafex.sats"
(* ****** ****** *)
(*
//prelude/SATS/bool000.sats
*)
(* ****** ****** *)
//
#extern
fun
XATS2JS_bool_neg
{b0:bool}
( b0
: bool(b0)
)
: bool(~b0) = $extnam()
//
#impltmp
bool_neg<> = XATS2JS_bool_neg
//
(* ****** ****** *)
//
#extern
fun
XATS2JS_bool_add
{b1,b2:bool}
( b1
: bool(b1)
, b2
: bool(b2)
)
: bool(b1+b2) = $extnam()
#extern
fun
XATS2JS_bool_mul
{b1,b2:bool}
( b1
: bool(b1)
, b2
: bool(b2)
)
: bool(b1*b2) = $extnam()
//
#impltmp
bool_add<> = XATS2JS_bool_add
#impltmp
bool_mul<> = XATS2JS_bool_mul
//
(* ****** ****** *)
//
(*
//prelude/SATS/char000.sats
*)
//
// [char] is a (small) number
//
(* ****** ****** *)
//
#impltmp
char_code<>
(   c0   ) = $UN.cast01( c0 )
//
#impltmp
char_make_code<>
(   i0   ) = $UN.cast01( i0 )
#impltmp
char_make_sint<>
(   i0   ) = $UN.cast01( i0 )
#impltmp
char_make_uint<>
(   i0   ) = $UN.cast01( i0 )
//
// HX-2022-06-12:
// It is deprecated
//
#impltmp
sint_make_char<>
(   c0   ) = $UN.cast01( c0 )
//
(* ****** ****** *)
#extern
fun
XATS2JS_char_cmp
( c1: char
, c2: char): sint = $extnam()
#impltmp
char_cmp<> = XATS2JS_char_cmp
(* ****** ****** *)
#extern
fun
XATS2JS_char_eqz
(c0: char): bool = $extnam()
#impltmp
char_eqz<> = XATS2JS_char_eqz
#extern
fun
XATS2JS_char_neqz
(c0: char): bool = $extnam()
#impltmp
char_neqz<> = XATS2JS_char_neqz
(* ****** ****** *)
#extern
fun
XATS2JS_char_equal
( c1: char
, c2: char): bool = $extnam()
#impltmp
char_equal<> = XATS2JS_char_equal
#extern
fun
XATS2JS_char_noteq
( c1: char
, c2: char): bool = $extnam()
#impltmp
char_noteq<> = XATS2JS_char_noteq
(* ****** ****** *)
//
#extern
fun
XATS2JS_char_isalpha
( c0: char ): bool = $extnam()
#extern
fun
XATS2JS_sint_isalpha
( c0: sint ): bool = $extnam()
//
#impltmp
char_isalpha<> = XATS2JS_char_isalpha
#impltmp
sint_isalpha<> = XATS2JS_sint_isalpha
//
(* ****** ****** *)
//
#extern
fun
XATS2JS_char_isalnum
( c0: char ): bool = $extnam()
#extern
fun
XATS2JS_sint_isalnum
( c0: sint ): bool = $extnam()
//
#impltmp
char_isalnum<> = XATS2JS_char_isalnum
#impltmp
sint_isalnum<> = XATS2JS_sint_isalnum
//
(* ****** ****** *)
//
#extern
fun
XATS2JS_char_isdigit
( c0: char ): bool = $extnam()
#extern
fun
XATS2JS_sint_isdigit
( c0: sint ): bool = $extnam()
//
#impltmp
char_isdigit<> = XATS2JS_char_isdigit
#impltmp
sint_isdigit<> = XATS2JS_sint_isdigit
//
(* ****** ****** *)
//
#extern
fun
XATS2JS_char_isxdigit
( c0: char ): bool = $extnam()
#extern
fun
XATS2JS_sint_isxdigit
( c0: sint ): bool = $extnam()
//
#impltmp
char_isxdigit<> = XATS2JS_char_isxdigit
#impltmp
sint_isxdigit<> = XATS2JS_sint_isxdigit
//
(* ****** ****** *)
//
//prelude/SATS/gint000.sats
//
(* ****** ****** *)
//
#extern
fun
XATS2JS_gint_sint2uint
  ( x0: sint ): uint = $extnam()
#extern
fun
XATS2JS_gint_uint2sint
  ( x0: uint ): sint = $extnam()
//
#impltmp
gint_sint2uint<> =
XATS2JS_gint_sint2uint(*sint->uint*)
#impltmp
gint_uint2sint<> =
XATS2JS_gint_uint2sint(*uint->sint*)
//
(* ****** ****** *)
//
#extern
fun
XATS2JS_gint_parse_sint
  ( x0: strn ): sint = $extnam()
#extern
fun
XATS2JS_gint_parse_uint
  ( x0: strn ): uint = $extnam()
//
#impltmp
gint_parse_sint<> = XATS2JS_gint_parse_sint
#impltmp
gint_parse_uint<> = XATS2JS_gint_parse_uint
//
(* ****** ****** *)
//
#extern
fun
XATS2JS_gint_neg_sint
{i:int}
( x0
: sint(i)): sint(-i) = $extnam()
#impltmp
gint_neg_sint<> = XATS2JS_gint_neg_sint
//
(* ****** ****** *)
//
#extern
fun
XATS2JS_gint_abs_sint
{i:int}
( x0
: sint(i)): sint(abs(i)) = $extnam()
#impltmp
gint_abs_sint<> = XATS2JS_gint_abs_sint
//
(* ****** ****** *)
//
#extern
fun
XATS2JS_gint_succ_sint
{i:int}
( x0
: sint(i)): sint(i+1) = $extnam()
#extern
fun
XATS2JS_gint_succ_uint
{i:int}
( x0
: uint(i)): uint(i+1) = $extnam()
#impltmp
gint_succ_sint<> = XATS2JS_gint_succ_sint
#impltmp
gint_succ_uint<> = XATS2JS_gint_succ_uint
//
(* ****** ****** *)
//
#extern
fun
XATS2JS_gint_pred_sint
{i:int}
( x0
: sint(i)): sint(i-1) = $extnam()
#extern
fun
XATS2JS_gint_pred_uint
{i:int|i>0}
( x0
: uint(i)): uint(i-1) = $extnam()
#impltmp
gint_pred_sint<> = XATS2JS_gint_pred_sint
#impltmp
gint_pred_uint<> = XATS2JS_gint_pred_uint
//
(* ****** ****** *)
//
#extern
fun
XATS2JS_gint_lnot_uint
(    x:uint    ):uint = $extnam()
#extern
fun
XATS2JS_gint_lor2_uint
(x:uint, y:uint):uint = $extnam()
#extern
fun
XATS2JS_gint_land_uint
(x:uint, y:uint):uint = $extnam()
#extern
fun
XATS2JS_gint_lxor_uint
(x:uint, y:uint):uint = $extnam()
//
#impltmp
gint_lnot_uint<> = XATS2JS_gint_lnot_uint
#impltmp
gint_lor2_uint<> = XATS2JS_gint_lor2_uint
#impltmp
gint_land_uint<> = XATS2JS_gint_land_uint
#impltmp
gint_lxor_uint<> = XATS2JS_gint_lxor_uint
//
(* ****** ****** *)
//
#extern
fun
XATS2JS_gint_asrn_sint
(x:sint, n:nint):sint = $extnam()
#extern
fun
XATS2JS_gint_lsln_uint
(x:uint, n:nint):uint = $extnam()
#extern
fun
XATS2JS_gint_lsrn_uint
(x:uint, n:nint):uint = $extnam()
//
#impltmp
gint_asrn_sint<> = XATS2JS_gint_asrn_sint
#impltmp
gint_lsln_uint<> = XATS2JS_gint_lsln_uint
#impltmp
gint_lsrn_uint<> = XATS2JS_gint_lsrn_uint
//
(* ****** ****** *)
//
#extern
fun
XATS2JS_gint_lt_sint_sint
{i,j:int}
( x
: sint(i)
, y
: sint(j)): bool(i<j) = $extnam()
#impltmp
gint_lt_sint_sint<> = XATS2JS_gint_lt_sint_sint
#extern
fun
XATS2JS_gint_lt_uint_uint
{i,j:int}
( x
: uint(i)
, y
: uint(j)): bool(i<j) = $extnam()
#impltmp
gint_lt_uint_uint<> = XATS2JS_gint_lt_uint_uint
//
(* ****** ****** *)
//
#extern
fun
XATS2JS_gint_gt_sint_sint
{i,j:int}
( x
: sint(i)
, y
: sint(j)): bool(i>j) = $extnam()
#impltmp
gint_gt_sint_sint<> = XATS2JS_gint_gt_sint_sint
#extern
fun
XATS2JS_gint_gt_uint_uint
{i,j:int}
( x
: uint(i)
, y
: uint(j)): bool(i>j) = $extnam()
#impltmp
gint_gt_uint_uint<> = XATS2JS_gint_gt_uint_uint
//
(* ****** ****** *)
//
#extern
fun
XATS2JS_gint_eq_sint_sint
{i,j:int}
( x
: sint(i)
, y
: sint(j)): bool(i=j) = $extnam()
#impltmp
gint_eq_sint_sint<> = XATS2JS_gint_eq_sint_sint
#extern
fun
XATS2JS_gint_eq_uint_uint
{i,j:int}
( x
: uint(i)
, y
: uint(j)): bool(i=j) = $extnam()
#impltmp
gint_eq_uint_uint<> = XATS2JS_gint_eq_uint_uint
//
(* ****** ****** *)
//
#extern
fun
XATS2JS_gint_lte_sint_sint
{i,j:int}
( x
: sint(i)
, y
: sint(j)): bool(i<=j) = $extnam()
#impltmp
gint_lte_sint_sint<> = XATS2JS_gint_lte_sint_sint
#extern
fun
XATS2JS_gint_lte_uint_uint
{i,j:int}
( x
: uint(i)
, y
: uint(j)): bool(i<=j) = $extnam()
#impltmp
gint_lte_uint_uint<> = XATS2JS_gint_lte_uint_uint
//
(* ****** ****** *)
//
#extern
fun
XATS2JS_gint_gte_sint_sint
{i,j:int}
( x
: sint(i)
, y
: sint(j)): bool(i>=j) = $extnam()
#impltmp
gint_gte_sint_sint<> = XATS2JS_gint_gte_sint_sint
#extern
fun
XATS2JS_gint_gte_uint_uint
{i,j:int}
( x
: uint(i)
, y
: uint(j)): bool(i>=j) = $extnam()
#impltmp
gint_gte_uint_uint<> = XATS2JS_gint_gte_uint_uint
//
(* ****** ****** *)
//
#extern
fun
XATS2JS_gint_neq_sint_sint
{i,j:int}
( x
: sint(i)
, y
: sint(j)): bool(i!=j) = $extnam()
#impltmp
gint_neq_sint_sint<> = XATS2JS_gint_neq_sint_sint
#extern
fun
XATS2JS_gint_neq_uint_uint
{i,j:int}
( x
: uint(i)
, y
: uint(j)): bool(i!=j) = $extnam()
#impltmp
gint_neq_uint_uint<> = XATS2JS_gint_neq_uint_uint
//
(* ****** ****** *)

#extern
fun
XATS2JS_gint_cmp_sint_sint
{i,j:int}
( x
: sint(i)
, y
: sint(j))
: sint(sgn(i-j)) = $extnam((*self*))
#impltmp
gint_cmp_sint_sint<> = XATS2JS_gint_cmp_sint_sint

#extern
fun
XATS2JS_gint_cmp_uint_uint
{i,j:int}
( x
: uint(i)
, y
: uint(j))
: sint(sgn(i-j)) = $extnam((*self*))
#impltmp
gint_cmp_uint_uint<> = XATS2JS_gint_cmp_uint_uint

(* ****** ****** *)
//
#extern
fun
XATS2JS_gint_add_sint_sint
{i,j:int}
( x
: sint(i)
, y
: sint(j)): sint( i+j ) = $extnam()
#impltmp
gint_add_sint_sint<> = XATS2JS_gint_add_sint_sint
#extern
fun
XATS2JS_gint_sub_sint_sint
{i,j:int}
( x
: sint(i)
, y
: sint(j)): sint( i-j ) = $extnam()
#impltmp
gint_sub_sint_sint<> = XATS2JS_gint_sub_sint_sint
//
#extern
fun
XATS2JS_gint_mul_sint_sint
{i,j:int}
( x
: sint(i)
, y
: sint(j)): sint( i*j ) = $extnam()
#impltmp
gint_mul_sint_sint<> = XATS2JS_gint_mul_sint_sint
#extern
fun
XATS2JS_gint_div_sint_sint
{i,j:int}
( x
: sint(i)
, y
: sint(j)): sint( i/j ) = $extnam()
#impltmp
gint_div_sint_sint<> = XATS2JS_gint_div_sint_sint
#extern
fun
XATS2JS_gint_mod_sint_sint
{i,j:int}
( x
: sint(i)
, y
: sint(j)): sint(mod(i,j)) = $extnam()
#impltmp
gint_mod_sint_sint<> = XATS2JS_gint_mod_sint_sint
//
(* ****** ****** *)
//
// prelude/SATS/gflt000.sats
//
(* ****** ****** *)
//
#extern
fun
XATS2JS_gflt_i_dflt
( x0: sint ): dflt = $extnam()
#impltmp
gflt_i_dflt<> = XATS2JS_gflt_i_dflt
//
(* ****** ****** *)
//
#extern
fun
XATS2JS_gflt_neg_dflt
  ( x0: dflt ): dflt = $extnam()
#impltmp
gflt_neg_dflt<> = XATS2JS_gflt_neg_dflt
//
#extern
fun
XATS2JS_gflt_abs_dflt
  ( x0: dflt ): dflt = $extnam()
#impltmp
gflt_abs_dflt<> = XATS2JS_gflt_abs_dflt
//
(* ****** ****** *)
//
#extern
fun
XATS2JS_gflt_succ_dflt
  ( x0: dflt ): dflt = $extnam()
#impltmp
gflt_succ_dflt<> = XATS2JS_gflt_succ_dflt
#extern
fun
XATS2JS_gflt_pred_dflt
  ( x0: dflt ): dflt = $extnam()
#impltmp
gflt_pred_dflt<> = XATS2JS_gflt_pred_dflt
//
(* ****** ****** *)
//
#extern
fun
XATS2JS_gflt_lt_dflt_dflt
( x0: dflt, y0: dflt ): bool = $extnam()
#extern
fun
XATS2JS_gflt_gt_dflt_dflt
( x0: dflt, y0: dflt ): bool = $extnam()
#extern
fun
XATS2JS_gflt_eq_dflt_dflt
( x0: dflt, y0: dflt ): bool = $extnam()
#extern
fun
XATS2JS_gflt_lte_dflt_dflt
( x0: dflt, y0: dflt ): bool = $extnam()
#extern
fun
XATS2JS_gflt_gte_dflt_dflt
( x0: dflt, y0: dflt ): bool = $extnam()
#extern
fun
XATS2JS_gflt_neq_dflt_dflt
( x0: dflt, y0: dflt ): bool = $extnam()
//
#impltmp
gflt_lt_dflt_dflt<> = XATS2JS_gflt_lt_dflt_dflt
#impltmp
gflt_gt_dflt_dflt<> = XATS2JS_gflt_gt_dflt_dflt
#impltmp
gflt_eq_dflt_dflt<> = XATS2JS_gflt_eq_dflt_dflt
#impltmp
gflt_lte_dflt_dflt<> = XATS2JS_gflt_lte_dflt_dflt
#impltmp
gflt_gte_dflt_dflt<> = XATS2JS_gflt_gte_dflt_dflt
#impltmp
gflt_neq_dflt_dflt<> = XATS2JS_gflt_neq_dflt_dflt
//
(* ****** ****** *)
//
#extern
fun
XATS2JS_gflt_cmp_dflt_dflt
( x0: dflt, y0: dflt ): sint = $extnam()
#impltmp
gflt_cmp_dflt_dflt<> = XATS2JS_gflt_cmp_dflt_dflt
//
(* ****** ****** *)
//
#extern
fun
XATS2JS_gflt_add_dflt_dflt
( x0: dflt, y0: dflt ): dflt = $extnam()
#extern
fun
XATS2JS_gflt_sub_dflt_dflt
( x0: dflt, y0: dflt ): dflt = $extnam()
#extern
fun
XATS2JS_gflt_mul_dflt_dflt
( x0: dflt, y0: dflt ): dflt = $extnam()
#extern
fun
XATS2JS_gflt_div_dflt_dflt
( x0: dflt, y0: dflt ): dflt = $extnam()
//
#impltmp
gflt_add_dflt_dflt<> = XATS2JS_gflt_add_dflt_dflt
#impltmp
gflt_sub_dflt_dflt<> = XATS2JS_gflt_sub_dflt_dflt
#impltmp
gflt_mul_dflt_dflt<> = XATS2JS_gflt_mul_dflt_dflt
#impltmp
gflt_div_dflt_dflt<> = XATS2JS_gflt_div_dflt_dflt
//
(* ****** ****** *)
//
(*
//prelude/SATS/strn000.sats
*)
//
(* ****** ****** *)
#impltmp
strn_vt2t<> =
XATS2JS_strn_vt2t
where
{
#extern
fun
XATS2JS_strn_vt2t
(cs
:strn_vt):strn = $extnam()
}
(* ****** ****** *)

#impltmp
stropt_nilq<> =
XATS2JS_stropt_nilq
where
{
#extern
fun
XATS2JS_stropt_nilq
(opt: stropt): bool = $extnam()
}
#impltmp
stropt_consq<> =
XATS2JS_stropt_consq
where
{
#extern
fun
XATS2JS_stropt_consq
(opt: stropt): bool = $extnam()
}

(* ****** ****** *)
#impltmp
strn_lt<> =
XATS2JS_strn_lt
where
{
#extern
fun
XATS2JS_strn_lt
(x1: strn
,x2: strn): bool = $extnam()
}
#impltmp
strn_gt<> =
XATS2JS_strn_gt
where
{
#extern
fun
XATS2JS_strn_gt
(x1: strn
,x2: strn): bool = $extnam()
}
#impltmp
strn_eq<> =
XATS2JS_strn_eq
where
{
#extern
fun
XATS2JS_strn_eq
(x1: strn
,x2: strn): bool = $extnam()
}
(* ****** ****** *)
#impltmp
strn_lte<> =
XATS2JS_strn_lte
where
{
#extern
fun
XATS2JS_strn_lte
(x1: strn
,x2: strn): bool = $extnam()
}
#impltmp
strn_gte<> =
XATS2JS_strn_gte
where
{
#extern
fun
XATS2JS_strn_gte
(x1: strn
,x2: strn): bool = $extnam()
}
#impltmp
strn_neq<> =
XATS2JS_strn_neq
where
{
#extern
fun
XATS2JS_strn_neq
(x1: strn
,x2: strn): bool = $extnam()
}
(* ****** ****** *)
#impltmp
strn_cmp<> =
XATS2JS_strn_cmp
where
{
#extern
fun
XATS2JS_strn_cmp
(x1: strn
,x2: strn): sint = $extnam()
}
(* ****** ****** *)
#impltmp
strn_head_opt<> =
XATS2JS_strn_head_opt
where
{
#extern
fun
XATS2JS_strn_head_opt
(cs: strn): char = $extnam()
}
(* ****** ****** *)
#impltmp
strn_head_raw<> =
XATS2JS_strn_head_raw
where
{
#extern
fun
XATS2JS_strn_head_raw
(cs: strn): char = $extnam()
}
(* ****** ****** *)
#impltmp
strn_tail_raw<> =
XATS2JS_strn_tail_raw
where
{
#extern
fun
XATS2JS_strn_tail_raw
(cs: strn): strn = $extnam()
}
(* ****** ****** *)
#impltmp
strn_length<> =
XATS2JS_strn_length
where
{
#extern
fun
XATS2JS_strn_length
(cs : strn) : nint = $extnam()
}
//
#impltmp
strn_vt_length0<> =
XATS2JS_strn_vt_length0
where
{
#extern
fun
XATS2JS_strn_vt_length0
(cs : !strn_vt) : nint = $extnam()
}
#impltmp
strn_vt_length1<> =
XATS2JS_strn_vt_length1
where
{
#extern
fun
XATS2JS_strn_vt_length1
(cs : !strn_vt) : nint = $extnam()
}
//
(* ****** ****** *)
#impltmp
strn_get_at<> =
XATS2JS_strn_get_at
where
{
#extern
fun
XATS2JS_strn_get_at
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
XATS2JS_strn_forall_cfr
( cs: strn
, f0: (cgtz) -<cfr> bool): bool
= $extnam((*self*))
//
in
XATS2JS_strn_forall_cfr
( cs
, lam(c0) => forall$test<cgtz>(c0))
end // end of [strn_forall]
(* ****** ****** *)
#impltmp
strtmp_vt_alloc<> =
XATS2JS_strtmp_vt_alloc
where
{
#extern
fun
XATS2JS_strtmp_vt_alloc
(bsz: sint) : strtmp0_vt = $extnam()
}
(* ****** ****** *)
#impltmp
strtmp_vt_set_at<> =
XATS2JS_strtmp_vt_set_at
where
{
#extern
fun
XATS2JS_strtmp_vt_set_at
( cs:strtmp0_vt
, i0:sint, c0:char): void = $extnam()
}
(* ****** ****** *)
#impltmp
strn_vt_forall0<>(cs) =
XATS2JS_strn_vt_forall_cfr
( cs
, lam(c0) =>
  forall0$test<cgtz>(c0) ) where
{
#extern
fun
XATS2JS_strn_vt_forall_cfr
( cs: ~strn_vt
, f0: (cgtz) -<cfr> bool): bool = $extnam()
} (*where*) // end of [strn_vt_forall0]
(* ****** ****** *)
#impltmp
strn_vt_forall1<>(cs) =
XATS2JS_strn_vt_forall_cfr
( cs
, lam(c0) =>
  forall1$test<cgtz>(c0) ) where
{
#extern
fun
XATS2JS_strn_vt_forall_cfr
( cs: !strn_vt
, f0: (cgtz) -<cfr> bool): bool = $extnam()
} (*where*) // end of [strn_vt_forall1]
(* ****** ****** *)

(* end of [ATS3/XANADU_prelude_DATS_CATS_JS_basics0.dats] *)

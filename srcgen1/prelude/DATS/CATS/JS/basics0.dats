(* ****** ****** *)
(*
Basics for Xats2js
// char, bool,
// ints, floats, string
*)
(* ****** ****** *)
//
#staload
UN = // for casting
"srcgen1\
/prelude/SATS/unsafex.sats"
//
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
XATS2JS_gint_neg$sint
{i:int}
( x0
: sint(i)): sint(-i) = $extnam()
#impltmp
gint_neg$sint<> = XATS2JS_gint_neg$sint
//
(* ****** ****** *)
//
#extern
fun
XATS2JS_gint_abs$sint
{i:int}
( x0
: sint(i)): sint(abs(i)) = $extnam()
#impltmp
gint_abs$sint<> = XATS2JS_gint_abs$sint
//
(* ****** ****** *)
//
#extern
fun
XATS2JS_gint_suc$sint
{i:int}
( x0
: sint(i)): sint(i+1) = $extnam()
#extern
fun
XATS2JS_gint_suc$uint
{i:int}
( x0
: uint(i)): uint(i+1) = $extnam()
#impltmp
gint_suc$sint<> = XATS2JS_gint_suc$sint
#impltmp
gint_suc$uint<> = XATS2JS_gint_suc$uint
//
(* ****** ****** *)
//
#extern
fun
XATS2JS_gint_pre$sint
{i:int}
( x0
: sint(i)): sint(i-1) = $extnam()
#extern
fun
XATS2JS_gint_pre$uint
{i:int|i>0}
( x0
: uint(i)): uint(i-1) = $extnam()
#impltmp
gint_pre$sint<> = XATS2JS_gint_pre$sint
#impltmp
gint_pre$uint<> = XATS2JS_gint_pre$uint
//
(* ****** ****** *)
//
#extern
fun
XATS2JS_gint_lnot$uint
(    x:uint    ):uint = $extnam()
#extern
fun
XATS2JS_gint_lor2$uint
(x:uint, y:uint):uint = $extnam()
#extern
fun
XATS2JS_gint_land$uint
(x:uint, y:uint):uint = $extnam()
#extern
fun
XATS2JS_gint_lxor$uint
(x:uint, y:uint):uint = $extnam()
//
#impltmp
gint_lnot$uint<> = XATS2JS_gint_lnot$uint
#impltmp
gint_lor2$uint<> = XATS2JS_gint_lor2$uint
#impltmp
gint_land$uint<> = XATS2JS_gint_land$uint
#impltmp
gint_lxor$uint<> = XATS2JS_gint_lxor$uint
//
(* ****** ****** *)
//
#extern
fun
XATS2JS_gint_asrn$sint
(x: sint, n: nint):sint = $extnam()
#extern
fun
XATS2JS_gint_lsln$uint
(x: uint, n: nint):uint = $extnam()
#extern
fun
XATS2JS_gint_lsrn$uint
(x: uint, n: nint):uint = $extnam()
//
#impltmp
gint_asrn$sint<> = XATS2JS_gint_asrn$sint
#impltmp
gint_lsln$uint<> = XATS2JS_gint_lsln$uint
#impltmp
gint_lsrn$uint<> = XATS2JS_gint_lsrn$uint
//
(* ****** ****** *)
//
#extern
fun
XATS2JS_gint_lt$sint$sint
{i,j:int}
( x
: sint(i)
, y
: sint(j)): bool(i<j) = $extnam()
#impltmp
gint_lt$sint$sint<> = XATS2JS_gint_lt$sint$sint
#extern
fun
XATS2JS_gint_lt$uint$uint
{i,j:int}
( x
: uint(i)
, y
: uint(j)): bool(i<j) = $extnam()
#impltmp
gint_lt$uint$uint<> = XATS2JS_gint_lt$uint$uint
//
(* ****** ****** *)
//
#extern
fun
XATS2JS_gint_gt$sint$sint
{i,j:int}
( x
: sint(i)
, y
: sint(j)): bool(i>j) = $extnam()
#impltmp
gint_gt$sint$sint<> = XATS2JS_gint_gt$sint$sint
#extern
fun
XATS2JS_gint_gt$uint$uint
{i,j:int}
( x
: uint(i)
, y
: uint(j)): bool(i>j) = $extnam()
#impltmp
gint_gt$uint$uint<> = XATS2JS_gint_gt$uint$uint
//
(* ****** ****** *)
//
#extern
fun
XATS2JS_gint_eq$sint$sint
{i,j:int}
( x
: sint(i)
, y
: sint(j)): bool(i=j) = $extnam()
#impltmp
gint_eq$sint$sint<> = XATS2JS_gint_eq$sint$sint
#extern
fun
XATS2JS_gint_eq$uint$uint
{i,j:int}
( x
: uint(i)
, y
: uint(j)): bool(i=j) = $extnam()
#impltmp
gint_eq$uint$uint<> = XATS2JS_gint_eq$uint$uint
//
(* ****** ****** *)
//
#extern
fun
XATS2JS_gint_lte$sint$sint
{i,j:int}
( x
: sint(i)
, y
: sint(j)): bool(i<=j) = $extnam()
#impltmp
gint_lte$sint$sint<> = XATS2JS_gint_lte$sint$sint
#extern
fun
XATS2JS_gint_lte$uint$uint
{i,j:int}
( x
: uint(i)
, y
: uint(j)): bool(i<=j) = $extnam()
#impltmp
gint_lte$uint$uint<> = XATS2JS_gint_lte$uint$uint
//
(* ****** ****** *)
//
#extern
fun
XATS2JS_gint_gte$sint$sint
{i,j:int}
( x
: sint(i)
, y
: sint(j)): bool(i>=j) = $extnam()
#impltmp
gint_gte$sint$sint<> = XATS2JS_gint_gte$sint$sint
#extern
fun
XATS2JS_gint_gte$uint$uint
{i,j:int}
( x
: uint(i)
, y
: uint(j)): bool(i>=j) = $extnam()
#impltmp
gint_gte$uint$uint<> = XATS2JS_gint_gte$uint$uint
//
(* ****** ****** *)
//
#extern
fun
XATS2JS_gint_neq$sint$sint
{i,j:int}
( x
: sint(i)
, y
: sint(j)): bool(i!=j) = $extnam()
#impltmp
gint_neq$sint$sint<> = XATS2JS_gint_neq$sint$sint
#extern
fun
XATS2JS_gint_neq$uint$uint
{i,j:int}
( x
: uint(i)
, y
: uint(j)): bool(i!=j) = $extnam()
#impltmp
gint_neq$uint$uint<> = XATS2JS_gint_neq$uint$uint
//
(* ****** ****** *)

#extern
fun
XATS2JS_gint_cmp$sint$sint
{i,j:int}
( x
: sint(i)
, y
: sint(j))
: sint(sgn(i-j)) = $extnam((*self*))
#impltmp
gint_cmp$sint$sint<> = XATS2JS_gint_cmp$sint$sint

#extern
fun
XATS2JS_gint_cmp$uint$uint
{i,j:int}
( x
: uint(i)
, y
: uint(j))
: sint(sgn(i-j)) = $extnam((*self*))
#impltmp
gint_cmp$uint$uint<> = XATS2JS_gint_cmp$uint$uint

(* ****** ****** *)
//
#extern
fun
XATS2JS_gint_add$sint$sint
{i,j:int}
( x
: sint(i)
, y
: sint(j)): sint( i+j ) = $extnam()
#impltmp
gint_add$sint$sint<> = XATS2JS_gint_add$sint$sint
#extern
fun
XATS2JS_gint_sub$sint$sint
{i,j:int}
( x
: sint(i)
, y
: sint(j)): sint( i-j ) = $extnam()
#impltmp
gint_sub$sint$sint<> = XATS2JS_gint_sub$sint$sint
//
#extern
fun
XATS2JS_gint_mul$sint$sint
{i,j:int}
( x
: sint(i)
, y
: sint(j)): sint( i*j ) = $extnam()
#impltmp
gint_mul$sint$sint<> = XATS2JS_gint_mul$sint$sint
#extern
fun
XATS2JS_gint_div$sint$sint
{i,j:int}
( x
: sint(i)
, y
: sint(j)): sint( i/j ) = $extnam()
#impltmp
gint_div$sint$sint<> = XATS2JS_gint_div$sint$sint
#extern
fun
XATS2JS_gint_mod$sint$sint
{i,j:int}
( x
: sint(i)
, y
: sint(j)): sint(mod(i,j)) = $extnam()
#impltmp
gint_mod$sint$sint<> = XATS2JS_gint_mod$sint$sint
//
(* ****** ****** *)
//
#extern
fun
XATS2JS_gint_add$uint$uint
{i,j:int}
( x
: uint(i)
, y
: uint(j)): uint( i+j ) = $extnam()
#impltmp
gint_add$uint$uint<> = XATS2JS_gint_add$uint$uint
#extern
fun
XATS2JS_gint_sub$uint$uint
{i,j:int | i >= j}
( x
: uint(i)
, y
: uint(j)): uint( i-j ) = $extnam()
#impltmp
gint_sub$uint$uint<> = XATS2JS_gint_sub$uint$uint
//
(* ****** ****** *)
//
// prelude/SATS/gflt000.sats
//
(* ****** ****** *)
//
#extern
fun
XATS2JS_gflt_si_dflt
( x0: sint ): dflt = $extnam()
#impltmp
gflt_si_dflt<> = XATS2JS_gflt_si_dflt
//
(* ****** ****** *)
//
#extern
fun
XATS2JS_gflt_neg$dflt
  ( x0: dflt ): dflt = $extnam()
#impltmp
gflt_neg$dflt<> = XATS2JS_gflt_neg$dflt
//
#extern
fun
XATS2JS_gflt_abs$dflt
  ( x0: dflt ): dflt = $extnam()
#impltmp
gflt_abs$dflt<> = XATS2JS_gflt_abs$dflt
//
(* ****** ****** *)
//
#extern
fun
XATS2JS_gflt_suc$dflt
  ( x0: dflt ): dflt = $extnam()
#impltmp
gflt_suc$dflt<> = XATS2JS_gflt_suc$dflt
#extern
fun
XATS2JS_gflt_pre$dflt
  ( x0: dflt ): dflt = $extnam()
#impltmp
gflt_pre$dflt<> = XATS2JS_gflt_pre$dflt
//
(* ****** ****** *)
//
#extern
fun
XATS2JS_gflt_lt$dflt$dflt
( x0: dflt, y0: dflt ): bool = $extnam()
#extern
fun
XATS2JS_gflt_gt$dflt$dflt
( x0: dflt, y0: dflt ): bool = $extnam()
#extern
fun
XATS2JS_gflt_eq$dflt$dflt
( x0: dflt, y0: dflt ): bool = $extnam()
#extern
fun
XATS2JS_gflt_lte$dflt$dflt
( x0: dflt, y0: dflt ): bool = $extnam()
#extern
fun
XATS2JS_gflt_gte$dflt$dflt
( x0: dflt, y0: dflt ): bool = $extnam()
#extern
fun
XATS2JS_gflt_neq$dflt$dflt
( x0: dflt, y0: dflt ): bool = $extnam()
//
#impltmp
gflt_lt$dflt$dflt<> = XATS2JS_gflt_lt$dflt$dflt
#impltmp
gflt_gt$dflt$dflt<> = XATS2JS_gflt_gt$dflt$dflt
#impltmp
gflt_eq$dflt$dflt<> = XATS2JS_gflt_eq$dflt$dflt
#impltmp
gflt_lte$dflt$dflt<> = XATS2JS_gflt_lte$dflt$dflt
#impltmp
gflt_gte$dflt$dflt<> = XATS2JS_gflt_gte$dflt$dflt
#impltmp
gflt_neq$dflt$dflt<> = XATS2JS_gflt_neq$dflt$dflt
//
(* ****** ****** *)
//
#extern
fun
XATS2JS_gflt_cmp$dflt$dflt
( x0: dflt, y0: dflt ): sint = $extnam()
#impltmp
gflt_cmp$dflt$dflt<> = XATS2JS_gflt_cmp$dflt$dflt
//
(* ****** ****** *)
//
#extern
fun
XATS2JS_gflt_add$dflt$dflt
( x0: dflt, y0: dflt ): dflt = $extnam()
#extern
fun
XATS2JS_gflt_sub$dflt$dflt
( x0: dflt, y0: dflt ): dflt = $extnam()
#extern
fun
XATS2JS_gflt_mul$dflt$dflt
( x0: dflt, y0: dflt ): dflt = $extnam()
#extern
fun
XATS2JS_gflt_div$dflt$dflt
( x0: dflt, y0: dflt ): dflt = $extnam()
//
#impltmp
gflt_add$dflt$dflt<> = XATS2JS_gflt_add$dflt$dflt
#impltmp
gflt_sub$dflt$dflt<> = XATS2JS_gflt_sub$dflt$dflt
#impltmp
gflt_mul$dflt$dflt<> = XATS2JS_gflt_mul$dflt$dflt
#impltmp
gflt_div$dflt$dflt<> = XATS2JS_gflt_div$dflt$dflt
//
(* ****** ****** *)
//
(*
//prelude/SATS/strn000.sats
*)
//
(* ****** ****** *)
//
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
//
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
//
(* ****** ****** *)
//
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
//
(* ****** ****** *)
//
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
//
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
(* ****** ****** *)
//
#impltmp
<(*tmp*)>
$UN.strn_head$raw =
XATS2JS_strn_head$raw
where
{
#extern
fun
XATS2JS_strn_head$raw
(cs: strn): char = $extnam()
}
//
#impltmp
<(*tmp*)>
$UN.strn_tail$raw =
XATS2JS_strn_tail$raw
where
{
#extern
fun
XATS2JS_strn_tail$raw
(cs: strn): strn = $extnam()
}
//
(* ****** ****** *)
(* ****** ****** *)
//
#impltmp
<(*tmp*)>
strn_get$at =
XATS2JS_strn_get$at
where
{
#extern
fun
XATS2JS_strn_get$at
( cs
: strn,i0: sint): char = $extnam()
}
//
(* ****** ****** *)
//
#impltmp
strn_head$opt<> =
XATS2JS_strn_head$opt
where
{
#extern
fun
XATS2JS_strn_head$opt
(cs: strn): char = $extnam()
}
//
(* ****** ****** *)
//
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
(* ****** ****** *)
//
#impltmp
strn_forall<>(cs) =
let
//
#extern
fun
XATS2JS_strn_forall$f1un
( cs: strn
, f0: (cgtz) -> bool): bool
= $extnam((*self*))//native
//
in
XATS2JS_strn_forall$f1un
( cs
, lam(c0) => forall$test<cgtz>(c0))
end//let//end-of-[strn_forall<>(cs)]
//
(* ****** ****** *)
(* ****** ****** *)
//
#impltmp
strtmp_vt_alloc<> =
XATS2JS_strtmp_vt_alloc
where
{
#extern
fun
XATS2JS_strtmp_vt_alloc
(bsz:sint): strtmp_vt = $extnam()
}
//
(* ****** ****** *)
//
#impltmp
strn_vt_get$at<> =
XATS2JS_strn_vt_get$at
where
{
#extern
fun
XATS2JS_strn_vt_get$at
( cs
: strn_vt
, i0:sint(*ind*)): char = $extnam()
}
//
(* ****** ****** *)
//
#impltmp
strn_vt_set$at<> =
XATS2JS_strn_vt_set$at
where
{
#extern
fun
XATS2JS_strn_vt_set$at
( cs:strn_vt
, i0:sint, c0:char): void = $extnam()
}
//
(* ****** ****** *)
//
#impltmp
strtmp_vt_set$at<> =
XATS2JS_strtmp_vt_set$at
where
{
#extern
fun
XATS2JS_strtmp_vt_set$at
( cs:strtmp_vt
, i0:sint, c0:char): void = $extnam()
}
//
(* ****** ****** *)
(* ****** ****** *)
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
(* ****** ****** *)
//
#impltmp
strn_vt_forall0<>(cs) =
XATS2JS_strn_vt_forall$f1un
( cs
, lam(c0) =>
  forall$test0<cgtz>(c0) ) where
{
#extern
fun
XATS2JS_strn_vt_forall$f1un
( cs: ~strn_vt
, f0:
  (cgtz) -> bool): bool = $extnam()
} (*where*) // end of [strn_vt_forall0]
//
(* ****** ****** *)
//
#impltmp
strn_vt_forall1<>(cs) =
XATS2JS_strn_vt_forall$f1un
( cs
, lam(c0) =>
  forall$test1<cgtz>(c0) ) where
{
#extern
fun
XATS2JS_strn_vt_forall$f1un
( cs: !strn_vt
, f0:
  (cgtz) -> bool): bool = $extnam()
} (*where*) // end of [strn_vt_forall1]
//
(* ****** ****** *)
//
#impltmp
strn_vt_rforall0<>(cs) =
XATS2JS_strn_vt_rforall$f1un
( cs
, lam(c0) =>
  rforall$test0<cgtz>(c0) ) where
{
#extern
fun
XATS2JS_strn_vt_rforall$f1un
( cs: ~strn_vt
, f0:
  (cgtz) -> bool): bool = $extnam()
} (*where*) // end of [strn_vt_rforall0]
//
(* ****** ****** *)
//
#impltmp
strn_vt_rforall1<>(cs) =
XATS2JS_strn_vt_rforall$f1un
( cs
, lam(c0) =>
  rforall$test1<cgtz>(c0) ) where
{
#extern
fun
XATS2JS_strn_vt_rforall$f1un
( cs: !strn_vt
, f0:
  (cgtz) -> bool): bool = $extnam()
} (*where*) // end of [strn_vt_rforall1]
//
(* ****** ****** *)
(* ****** ****** *)
//
(* ****** ****** *)(* ****** ****** *)(* ****** ****** *)
(* ****** ****** *)(* ****** ****** *)(* ****** ****** *)

(* end of [ATS3/XANADU_srcgen1_prelude_DATS_CATS_JS_basics0.dats] *)

(* ****** ****** *)
(*
Basics for Xinterp
*)
(* ****** ****** *)
#staload
UN = // for casting
"srcgen1\
/prelude/SATS/unsafex.sats"
(* ****** ****** *)
#staload
"srcgen1\
/xatslib\
/libcats/SATS/libcats.sats"
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
: bool(b0))
: bool(~b0) = $extnam()
(*
#extnam
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
: bool(b2))
: bool(b1+b2) = $extnam()
#extern
fun
XINTERP_bool_mul
{b1,b2:bool}
( b1
: bool(b1)
, b2
: bool(b2))
: bool(b1*b2) = $extnam()
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
: bool): void = $extnam()
#impltmp
bool_print<> = XINTERP_bool_print
//
#extern
fun
XINTERP_bool_fprint
( btf: bool
, out: FILR): void = $extnam()
#impltmp
bool_fprint<> = XINTERP_bool_fprint
//
(* ****** ****** *)
//
// prelude/char000.sats
//
(* ****** ****** *)
//
#extern
fun
XINTERP_char_eqz
{c:char}
( c0
: char(c)): bool(c=0)
= $extnam( (*self*) )
#extern
fun
XINTERP_char_neqz
{c:char}
( c0
: char(c)): bool(c>0)
= $extnam( (*self*) )
//
#impltmp
char_eqz<> = XINTERP_char_eqz
#impltmp
char_neqz<> = XINTERP_char_neqz
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
= $extnam( (*self*) )
#extern
fun
XINTERP_char_noteq
{c1,c2:char}
( c1
: char(c1)
, c2
: char(c2)): bool(c1!=c2)
= $extnam( (*self*) )
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
: char): sint = $extnam()
#impltmp
char_cmp<> = XINTERP_char_cmp
//
(* ****** ****** *)
//
#extern
fun
XINTERP_char_code
( c0
: char): sint = $extnam()
//
#impltmp
char_code<> = XINTERP_char_code
//
(* ****** ****** *)
//
#extern
fun
XINTERP_char_print
( c0
: char): void = $extnam()
#impltmp
char_print<> = XINTERP_char_print
//
#extern
fun
XINTERP_char_fprint
( chr: char
, out: FILR): void = $extnam()
#impltmp
char_fprint<> = XINTERP_char_fprint
//
(* ****** ****** *)
//
#extern
fun
XINTERP_char_make_code
( c0
: sint): char = $extnam()
#extern
fun
XINTERP_char_make_sint
( c0
: sint): char = $extnam()
#extern
fun
XINTERP_char_make_uint
( c0
: uint): char = $extnam()
//
#impltmp
char_make_code<> = XINTERP_char_make_code
#impltmp
char_make_sint<> = XINTERP_char_make_sint
#impltmp
char_make_uint<> = XINTERP_char_make_uint
//
(* ****** ****** *)
//
// prelude/gint000.sats
//
(* ****** ****** *)
//
#extern
fun
XINTERP_gint_sint2uint
( x0
: sint): uint = $extnam()
#extern
fun
XINTERP_gint_uint2sint
( x0
: uint): sint = $extnam()
//
#impltmp
gint_sint2uint<> = XINTERP_gint_sint2uint
#impltmp
gint_uint2sint<> = XINTERP_gint_uint2sint
//
(* ****** ****** *)
//
#extern
fun
XINTERP_gint_print$sint
( x0
: sint): void = $extnam()
#extern
fun
XINTERP_gint_print$uint
( x0
: uint): void = $extnam()
//
#impltmp
gint_print$sint<> = XINTERP_gint_print$sint
#impltmp
gint_print$uint<> = XINTERP_gint_print$uint
//
(* ****** ****** *)
//
#extern
fun
XINTERP_gint_fprint$sint
( int: sint
, out: FILR): void = $extnam()
#extern
fun
XINTERP_gint_fprint$uint
( unt: uint
, out: FILR): void = $extnam()
//
#impltmp
gint_fprint$sint<> =
  XINTERP_gint_fprint$sint(*sint,FILR*)
#impltmp
gint_fprint$uint<> =
  XINTERP_gint_fprint$uint(*uint,FILR*)
//
(* ****** ****** *)
//
#extern
fun
XINTERP_gint_neg$sint
{i:int}
( x0
: sint(i)): sint(-i)
= $extnam( (*self*) )
#impltmp
gint_neg$sint<> = XINTERP_gint_neg$sint
//
(* ****** ****** *)
//
#extern
fun
XINTERP_gint_abs$sint
{i:int}
( x0
: sint(i))
: sint(abs(i)) = $extnam()
#impltmp
gint_abs$sint<> = XINTERP_gint_abs$sint
//
(* ****** ****** *)
//
#extern
fun
XINTERP_gint_suc$sint
{i:int}
( x0
: sint(i))
: sint(i+1) = $extnam((*0*))
#extern
fun
XINTERP_gint_pre$sint
{i:int}
( x0
: sint(i))
: sint(i-1) = $extnam((*0*))
//
#impltmp
gint_suc$sint<> = XINTERP_gint_suc$sint
#impltmp
gint_pre$sint<> = XINTERP_gint_pre$sint
//
(* ****** ****** *)
//
#extern
fun
XINTERP_gint_lt$sint$sint
{i,j:int}
( x
: sint(i)
, y
: sint(j))
: bool(i<j) = $extnam((*0*))
#impltmp
gint_lt$sint$sint<> = XINTERP_gint_lt$sint$sint
//
#extern
fun
XINTERP_gint_gt$sint$sint
{i,j:int}
( x
: sint(i)
, y
: sint(j))
: bool(i>j) = $extnam((*0*))
#impltmp
gint_gt$sint$sint<> = XINTERP_gint_gt$sint$sint
//
#extern
fun
XINTERP_gint_eq$sint$sint
{i,j:int}
( x
: sint(i)
, y
: sint(j))
: bool(i=j) = $extnam((*0*))
#impltmp
gint_eq$sint$sint<> = XINTERP_gint_eq$sint$sint
//
#extern
fun
XINTERP_gint_lte$sint$sint
{i,j:int}
( x
: sint(i)
, y
: sint(j))
: bool(i<=j) = $extnam((*0*))
#impltmp
gint_lte$sint$sint<> = XINTERP_gint_lte$sint$sint
//
#extern
fun
XINTERP_gint_gte$sint$sint
{i,j:int}
( x
: sint(i)
, y
: sint(j))
: bool(i>=j) = $extnam((*0*))
#impltmp
gint_gte$sint$sint<> = XINTERP_gint_gte$sint$sint
//
#extern
fun
XINTERP_gint_neq$sint$sint
{i,j:int}
( x
: sint(i)
, y
: sint(j))
: bool(i!=j) = $extnam((*0*))
#impltmp
gint_neq$sint$sint<> = XINTERP_gint_neq$sint$sint
//
(* ****** ****** *)

#extern
fun
XINTERP_gint_cmp$sint$sint
{i,j:int}
( x
: sint(i)
, y
: sint(j))
: sint(sgn(i-j)) = $extnam()
#impltmp
gint_cmp$sint$sint<> = XINTERP_gint_cmp$sint$sint

(* ****** ****** *)
//
#extern
fun
XINTERP_gint_add$sint$sint
{i,j:int}
( x
: sint(i)
, y
: sint(j))
: sint(i+j) = $extnam((*0*))
#impltmp
gint_add$sint$sint<> = XINTERP_gint_add$sint$sint
#extern
fun
XINTERP_gint_sub$sint$sint
{i,j:int}
( x
: sint(i)
, y
: sint(j))
: sint(i-j) = $extnam((*0*))
#impltmp
gint_sub$sint$sint<> = XINTERP_gint_sub$sint$sint
//
#extern
fun
XINTERP_gint_mul$sint$sint
{i,j:int}
( x
: sint(i)
, y
: sint(j))
: sint(i*j) = $extnam((*0*))
#impltmp
gint_mul$sint$sint<> = XINTERP_gint_mul$sint$sint
#extern
fun
XINTERP_gint_div$sint$sint
{i,j:int}
( x
: sint(i)
, y
: sint(j))
: sint(i/j) = $extnam((*0*))
#impltmp
gint_div$sint$sint<> = XINTERP_gint_div$sint$sint
//
#extern
fun
XINTERP_gint_mod$sint$sint
{i,j:int}
( x
: sint(i)
, y
: sint(j))
: sint(mod(i,j)) = $extnam()
#impltmp
gint_mod$sint$sint<> = XINTERP_gint_mod$sint$sint
//
(* ****** ****** *)
//
// prelude/gflt.sats
//
(* ****** ****** *)
//
#extern
fun
XINTERP_gflt_si_dflt
( x0: sint ): dflt = $extnam()
#impltmp
gflt_si_dflt<> = XINTERP_gflt_si_dflt
//
(* ****** ****** *)
//
#extern
fun
XINTERP_gflt_neg$dflt
( x0: dflt ): dflt = $extnam()
#impltmp
gflt_neg$dflt<> = XINTERP_gflt_neg$dflt
//
(* ****** ****** *)
//
#extern
fun
XINTERP_gflt_abs$dflt
( x0: dflt ): dflt = $extnam()
#impltmp
gflt_abs$dflt<> = XINTERP_gflt_abs$dflt
//
(* ****** ****** *)
//
#extern
fun
XINTERP_gflt_suc$dflt
( x0: dflt ): dflt = $extnam()
#impltmp
gflt_suc$dflt<> = XINTERP_gflt_suc$dflt
#extern
fun
XINTERP_gflt_pre$dflt
( x0: dflt ): dflt = $extnam()
#impltmp
gflt_pre$dflt<> = XINTERP_gflt_pre$dflt
//
(* ****** ****** *)
//
#extern
fun
XINTERP_gflt_lt$dflt$dflt
( x0: dflt
, y0: dflt ): bool = $extnam()
#extern
fun
XINTERP_gflt_gt$dflt$dflt
( x0: dflt
, y0: dflt ): bool = $extnam()
#extern
fun
XINTERP_gflt_eq$dflt$dflt
( x0: dflt
, y0: dflt ): bool = $extnam()
#extern
fun
XINTERP_gflt_lte$dflt$dflt
( x0: dflt
, y0: dflt ): bool = $extnam()
#extern
fun
XINTERP_gflt_gte$dflt$dflt
( x0: dflt
, y0: dflt ): bool = $extnam()
#extern
fun
XINTERP_gflt_neq$dflt$dflt
( x0: dflt
, y0: dflt ): bool = $extnam()
//
#impltmp
gflt_lt$dflt$dflt<> = XINTERP_gflt_lt$dflt$dflt
#impltmp
gflt_gt$dflt$dflt<> = XINTERP_gflt_gt$dflt$dflt
#impltmp
gflt_eq$dflt$dflt<> = XINTERP_gflt_eq$dflt$dflt
#impltmp
gflt_lte$dflt$dflt<> = XINTERP_gflt_lte$dflt$dflt
#impltmp
gflt_gte$dflt$dflt<> = XINTERP_gflt_gte$dflt$dflt
#impltmp
gflt_neq$dflt$dflt<> = XINTERP_gflt_neq$dflt$dflt
//
(* ****** ****** *)
//
#extern
fun
XINTERP_gflt_cmp$dflt$dflt
( x0: dflt
, y0: dflt ): sint = $extnam()
#impltmp
gflt_cmp$dflt$dflt<> = XINTERP_gflt_cmp$dflt$dflt
//
(* ****** ****** *)
//
#extern
fun
XINTERP_gflt_add$dflt$dflt
( x0: dflt
, y0: dflt ): dflt = $extnam()
#extern
fun
XINTERP_gflt_sub$dflt$dflt
( x0: dflt
, y0: dflt ): dflt = $extnam()
#extern
fun
XINTERP_gflt_mul$dflt$dflt
( x0: dflt
, y0: dflt ): dflt = $extnam()
#extern
fun
XINTERP_gflt_div$dflt$dflt
( x0: dflt
, y0: dflt ): dflt = $extnam()
//
#impltmp
gflt_add$dflt$dflt<> = XINTERP_gflt_add$dflt$dflt
#impltmp
gflt_sub$dflt$dflt<> = XINTERP_gflt_sub$dflt$dflt
#impltmp
gflt_mul$dflt$dflt<> = XINTERP_gflt_mul$dflt$dflt
#impltmp
gflt_div$dflt$dflt<> = XINTERP_gflt_div$dflt$dflt
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
may or may not
be of the same representation!!!
#impltmp
strn_vt2t<>(cs) = $UN.castlin01(cs)
*)
#extern
fun
XINTERP_strn_vt2t
( cs
: strn_vt): strn = $extnam()
#impltmp
strn_vt2t<> = XINTERP_strn_vt2t
//
(* ****** ****** *)
//
#extern
fun
XINTERP_strn_print
( x0
: strn ): void = $extnam()
#impltmp
strn_print<> = XINTERP_strn_print
//
(* ****** ****** *)
//
#extern
fun
XINTERP_strn_head$opt
( x0
: strn ): char = $extnam()
#impltmp
strn_head$opt<> = XINTERP_strn_head$opt
//
(* ****** ****** *)
//
#extern
fun
XINTERP_strn_head$raw
( x0
: strn ): char = $extnam()
#extern
fun
XINTERP_strn_tail$raw
( x0
: strn ): strn = $extnam()
//
#impltmp
$UN.strn_head$raw<> = XINTERP_strn_head$raw
#impltmp
$UN.strn_tail$raw<> = XINTERP_strn_tail$raw
//
(* ****** ****** *)
//
#extern
fun
XINTERP_strtmp_vt_alloc
{n:nat}
( len
: sint(n))
: strtmp_vt(n) = $extnam()
//
#impltmp
strtmp_vt_alloc<> = XINTERP_strtmp_vt_alloc
//
(* ****** ****** *)
//
#extern
fun
XINTERP_strn_get$at
{n:nat}
{i:int|i<n}
( p0: strn(n), i0: sint(i) ): cgtz
= $extnam((*self*))
#impltmp
strn_get$at<> = XINTERP_strn_get$at
//
#extern
fun
XINTERP_strtmp_vt_set$at
{n:nat}
{i:int|i<n}
( p0:
! strtmp_vt(n), i0: sint(i), c0: cgtz): void
= $extnam((*self*))
#impltmp
strtmp_vt_set$at<> = XINTERP_strtmp_vt_set$at
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
) : a0ptr(?a) = $extnam()
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
: a1ptr(?a) = $extnam()
//
#impltmp
{a:vt}
a1ptr_alloc<a> = XINTERP_a1ptr_alloc
//
(* ****** ****** *)
//
#extern
fun
XINTERP_a0ref_dtget
{a:vt}
(A0: a0ref(a)): (?!a) = $extnam()
#extern
fun
XINTERP_a0ref_dtset
{a:vt}
(A0
:a0ref(a), x0: ?!a): void = $extnam()
//
(* ****** ****** *)
//
#impltmp
{a:vt}
a0ref_dtget<a> = XINTERP_a0ref_dtget{a}
//
#impltmp
{a:vt}
a0ref_dtset<a> = XINTERP_a0ref_dtset{a}
//
(* ****** ****** *)
(* ****** ****** *)
//
#extern
fun
XINTERP_a1ref_head$raw
{a:vt}
{n:i0}
( A0
: a1ref(a, n)): (?!a) = $extnam()
#extern
fun
XINTERP_a1ref_tail$raw
{a:vt}{n:i0}
(A0
:a1ref(a,n)): a1ref(a,n-1) = $extnam()
//
#extern
fun
XINTERP_a1ref_dtget$at
{a:vt}{n:int}
( A0
: a1ref(a, n)
, i0
: sint(*index*)): (?!a) = $extnam((*self*))
#extern
fun
XINTERP_a1ptr_dtget$at1
{a:vt}{n:int}
( A0:
! a1ptr(a, n)
, i0
: sint(*index*)): (?!a) = $extnam((*self*))
//
#extern
fun
XINTERP_a1ref_dtset$at
{a:vt}{n:int}
( A0
: a1ref(a, n)
, i0
: sint(*idx*), x0: ?!a): void = $extnam((*0*))
#extern
fun
XINTERP_a1ptr_dtset$at1
{a:vt}{n:int}
( A0:
! a1ptr(a, n)
, i0
: sint(*idx*), x0: ?!a): void = $extnam((*0*))
//
(* ****** ****** *)
//
#impltmp
{a:t0}
a1ref_head<a>
(A0) =
XINTERP_a1ref_head$raw{a}(A0)
#impltmp
{a:vt}
a1ref_tail<a>
(A0) =
XINTERP_a1ref_tail$raw{a}(A0)
//
#impltmp
{a:t0}
a1ref_get$at<a>
(A0, i0) =
XINTERP_a1ref_dtget$at{a}(A0, i0)
#impltmp
{a:t0}
a1ptr_get$at1<a>
(A0, i0) =
XINTERP_a1ptr_dtget$at1{a}(A0, i0)
//
#impltmp
{a:vt}
a1ref_dtget$at<a>
(A0, i0) =
XINTERP_a1ref_dtget$at{a}(A0, i0)
#impltmp
{a:vt}
a1ptr_dtget$at1<a>
(A0, i0) =
XINTERP_a1ptr_dtget$at1{a}(A0, i0)
//
(* ****** ****** *)
//
#impltmp
{a:t0}
a1ref_set$at<a>
(A0, i0, x0) =
XINTERP_a1ref_dtset$at{a}(A0, i0, x0)
#impltmp
{a:t0}
a1ptr_set$at1<a>
(A0, i0, x0) =
XINTERP_a1ptr_dtset$at1{a}(A0, i0, x0)
//
(* ****** ****** *)

(* end of [ATS3/XANADU_prelude_DATS_CATS_Xint_basics0.dats] *)

(* ****** ****** *)
(*
Basics for Xinterp
*)
(* ****** ****** *)
#staload
UN = // for casting
"prelude/SATS/unsafe.sats"
(* ****** ****** *)
//
// prelude/bool.sats
//
(* ****** ****** *)
//
#extern
fun
Xint_bool_neg
{b0:bool}
( b0
: bool(b0)
)
: bool(~b0) // = $ext()
impltmp
bool_neg<> = Xint_bool_neg
//
(* ****** ****** *)
//
#extern
fun
Xint_bool_add
{b1,b2:bool}
( b1
: bool(b1)
, b2
: bool(b2)
)
: bool(b1+b2) // = $ext()
#extern
fun
Xint_bool_mul
{b1,b2:bool}
( b1
: bool(b1)
, b2
: bool(b2)
)
: bool(b1*b2) // = $ext()
//
impltmp
bool_add<> = Xint_bool_add
impltmp
bool_mul<> = Xint_bool_mul
//
(* ****** ****** *)
//
#extern
fun
Xint_bool_print
( b0
: bool): void // = $ext()
impltmp
bool_print<> = Xint_bool_print
//
(* ****** ****** *)
//
// prelude/char.sats
//
(* ****** ****** *)
//
#extern
fun
Xint_char_eqzq
{c:char}
( c0
: char(c))
: bool(c=0) // = $ext()
#extern
fun
Xint_char_neqzq
{c:char}
( c0
: char(c))
: bool(c>0) // = $ext()
//
impltmp
char_eqzq<> = Xint_char_eqzq
impltmp
char_neqzq<> = Xint_char_neqzq
//
(* ****** ****** *)
//
#extern
fun
Xint_char_equal
{c1,c2:char}
( c1
: char(c1)
, c2
: char(c2))
: bool(c1=c2) // = $ext()
#extern
fun
Xint_char_noteq
{c1,c2:char}
( c1
: char(c1)
, c2
: char(c2))
: bool(c1!=c2) // = $ext()
//
impltmp
char_equal<> = Xint_char_equal
impltmp
char_noteq<> = Xint_char_noteq
//
(* ****** ****** *)
//
#extern
fun
Xint_char_cmp
( c1
: char
, c2
: char): sint // = $ext()
impltmp
char_cmp<> = Xint_char_cmp
//
(* ****** ****** *)
//
#extern
fun
Xint_char_print
( c0
: char): void // = $ext()
impltmp
char_print<> = Xint_char_print
//
(* ****** ****** *)
//
#extern
fun
Xint_char_make_sint
( c0: sint ) : char // = $ext()
#extern
fun
Xint_char_make_uint
( c0: uint ) : char // = $ext()
//
impltmp
char_make_sint<> = Xint_char_make_sint
impltmp
char_make_uint<> = Xint_char_make_uint
//
(* ****** ****** *)
//
#extern
fun
Xint_sint_make_char
( c0: char ) : sint // = $ext()
//
impltmp
sint_make_char<> = Xint_sint_make_char
//
(* ****** ****** *)
//
// prelude/gint.sats
//
(* ****** ****** *)
//
#extern
fun
Xint_gint_print_sint
( x0 : sint ) : void // = $ext()
impltmp
gint_print_sint<>(i0) =
Xint_gint_print_sint(i0)
#extern
fun
Xint_gint_print_uint
( x0 : uint ) : void // = $ext()
impltmp
gint_print_uint<>(u0) =
Xint_gint_print_uint(u0)
//
(* ****** ****** *)
//
#extern
fun
Xint_gint_neg_sint
{i:int}
( x0
: sint(i)): sint(-i) // = $ext()
impltmp
gint_neg_sint<> = Xint_gint_neg_sint
//
(* ****** ****** *)
//
#extern
fun
Xint_gint_abs_sint
{i:int}
( x0
: sint(i)): sint(abs(i)) // = $ext()
impltmp
gint_abs_sint<> = Xint_gint_abs_sint
//
(* ****** ****** *)
//
#extern
fun
Xint_gint_succ_sint
{i:int}
( x0
: sint(i)): sint(i+1) // = $ext()
#extern
fun
Xint_gint_pred_sint
{i:int}
( x0
: sint(i)): sint(i-1) // = $ext()
impltmp
gint_succ_sint<> = Xint_gint_succ_sint
impltmp
gint_pred_sint<> = Xint_gint_pred_sint
//
(* ****** ****** *)
//
#extern
fun
Xint_gint_lt_sint_sint
{i,j:int}
( x
: sint(i)
, y
: sint(j)): bool(i<j) // = $ext()
impltmp
gint_lt_sint_sint<> = Xint_gint_lt_sint_sint
//
#extern
fun
Xint_gint_gt_sint_sint
{i,j:int}
( x
: sint(i)
, y
: sint(j)): bool(i>j) // = $ext()
impltmp
gint_gt_sint_sint<> = Xint_gint_gt_sint_sint
//
#extern
fun
Xint_gint_eq_sint_sint
{i,j:int}
( x
: sint(i)
, y
: sint(j)): bool(i=j) // = $ext()
impltmp
gint_eq_sint_sint<> = Xint_gint_eq_sint_sint
//
#extern
fun
Xint_gint_lte_sint_sint
{i,j:int}
( x
: sint(i)
, y
: sint(j)): bool(i<=j) // = $ext()
impltmp
gint_lte_sint_sint<> = Xint_gint_lte_sint_sint
//
#extern
fun
Xint_gint_gte_sint_sint
{i,j:int}
( x
: sint(i)
, y
: sint(j)): bool(i>=j) // = $ext()
impltmp
gint_gte_sint_sint<> = Xint_gint_gte_sint_sint
//
#extern
fun
Xint_gint_neq_sint_sint
{i,j:int}
( x
: sint(i)
, y
: sint(j)): bool(i!=j) // = $ext()
impltmp
gint_neq_sint_sint<> = Xint_gint_neq_sint_sint
//
(* ****** ****** *)

#extern
fun
Xint_gint_cmp_sint_sint
{i,j:int}
( x
: sint(i)
, y
: sint(j)): sint(sgn(i-j)) // = $ext()
impltmp
gint_cmp_sint_sint<> = Xint_gint_cmp_sint_sint

(* ****** ****** *)
//
#extern
fun
Xint_gint_add_sint_sint
{i,j:int}
( x
: sint(i)
, y
: sint(j)): sint( i+j ) // = $ext()
impltmp
gint_add_sint_sint<> = Xint_gint_add_sint_sint
#extern
fun
Xint_gint_sub_sint_sint
{i,j:int}
( x
: sint(i)
, y
: sint(j)): sint( i-j ) // = $ext()
impltmp
gint_sub_sint_sint<> = Xint_gint_sub_sint_sint
//
#extern
fun
Xint_gint_mul_sint_sint
{i,j:int}
( x
: sint(i)
, y
: sint(j)): sint( i*j ) // = $ext()
impltmp
gint_mul_sint_sint<> = Xint_gint_mul_sint_sint
#extern
fun
Xint_gint_div_sint_sint
{i,j:int}
( x
: sint(i)
, y
: sint(j)): sint( i/j ) // = $ext()
impltmp
gint_div_sint_sint<> = Xint_gint_div_sint_sint
#extern
fun
Xint_gint_mod_sint_sint
{i,j:int}
( x
: sint(i)
, y
: sint(j)): sint(mod(i,j)) // = $ext()
impltmp
gint_mod_sint_sint<> = Xint_gint_mod_sint_sint
//
(* ****** ****** *)
//
// prelude/gflt.sats
//
(* ****** ****** *)
//
#extern
fun
Xint_gflt_i_dflt
( x0: sint ): dflt // = $ext()
impltmp
gflt_i_dflt<> = Xint_gflt_i_dflt
//
(* ****** ****** *)
//
#extern
fun
Xint_gflt_neg_dflt
  ( x0: dflt ): dflt // = $ext()
impltmp
gflt_neg_dflt<> = Xint_gflt_neg_dflt
//
#extern
fun
Xint_gflt_abs_dflt
  ( x0: dflt ): dflt // = $ext()
impltmp
gflt_abs_dflt<> = Xint_gflt_abs_dflt
//
(* ****** ****** *)
//
#extern
fun
Xint_gflt_succ_dflt
  ( x0: dflt ): dflt // = $ext()
impltmp
gflt_succ_dflt<> = Xint_gflt_succ_dflt
#extern
fun
Xint_gflt_pred_dflt
  ( x0: dflt ): dflt // = $ext()
impltmp
gflt_pred_dflt<> = Xint_gflt_pred_dflt
//
(* ****** ****** *)
//
#extern
fun
Xint_gflt_lt_dflt_dflt
( x0: dflt, y0: dflt ): bool // = $ext()
#extern
fun
Xint_gflt_gt_dflt_dflt
( x0: dflt, y0: dflt ): bool // = $ext()
#extern
fun
Xint_gflt_eq_dflt_dflt
( x0: dflt, y0: dflt ): bool // = $ext()
#extern
fun
Xint_gflt_lte_dflt_dflt
( x0: dflt, y0: dflt ): bool // = $ext()
#extern
fun
Xint_gflt_gte_dflt_dflt
( x0: dflt, y0: dflt ): bool // = $ext()
#extern
fun
Xint_gflt_neq_dflt_dflt
( x0: dflt, y0: dflt ): bool // = $ext()
//
impltmp
gflt_lt_dflt_dflt<> = Xint_gflt_lt_dflt_dflt
impltmp
gflt_gt_dflt_dflt<> = Xint_gflt_gt_dflt_dflt
impltmp
gflt_eq_dflt_dflt<> = Xint_gflt_eq_dflt_dflt
impltmp
gflt_lte_dflt_dflt<> = Xint_gflt_lte_dflt_dflt
impltmp
gflt_gte_dflt_dflt<> = Xint_gflt_gte_dflt_dflt
impltmp
gflt_neq_dflt_dflt<> = Xint_gflt_neq_dflt_dflt
//
(* ****** ****** *)
//
#extern
fun
Xint_gflt_cmp_dflt_dflt
( x0: dflt, y0: dflt ): sint // = $ext()
impltmp
gflt_cmp_dflt_dflt<> = Xint_gflt_cmp_dflt_dflt
//
(* ****** ****** *)
//
#extern
fun
Xint_gflt_add_dflt_dflt
( x0: dflt, y0: dflt ): dflt // = $ext()
#extern
fun
Xint_gflt_sub_dflt_dflt
( x0: dflt, y0: dflt ): dflt // = $ext()
#extern
fun
Xint_gflt_mul_dflt_dflt
( x0: dflt, y0: dflt ): dflt // = $ext()
#extern
fun
Xint_gflt_div_dflt_dflt
( x0: dflt, y0: dflt ): dflt // = $ext()
//
impltmp
gflt_add_dflt_dflt<> = Xint_gflt_add_dflt_dflt
impltmp
gflt_sub_dflt_dflt<> = Xint_gflt_sub_dflt_dflt
impltmp
gflt_mul_dflt_dflt<> = Xint_gflt_mul_dflt_dflt
impltmp
gflt_div_dflt_dflt<> = Xint_gflt_div_dflt_dflt
//
(* ****** ****** *)
//
// prelude/string.sats
//
(* ****** ****** *)
//
(*
In Xint,
string and string_vt are
of the same representation!!!
*)
impltmp
string_vt2t<>
( cs ) = $UN.castlin01(cs)
//
(* ****** ****** *)
//
#extern
fun
Xint_string_print
( x0: string ) : void // = $ext()
impltmp
string_print<> = Xint_string_print
//
(* ****** ****** *)
//
#extern
fun
Xint_string_head_opt
( x0 : string ) : char // = $ext()
impltmp
string_head_opt<> = Xint_string_head_opt
//
(* ****** ****** *)
//
#extern
fun
Xint_string_head_raw
( x0 : string ) : char // = $ext()
fun
Xint_string_tail_raw
( x0: string ) : string // = $ext()
impltmp
string_head_raw<> = Xint_string_head_raw
impltmp
string_tail_raw<> = Xint_string_tail_raw
//
(* ****** ****** *)
//
#extern
fun
Xint_strtmp_vt_alloc
{n:nat}
(len: int(n)): strtmp_vt(n)
impltmp
strtmp_vt_alloc<> = Xint_strtmp_vt_alloc
//
#extern
fun
Xint_string_get_at
{n:nat}
{i:int|i<n}
( p0:
  string(n)
, i0: int(i)): cgtz
impltmp
string_get_at<> = Xint_string_get_at
//
#extern
fun
Xint_strtmp_vt_set_at
{n:nat}
{i:int|i<n}
( p0:
! strtmp_vt(n), i0:int(i), c0:cgtz): void
impltmp
strtmp_vt_set_at<> = Xint_strtmp_vt_set_at
//
(* ****** ****** *)
//
// prelude/garr.sats
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
Xint_a0ptr_alloc
{a:vt}((*void*)): a0ptr(?a)
impltmp
{a:vt}
a0ptr_alloc<a> = Xint_a0ptr_alloc
//
#extern
fun
Xint_a0ref_get
{a:vt}
(A0: a0ref(a)): ~a
#extern
fun
Xint_a0ref_set
{a:vt}
(A0: a0ref(a), x0: a): void
//
impltmp
{a:vt}
a0ref_get<a>
(A0) = Xint_a0ref_get{a}(A0)
impltmp
{a:vt}
a0ref_set<a>
(A0, x0) = Xint_a0ref_set{a}(A0, x0)
//
(* ****** ****** *)
//
#extern
fun
Xint_a1ptr_alloc
{a:vt}{n:int}
( asz: int(n) ): a1ptr(?a)
impltmp
{a:vt}
a1ptr_alloc<a> = Xint_a1ptr_alloc
//
#extern
fun
Xint_a1ref_head_raw
{a:vt}{n:int}
( A0
: a1ref(a, n) ): ~a
#extern
fun
Xint_a1ref_tail_raw
{a:vt}{n:int}
( A0
: a1ref(a, n) ): a1ref(a, n-1)
//
#extern
fun
Xint_a1ref_get_at_raw
{a:vt}{n:int}
( A0
: a1ref(a, n), i0: int): ~a
#extern
fun
Xint_a1ptr_get_at_raw
{a:vt}{n:int}
( A0:
! a1ptr(a, n), i0: int): ~a
//
#extern
fun
Xint_a1ref_set_at_raw
{a:vt}{n:int}
( A0
: a1ref(a, n), i0: int, x0: a): void
#extern
fun
Xint_a1ptr_set_at_raw
{a:vt}{n:int}
( A0:
! a1ptr(a, n), i0: nintlt(n), x0: a): void
//
(* ****** ****** *)
//
impltmp
{a:vt}
a1ref_head<a>
(A0) =
Xint_a1ref_head_raw{a}(A0)
impltmp
{a:vt}
a1ref_tail<a>
(A0) =
Xint_a1ref_tail_raw{a}(A0)
//
impltmp
{a:vt}
a1ref_get_at<a>
(A0, i0) =
Xint_a1ref_get_at_raw{a}(A0, i0)
impltmp
{a:vt}
a1ptr_get_at<a>
(A0, i0) =
Xint_a1ptr_get_at_raw{a}(A0, i0)
//
impltmp
{a:vt}
a1ref_set_at<a>
(A0, i0, x0) =
Xint_a1ref_set_at_raw{a}(A0, i0, x0)
impltmp
{a:vt}
a1ptr_set_at<a>
(A0, i0, x0) =
Xint_a1ptr_set_at_raw{a}(A0, i0, x0)
impltmp
{a:vt}
a1ptr_set_at_raw<a>
(A0, i0, x0) =
Xint_a1ptr_set_at_raw{a}(A0, i0, x0)
//
(* ****** ****** *)
//
#extern
fun
Xint_rand_nint_limit
{n:pos}(limit: int(n)): nintlt(n)
//
impltmp
rand_nint_limit<> = Xint_rand_nint_limit
//
(* ****** ****** *)

(* end of [Xint_runtime.dats] *)

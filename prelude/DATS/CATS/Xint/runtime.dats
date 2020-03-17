(* ****** ****** *)
(*
** The runtime for Xinterp
*)
(* ****** ****** *)
//
// prelude/bool.sats
//
(* ****** ****** *)
//
#extern
fun
xint_bool_neg
{b0:bool}
( b0
: bool(b0)
) : bool(~b0) = $ext()
impltmp
bool_neg<> = xint_bool_neg
//
(* ****** ****** *)
//
#extern
fun
xint_bool_add
{b1,b2:bool}
( b1
: bool(b1)
, b2
: bool(b2)
) : bool(b1+b2) = $ext()
#extern
fun
xint_bool_mul
{b1,b2:bool}
( b1
: bool(b1)
, b2
: bool(b2)
) : bool(b1*b2) = $ext()
//
impltmp
bool_add<> = xint_bool_add
impltmp
bool_mul<> = xint_bool_mul
//
(* ****** ****** *)
//
#extern
fun
xint_bool_print
( b0
: bool): void = $ext()
impltmp
bool_print<> = xint_bool_print
//
(* ****** ****** *)
//
// prelude/char.sats
//
(* ****** ****** *)
//
#extern
fun
xint_char_eqzq
{c:char}
( c0
: char(c)
) : bool(c=0) = $ext()
#extern
fun
xint_char_neqzq
{c:char}
( c0
: char(c)
) : bool(c>0) = $ext()
//
impltmp
char_eqzq<> = xint_char_eqzq
impltmp
char_neqzq<> = xint_char_neqzq
//
(* ****** ****** *)
//
#extern
fun
xint_char_equal
{c1,c2:char}
( c1
: char(c1)
, c2
: char(c2)
) : bool(c1=c2) = $ext()
#extern
fun
xint_char_noteq
{c1,c2:char}
( c1
: char(c1)
, c2
: char(c2)
) : bool(c1!=c2) = $ext()
//
impltmp
char_equal<> = xint_char_equal
impltmp
char_noteq<> = xint_char_noteq
//
(* ****** ****** *)
//
#extern
fun
xint_char_cmp
( c1: char
, c2: char): sint = $ext()
impltmp
char_cmp<> = xint_char_cmp
//
(* ****** ****** *)
//
#extern
fun
xint_char_print
(c0: char): void = $ext()
impltmp
char_print<> = xint_char_print
//
(* ****** ****** *)
//
// prelude/gint.sats
//
(* ****** ****** *)
//
#extern
fun
xint_gint_print_sint
  (x0: sint): void = $ext()
impltmp
gint_print_sint<> = xint_gint_print_sint
//
(* ****** ****** *)
//
#extern
fun
xint_gint_neg_sint
{i:int}
(x0: sint(i)): sint(-i) = $ext()
impltmp
gint_neg_sint<> = xint_gint_neg_sint
//
#extern
fun
xint_gint_succ_sint
{i:int}
(x0: sint(i)): sint(i+1) = $ext()
#extern
fun
xint_gint_pred_sint
{i:int}
(x0: sint(i)): sint(i-1) = $ext()
impltmp
gint_succ_sint<> = xint_gint_succ_sint
impltmp
gint_pred_sint<> = xint_gint_pred_sint
//
(* ****** ****** *)

#extern
fun
xint_gint_lt_sint_sint
{i,j:int}
( x: sint(i)
, y: sint(j)): bool(i<j) = $ext()
impltmp
gint_lt_sint_sint<> = xint_gint_lt_sint_sint

#extern
fun
xint_gint_gt_sint_sint
{i,j:int}
( x: sint(i)
, y: sint(j)): bool(i>j) = $ext()
impltmp
gint_gt_sint_sint<> = xint_gint_gt_sint_sint

#extern
fun
xint_gint_eq_sint_sint
{i,j:int}
( x: sint(i)
, y: sint(j)): bool(i=j) = $ext()
impltmp
gint_eq_sint_sint<> = xint_gint_eq_sint_sint

#extern
fun
xint_gint_lte_sint_sint
{i,j:int}
( x: sint(i)
, y: sint(j)): bool(i<=j) = $ext()
impltmp
gint_lte_sint_sint<> = xint_gint_lte_sint_sint

#extern
fun
xint_gint_gte_sint_sint
{i,j:int}
( x: sint(i)
, y: sint(j)): bool(i>=j) = $ext()
impltmp
gint_gte_sint_sint<> = xint_gint_gte_sint_sint

#extern
fun
xint_gint_neq_sint_sint
{i,j:int}
( x: sint(i)
, y: sint(j)): bool(i!=j) = $ext()
impltmp
gint_neq_sint_sint<> = xint_gint_neq_sint_sint

(* ****** ****** *)

#extern
fun
xint_gint_cmp_sint_sint
{i,j:int}
( x
: sint(i)
, y
: sint(j)): sint(sgn(i-j)) = $ext()
impltmp
gint_cmp_sint_sint<> = xint_gint_cmp_sint_sint

(* ****** ****** *)
//
#extern
fun
xint_gint_add_sint_sint
{i,j:int}
( x: sint(i)
, y: sint(j)): sint( i+j ) = $ext()
impltmp
gint_add_sint_sint<> = xint_gint_add_sint_sint
#extern
fun
xint_gint_sub_sint_sint
{i,j:int}
( x: sint(i)
, y: sint(j)): sint( i-j ) = $ext()
impltmp
gint_sub_sint_sint<> = xint_gint_sub_sint_sint
//
#extern
fun
xint_gint_mul_sint_sint
{i,j:int}
( x: sint(i)
, y: sint(j)): sint( i*j ) = $ext()
impltmp
gint_mul_sint_sint<> = xint_gint_mul_sint_sint
#extern
fun
xint_gint_div_sint_sint
{i,j:int}
( x: sint(i)
, y: sint(j)): sint( i/j ) = $ext()
impltmp
gint_div_sint_sint<> = xint_gint_div_sint_sint
#extern
fun
xint_gint_mod_sint_sint
{i,j:int}
( x: sint(i)
, y: sint(j)): sint(mod(i,j)) = $ext()
impltmp
gint_mod_sint_sint<> = xint_gint_mod_sint_sint
//
(* ****** ****** *)
//
// prelude/string.sats
//
(* ****** ****** *)
//
#extern
fun
xint_string_print
(x0: string): void = $ext()
impltmp
string_print<> = xint_string_print
//
(* ****** ****** *)
//
#extern
fun
xint_string_head
(x0: string): char = $ext()
impltmp
string_head<> = xint_string_head
//
#extern
fun
xint_string_head_raw
(x0: string): char = $ext()
fun
xint_string_tail_raw
(x0: string): string = $ext()
impltmp
string_head_raw<> = xint_string_head_raw
impltmp
string_tail_raw<> = xint_string_tail_raw
//
(* ****** ****** *)

(* end of [runtime.dats] *)

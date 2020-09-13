(* ****** ****** *)
(*
Basics for Xats2js
*)
(* ****** ****** *)
//
// prelude/bool.sats
//
(* ****** ****** *)
//
#extern
fun
JS_bool_neg
{b0:bool}
( b0
: bool(b0)
)
: bool(~b0) // = $ext()
//
impltmp bool_neg<> = JS_bool_neg
//
(* ****** ****** *)
//
#extern
fun
JS_bool_add
{b1,b2:bool}
( b1
: bool(b1)
, b2
: bool(b2)
)
: bool(b1+b2) // = $ext()
#extern
fun
JS_bool_mul
{b1,b2:bool}
( b1
: bool(b1)
, b2
: bool(b2)
)
: bool(b1*b2) // = $ext()
//
impltmp bool_add<> = JS_bool_add
impltmp bool_mul<> = JS_bool_mul
//
(* ****** ****** *)
//
// prelude/gint.sats
//
(* ****** ****** *)
//
#extern
fun
JS_gint_neg_sint
{i:int}
( x0
: sint(i)): sint(-i) // = $ext()
impltmp
gint_neg_sint<> = JS_gint_neg_sint
//
(* ****** ****** *)
//
#extern
fun
JS_gint_abs_sint
{i:int}
( x0
: sint(i)): sint(abs(i)) // = $ext()
impltmp
gint_abs_sint<> = JS_gint_abs_sint
//
(* ****** ****** *)
//
#extern
fun
JS_gint_succ_sint
{i:int}
( x0
: sint(i)): sint(i+1) // = $ext()
#extern
fun
JS_gint_pred_sint
{i:int}
( x0
: sint(i)): sint(i-1) // = $ext()
impltmp
gint_succ_sint<> = JS_gint_succ_sint
impltmp
gint_pred_sint<> = JS_gint_pred_sint
//
(* ****** ****** *)
//
#extern
fun
JS_gint_lt_sint_sint
{i,j:int}
( x
: sint(i)
, y
: sint(j)): bool(i<j) // = $ext()
impltmp
gint_lt_sint_sint<> = JS_gint_lt_sint_sint
//
#extern
fun
JS_gint_gt_sint_sint
{i,j:int}
( x
: sint(i)
, y
: sint(j)): bool(i>j) // = $ext()
impltmp
gint_gt_sint_sint<> = JS_gint_gt_sint_sint
//
#extern
fun
JS_gint_eq_sint_sint
{i,j:int}
( x
: sint(i)
, y
: sint(j)): bool(i=j) // = $ext()
impltmp
gint_eq_sint_sint<> = JS_gint_eq_sint_sint
//
#extern
fun
JS_gint_lte_sint_sint
{i,j:int}
( x
: sint(i)
, y
: sint(j)): bool(i<=j) // = $ext()
impltmp
gint_lte_sint_sint<> = JS_gint_lte_sint_sint
//
#extern
fun
JS_gint_gte_sint_sint
{i,j:int}
( x
: sint(i)
, y
: sint(j)): bool(i>=j) // = $ext()
impltmp
gint_gte_sint_sint<> = JS_gint_gte_sint_sint
//
#extern
fun
JS_gint_neq_sint_sint
{i,j:int}
( x
: sint(i)
, y
: sint(j)): bool(i!=j) // = $ext()
impltmp
gint_neq_sint_sint<> = JS_gint_neq_sint_sint
//
(* ****** ****** *)

#extern
fun
JS_gint_cmp_sint_sint
{i,j:int}
( x
: sint(i)
, y
: sint(j)): sint(sgn(i-j)) // = $ext()
impltmp
gint_cmp_sint_sint<> = JS_gint_cmp_sint_sint

(* ****** ****** *)
//
#extern
fun
JS_gint_add_sint_sint
{i,j:int}
( x
: sint(i)
, y
: sint(j)): sint( i+j ) // = $ext()
impltmp
gint_add_sint_sint<> = JS_gint_add_sint_sint
#extern
fun
JS_gint_sub_sint_sint
{i,j:int}
( x
: sint(i)
, y
: sint(j)): sint( i-j ) // = $ext()
impltmp
gint_sub_sint_sint<> = JS_gint_sub_sint_sint
//
#extern
fun
JS_gint_mul_sint_sint
{i,j:int}
( x
: sint(i)
, y
: sint(j)): sint( i*j ) // = $ext()
impltmp
gint_mul_sint_sint<> = JS_gint_mul_sint_sint
#extern
fun
JS_gint_div_sint_sint
{i,j:int}
( x
: sint(i)
, y
: sint(j)): sint( i/j ) // = $ext()
impltmp
gint_div_sint_sint<> = JS_gint_div_sint_sint
#extern
fun
JS_gint_mod_sint_sint
{i,j:int}
( x
: sint(i)
, y
: sint(j)): sint(mod(i,j)) // = $ext()
impltmp
gint_mod_sint_sint<> = JS_gint_mod_sint_sint
//
(* ****** ****** *)
//
// prelude/gflt.sats
//
(* ****** ****** *)
//
#extern
fun
JS_gflt_i_dflt
( x0: sint ): dflt // = $ext()
impltmp
gflt_i_dflt<> = JS_gflt_i_dflt
//
(* ****** ****** *)
//
#extern
fun
JS_gflt_neg_dflt
  ( x0: dflt ): dflt // = $ext()
impltmp
gflt_neg_dflt<> = JS_gflt_neg_dflt
//
#extern
fun
JS_gflt_abs_dflt
  ( x0: dflt ): dflt // = $ext()
impltmp
gflt_abs_dflt<> = JS_gflt_abs_dflt
//
(* ****** ****** *)
//
#extern
fun
JS_gflt_succ_dflt
  ( x0: dflt ): dflt // = $ext()
impltmp
gflt_succ_dflt<> = JS_gflt_succ_dflt
#extern
fun
JS_gflt_pred_dflt
  ( x0: dflt ): dflt // = $ext()
impltmp
gflt_pred_dflt<> = JS_gflt_pred_dflt
//
(* ****** ****** *)
//
#extern
fun
JS_gflt_lt_dflt_dflt
( x0: dflt, y0: dflt ): bool // = $ext()
#extern
fun
JS_gflt_gt_dflt_dflt
( x0: dflt, y0: dflt ): bool // = $ext()
#extern
fun
JS_gflt_eq_dflt_dflt
( x0: dflt, y0: dflt ): bool // = $ext()
#extern
fun
JS_gflt_lte_dflt_dflt
( x0: dflt, y0: dflt ): bool // = $ext()
#extern
fun
JS_gflt_gte_dflt_dflt
( x0: dflt, y0: dflt ): bool // = $ext()
#extern
fun
JS_gflt_neq_dflt_dflt
( x0: dflt, y0: dflt ): bool // = $ext()
//
impltmp
gflt_lt_dflt_dflt<> = JS_gflt_lt_dflt_dflt
impltmp
gflt_gt_dflt_dflt<> = JS_gflt_gt_dflt_dflt
impltmp
gflt_eq_dflt_dflt<> = JS_gflt_eq_dflt_dflt
impltmp
gflt_lte_dflt_dflt<> = JS_gflt_lte_dflt_dflt
impltmp
gflt_gte_dflt_dflt<> = JS_gflt_gte_dflt_dflt
impltmp
gflt_neq_dflt_dflt<> = JS_gflt_neq_dflt_dflt
//
(* ****** ****** *)
//
#extern
fun
JS_gflt_cmp_dflt_dflt
( x0: dflt, y0: dflt ): sint // = $ext()
impltmp
gflt_cmp_dflt_dflt<> = JS_gflt_cmp_dflt_dflt
//
(* ****** ****** *)
//
#extern
fun
JS_gflt_add_dflt_dflt
( x0: dflt, y0: dflt ): dflt // = $ext()
#extern
fun
JS_gflt_sub_dflt_dflt
( x0: dflt, y0: dflt ): dflt // = $ext()
#extern
fun
JS_gflt_mul_dflt_dflt
( x0: dflt, y0: dflt ): dflt // = $ext()
#extern
fun
JS_gflt_div_dflt_dflt
( x0: dflt, y0: dflt ): dflt // = $ext()
//
impltmp
gflt_add_dflt_dflt<> = JS_gflt_add_dflt_dflt
impltmp
gflt_sub_dflt_dflt<> = JS_gflt_sub_dflt_dflt
impltmp
gflt_mul_dflt_dflt<> = JS_gflt_mul_dflt_dflt
impltmp
gflt_div_dflt_dflt<> = JS_gflt_div_dflt_dflt
//
(* ****** ****** *)

(* end of [JS_basics.dats] *)

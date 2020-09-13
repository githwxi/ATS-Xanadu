(* ****** ****** *)
(*
** The runtime for Xats2js
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

(* end of [JS_runtime.dats] *)

(* ****** ****** *)
(*
** The runtime for Xats2js
*)
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
impltmp
bool_neg<> = JS_bool_neg
//
(* ****** ****** *)

(* end of [JS_runtime.dats] *)

(* ****** ****** *)
(*
Eqref for Xats2js
*)
(* ****** ****** *)
//
impltmp
{a:t0}
g_eqref<a> =
XATS2JS_g_eqref{a}
where
{
#extern
fun
XATS2JS_g_eqref
{a:t0}
(x1: a, x2: a): bool = $exname()
}
//
impltmp
{a:t0}
g_neqrf<a> =
XATS2JS_g_eqref{a}
where
{
#extern
fun
XATS2JS_g_neqrf
{a:t0}
(x1: a, x2: a): bool = $exname()
}
//
(* ****** ****** *)

(* end of [XATS2JS_g_eqref.dats] *)

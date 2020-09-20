(* ****** ****** *)
(*
** HX-2020-09:
** xats2js:
** for unsafe functions
*)
(* ****** ****** *)
#staload
UN =
"prelude/SATS/unsafe.sats"
(* ****** ****** *)
#extern
fun
JS_UN_p2tr_get
{a:vt}
(p0: p2tr(a)): a // = $ext()
impltmp
<a>(*tmp*)
$UN.p2tr_get = JS_UN_p2tr_get
(* ****** ****** *)
#extern
fun
JS_UN_p2tr_set
{a:vt}
( p0
: p2tr(a), x0: a): void // = $ext()
impltmp
<a>(*tmp*)
$UN.p2tr_set = JS_UN_p2tr_set
(* ****** ****** *)

(* end of [JS_unsafe.dats] *)

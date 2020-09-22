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
XATS2JS_UN_p2tr_get
{a:vt}
(p0: p2tr(a)): a // = $ext()
impltmp
<a>(*tmp*)
$UN.p2tr_get = XATS2JS_UN_p2tr_get
(* ****** ****** *)
#extern
fun
XATS2JS_UN_p2tr_set
{a:vt}
( p0
: p2tr(a), x0: a): void // = $ext()
impltmp
<a>(*tmp*)
$UN.p2tr_set = XATS2JS_UN_p2tr_set
(* ****** ****** *)

(* end of [XATS2JS_unsafe.dats] *)

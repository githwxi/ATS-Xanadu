(* ****** ****** *)
(*
** HX-2020-09:
** xats2js:
** for unsafe functions
*)
(* ****** ****** *)
#staload
UN =
"prelude/SATS/unsafex.sats"
(* ****** ****** *)
#extern
fun
XATS2JS_UN_p2tr_get
{a:vt}
( p0
: p2tr(a)): (a)
= $exname((*self*))
#impltmp
<a>(*tmp*)
$UN.p2tr_get = XATS2JS_UN_p2tr_get
(* ****** ****** *)
#extern
fun
XATS2JS_UN_p2tr_set
{a:vt}
( p0
: p2tr(a), x0: a): void
= $exname((*self*))
#impltmp
<a>(*tmp*)
$UN.p2tr_set = XATS2JS_UN_p2tr_set
(* ****** ****** *)

(* end of [prelude_DATS_CATS_JS_unsafex.dats] *)

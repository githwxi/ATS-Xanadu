(* ****** ****** *)
(*
** HX-2020-09:
** xats2js:
** for unsafe functions
*)
(* ****** ****** *)
//
#staload UN =
"srcgen1\
/prelude/SATS/unsafex.sats"
//
(* ****** ****** *)
//
#impltmp
<a>(*tmp*)
$UN.p2tr_get =
XATS2JS_UN_p2tr_get where
{
#extern
fun
XATS2JS_UN_p2tr_get
{a:vt}
(p0: p2tr(a)): (a) = $extnam()
}
//
(* ****** ****** *)
//
#impltmp
<a>(*tmp*)
$UN.p2tr_set =
XATS2JS_UN_p2tr_set where
{
#extern
fun
XATS2JS_UN_p2tr_set
{a:vt}
( p0
: p2tr(a), x0: a): void = $extnam()
}
//
(* ****** ****** *)
(* ****** ****** *)
//
(* ****** ****** *)(* ****** ****** *)(* ****** ****** *)
(* ****** ****** *)(* ****** ****** *)(* ****** ****** *)

(* end of [ATS3/XANADU_srcgen1_prelude_DATS_CATS_JS_unsafex.dats] *)

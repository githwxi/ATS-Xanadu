(* ****** ****** *)
(* ****** ****** *)
#staload UN =
"prelude/SATS/unsfx00.sats"
(* ****** ****** *)
(* ****** ****** *)
//
#include
"prelude/HATS/prelude_dats.hats"
#include
"prelude/HATS/prelude_JS_dats.hats"
#include
"prelude/HATS/prelude_NODE_dats.hats"
//
(* ****** ****** *)
(* ****** ****** *)
//
fun
strm_sint$from
( n0
: sint): strm(sint) =
$lazy(
strmcon_cons
(n0, strm_sint$from(n0+1))
where{
val () = printsln("\
strm_sint$from: n0 = ", n0)})
//end-of-(strm_sint$from(...))
//
(* ****** ****** *)
(* ****** ****** *)
//
val xs = strm_sint$from(101)
//
val () =
(
printsln("x1 = ", x1)
) where
{
val-strmcon_cons(x1, ys) = (!xs)}
val () =
(
printsln("x1 = ", x1)
) where
{
val-strmcon_cons(x1, ys) = (!xs)}
//
(* ****** ****** *)
(* ****** ****** *)
//
(*
fun
strm_vt_sint$from
( n0
: sint): strm_vt(sint) =
$llazy(
(
printsln("\
strm_vt_sint$from: n0 = ", n0)
;
strmcon_vt_cons
(n0, strm_vt_sint$from(n0+1))))
//
val xs = strm_vt_sint$from(101)
//
val () =
printsln("x1 = ", x1)
where{
val-strmcon_vt_cons(x1, ys) = (!xs)}
val () =
printsln("x1 = ", x1)
where{
val-strmcon_vt_cons(x1, ys) = (!xs)}
*)
//
(* ****** ****** *)
(* ****** ****** *)
//
(***********************************************************************)
(* end of [ATS3/XANADU_srcgen2_xats2js_srcgen1_TEST_test10_xats2js.dats] *)
(***********************************************************************)

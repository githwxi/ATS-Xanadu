(* ****** ****** *)
#staload UN =
"prelude/SATS/unsafex.sats"
(* ****** ****** *)
//
#include
"prelude/HATS/prelude_dats.hats"
//
#include
"prelude/HATS/CATS/JS/prelude_dats.hats"
//
(* ****** ****** *)
#impltmp
< (*tmp*) >
gint_add_sint_sint
  (x , y) =
gint_add_sint_sint<>(x, y)
(* ****** ****** *)

fun foo() = 1 + 2

(* ****** ****** *)
////
(* ****** ****** *)
//
// (*
fun
fact2
(xs: sint) =
foldl(xs, 1.0) where
{
#impltmp
foldl$fopr(r0:dflt, x0) = r0 * (x0+1) }
// *)
//
(* ****** ****** *)
(* ****** ****** *)
//
(*
fun
fact2
(xs: sint) =
foldl_cfr(xs, 1.0, lam(r0:dflt,x0) => r0 * (x0+1))
*)
//
(* ****** ****** *)
(* ****** ****** *)

(* end of [(* end of [ATS3/XATSOPT_BOOT_JS_DATA_mytest03.dats] *)

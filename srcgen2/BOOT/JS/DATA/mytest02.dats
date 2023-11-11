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
(* ****** ****** *)
//
(*
fun
fact2
(xs: sint): sint =
foldl(xs, 1) where
{
#typedef xs = sint
#typedef x0 = sint
#typedef r0 = sint
#impltmp
foldl$fopr<xs><x0><r0>(r0, x0) = r0 * (x0+1)
}
*)
//
(* ****** ****** *)
(* ****** ****** *)
//
fun
fact2
(xs: sint) =
foldl_cfr(xs, 1.0, lam(r0:dflt,x0) => r0 * (x0+1))
//
(* ****** ****** *)
(* ****** ****** *)

(* end of [(* end of [ATS3/XATSOPT_BOOT_JS_DATA_mytest02.dats] *)

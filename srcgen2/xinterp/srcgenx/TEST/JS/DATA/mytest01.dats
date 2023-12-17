(* ****** ****** *)
#staload UN =
"prelude/SATS/unsafex.sats"
(* ****** ****** *)
//
#include
"prelude/HATS/prelude_dats.hats"
//
#include
"prelude/HATS/CATS/Xint/prelude_dats.hats"
//
(* ****** ****** *)
val N1 = 5
val N2 = (N1+N1)
val N3 = (N1*N2)
(* ****** ****** *)
(* ****** ****** *)
//
fun
fact1
(x: sint): sint =
if (x > 0) then x * fact1(x-1) else 1
//
(* ****** ****** *)
(* ****** ****** *)

(* end of [(* end of [ATS3/XATSOPT_BOOT_JS_DATA_mytest01.dats] *)

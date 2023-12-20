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
if (x > 0)
then x * fact1(x-1) else 1
//
(* ****** ****** *)
//
fun
fibo1
(x: sint): sint =
if (x >= 2)
then fibo1(x-2)+fibo1(x-1) else x
//
(* ****** ****** *)
//
fun
fact2
(x: sint): sint =
(
  loop@(x, 1)) where
{
fun
loop
@(x: sint, r: sint): sint =
if x > 0 then loop@(x-1, x*r) else r
}
//
(* ****** ****** *)
(* ****** ****** *)
val fact1_10 = fact1(10)
(* ****** ****** *)
val fibo1_10 = fibo1(10)
(* ****** ****** *)
val fact2_10 = fact2(10)
(* ****** ****** *)
(* ****** ****** *)

(* end of [(* end of [ATS3/XATSOPT_BOOT_JS_DATA_mytest01.dats] *)

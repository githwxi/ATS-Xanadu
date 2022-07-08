(* ****** ****** *)
(*
Fri Jul  8 15:05:48 EDT 2022
*)
(* ****** ****** *)
#include "./xats2js_test.hats"
(* ****** ****** *)

#staload F = "./../SATS/functor.sats"
#staload _ = "./../DATS/functor.dats"

(* ****** ****** *)

val (  ) =
prerrln
(
$F.fmap<optn>
(lam(x:int): int => x+1)(optn(100)))

(* ****** ****** *)

val (  ) =
prerrln
(
$F.fmap<list>
(lam(x:int): int => x+1)(list_btw(0,10)))

(* ****** ****** *)

(* end of [ATS3_xatslib_haskell_test02_functor.dats] *)

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

val ( ) =
proutsln
(
$F.fmap<optn>
(lam(x:int): int => x+1,optn(100)))

(* ****** ****** *)

val ( ) =
proutsln
(
$F.fmap<list>
(lam(x:int): int => x+1,list_btw(0,10)))

(* ****** ****** *)

val ( ) =
proutsln
(
$F.fmap<strm>
(lam(x:int): int => x+1,strm_from( 0 )))

(* ****** ****** *)
(* ****** ****** *)
//
(***********************************************************************)
(* end of [ATS3_srcgen1_xatslib_haskell_TEST_test02_functor.dats] *)
(***********************************************************************)

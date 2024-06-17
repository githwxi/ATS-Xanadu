(* ****** ****** *)
(*
Fri Jul  8 15:05:48 EDT 2022
*)
(* ****** ****** *)
#include "./xats2js_test.hats"
(* ****** ****** *)

#staload M = "./../SATS/monoid0.sats"
#staload _ = "./../DATS/monoid0.dats"

(* ****** ****** *)

val xs02 = list(0, 1, 2)
val xs35 = list(3, 4, 5)
val xs69 = list(6, 7, 8, 9)
val (  ) =
prerrln($M.mconcat(list(xs02, xs35, xs69)))

(* ****** ****** *)

val opt0 = optn(xs02)
val opt1 = optn(xs35)
val opt2 = optn(xs69)
val (  ) =
prerrln($M.mconcat(list(opt0, opt1, opt2)))

(* ****** ****** *)

(* end of [ATS3_xatslib_haskell_test01_monoid.dats] *)


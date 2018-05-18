(* ****** ****** *)
(*
** HX-2018-05-16
** Unit testing. Kind of.
*)
(* ****** ****** *)
//
#include
"share/atspre_staload.hats"
//
(* ****** ****** *)
//
#staload
"./../SATS/symbol.sats"
//
(* ****** ****** *)

local
//
#include "./../DATS/symbol.dats"
//
in
  // nothing
end // end of [local]

(* ****** ****** *)
//
val () =
println!
("Hello from [test_symbol]!")
//
(* ****** ****** *)

implement main0() = ((*void*))

(* ****** ****** *)

(* end of [test_symbol.dats] *)

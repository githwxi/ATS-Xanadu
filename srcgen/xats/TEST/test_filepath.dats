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
#staload "./../SATS/filepath.sats"
//
(* ****** ****** *)

local
//
#include "./../DATS/filepath.dats"
//
in
  // nothing
end // end of [local]

(* ****** ****** *)
//
val () =
println!
("Hello from [test_filepath]!")
//
(* ****** ****** *)

implement main0() = ((*void*))

(* ****** ****** *)

(* end of [test_filepath.dats] *)

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
#staload "./../SATS/lexbuf.sats"
//
(* ****** ****** *)

local
//
#include
"./../DATS/symbol.dats"
#include
"./../DATS/location.dats"
#include
"./../DATS/filepath.dats"
//
#include "./../DATS/lexbuf.dats"
//
in
  // nothing
end // end of [local]

(* ****** ****** *)
//
val () =
println!
("Hello from [test_lexbuf]!")
//
(* ****** ****** *)

implement main0() = ((*void*))

(* ****** ****** *)

(* end of [test_lexbuf.dats] *)

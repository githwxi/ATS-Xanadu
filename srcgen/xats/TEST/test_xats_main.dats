(* ****** ****** *)
(*
** HX-2018-06-30
** Testing. Kind of.
*)
(* ****** ****** *)
//
#include
"share/atspre_staload.hats"
#include
"share/atspre_staload_libats_ML.hats"
//
(* ****** ****** *)

local
//
#include
"./../../util/DATS/cblist.dats"
#include
"./../../util/DATS/Posix/cblist.dats"
//
in
  // nothing
end // end of [local]

(* ****** ****** *)

local
//
(* ****** ****** *)
//
#include
"./../DATS/symbol.dats"
#include
"./../DATS/location.dats"
#include
"./../DATS/filepath.dats"
//
(* ****** ****** *)
//
#include"./../DATS/lexbuf.dats"
//
#include"./../DATS/lexing_token.dats"
#include"./../DATS/lexing_kword.dats"
//
#include"./../DATS/lexing_util0.dats"
//
(* ****** ****** *)
//
#include"./../DATS/staexp0.dats"
#include"./../DATS/staexp0_print.dats"
//
(* ****** ****** *)
//
#include"./../DATS/parsing_tokbuf.dats"
//
#include"./../DATS/parsing_basics.dats"
#include"./../DATS/parsing_staexp.dats"
#include"./../DATS/parsing_dynexp.dats"
//
(* ****** ****** *)
//
in
  // nothing
end // end of [local]

(* ****** ****** *)

implement
main0() =
{
//
val () =
println!
("Hello from [test_xats_main]!")
//
} (* end of [main0] *)

(* ****** ****** *)

#staload "./../SATS/lexing.sats"

(* ****** ****** *)

val-
toks =
(
string_tokenize
("foo(x + 1 - 2 * 3 / 4) + bar")
)
//
val
toks =
list_vt2t(toks)
//
val ((*void*)) =
list0_foreach<token>
( g0ofg1(toks)
, lam(tok) => fprint_token(stdout_ref, tok))
//
(* ****** ****** *)

(* end of [test_xats_main.dats] *)

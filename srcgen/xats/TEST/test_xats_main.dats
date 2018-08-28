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
"./../DATS/basics.dats"
//
#include
"./../DATS/symbol.dats"
#include
"./../DATS/symmap.dats"
#include
"./../DATS/symenv.dats"
//
#include
"./../DATS/label0.dats"
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
#include"./../DATS/dynexp0.dats"
#include"./../DATS/staexp0_print.dats"
#include"./../DATS/dynexp0_print.dats"
//
(* ****** ****** *)
//
#include"./../DATS/parsing_tokbuf.dats"
//
#include"./../DATS/parsing_basics.dats"
//
#include"./../DATS/parsing_staexp.dats"
//
#include"./../DATS/parsing_dynexp.dats"
//
(* ****** ****** *)
//
#include"./../DATS/staexp1.dats"
#include"./../DATS/dynexp1.dats"
#include"./../DATS/staexp1_print.dats"
#include"./../DATS/dynexp1_print.dats"
//
(* ****** ****** *)

#include "./../DATS/fixity.dats"

#include"./../DATS/trans01_envmap.dats"
#include"./../DATS/trans01_staexp.dats"
#include"./../DATS/trans01_dynexp.dats"

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
//
#staload "./../SATS/lexing.sats"
//
#staload "./../SATS/staexp0.sats"
#staload "./../SATS/dynexp0.sats"
//
#staload "./../SATS/parsing.sats"
//
#staload "./../SATS/staexp1.sats"
#staload "./../SATS/dynexp1.sats"
//
(* ****** ****** *)

#staload "./../SATS/trans01.sats"

(* ****** ****** *)

implement
fprint_val<sort0> = fprint_sort0
implement
fprint_val<s0exp> = fprint_s0exp
implement
fprint_val<d0exp> = fprint_d0exp
implement
fprint_val<d0ecl> = fprint_d0ecl

(* ****** ****** *)
(*
//
val-
toks =
(
string_tokenize
("\
//
//
")
)
//
val
toks =
lexing_preprocess_tokenlst(toks)
//
val
toks =
list_vt2t(toks)
(*
val ((*void*)) =
list0_foreach<token>
( g0ofg1(toks)
, lam(tok) => fprint_token(stdout_ref, tok))
*)
//
val s0e0 = let
//
var err: int
var buf: tokbuf
val ((*void*)) = (err := 0)
val ((*void*)) =
tokbuf_initize_list(buf, toks)
//
in
  p_s0exp(buf, err)
end // end of [val]
//
val () = println! ("s0e0 = ", s0e0)
//
*)
(* ****** ****** *)

val opt =
fileref_open_opt
("./test_staexp.text", file_mode_r)
val-~Some_vt(inp) = opt
val
toks =
fileref_tokenize(inp)
val
toks =
lexing_preprocess_tokenlst(toks)
//
val toks = list_vt2t(toks)
//
val ((*void*)) =
list0_foreach<token>
( g0ofg1(toks)
, lam(tok) => println!(tok))
//
val d0cs = let
//
var err: int
var buf: tokbuf
val ((*void*)) = (err := 0)
val ((*void*)) =
  tokbuf_initize_list(buf, toks)
//
in
  p_d0eclseq_top(buf, err)
end // end of [val]

val () = println! ("d0cs = ", d0cs)

(* ****** ****** *)

val d1cs = d0eclist_trans(d0cs)

(* ****** ****** *)

(* end of [test_xats_main.dats] *)

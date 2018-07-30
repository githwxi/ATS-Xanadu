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
#include"./../DATS/staexp0_print.dats"
//
(* ****** ****** *)
//
#include"./../DATS/dynexp0.dats"
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
//
val-
toks =
(
string_tokenize
("\
foo $X.a b c ($A.d, bar($A.e, $A.f))\n\
prop type t0ype view viewtype viewt0ype")
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
(g0ofg1(toks), lam(tok) => fprint_token(stdout_ref, tok))
*)
//
val s0t0 = let
//
var err: int
var buf: tokbuf
val ((*void*)) = (err := 0)
val ((*void*)) =
tokbuf_initize_list(buf, toks)
//
in
  p_sort0(buf, err)
end // end of [val]

val () = println! ("s0t0 = ", s0t0)

(* ****** ****** *)
//
val-
toks =
(
string_tokenize
("\
$extype\"abcde\"
// lam@ x y z : int => x + y + z
// (lam(x: int, y)(z: bool): int => x + y)(1, 2)(false)
// @[int][n+100]\n\
// f@(x + 1, y, z | what)
// @{a=f(x), b=g(y), 3=h(z)}
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
(g0ofg1(toks), lam(tok) => fprint_token(stdout_ref, tok))
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

val () = println! ("s0e0 = ", s0e0)

(* ****** ****** *)

//
val-
toks =
(
string_tokenize
("\
let
  #nonfix x y z
in
  // nothing
endlet // end-of-let
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
(g0ofg1(toks), lam(tok) => fprint_token(stdout_ref, tok))
*)
//
val d0e0 = let
//
var err: int
var buf: tokbuf
val ((*void*)) = (err := 0)
val ((*void*)) =
tokbuf_initize_list(buf, toks)
//
in
  p_d0exp(buf, err)
end // end of [val]

val () = println! ("d0e0 = ", d0e0)

(* ****** ****** *)
//
val-
toks =
(
string_tokenize
("\
#infix < >
#infixl + -
#infixl && ||
// #infixl (0) & |
#infixr -> ->> =>>
#prefix 10 ! !!
// #postfix (&& + 10) ++ --
#nonfix print fprint forall
typedef foo(x: type+) = tup(int, int)
abstype foo(type+) == lam y => tup(int, int)
abstype foo(x: type+) <= lam y => tup(int, int)
#nonfix print fprint forall
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
(g0ofg1(toks), lam(tok) => fprint_token(stdout_ref, tok))
*)
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
  p_d0eclseq(buf, err)
end // end of [val]

val () = println! ("d0cs = ", d0cs)

(* ****** ****** *)

(* end of [test_xats_main.dats] *)

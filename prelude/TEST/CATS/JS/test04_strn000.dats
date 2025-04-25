(* ****** ****** *)
(*
HX-2024-08-09:
For testing prelude/JS!
*)
(* ****** ****** *)
(* ****** ****** *)
#staload UN =
"prelude/SATS/unsfx00.sats"
(* ****** ****** *)
(* ****** ****** *)
#staload _ =
"prelude/DATS/gdbg000.dats"
(* ****** ****** *)
(* ****** ****** *)
//
#include
"prelude/HATS/prelude_dats.hats"
#include
"prelude/HATS/prelude_JS_dats.hats"
//
(* ****** ****** *)
(* ****** ****** *)
//
val A9 = strn(9, 'a')
val () =
printsln("A9 = ", A9)
val () =
printsln("|A9| = ", length(A9))
//
(* ****** ****** *)
//
val AB = strn
(26, lam(i:sint) => 'a'+i)
val () = printsln("AB = ", AB)
//
val BA = strn_reverse(AB)
val () = printsln("BA = ", BA)
//
val
ABAB = appends(AB, AB)
val () = printsln("ABAB = ", ABAB)
val
ABBA = appends(AB, BA)
val () = printsln("ABBA = ", ABBA)
//
(* ****** ****** *)
(* ****** ****** *)
//
val
rABAB = strn$rconcat(@(AB, AB))
val () = printsln("rABAB = ", rABAB)
//
val
ABABAB = strn$concat(@(AB, AB, AB))
val () = printsln("ABABAB = ", ABABAB)
//
(* ****** ****** *)
(* ****** ****** *)
//
val wrd0 = "hello"
val wrds =
list_fmake_fwork<strn>
(
lam(work) =>
GASZ(wrd0).iforitm(
lam(i, ci) => GASZ(26).foritm
(
lam(j) =>
let
  val cj = 'a'+j
in
if ci = cj
then () else work
($UN.strn_fset$at$raw(wrd0, i, cj))
end)))
//
val (  ) = printsln("wrds = ", wrds)
//
(* ****** ****** *)
(* ****** ****** *)
//
val wrds =
list_fmake_fwork<strn>
(
lam(work) =>
GSEQ(wrd0).iforitm
(
lam(i, ci) => GASZ(26).foritm
(
lam(j) =>
let
  val cj = 'a'+j
in
if ci = cj
then () else work
($UN.strn_fset$at$raw(wrd0, i, cj))
end)))
//
val (  ) = printsln("wrds = ", wrds)
//
(* ****** ****** *)
(* ****** ****** *)
//
val () =
printsln
("prefix(\"abcde\", 3)=", prefix("abcde", 3))
val () =
printsln
("suffix(\"abcde\", 3)=", suffix("abcde", 3))
//
val () = printsln
("slice(\"abcde\", 1, 3)=", slice("abcde", 1, 3))
//
(* ****** ****** *)
(* ****** ****** *)
//
val () = console_log(the_print_store_flush())
//
(* ****** ****** *)
(* ****** ****** *)
//
(* ****** ****** *)(* ****** ****** *)(* ****** ****** *)
(* ****** ****** *)(* ****** ****** *)(* ****** ****** *)

(* end of [ATS3/XANADU_prelude_TEST_CATS_JS_test04_strn000.dats] *)

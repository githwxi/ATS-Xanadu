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
(*
#impltmp
sint_print
<(*tmp*)>(x0) = console_log(x0)
#impltmp
strn_print
<(*tmp*)>(x0) = console_log(x0)
*)
(* ****** ****** *)
//
#include
"prelude/HATS/prelude_dats.hats"
#include
"prelude/HATS/prelude_JS_dats.hats"
//
(* ****** ****** *)
//
val A9 =
strn_make_ncpy(9, 'a')
val () =
(
  printsln("A9 = ", A9))
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
rABAB =
gseq_strn$rconcat(@(AB, AB))
val () = printsln("rABAB = ", rABAB)
//
val
ABABAB =
gseq_strn$concat(@(AB, AB, AB))
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
gseq_iforitm
(
GASZ(wrd0),
lam(i, ci) => gseq_foritm
(
GASZ(26),
lam(j) =>
let
  val cj = 'a'+j
in
if ci = cj
then () else work
($UN.strn_fset$at$raw(wrd0, i, cj))
end
)
)
)
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
lam(i, ci) =>
gseq_foritm
(
GASZ(26),
lam(j) =>
let
  val cj = 'a'+j
in
if ci = cj
then () else work
($UN.strn_fset$at$raw(wrd0, i, cj))
end)))//end(list_fmake_fwork<strn>)
//
val (  ) = printsln("wrds = ", wrds)
//
(* ****** ****** *)
(* ****** ****** *)
//
val ab0 =
strn_make_nfun
(26, lam(i) => 'a'+i)
//
val ab1 = listize(ab0)
val ( ) = printsln("ab1 = ", strn(ab1))
//
val ab2 = strmize(ab0)
val ( ) = printsln("ab2 = ", strn(ab2))
//
val ab3 =
strmize(
list_make_nfun(26,
lam(i) =>
strn_make_nfun(1, lam(_) => 'z'+(-i))))
val ( ) = printsln("ab3 = ", strn(ab3))
//
(* ****** ****** *)
//
val () =
printsln
("prefix(\"abcde\", 3)=", prefix("abcde", 3))
val () =
printsln
("suffix(\"abcde\", 3)=", suffix("abcde", 3))
//
(*
// HX-2025-04-27:
val () = // out-of-bounds
printsln // error cannot be caught yet!
("prefix(\"abcde\", 10)=", prefix("abcde", 10))
*)
//
val () = printsln
("slice(\"abcde\", 1, 1)=", slice("abcde", 1, 1))
val () = printsln
("slice(\"abcde\", 1, 2)=", slice("abcde", 1, 2))
//
(* ****** ****** *)
(* ****** ****** *)
//
val () = console_log
("the_print_store:\n" + (the_print_store_flush()))
//
(* ****** ****** *)
(* ****** ****** *)
//
(***********************************************************************)
(* end of [ATS3/XANADU_prelude_TEST_CATS_JS_test04_strn000.dats] *)
(***********************************************************************)

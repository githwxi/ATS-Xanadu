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
#include
"srcgen2\
/prelude/HATS/prelude_dats.hats"
(* ****** ****** *)
#include
"srcgen2\
/prelude/HATS/prelude_JS_dats.hats"
(* ****** ****** *)
(*
#include
"srcgen2\
/prelude/HATS/prelude_NODE_dats.hats"
*)
(* ****** ****** *)
(* ****** ****** *)
//
val A9 = strn(9, 'a')
val () =
prints("A9 = ", A9, "\n")
val () = prints
("|A9| = ", length(A9), "\n")
//
(* ****** ****** *)
//
val AB = strn
(26, lam(i:sint) => 'a'+i)
val () = prints("AB = ", AB, "\n")
//
val BA = strn_reverse(AB)
val () = prints("BA = ", BA, "\n")
//
val
ABAB = appends(AB, AB)
val () = prints("ABAB = ", ABAB, "\n")
val
ABBA = appends(AB, BA)
val () = prints("ABBA = ", ABBA, "\n")
//
(* ****** ****** *)
(* ****** ****** *)
//
val
rABAB = strn$rconcat(@(AB, AB))
val () = prints("rABAB = ", rABAB, "\n")
//
val
ABABAB = strn$concat(@(AB, AB, AB))
val () = prints("ABABAB = ", ABABAB, "\n")
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
  end
)
)
)
//
val (  ) = prints("wrds = ", wrds, "\n")
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
    end
  )
)
)
//
val (  ) = prints("wrds = ", wrds, "\n")
//
(* ****** ****** *)
(* ****** ****** *)
//
val () = prints
("prefix(\"abcde\", 3)=", prefix("abcde", 3), "\n")
val () = prints
("suffix(\"abcde\", 3)=", suffix("abcde", 3), "\n")
//
val () = prints
("slice(\"abcde\", 1, 3)=", slice("abcde", 1, 3), "\n")
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

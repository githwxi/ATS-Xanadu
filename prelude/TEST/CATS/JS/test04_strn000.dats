(* ****** ****** *)
(*
HX-2024-08-09:
For testing prelude/JS!
*)
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
#include
"srcgen2\
/prelude/HATS/prelude_NODE_dats.hats"
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
val ABAB = appends(AB, AB)
val () = prints("ABAB = ", ABAB, "\n")
val ABBA = appends(AB, BA)
val () = prints("ABBA = ", ABBA, "\n")
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
(* ****** ****** *)(* ****** ****** *)(* ****** ****** *)
(* ****** ****** *)(* ****** ****** *)(* ****** ****** *)

(* end of [ATS3/XANADU_prelude_TEST_CATS_JS_test04_strn000.dats] *)

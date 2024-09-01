(* ****** ****** *)
(*
HX-2024-08-09:
For testing xatslib/JS!
*)
(* ****** ****** *)
(* ****** ****** *)
#staload _ =
"prelude/DATS/gdbg000.dats"
(* ****** ****** *)
(* ****** ****** *)
(*
#include
"srcgen1\
/prelude/HATS/prelude_dats.hats"
*)
#include
"srcgen2\
/prelude/HATS/prelude_dats.hats"
(* ****** ****** *)
#include
"srcgen2\
/prelude/HATS/prelude_JS_dats.hats"
(* ****** ****** *)
#include
"srcgen1\
/prelude/HATS/CATS/JS/prelude_dats.hats"
(* ****** ****** *)
#staload _ =
"srcgen1\
/prelude/DATS/CATS/JS/Node/g_print.dats"
(* ****** ****** *)
(* ****** ****** *)

val AB =
strn(26, lam(i) => 'a'+i)
val () = prints("AB = ", AB, "\n")
//
val BA = strn_reverse(AB)
val () = prints("BA = ", BA, "\n")
//
val ABAB = appends(AB, AB)
val () = prints("ABAB = ", ABAB, "\n")

(* ****** ****** *)
(* ****** ****** *)
//
(* ****** ****** *)(* ****** ****** *)(* ****** ****** *)
(* ****** ****** *)(* ****** ****** *)(* ****** ****** *)

(* end of [ATS3/XANADU_prelude_TEST_CATS_JS_test04_strn000.dats] *)

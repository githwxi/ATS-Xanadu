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
//
#include
"xatslib\
/JS/HATS/xatslib_JS_sats.hats"
//
(* ****** ****** *)
(* ****** ****** *)
#include
"srcgen1\
/prelude/HATS/prelude_dats.hats"
#include
"srcgen2\
/prelude/HATS/prelude_dats.hats"
(* ****** ****** *)
(* ****** ****** *)
//
#include
"xatslib/JS/HATS/xatslib_JS_dats.hats"
//
(* ****** ****** *)
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
//
val map1 =
jshsmap
(list(@("a", 0), @("a", 1)))
val (  ) = prints
("map1(", type(map1), ") = ", map1, "\n")
//
val kxs1 =
GSEQ(map1).listize()
val (  ) = prints
("kxs1(", type(kxs1), ") = ", kxs1, "\n")
//
(* ****** ****** *)
(* ****** ****** *)
//
(* ****** ****** *)(* ****** ****** *)
(* ****** ****** *)(* ****** ****** *)

(* end of [ATS3/XANADU_xatslib_JS_TEST_test01_jshsmap.dats] *)

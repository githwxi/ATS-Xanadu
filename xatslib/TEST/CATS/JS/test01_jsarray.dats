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
#include
"./../../../HATS/xatslib_JS_dats.hats"
//
(* ****** ****** *)
(* ****** ****** *)
//
val A1 =
jsarray_1val(1)
val A2 =
jsarray_2val("1", "2")
val A3 =
jsarray_3val("1", "2", "3")
//
val () =
prints("A1(", type(A1), ") = ", A1, "\n")
val () =
prints("A2(", type(A2), ") = ", A2, "\n")
val () =
prints("A3(", type(A3), ") = ", A3, "\n")
//
(* ****** ****** *)
//
val A4 = appends(A3, A3)
val () =
prints("A4(", type(A4), ") = ", A4, "\n")
//
(* ****** ****** *)
//
val An =
jsarray_make_ncpy
( 10, -1(*init*) )
//
val () =
prints("An(", type(An), ") = ", An, "\n")
//
(* ****** ****** *)
(* ****** ****** *)
//
val iter =
jsarray_iter_make(An)
val-true =
jsarray_iter_next$work
(iter
,lam(i, x) => print1s("(i,x) = (", i, ",", x, ")\n"))
//
(* ****** ****** *)
(* ****** ****** *)
//
(* ****** ****** *)(* ****** ****** *)(* ****** ****** *)
(* ****** ****** *)(* ****** ****** *)(* ****** ****** *)

(* end of [ATS3/XANADU_xatslib_TEST_CATS_JS_test01_jsarray.dats] *)

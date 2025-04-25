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
"prelude/HATS/prelude_dats.hats"
(* ****** ****** *)
#include
"prelude/HATS/prelude_JS_dats.hats"
(* ****** ****** *)
(* ****** ****** *)
//
#symload ref
with a0rf_make_1val of 1000
//
(* ****** ****** *)
//
val A0 = ref(0)
val () =
printsln("A0(", type(A0), ") = ", A0)
//
(* ****** ****** *)
//
val x0 = get(A0)
val () =
printsln("x0(", type(x0), ") = ", x0)
//
val () = set(A0, 10)
val () =
printsln("A0(", type(A0), ") = ", A0)
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

(* end of [ATS3/XANADU_prelude_TEST_CATS_JS_test01_a0rf000.dats] *)

(* ****** ****** *)
(* ****** ****** *)
(*
HX-2026-09-22:
For testing prelude/PL!
Tue Sep 22 12:30:52 AM EDT 2026
*)
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
"prelude/HATS/prelude_PL_dats.hats"
//
(* ****** ****** *)
(* ****** ****** *)
//
fun
fact(n: nint): sint =
if
(n > 0)
then n * fact(n-1) else 1
//
(* ****** ****** *)
(* ****** ****** *)
//
val
fact = trace(fact, "fact")
//
val (  ) =
(20).foritm
(lam(n:nint)=>g_void(fact(n)))
//
(* ****** ****** *)
(* ****** ****** *)
//
val
strn_append =
trace(strn_append<>, "strn_append")
val strn_abc = strn_append("a", "bc")
val strn_xyz = strn_append("x", "yz")
//
(* ****** ****** *)
(* ****** ****** *)
//
(***********************************************************************)
(* end of [ATS3/XANADU_prelude_TEST_CATS_PL_test05_gdbg000.dats] *)
(***********************************************************************)

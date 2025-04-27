(* ****** ****** *)
(*
HX-2025-04-27:
For testing prelude/PY!
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
"prelude/HATS/prelude_PY_dats.hats"
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
fact = trace("fact", fact)
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
trace("strn_append", strn_append<>)
val strn_abc = strn_append("a", "bc")
val strn_xyz = strn_append("x", "yz")
//
(* ****** ****** *)
(* ****** ****** *)
//
(* ****** ****** *)(* ****** ****** *)(* ****** ****** *)
(* ****** ****** *)(* ****** ****** *)(* ****** ****** *)

(* end of [ATS3/XANADU_prelude_TEST_CATS_PY_test05_gdbg000.dats] *)

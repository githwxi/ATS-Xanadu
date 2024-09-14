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
val () = prints
("Hello from [test99_mydiary]!", "\n")
//
(* ****** ****** *)
(* ****** ****** *)
//
val AB =
strn(26, lam(i)=>'a'+i)
val () = prints("AB = ", AB, "\n")
//
(* ****** ****** *)
//
val abc = prefix(AB, 3)
val xyz = suffix(AB, 23)
val ( ) = prints("abc = ", abc, "\n")
val ( ) = prints("xyz = ", xyz, "\n")
//
(* ****** ****** *)
//
val AB2 = g_ncpy(AB, 2) // 2*AB
val ( ) = prints("AB2 = ", AB2, "\n")
//
(* ****** ****** *)
//
val ABAB =
adds(AB, AB) where
{
  #impltmp
  g_add<strn> = strn_append }
val (  ) = prints("ABAB = ", ABAB, "\n")
//
(* ****** ****** *)
(* ****** ****** *)
//
fun
fact(n: sint): sint =
fact_loop(0(*i*), 1(*r*))
where
{
  val
  fact_n = n
  #include "./DATA/data00_fact000.dats" }
//
(* ****** ****** *)
//
local
val N0 = 10
val () =
prints("fact(", N0, ") = ", fact(N0), "\n")
endloc//local
//
(* ****** ****** *)
(* ****** ****** *)
//
(* ****** ****** *)(* ****** ****** *)(* ****** ****** *)
(* ****** ****** *)(* ****** ****** *)(* ****** ****** *)

(* end of [ATS3/XANADU_prelude_TEST_CATS_JS_test99_mydiary.dats] *)

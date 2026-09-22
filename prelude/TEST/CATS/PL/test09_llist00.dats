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
length
(xs: !list_vt(sint)): nint =
case+ xs of
| !
list_vt_nil() => 0
| !
list_vt_cons(_, xs) => 1+length(xs)
//
(* ****** ****** *)
(* ****** ****** *)
//
val ns =
list_vt_nfun
(10, lam(i) => i)
//
val ln = length(ns)
val () =
printsln("ln = ", ln)
//
val ns =
map0$fun(ns, lam(i:sint)=>i*i)
val () = print0s("ns = ", ns, "\n")
//
(* ****** ****** *)
(* ****** ****** *)
//
val ns =
list_vt_nfun
(10, lam(i) => i)
val ns =
maprev0$fun(ns, lam(i:sint)=>i*i)
val () = print0s("ns = ", ns, "\n")
//
(* ****** ****** *)
(* ****** ****** *)
//
(***********************************************************************)
(* end of [ATS3/XANADU_prelude_TEST_CATS_PL_test09_llist00.dats] *)
(***********************************************************************)

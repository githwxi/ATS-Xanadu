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
//
#include
"prelude/HATS/prelude_dats.hats"
#include
"prelude/HATS/prelude_JS_dats.hats"
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
val () = console_log(the_print_store_flush( (*void*) ))
//
(* ****** ****** *)
(* ****** ****** *)
//
(***********************************************************************)
(* end of [ATS3/XANADU_prelude_TEST_CATS_JS_test09_llist00.dats] *)
(***********************************************************************)

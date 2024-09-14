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
(*
#include
"srcgen2\
/prelude/HATS/prelude_NODE_dats.hats"
*)
(* ****** ****** *)
(* ****** ****** *)
//
val ns =
list_vt_nfun
(10, lam(i) => i)
val ns =
map0_fun(ns, lam(i:sint)=>i*i)
val () = print0s("ns = ", ns, "\n")
//
(* ****** ****** *)
(* ****** ****** *)
//
val ns =
list_vt_nfun
(10, lam(i) => i)
val ns =
maprev0_fun(ns, lam(i:sint)=>i*i)
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
(* ****** ****** *)(* ****** ****** *)(* ****** ****** *)
(* ****** ****** *)(* ****** ****** *)(* ****** ****** *)

(* end of [ATS3/XANADU_prelude_TEST_CATS_JS_test09_llist000.dats] *)

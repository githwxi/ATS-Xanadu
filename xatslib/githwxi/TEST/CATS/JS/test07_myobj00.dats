(* ****** ****** *)
(* ****** ****** *)
(*
HX-2024-09-07:
Sat 07 Sep 2024 02:40:27 PM EDT
*)
(* ****** ****** *)
(* ****** ****** *)
#staload UN =
"prelude/SATS/unsfx00.sats"
(* ****** ****** *)
(* ****** ****** *)
#staload _ =
"prelude/DATS/gdbg000.dats"
(* ****** ****** *)
(* ****** ****** *)
//
#include
"srcgen2\
/prelude/HATS/prelude_dats.hats"
#include
"xatslib\
/libcats/HATS/libcats_dats.hats"
#include
"xatslib\
/githwxi/HATS/githwxi_dats.hats"
//
(* ****** ****** *)
(* ****** ****** *)
//
#include
"srcgen2\
/prelude/HATS/prelude_JS_dats.hats"
#include
"xatslib/HATS/xatslib_JS_dats.hats"
#include
"xatslib\
/libcats/HATS/libcats_JS_dats.hats"
#include
"xatslib\
/githwxi/HATS/githwxi_JS_dats.hats"
//
(* ****** ****** *)
(* ****** ****** *)
//
#include
"srcgen2\
/prelude/HATS/prelude_NODE_dats.hats"
#include
"xatslib\
/libcats/HATS/libcats_NODE_dats.hats"
#include
"xatslib\
/githwxi/HATS/githwxi_NODE_dats.hats"
//
(* ****** ****** *)
#include
"xatslib\
/githwxi/HATS/githwxi_DETMP_dats.hats"
(* ****** ****** *)
//
val () =
prints
("Hello from [test07_myobj00]!", "\n")
//
(* ****** ****** *)
(* ****** ****** *)
//
val
obj0 = myobj_make_nil()
val () = prints("obj0 = ", obj0, "\n")
//
val () =
hmap_insert$new(obj0, "a", DTVsint(1))
val () =
hmap_insert$new(obj0, "b", DTVsint(2))
val () = prints("obj0 = ", obj0, "\n")
//
val () = prints
("a+b = ", sint(obj0["a"])+sint(obj0["b"]))
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

(* end of [ATS3/XANADU_xatslib_JS_githwxi_TEST_test07_myobj00.dats] *)

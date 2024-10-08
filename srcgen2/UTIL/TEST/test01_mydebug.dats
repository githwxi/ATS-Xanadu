(* ****** ****** *)
(* ****** ****** *)
(*
HX-2024-10-04:
Fri Oct  4 05:52:05 PM EDT 2024
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
#include
"srcgen2\
/prelude/HATS/prelude_dats.hats"
#include
"xatslib\
/githwxi/HATS/githwxi_dats.hats"
(* ****** ****** *)
(* ****** ****** *)
#include
"srcgen2\
/prelude/HATS/prelude_JS_dats.hats"
#include
"xatslib/HATS/xatslib_JS_dats.hats"
(* ****** ****** *)
(* ****** ****** *)
//
#include
"srcgen2\
/prelude/HATS/prelude_NODE_dats.hats"
//
(* ****** ****** *)
(* ****** ****** *)
//
val () = prints
("Hello from [test01_mydebug]!\n")
//
(* ****** ****** *)
(* ****** ****** *)
//
datatype ab =
| A of () | B of ()
//
(* ****** ****** *)
//
fun f_ab(x: ab): sint =
case+ x of A => 0 | B _ => 1 // | C() => 2
//
(* ****** ****** *)
(* ****** ****** *)
//
(* ****** ****** *)(* ****** ****** *)(* ****** ****** *)
(* ****** ****** *)(* ****** ****** *)(* ****** ****** *)

(* end of [ATS-XANADU/srcgen2/UTIL/TEST/test01_mydebug.dats] *)

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
"srcgen1\
/prelude/HATS/prelude_dats.hats"
#include
"srcgen2\
/prelude/HATS/prelude_dats.hats"
(* ****** ****** *)
(* ****** ****** *)
//
#include
"xatslib/HATS/xatslib_JS_dats.hats"
//
(* ****** ****** *)
(* ****** ****** *)
#include
"srcgen1\
/prelude/HATS/CATS/JS/prelude_dats.hats"
(* ****** ****** *)
#staload _ =
"srcgen1\
/prelude/DATS/CATS/JS/Node/g_print.dats"
(* ****** ****** *)
(* ****** ****** *)
//
val map1 =
jshsmap
(list(@("a", 0),@("b", 1)))
val (  ) = prints
("map1(", type(map1), ") = ", map1, "\n")
//
val kxs1 =
GSEQ(map1).listize()
val (  ) = print1s
("kxs1(", vwtp(kxs1), ") = ", kxs1, "\n")
//
val arr1 = jsarray
(lam(work) => GSEQ(map1).foritm(work))
val (  ) = prints
("arr1(", type(arr1), ") = ", arr1, "\n")
val (  ) =
let
#typedef a = (strn, sint)
in//let
sortref
(arr1, lam(kx1:a, kx2:a) =>
let val (k1, _) = kx1
    and (k2, _) = kx2 in -(k1\cmp(k2)) end)
end
//
val (  ) = prints
("arr1(", type(arr1), ") = ", arr1, "\n")
//
(* ****** ****** *)
(* ****** ****** *)
//
(* ****** ****** *)(* ****** ****** *)(* ****** ****** *)
(* ****** ****** *)(* ****** ****** *)(* ****** ****** *)

(* end of [ATS3/XANADU_xatslib_JS_TEST_test01_jshsmap.dats] *)

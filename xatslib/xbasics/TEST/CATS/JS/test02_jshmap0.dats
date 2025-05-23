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
"prelude/HATS/prelude_dats.hats"
(* ****** ****** *)
#include
"prelude/HATS/prelude_JS_dats.hats"
(* ****** ****** *)
#include
"prelude/HATS/prelude_NODE_dats.hats"
(* ****** ****** *)
(* ****** ****** *)
//
#include
"./../../../HATS/xbasics_JS_dats.hats"
//
(* ****** ****** *)
(* ****** ****** *)
//
val map1 =
jshmap
(list_2val
(@("a", 0),@("b", 1)))
val (  ) = prints
("map1(", type(map1), ") = ", map1, "\n")
//
(* ****** ****** *)
//
val kxs1 =
map1.listize((*symloaded*))
val (  ) = print1s
("kxs1(", vwtp(kxs1), ") = ", kxs1, "\n")
//
(* ****** ****** *)
//
val kxs2 =
map1.strmize((*symloaded*))
val (  ) = print0s
("kxs2(", type(kxs2), ") = ", kxs2, "\n")
//
(* ****** ****** *)
(* ****** ****** *)
//
val arr1 = jsdasz
(lam(work) => GSEQ(map1).foritm(work))
val (  ) = prints
("arr1(", type(arr1), ") = ", arr1, "\n")
//
val (  ) =
let
#typedef a =
(strn, sint)
in//let
sortref(arr1,
lam(kx1:a, kx2:a) =>
let
  val (k1, _) = kx1
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

(* end of [ATS3/XANADU_xatslib_xbasics_TEST_CATS_JS_test02_jshmap0.dats] *)

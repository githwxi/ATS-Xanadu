(* ****** ****** *)
(* ****** ****** *)
(*
HX-2024-08-03:
Sat 03 Aug 2024 03:08:26 PM EDT
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
//
(* ****** ****** *)
(* ****** ****** *)
#include
"srcgen2\
/prelude/HATS/prelude_JS_dats.hats"
#include
"xatslib/HATS/xatslib_JS_dats.hats"
//
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
(*
fun
<a:t0>
quicksort
( xs
: list(a)): list(a) =
(
  qsort(xs)) where
{
fun
qsort(xs) =
(
case+ xs of
|
list_nil() =>
list_nil()
|
list_cons(x0, xs) =>
let
val
(ys, zs) =
list_partit
(xs, lam(x1) => x1\cmp(x0) <= 0)
in//let
appends
(qsort(ys), list@(x0), qsort(zs))
end//let
)
}
*)
//
(* ****** ****** *)
////
(* ****** ****** *)
val f0 =
lam(x:int) => @(x, x=x)
val () =
prints
("type(f0) = ", type(f0), "\n")
(* ****** ****** *)
(*
val b0 =
GASZ("abcde").exists(lam(c)=>c='f')
*)
(* ****** ****** *)
////
(* ****** ****** *)
(* ****** ****** *)
//
//
val () =
irforitm
( GSEQ(ys)
, lam(i, y) =>
prints("(i, x) = (", i, ",", y, ")"))
val () = prints("\n")
//
val rys = rlistize(GSEQ(ys))
val ( ) = print1s("rys = ", rys, "\n")
////
//
(* ****** ****** *)
(* ****** ****** *)
//
(* ****** ****** *)(* ****** ****** *)(* ****** ****** *)
(* ****** ****** *)(* ****** ****** *)(* ****** ****** *)

(* end of [ATS3/XANADU_xatslib_JS_githwxi_TEST_test99_mydiary.dats] *)

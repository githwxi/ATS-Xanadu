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
val f0 =
lam(x:sint) => @(x, x=x)
val () =
prints
("type(f0) = ", type(f0), "\n")
(* ****** ****** *)
val b0 =
GSEQ("abcde").exists(lam(c)=>c='f')
val () = prints
("exists(\"abcde\", 'f') = ", b0, "\n")
(* ****** ****** *)
(* ****** ****** *)
//
#extern
fun
<a:t0>
list_quicksort(xs: list(a)): list(a)
//
(* ****** ****** *)
//
#impltmp
< a: t0 >
list_quicksort
  ( xs ) =
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
//
val
(ys, zs) =
list_partit
(xs
,lam(x1)=>(x1\g_cmp(x0)) <= 0)
//
(*
val () =
prints("qsort: ys = ", ys, "\n")
val () =
prints("qsort: zs = ", zs, "\n")
*)
//
in//let
(
 appends
 (qsort(ys), list@(x0), qsort(zs)))
end//let
)
}
//
(* ****** ****** *)
(* ****** ****** *)
//
val xs =
list(11, lam(i) => g_sqr(5-i))
//
(* ****** ****** *)
(* ****** ****** *)
//
val rxs = rlistize(GSEQ(xs))
val ( ) = print1s("rxs = ", rxs, "\n")
//
(* ****** ****** *)
(* ****** ****** *)
//
val () = prints
("sort(", xs, ") = ", list_quicksort(xs), "\n")
//
(* ****** ****** *)
(* ****** ****** *)
//
(* ****** ****** *)(* ****** ****** *)(* ****** ****** *)
(* ****** ****** *)(* ****** ****** *)(* ****** ****** *)

(* end of [ATS3/XANADU_xatslib_JS_githwxi_TEST_test99_mydiary.dats] *)

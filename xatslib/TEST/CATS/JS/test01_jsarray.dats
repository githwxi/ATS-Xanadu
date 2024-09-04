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
#include
"./../../../HATS/xatslib_JS_dats.hats"
//
(* ****** ****** *)
(* ****** ****** *)
//
val A1 =
jsarray_1val(1)
val A2 =
jsarray_2val("1", "2")
val A3 =
jsarray_3val("1", "2", "3")
//
val () =
prints("A1(", type(A1), ") = ", A1, "\n")
val () =
prints("A2(", type(A2), ") = ", A2, "\n")
val () =
prints("A3(", type(A3), ") = ", A3, "\n")
//
(* ****** ****** *)
//
val A4 = appends(A3, A3)
val () =
prints("A4(", type(A4), ") = ", A4, "\n")
//
(* ****** ****** *)
//
val An =
jsarray_make_ncpy
( 10, -1(*init*) )
//
val () =
prints("An(", type(An), ") = ", An, "\n")
//
(* ****** ****** *)
//
val ( ) = prints("sAn = ", sum(An), "\n")
//
(* ****** ****** *)
//
val xs =
GSEQ(An).listize((*0*))
val () =
print1s("xs(", type(xs), ") = ", xs, "\n")
val xs = list_vt2t{sint}(xs)
val () =
print1s("xs(", type(xs), ") = ", xs, "\n")
//
(* ****** ****** *)
val () = print1s
("rlistize(",An,") = ",rlistize(GSEQ(An)),"\n")
val () = print1s
("rlistize(",An,") = ",rlistize(GASZ(An)),"\n")
(* ****** ****** *)
//
val () =
prints("An = ", An, "\n") where
{
  val () = mapref(An, lam(x:sint) => x+x)
}
val () = prints
("map_list(An) = "
, map_list(An, lam(x:sint) => x*x), "\n")
//
(* ****** ****** *)
(* ****** ****** *)
//
val ys =
gseq_imap_list
<xs><x0><y0>(An) where
{
#typedef x0 = nint
#typedef y0 = nint
#typedef xs = jsa0(nint)
#impltmp
imap$fopr
<x0><y0>(i0, x0) = i0*x0*x0 + 1}//where
val () =
print1s("ys(", type(ys), ") = ", ys, "\n")
//
(* ****** ****** *)
//
val zs =
gseq_irmap_list
<xs><x0><z0>(An) where
{
#typedef x0 = nint
#typedef z0 = nint
#typedef xs = jsa0(nint)
#impltmp
irmap$fopr
<x0><z0>(i0, x0) = i0*x0*x0 + 1}//where
val () =
print1s("zs(", type(zs), ") = ", zs, "\n")
//
(* ****** ****** *)
//
fun
list$sint_sum(xs) =
gseq_sum<list(sint)><sint>(xs)
#symload sum with list$sint_sum
val sys = sum(ys)
val (  ) =
print1s("sys(", type(sys), ") = ", sys, "\n")
//
fun
list$sint_prod(xs) =
gseq_prod<list(sint)><sint>(xs)
#symload prod with list$sint_prod
val pzs = prod(zs)
val (  ) =
print1s("pzs(", type(pzs), ") = ", pzs, "\n")
//
(* ****** ****** *)
(* ****** ****** *)
//
val () = prints
("fact(0) = ", fc_bool(muls()), "\n")
val () = prints
("fact(10) = "
, muls(1, 2, 3, 4, 5, 6, 7, 8, 9, 10), "\n")
//
(* ****** ****** *)
(* ****** ****** *)
//
(*
val () =
prints("xs = ", xs, "\n")
*)
val b0 =
forall
(GSEQ(xs), lam(x) => x >= 0)
val () = prints("b0 = ", b0, "\n")
val rb0 =
rforall
(GSEQ(xs), lam(x) => x >= 0)
val ( ) = prints("rb0 = ", rb0, "\n")
//
(* ****** ****** *)
//
val b1 =
forall
(GASZ(An), lam(x) => x <= 0)
val ( ) = (prints("b1 = ", b1, "\n"))
val rb1 =
rforall
(GASZ(An), lam(x) => x <= 0)
val ( ) = (prints("rb1 = ", rb1, "\n"))
//
(* ****** ****** *)
(* ****** ****** *)
//
val An2 =
jsarray_fmake_fwork{sint}
(
lam(work)=>
(foritm(An, work);rforitm(An, work)))
val ( ) =
prints("jsarray_fmake_fwork(...) = ", An2, "\n")
//
(* ****** ****** *)
(* ****** ****** *)
//
val iter =
jsarray_iter_make(An)
val-true =
jsarray_iter_next$work
(iter
,lam(i, x) => print1s("(i,x) = (", i, ",", x, ")\n"))
//
(* ****** ****** *)
(* ****** ****** *)
//
(* ****** ****** *)(* ****** ****** *)(* ****** ****** *)
(* ****** ****** *)(* ****** ****** *)(* ****** ****** *)

(* end of [ATS3/XANADU_xatslib_TEST_CATS_JS_test01_jsarray.dats] *)

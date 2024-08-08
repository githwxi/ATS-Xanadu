(* ****** ****** *)
(*
HX-2024-07-21:
For testing xatslib/JS!
*)
(* ****** ****** *)
(* ****** ****** *)
#staload _ =
"prelude/DATS/gdbg000.dats"
(* ****** ****** *)
(* ****** ****** *)
//
(*
HX-2024-07-21:
Sun 21 Jul 2024 11:06:11 PM EDT
*)
//
#include
"xatslib\
/JS/HATS/xatslib_JS_sats.hats"
//
(* ****** ****** *)
(* ****** ****** *)
#include
"srcgen1\
/prelude/HATS/prelude_dats.hats"
#include
"srcgen2\
/prelude/HATS/prelude_dats.hats"
(* ****** ****** *)
//
#include
"xatslib/JS/HATS/xatslib_JS_dats.hats"
//
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
val A1 =
jsarray(1)
val A2 =
jsarray("1", "2")
val A3 =
jsarray("1", "2", "3")
//
val () =
prints("A3(", type(A3), ") = ", A3, "\n")
//
val An =
jsarray_make_ncpy
( 10, -1(*init*) )
//
val () =
prints("An(", type(An), ") = ", An, "\n")
//
val An =
jsarray_make_nfun
( 10, lam(i) => i+1)
//
val () =
prints("An(", type(An), ") = ", An, "\n")
//
(*
val A4 =
gs_append_a2<strn>(A3, A3)
*)
val A4 = jsarray_append<>(A3, A3)
//
val () =
prints("A4(", type(A4), " = ", A4, "\n")
////
(* ****** ****** *)
//
val xs = listize(An)
val () =
print1s("xs = ", xs, "\n")
//
(* ****** ****** *)
//
val xs = list_vt2t(xs)
val () = prints("xs = ", xs, "\n")
//
val xs2 = appends(xs, xs)
val () = prints("xs2 = ", xs2, "\n")
//
(* ****** ****** *)
//
val ys =
gseq_imap_list
<xs><x0><y0>(An) where
{
#typedef x0 = nint
#typedef y0 = nint
#typedef xs = jsa(nint)
#impltmp
imap$fopr
<x0><y0>(i0, x0) = i0*x0*x0 + 1
}
val () = prints("ys = ", ys, "\n")
//
(* ****** ****** *)
(* ****** ****** *)
//
val zs =
gseq_irmap_list
<xs><x0><z0>(An) where
{
#typedef x0 = nint
#typedef z0 = nint
#typedef xs = jsa(nint)
#impltmp
irmap$fopr
<x0><z0>(i0, x0) = i0*x0*x0 + 1
}
val () = prints("zs = ", zs, "\n")
//
(* ****** ****** *)
(* ****** ****** *)
//
val sAn = sum(An)
val ( ) = prints("sAn = ", sAn, "\n")
//
(* ****** ****** *)
(* ****** ****** *)
//
fun
list$sint_sum(xs) =
gseq_sum<list(sint)><sint>(xs)
#symload sum with list$sint_sum
//
val sys = sum(ys)
val ( ) = prints("sys = ", sys, "\n")
val szs = sum(zs)
val ( ) = prints("szs = ", szs, "\n")
//
(* ****** ****** *)
(* ****** ****** *)
//
val () =
prints("An = ", An, "\n") where
{
  val () =
  mapref(An, lam(x:sint) => x+x)
}
//
val () = prints
("map_list(An) = "
, map_list(An, lam(x:sint) => x*x), "\n")
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
#symload
GSEQ with GSEQ_make_list
#symload
GASZ with GASZ_make_jsarray
#symload forall
with GSEQ_forall_c1fr of 1000
#symload forall
with GASZ_forall_c1fr of 1000
*)
//
val b0 =
forall(GSEQ(xs), lam(x) => x >= 0)
val ( ) = prints("b0 = ", b0, "\n")
val rb0 =
rforall(GSEQ(xs), lam(x) => x >= 0)
val ( ) = prints("rb0 = ", rb0, "\n")
//
val b1 =
forall
(
GASZ(An),
lam(x) => (print("x=", x); x >= 0))
val ( ) = (prints("b1 = ", b1, "\n"))
val rb1 =
rforall
(
GASZ(An),
lam(x) => (print("x=", x); x >= 0))
val ( ) = (prints("rb1 = ", rb1, "\n"))
//
(* ****** ****** *)
(* ****** ****** *)
//
val N = 10
val () = print1s
("rlistize(",N,") = ",rlistize(GSEQ(N)),"\n")
val () = print1s
("rlistize(",xs,") = ",rlistize(GSEQ(xs)),"\n")
val () = print1s
("rlistize(",An,") = ",rlistize(GSEQ(An)),"\n")
val () = print1s
("rlistize(",An,") = ",rlistize(GASZ(An)),"\n")
//
(* ****** ****** *)
(* ****** ****** *)
val N = 10
val () = print1s
("listize(",N,") = ",listize(GSEQ_nint0(N)),"\n")
val () = print1s
("rlistize(",N,") = ",rlistize(GSEQ_nint0(N)),"\n")
(* ****** ****** *)
(* ****** ****** *)
//
val x2s = list_c2hoose_lstrm(xs)
val ( ) = print1s("x2s = ", listize0(x2s), "\n")
val x3s = list_c3hoose_lstrm(xs)
val ( ) = print1s("x3s = ", listize0(x3s), "\n")
//
(* ****** ****** *)
(* ****** ****** *)
//
val ( ) =
(
prints
("foritms(xs, A4): ");
foritms(xs, A4); prints("\n")) where
{
#impltmp foritm$work<sint>(x0) = prints(x0)
#impltmp foritm$work<strn>(x0) = prints(x0) }//whr
//
(* ****** ****** *)
(* ****** ****** *)
//
val xs2 =
list_fmake_fwork<sint>
(lam(work)=>(foritm(xs, work);rforitm(xs, work)))
val ( ) = prints("list_fmake_fwork(...) = ", xs2, "\n")
//
val An2 =
jsarray_fmake_fwork{sint}
(lam(work)=>(foritm(An, work);rforitm(An, work)))
val ( ) = prints("jsarray_fmake_fwork(...) = ", An2, "\n")
//
(* ****** ****** *)
(* ****** ****** *)
//
(* ****** ****** *)(* ****** ****** *)
(* ****** ****** *)(* ****** ****** *)

(* end of [ATS3/XANADU_xatslib_JS_TEST_mydiary.dats] *)

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
#include
"srcgen1\
/prelude/HATS/prelude_dats.hats"
#include
"srcgen2\
/prelude/HATS/prelude_dats.hats"
(* ****** ****** *)
//
#include
"xatslib/HATS/xatslib_JS_dats.hats"
//
(* ****** ****** *)
(* ****** ****** *)
//
//
//
(* ****** ****** *)
//
val xs2 = appends(xs, xs)
val () = prints("xs2 = ", xs2, "\n")
//
(* ****** ****** *)
//
val sAn = sum(An)
val ( ) = prints("sAn = ", sAn, "\n")
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
(*
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
*)
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
(*
val N = 10
val () = print1s
("listize(",N,") = ",listize(GSEQ_nint0(N)),"\n")
val () = print1s
("rlistize(",N,") = ",rlistize(GSEQ_nint0(N)),"\n")
*)
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

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
list_ncpy(10, 1)
val () =
prints("ns = ", ns, "\n")
val () = prints
("|ns| = ", length(ns), "\n")
//
val xs =
list
(10, lam(i:sint) => i)
val () = prints("xs = ", xs, "\n")
//
val ys =
map(xs, lam(i:sint) => i*i)
val () = prints("ys = ", ys, "\n")
val zs =
maprev(xs, lam(i:sint) => i*i)
val () = prints("zs = ", zs, "\n")
//
val () =
prints("yszs = ", appends(ys, zs), '\n')
//
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
val () = print1s
("rlistize(",10,") = ", rlistize(GSEQ(10)),"\n")
val () = print1s
("rlistize(",xs,") = ", rlistize(GSEQ(xs)),"\n")
//
(* ****** ****** *)
//
val N = 10
val () = print1s
("listize(",N,") = ",listize(GSEQ_nint0(N)),"\n")
val () = print1s
("rlistize(",N,") = ",rlistize(GSEQ_nint0(N)),"\n")
//
(* ****** ****** *)
//
(* ****** ****** *)
(* ****** ****** *)
//
val xs2 =
list_fmake_fwork<sint>
(lam(work)=>(foritm(xs, work);rforitm(xs, work)))
val ( ) = prints("list_fmake_fwork(...) = ", xs2, "\n")
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

(* end of [ATS3/XANADU_prelude_TEST_CATS_JS_test06_list000.dats] *)

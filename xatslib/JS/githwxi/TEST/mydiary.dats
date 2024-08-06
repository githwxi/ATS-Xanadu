(* ****** ****** *)
(* ****** ****** *)
(*
HX-2024-08-03:
Sat 03 Aug 2024 03:08:26 PM EDT
*)
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
#staload
"./../DATS/qlist00.dats"
//
val xs =
qlist_nil{sint}()
val xs = folditm
( GSEQ(list(1,2,3))
, xs, lam(r, x) => qlist_snoc(r, x))
//
val () = prints("xs = ", xs, "\n")
//
val () = prints("sum(xs) = ", sum(GSEQ(xs)), "\n")
val () = prints("prod(xs) = ", prod(GSEQ(xs)), "\n")
val () = print1s("listize(xs) = ", listize(GSEQ(xs)), "\n")
val () = print1s("rlistize(xs) = ", rlistize(GSEQ(xs)), "\n")
//
(* ****** ****** *)
//
#define
GZ2SEQ(xs, ys) =
GSEQ_z2make(GSEQ(xs), GSEQ(ys))
#define
GX2SEQ(xs, ys) =
GSEQ_x2make(GSEQ(xs), GSEQ(ys))
//
val xs =
list(1,2,3,4)
val ys =
list(10,20,30,40,50)
val xys =
rlistize(GZ2SEQ(xs, ys))
val ( ) =
print1s("rlistize(GZ2SEQ(xs, ys))) = ", xys, "\n")
////
val () =
irforitm
( GSEQ(ys)
, lam(i, x) => prints("(i, x) = (", i, ",", x, ")"))
val () = prints("\n")
////
val rys = rlistize(GSEQ(ys))
val ( ) = print1s("rys = ", rys, "\n")
////
val rxys =
rlistize(GZ2SEQ(xs, ys))
val ( ) =
print1s("rlistize(GSEQ_z2make(GSEQ(xs), GSEQ(ys))) = ", rxys, "\n")
//
val xys =
listize(GX2SEQ(xs, ys))
val ( ) =
print1s("listize(GSEQ_x2make(GSEQ(xs), GSEQ(ys))) = ", xys, "\n")
val rxys =
rlistize(GX2SEQ(xs, ys))
val ( ) =
print1s("rlistize(GSEQ_x2make(GSEQ(xs), GSEQ(ys))) = ", rxys, "\n")
//
(* ****** ****** *)
(* ****** ****** *)
//
(* ****** ****** *)(* ****** ****** *)(* ****** ****** *)
(* ****** ****** *)(* ****** ****** *)(* ****** ****** *)

(* end of [ATS3/XANADU_xatslib_JS_githwxi_TEST_mydiary.dats] *)

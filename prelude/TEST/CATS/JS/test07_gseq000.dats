(* ****** ****** *)
(*
HX-2024-09-05:
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
(*
HX-2024-09-05:
Already defined in gseq002
*)
#define
GZ2SEQ(xs, ys) =
GSEQ_z2make(GSEQ(xs), GSEQ(ys))
#define
GX2SEQ(xs, ys) =
GSEQ_x2make(GSEQ(xs), GSEQ(ys))
//
(* ****** ****** *)
(* ****** ****** *)
//
val xs = list@(1, 2, 3)
val ys = list@(10,20,30,40)
val () = prints("xs = ", xs, "\n")
val () = prints("ys = ", ys, "\n")
//
(* ****** ****** *)
///
val ztup =
GZ2SEQ(xs, ys)
val (  ) =
prints("ztup = ", ztup, "\n")
//
val zxys = listize(ztup)
val (  ) =
print1s("listize(ztup) = ", zxys, "\n")
//
(* ****** ****** *)
//
val xztup =
GSEQ_x2make
(GSEQ(xs), ztup)
val (   ) =
prints("xztup = ", xztup, "\n")
//
val xzxys = listize(xztup)
val (   ) =
print1s("listize(xztup) = ", xzxys, "\n")
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

(* ****** ****** *)
(* ****** ****** *)
(*
HX-2025-05-17:
For testing xats2js!
*)
(* ****** ****** *)
(* ****** ****** *)
#include
"srcgen2\
/prelude/HATS/prelude_dats.hats"
(* ****** ****** *)
(* ****** ****** *)

val xs =
list@(1, 2, 3)

(* ****** ****** *)

val
sint_id0 =
lam(x: sint): sint => x

(* ****** ****** *)
(* ****** ****** *)

#impltmp
< x0:t0 >
< y0:t0 >
list_map =
gseq_map_list
<list(x0)><x0><y0>(*void*)

val ys = list_map<sint><sint>(xs)

(* ****** ****** *)
////
(* ****** ****** *)
//
val-
xs as
list_cons(x1, _) = list_sing(1)
//
val x2 = x1 + 1 // x1=1 and x2=2
val-
list_cons(x1, _) = xs // xs=sing(1)
//
(* ****** ****** *)
(* ****** ****** *)
//
(***********************************************************************)
(* end of [ATS3/XANADU_srcgen2_TEST_testxx_mydebug.dats] *)
(***********************************************************************)

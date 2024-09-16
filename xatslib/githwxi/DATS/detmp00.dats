(* ****** ****** *)
(* ****** ****** *)
(*
HX-2024-09-16:
For detemplating
some (large) functions
Mon 16 Sep 2024 10:27:18 AM EDT
*)
(* ****** ****** *)
(* ****** ****** *)
//
#extern
fun
dtval_print_
( dtv: dtval ): void
#extern
fun
dtval_fprint_
( dtv
: dtval, out: FILR): void
//
#impltmp
dtval_print_
  ( dtv ) =
(
  g_print<dtval>(dtv))
#impltmp
dtval_fprint_
  ( dtv, out ) =
let
#impltmp
g_stdout<>() = out
in//let
  g_print<dtval>(dtv) end//let
//
#impltmp
g_fprint<dtval> = dtval_fprint_
//
(* ****** ****** *)
(* ****** ****** *)

(* ****** ****** *)(* ****** ****** *)(* ****** ****** *)
(* ****** ****** *)(* ****** ****** *)(* ****** ****** *)

(* end of [ATS3/XANADU_xatslib_githwxi_DATS_detmp00.dats] *)

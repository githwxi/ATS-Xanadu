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
myobj00$dtval_fprint_
( dtv
: dtval, out: FILR): void
//
#impltmp
myobj00$dtval_fprint_
  ( dtv, out ) =
let
#impltmp
g_stdout<>() = out
in//let
  g_print<dtval>(dtv) end//let
//
#impltmp
g_print
<dtval>(dtv) =
myobj00$dtval_fprint_(dtv, g_stdout<>())
//
(* ****** ****** *)
(* ****** ****** *)

(* ****** ****** *)(* ****** ****** *)(* ****** ****** *)
(* ****** ****** *)(* ****** ****** *)(* ****** ****** *)

(* end of [ATS3/XANADU_xatslib_githwxi_DATS_detmp00.dats] *)

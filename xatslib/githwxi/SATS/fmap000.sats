(* ****** ****** *)
(* ****** ****** *)
(*
HX-2024-09-07:
For miscellaneous
map-transform functions
Sat 07 Sep 2024 05:43:45 PM EDT
HX-2026-01-24:
What is declared here is
in prelude/gfun000 already.
This file is here to record
a little bit of history of ATS.
Sat Jan 24 02:12:16 AM EST 2026
*)
(* ****** ****** *)
(* ****** ****** *)
//
fun
<x0:t0>
<y0:t0>
fopr_map$list
(fopr: x0 -> y0): list(x0) -> list(y0)
//
(* ****** ****** *)
//
fun
<x0:t0>
<y0:t0>
fopr_map$optn
(fopr: x0 -> y0): optn(x0) -> optn(y0)
//
(* ****** ****** *)
//
fun
<x0:t0>
<y0:t0>
fopr_map$strm
(fopr: x0 -> y0): strm(x0) -> strm(y0)
//
(* ****** ****** *)
(* ****** ****** *)
//
(***********************************************************************)
(* end of [ATS3/XANADU_xatslib_githwxi_SATS_fmap000.sats] *)
(***********************************************************************)

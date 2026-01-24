(* ****** ****** *)
(* ****** ****** *)
(*
HX-2024-09-07:
For miscellaneous
map-transform functions
Sat 07 Sep 2024 05:43:45 PM EDT
HX-2026-01-24:
Sat Jan 24 02:12:16 AM EST 2026
*)
(* ****** ****** *)
(* ****** ****** *)
#staload "./../SATS/fmap000.sats"
(* ****** ****** *)
(* ****** ****** *)
//
#impltmp
< x0:t0 >
< y0:t0 >
fopr_map$list(fopr) = (lam(xs) => xs.map(fopr))
//
#impltmp
< x0:t0 >
< y0:t0 >
fopr_map$optn(fopr) = (lam(xs) => xs.map(fopr))
//
#impltmp
< x0:t0 >
< y0:t0 >
fopr_map$strm(fopr) = (lam(xs) => xs.map(fopr))
//
(* ****** ****** *)
(* ****** ****** *)
//
(***********************************************************************)
(* end of [ATS3/XANADU_xatslib_githwxi_DATS_fmap000.dats] *)
(***********************************************************************)

(* ****** ****** *)
(* ****** ****** *)
(*
HX-2024-09-07:
For miscellaneous
map-transform functions
Sat 07 Sep 2024 05:43:45 PM EDT
*)
(* ****** ****** *)
(* ****** ****** *)
//
#extern
fun
<x0:t0>
<y0:t0>
fmap_list
( fmap
: x0 -> y0)
: list(x0) -> list(y0)
//
#impltmp
< x0:t0 >
< y0:t0 >
fmap_list(fopr) =
(
  lam(xs) => xs.map_fun(fopr))
//
(* ****** ****** *)
//
#extern
fun
<x0:t0>
<y0:t0>
fmap_optn
( fmap
: x0 -> y0)
: optn(x0) -> optn(y0)
//
#impltmp
< x0:t0 >
< y0:t0 >
fmap_optn(fopr) =
(
  lam(xs) => xs.map_fun(fopr))
//
(* ****** ****** *)
//
#extern
fun
<x0:t0>
<y0:t0>
fmap_strm
( fmap: x0 -> y0)
: strm(x0) -> strm(y0)
//
#impltmp
< x0:t0 >
< y0:t0 >
fmap_strm(fopr) =
(
  lam(xs) => xs.map_fun(fopr))
//
(* ****** ****** *)
(* ****** ****** *)
//
(* ****** ****** *)(* ****** ****** *)(* ****** ****** *)
(* ****** ****** *)(* ****** ****** *)(* ****** ****** *)

(* end of [ATS3/XANADU_xatslib_githwxi_DATS_fmap000.dats] *)

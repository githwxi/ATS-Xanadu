(* ****** ****** *)
(* ****** ****** *)
(*
HX-2024-05-15:
Thu May 15 12:01:53 AM EDT 2025
*)
(* ****** ****** *)
(* ****** ****** *)
//
#staload UN =
"prelude/SATS/unsfx00.sats"
//
(* ****** ****** *)
(* ****** ****** *)
//
#staload "./../SATS/gseq000.sats"
//
(* ****** ****** *)
(* ****** ****** *)
//
#impltmp
< xs:t0 >
< x0:t0 >
gseq_2choose$strmize
  ( xs ) =
(
  auxmain(xs)) where
{
//
fun
auxmain(xs: xs) = $llazy
(
if
gseq_nilq
<xs><x0>(xs)
then
strmcon_vt_nil((*0*))
else
let//0
//
val hd =
gseq_head<xs><x0>(xs)
val tl =
gseq_tail<xs><x0>(xs)
//
val ys =
gseq_map_lstrm<xs><x0>(tl)
where {
#typedef y0 = (x0, x0)
#impltmp
map$fopr<x0><y0>(x1) = (hd, x1) }
//
in//let0
//
(
!strm_vt_append00(ys, auxmain(tl)))
//
end(*let*)//end-of-[  auxmain( xs )  ]
)
//
}(*where*)//end-of-[gseq_2choose$strmize(xs)]
//
(* ****** ****** *)
(* ****** ****** *)
//
#impltmp
< xs:t0 >
< x0:t0 >
gseq_3choose$strmize
  ( xs ) =
(
  auxmain(xs)) where
{
//
#vwtpdef zs =
strm_vt@(x0, x0, x0)
//
fun
auxmain
(xs: xs): zs = $llazy
(
if
gseq_nilq
<xs><x0>(xs)
then
(
strmcon_vt_nil((*0*)))
else
let//0
//
val hd =
(
 gseq_head<xs><x0>(xs))
val tl =
(
 gseq_tail<xs><x0>(xs))
//
val zs =
gseq_map_lstrm<ys><y0>(ys)
where {
//
val ys =
gseq_2choose$strmize
<  xs  ><  x0  >(   tl   )
//
#typedef y0 = @(x0, x0)
#vwtpdef ys = strm_vt(y0)
#typedef z0 = @(x0, x0, x0)
#impltmp
map$fopr
<y0><z0>(y0) = (hd, y0.0, y0.1) }
//
in//let0
//
(
!strm_vt_append00(zs, auxmain(tl)))
//
end(*let*)//end-of-[  auxmain( xs )  ]
)
//
}(*where*)//end-of-[gseq_3choose$strmize(xs)]
//
(* ****** ****** *)
(* ****** ****** *)
//
(***********************************************************************)
(* end of [ATS3/XANADU_xatslib_githwxi_DATS_gseq000.dats] *)
(***********************************************************************)

(* ****** ****** *)
(* ****** ****** *)
(*
HX-2024-08-15:
Thu 15 Aug 2024 10:21:52 PM EDT
For implementing operations on so-called
2-list-based queues
*)
(* ****** ****** *)
(* ****** ****** *)
//
#staload UN =
"prelude/SATS/unsfx00.sats"
//
(* ****** ****** *)
(* ****** ****** *)
#typedef si = sint
(* ****** ****** *)
(* ****** ****** *)
//
(*
#abstype
range_ilt == si
#abstype
range_igte == si
*)
#abstype
range_ibtw == (si, si)
//
(* ****** ****** *)
(* ****** ****** *)
//
(*
#impltmp
g_ptype<
range_ilt>() = pstrn"range_ilt"
#impltmp
g_ptype<
range_igte>() = pstrn"range_igte"
*)
//
#impltmp
g_ptype<
range_ibtw>() = pstrn"range_ibtw"
//
(* ****** ****** *)
(* ****** ****** *)
//
(*
#extern
fun<>
range_ilt(i0: si): range_ilt
#extern
fun<>
range_ilte(i0: si): range_ilt
#extern
fun<>
range_igt(i0: si): range_igte
fun<>
range_igte(i0: si): range_igte
*)
//
(* ****** ****** *)
(* ****** ****** *)
//
#extern
fun
range_ibtw_lb
(range: range_ibtw): sint(*lower*)
#extern
fun
range_ibtw_ub
(range: range_ibtw): sint(*upper*)
//
#extern
fun<>
range_ibtw(i0:si, i1:si): range_ibtw
#extern
fun
<xs:t0>
range_ibtwe(i0:si, i1:si): range_ibtw
//
(* ****** ****** *)
(* ****** ****** *)
//
#impltmp
gseq_forall
<range_ibtw><si>
 (   range   ) =
let
#impltmp
map$fopr<si>(i0) = i0
in//let
gseq_map$forall
<range_ibtw><si><si>(range)
end//let//end(gseq_forall<range_ibtw>)
//
#impltmp
{ y0:vt }
gseq_map$forall
<range_ibtw><si><y0>
 (   range   ) =
(
auxloop(lb, ub)) where
{
//
fun
auxloop
( lb: si
, ub: si): bool =
if
(lb >= ub)
then (true) else
(
if
forall$test0<y0>
(map$fopr<si><y0>(lb))
then
auxloop(lb+1, ub) else false)
//
val lb = range_ibtw_lb(range) // lower
val ub = range_ibtw_ub(range) // upper
//
}(*where*)//end-of(gseq_map$forall<range_ibtw>)
//
(* ****** ****** *)
(* ****** ****** *)
//
(* ****** ****** *)(* ****** ****** *)(* ****** ****** *)
(* ****** ****** *)(* ****** ****** *)(* ****** ****** *)

(* end of [ATS3/XANADU_xatslib_githwxi_DATS_ggrph00.dats] *)

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
#typedef si = sint
(* ****** ****** *)
(* ****** ****** *)
//
#staload UN =
"prelude/SATS/unsfx00.sats"
//
(* ****** ****** *)
(* ****** ****** *)
//
(*
#abstype
range_ilt == sint
#abstype
range_igte == sint
*)
#abstype
range_ibtw == @(si, si)
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
fun<>
range_ibtw_lb
(range: range_ibtw): sint(*lower*)
#extern
fun<>
range_ibtw_ub
(range: range_ibtw): sint(*upper*)
//
#extern
fun<>
range_ibtw(lb:si, ub:si): range_ibtw
#extern
fun<>
<xs:t0>
range_ibtwe(lb:si, ub:si): range_ibtw
//
(* ****** ****** *)
(* ****** ****** *)
//
local
//
#absimpl
range_ibtw = @(si, si)
//
in//local
//
#impltmp
<(*tmp*)>
range_ibtw
( lb, ub ) = @(lb, ub)
//
#impltmp
<(*tmp*)>
range_ibtw_lb(lbub) = lbub.0
#impltmp
<(*tmp*)>
range_ibtw_ub(lbub) = lbub.1
//
end(*local*)//end-of-[absimpl(range_ibtw)]
//
(* ****** ****** *)
//
#impltmp
<(*tmp*)>
range_ibtwe
( lb, ub ) = range_ibtw<>(lb, ub+1)
//
(* ****** ****** *)
(* ****** ****** *)
//
#impltmp
gasz_length
<range_ibtw><si>
(    range    ) =
(
if
(lb >= ub)
then (0) else (ub - lb))
where
{
val lb = range_ibtw_lb(range)
val ub = range_ibtw_ub(range)
}(*where*)//end(gasz_length<range_ibtw>)
//
(* ****** ****** *)
(* ****** ****** *)
//
#impltmp
gseq_forall
<range_ibtw><si>
(    range    ) =
(
auxloop(lb, ub)) where
{
//
val lb = range_ibtw_lb(range)
val ub = range_ibtw_ub(range)
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
forall$test<si>(lb)
then
(
  auxloop(lb+1, ub)) else false)
//
}(*where*)//end(gseq_forall<range_ibtw>)
//
(* ****** ****** *)
(* ****** ****** *)
//
//
#impltmp
gseq_rforall
<range_ibtw><si>
(    range    ) =
(
if
(lb < ub)
then
auxloop
(lb, ub-1) else true)
where
{
//
val lb =
(
  range_ibtw_lb(range))
val ub =
(
  range_ibtw_ub(range))
//
fun
auxloop
( lb: si
, ub: si): bool = // lb <= ub
if
forall$test<si>(ub)
then
(
if
(lb < ub)
then
auxloop
(lb, ub-1) else true) else false
//
}(*where*)//end(gseq_rforall<range_ibtw>)
//
(* ****** ****** *)
(* ****** ****** *)
//
#impltmp
$UN.gasz_get$at$raw
< range_ibtw >< si >
(   range, index   ) =
(
range_ibtw_lb(range)+index)
(*where*)//end(gasz_get$at$raw<range_ibtw>)
//
(* ****** ****** *)
(* ****** ****** *)
//
(* ****** ****** *)(* ****** ****** *)(* ****** ****** *)
(* ****** ****** *)(* ****** ****** *)(* ****** ****** *)

(* end of [ATS3/XANADU_xatslib_githwxi_DATS_range00.dats] *)

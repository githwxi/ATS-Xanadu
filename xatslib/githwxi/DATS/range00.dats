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
#symload lb with range_ibtw_lb//of(0)
#symload ub with range_ibtw_ub//of(0)
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
#impltmp
g_print
<range_ibtw>
(   range   ) =
(
pstrn"range(";
g_print<sint>(lb);pstrn",";
g_print<sint>(ub);pstrn")")
where
{
val lb = range_ibtw_lb<>(range)
val ub = range_ibtw_ub<>(range)
}(*where*)//end(g_print<range_ibtw>)
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
val lb = range_ibtw_lb<>(range)
val ub = range_ibtw_ub<>(range)
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
val lb = range_ibtw_lb<>(range)
val ub = range_ibtw_ub<>(range)
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
rforall$test<si>(ub)
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
range_ibtw_lb<>(lbub) = lbub.0
#impltmp
range_ibtw_ub<>(lbub) = lbub.1
//
end(*local*)//end-of-[absimpl(range_ibtw)]
//
(* ****** ****** *)
//
#impltmp
<(*tmp*)>
range_ibtwe
( lb, ub ) = range_ibtw(lb,ub+1)
//
(* ****** ****** *)
(* ****** ****** *)
//
#extern
fun<>
range_ibtw_inter
( r1:range_ibtw
, r2:range_ibtw): range_ibtw
#symload inter with range_ibtw_inter//of(0)
//
#extern
fun<>
range_ibtw_union
( r1:range_ibtw
, r2:range_ibtw): range_ibtw
#symload union with range_ibtw_union//of(0)
//
(* ****** ****** *)
//
#impltmp
<(*tmp*)>
range_ibtw_inter
  (r1, r2) =
let
val lb = max
(r1.lb(),r2.lb())
val ub = min
(r1.ub(),r2.ub()) in range_ibtw(lb, rb)
end(*let*)//end-of-[range_ibtw_inter(r1,r2)]
//
#impltmp
<(*tmp*)>
range_ibtw_union
  (r1, r2) =
let
val lb = min
(r1.lb(),r2.lb())
val ub = max
(r1.ub(),r2.ub()) in range_ibtw(lb, rb)
end(*let*)//end-of-[range_ibtw_inter(r1,r2)]
//
(* ****** ****** *)
(* ****** ****** *)
//
#extern
fcast // fun
GSEQ_make_range_ibtw
(xs: range_ibtw): GSEQ(range_ibtw, sint)
#symload GSEQ with GSEQ_make_range_ibtw of 1000
//
#extern
fcast // fun
GASZ_make_range_ibtw
(xs: range_ibtw): GASZ(range_ibtw, sint)
#symload GASZ with GASZ_make_range_ibtw of 1000
//
(* ****** ****** *)
(* ****** ****** *)
//
(* ****** ****** *)(* ****** ****** *)(* ****** ****** *)
(* ****** ****** *)(* ****** ****** *)(* ****** ****** *)

(* end of [ATS3/XANADU_xatslib_githwxi_DATS_range00.dats] *)

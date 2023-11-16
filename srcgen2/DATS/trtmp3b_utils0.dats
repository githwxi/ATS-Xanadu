(***********************************************************************)
(*                                                                     *)
(*                         Applied Type System                         *)
(*                                                                     *)
(***********************************************************************)

(*
** ATS/Xanadu - Unleashing the Potential of Types!
** Copyright (C) 2023 Hongwei Xi, ATS Trustful Software, Inc.
** All rights reserved
**
** ATS is free software;  you can  redistribute it and/or modify it under
** the terms of  the GNU GENERAL PUBLIC LICENSE (GPL) as published by the
** Free Software Foundation; either version 3, or (at  your  option)  any
** later version.
** 
** ATS is distributed in the hope that it will be useful, but WITHOUT ANY
** WARRANTY; without  even  the  implied  warranty  of MERCHANTABILITY or
** FITNESS FOR A PARTICULAR PURPOSE.  See the  GNU General Public License
** for more details.
** 
** You  should  have  received  a  copy of the GNU General Public License
** along  with  ATS;  see the  file COPYING.  If not, please write to the
** Free Software Foundation,  51 Franklin Street, Fifth Floor, Boston, MA
** 02110-1301, USA.
*)

(* ****** ****** *)
//
(*
Author: Hongwei Xi
(*
Mon Oct 23 00:46:25 EDT 2023
*)
Authoremail: gmhwxiATgmailDOTcom
*)
//
(* ****** ****** *)
#include
"./../HATS/xatsopt_sats.hats"
#include
"./../HATS/xatsopt_dats.hats"
(* ****** ****** *)
#define
ATS_PACKNAME
"ATS3.XANADU.xatsopt-20220500"
(* ****** ****** *)
#staload "./../SATS/xbasics.sats"
(* ****** ****** *)
#staload "./../SATS/xstamp0.sats"
(* ****** ****** *)
#staload "./../SATS/xlabel0.sats"
(* ****** ****** *)
#staload "./../SATS/xsymbol.sats"
#staload "./../SATS/xsymmap.sats"
(* ****** ****** *)
#staload "./../SATS/staexp2.sats"
#staload "./../SATS/statyp2.sats"
(* ****** ****** *)
#staload "./../SATS/dynexp2.sats"
#staload "./../SATS/dynexp3.sats"
(* ****** ****** *)
#staload "./../SATS/trtmp3b.sats"
(* ****** ****** *)
#symload name with d2cst_get_name
(* ****** ****** *)
#symload node with s2typ_get_node
(* ****** ****** *)
#symload node with dimpl_get_node
(* ****** ****** *)
#symload s2vs with s2qag_get_s2vs
#symload s2vs with t2qag_get_s2vs
(* ****** ****** *)
#symload t2ps with t2jag_get_t2ps
(* ****** ****** *)
#staload _ = "./xsymmap_topmap.dats"
(* ****** ****** *)

local

fun
f1_s2extq
(s2v0: s2var
,s2vs: s2varlst): bool =
(
case+ s2vs of
|
list_nil() => false
|
list_cons(s2v1, s2vs) =>
if
s2v0 = s2v1
then true
else f1_s2extq(s2v0, s2vs))
//
fun
f2_s2extq
(s2v0: s2var
,t2qs: t2qaglst): bool =
(
case+ t2qs of
|
list_nil() => false
|
list_cons(t2q1, t2qs) =>
if
f1_s2extq
(s2v0, t2q1.s2vs())
then true
else f2_s2extq(s2v0, t2qs))
//
fun
f3_s2extq
(s2v0: s2var
,s2qs: s2qaglst
,t2qs: t2qaglst): bool =
(
case+ s2qs of
|
list_nil() =>
f2_s2extq(s2v0, t2qs)
|
list_cons(s2q1, s2qs) =>
if
f1_s2extq
(s2v0, s2q1.s2vs())
then true
else f3_s2extq(s2v0, s2qs, t2qs))

(* ****** ****** *)
//
fun
f0_d3clmat
(d3cl: d3ecl
,t2js: t2jaglst): optn(s2vts) =
(
case+
d3cl.node() of
|
D3Cimplmnt0
( tok0
, stmp
, sqas, tqas
, dimp, t2is
, f3as, sres, body) =>
(
case+
dimp.node() of
|DIMPLone2
(_(*dcst*), svts) =>
f0_targmat(svts,t2js,sqas,tqas)
|
_(* otherwise *) => optn_nil(*0*)
)
|
_(* otherwise *) => optn_nil(*0*)
) where
{
(*
val () =
prerrln("f0_d3clmat: d3cl = ", d3cl)
val () =
prerrln("f0_d3clmat: t2js = ", t2js)
*)
}(*where*)//end-of-[f0_d3clmat(d3cl,...)]
//
and
f0_targmat
(svts: s2vts
,t2js: t2jaglst
,s2qs: s2qaglst
,t2qs: t2qaglst): optn(s2vts) =
let
val
tsub = list_vt_nil(*0*)
val
opt0 =
f1_svts_t2js(svts, t2js, tsub)
in//let
case+ opt0 of
| ~
optn_vt_nil() => optn_nil(*0*)
| ~
optn_vt_cons(tsub) =>
optn_cons(list_vt2t(reverse0(tsub)))
end where // end-of-[f0_targmat(...)]
{
//
#typedef
s2vt1 =
(s2var, s2typ)
#vwtpdef
s2vts_vt =
list_vt@(s2var, s2typ)
//
fun
f2_tip1_tjp1
( tip1
: s2typ
, tjp1
: s2typ
, tsub
: &s2vts_vt >> _): bool =
(
case+
tip1.node() of
//
|T2Pvar _ =>
(g2_svar_tjp1(tip1,tjp1,tsub))
//
|T2Pcst _ =>
(g2_scst_tjp1(tip1,tjp1,tsub))
//
|T2Papps _ =>
(g2_apps_tjp1(tip1,tjp1,tsub))
//
|T2Ptext _ =>
(g2_text_tjp1(tip1,tjp1,tsub))
//
|T2Ptrcd _ =>
(g2_trcd_tjp1(tip1,tjp1,tsub))
//
|T2Pnone0((*0*)) => (   true   )
|T2Pnone1(s2typ) => (   true   )
|T2Ps2exp(s2exp) => (   true   )
//
|_(* otherwise *) => (   false   )
//
) where
{
//
(* ****** ****** *)
//
fun
g2_svar_tjp1
( tip1
: s2typ
, tjp1
: s2typ
, tsub
: &s2vts_vt >> _): bool =
let
//
val-
T2Pvar
(s2vi) = tip1.node()
//
fun
h2_search
( svts
: !s2vts_vt): s2typopt_vt =
(
case+ svts of
| !
list_vt_nil
( (*void*) ) =>
optn_vt_nil(*void*)
| !
list_vt_cons
(svt1, svts) =>
(
if
(s2vi != svt1.0)
then h2_search(svts)
else optn_vt_cons(svt1.1)))
//
in//let
//
if
f3_s2extq
(
s2vi,s2qs,t2qs
)
then
(
case+
h2_search(tsub) of
| ~
optn_vt_nil() =>
(
  true ) where {
val () =
tsub :=
list_vt_cons((s2vi,tjp1),tsub)
}
| ~
optn_vt_cons(tip1) =>
(
f2_tip1_tjp1(tip1, tjp1, tsub)))
else
(
case+
tjp1.node() of
|
T2Pvar(s2vj) =>
if
(s2vi = s2vj) then true else false
//
|_(*non-T2Pvar*) => (    false    ))
//
end(*let*)//end of [g2_svar_tjp1(...)]
//
(* ****** ****** *)
//
fun
g2_scst_tjp1
( tip1
: s2typ
, tjp1
: s2typ
, tsub
: &s2vts_vt >> _): bool =
let
val-
T2Pcst(s2ci) = tip1.node()
in//let
(
case+
tjp1.node() of
//
|
T2Pcst(s2cj) =>
if
(s2ci = s2cj) then true else false
//
|
_(*non-T2Pvar*) => (    false    ))
end(*let*)//end of [g2_scst_tjp1(...)]
//
(* ****** ****** *)
//
fun
g2_apps_tjp1
( tip1
: s2typ
, tjp1
: s2typ
, tsub
: &s2vts_vt >> _): bool =
let
val-
T2Papps
(t2fi, tips) = tip1.node()
in//let
(
case+
tjp1.node() of
//
|
T2Papps
(t2fj, tjps) =>
let
val res1 =
f2_tip1_tjp1(t2fi, t2fj, tsub)
in//let
(if
 res1
 then
 f2_tips_tjps
 (tips, tjps, tsub) else false)
end//let
//
|
_(*non-T2Pvar*) => (    false    ))
end(*let*)//end of [g2_apps_tjp1(...)]
//
(* ****** ****** *)
//
fun
g2_text_tjp1
( tip1
: s2typ
, tjp1
: s2typ
, tsub
: &s2vts_vt >> _): bool =
let
val-
T2Ptext
(tnmi, tips) = tip1.node()
in//let
(
case+
tjp1.node() of
//
|
T2Ptext
(tnmj, tjps) =>
let
val res1 = (tnmi = tnmj)
in//let
(if
 res1
 then
 f2_tips_tjps
 (tips, tjps, tsub) else false)
end//let
//
|
_(*non-T2Pvar*) => (    false    ))
end(*let*)//end of [g2_text_tjp1(...)]
//
(* ****** ****** *)
//
fun
g2_trcd_tjp1
( tip1
: s2typ
, tjp1
: s2typ
, tsub
: &s2vts_vt >> _): bool =
let
val-
T2Ptrcd
(kndi
,npfi, ltis) = tip1.node()
in//let
(
case+
tjp1.node() of
//
|
T2Ptrcd
(kndj
,npfj, ltjs) =>
let
val res1 =
trcdknd_equal
(kndi , kndj)
val res1 =
if res1 then 
(npfi = npfj) else false
in//let
(if
 res1
 then
 f2_ltis_ltjs
 (ltis, ltjs, tsub) else false)
end//let
//
|
_(*non-T2Pvar*) => (    false    ))
end(*let*)//end of [g2_text_tjp1(...)]
//
(* ****** ****** *)
//
val tip1 = s2typ_hnfiz0(tip1)
val tjp1 = s2typ_hnfiz0(tjp1)
//
(*
val (  ) =
prerrln("f2_tip1_tjp1: tip1 = ", tip1)
val (  ) =
prerrln("f2_tip1_tjp1: tjp1 = ", tjp1)
*)
//
}(*where*)
//end-of-[f2_tip1_tjp1(tip1,tjp1,tsub)]
//
(* ****** ****** *)
//
and
f2_tips_tjps
( tips
: s2typlst
, tjps
: s2typlst
, tsub
: &s2vts_vt >> _): bool =
(
case+ tips of
|list_nil() => true
|list_cons(tip1, tips) =>
(
case+ tjps of
|list_nil() => true
|list_cons(tjp1, tjps) =>
let
val res1 =
f2_tip1_tjp1(tip1, tjp1, tsub)
in//let
(if
 res1
 then
 f2_tips_tjps
 (tips, tjps, tsub) else false)
end//let
)
)(*case+*)
//end-of-[f2_tips_tjps(tips,tjps,tsub)]
//
(* ****** ****** *)
//
and
f2_ltis_ltjs
( ltis
: l2t2plst
, ltjs
: l2t2plst
, tsub
: &s2vts_vt >> _): bool =
(
case+ ltis of
|list_nil() => true
|list_cons(lti1, ltis) =>
(
case+ ltjs of
|list_nil() => true
|list_cons(ltj1, ltjs) =>
let
//
val
S2LAB(li, tip1) = lti1
val
S2LAB(lj, tjp1) = ltj1
val res1 =
if (li = lj) then
f2_tip1_tjp1
(tip1, tjp1, tsub) else false
//
in//let
(if
 res1
 then
 f2_ltis_ltjs
 (ltis, ltjs, tsub) else false)
end//let
)
)(*case+*)
//end-of-[f2_tips_tjps(tips,tjps,tsub)]
//
(* ****** ****** *)
//
fun
f2_svt1_tjp1
( svt1
: s2vt1
, tjp1
: s2typ
, tsub
: s2vts_vt): optn_vt(s2vts_vt) =
let
val (_, tip1) = svt1
in//let
case
tip1.node() of
|
T2Pvar(s2vi) =>
(
if
f3_s2extq(s2vi, s2qs, t2qs)
then
optn_vt_cons
(
list_vt_cons((s2vi,tjp1),tsub))
else
(
case+
tjp1.node() of
|
T2Pvar(s2vj) =>
if
(s2vi = s2vj)
then optn_vt_cons(tsub)
else (free(tsub); optn_vt_nil())
|
_(*non-T2Pvar*) =>
let
val () =
free(tsub) in optn_vt_nil() end))
|
_(*non-T2Pvar*) =>
let
//
var
tsub = tsub
val
res0 =
f2_tip1_tjp1(tip1, tjp1, tsub)
//
in//let
  if res0
  then optn_vt_cons(tsub)
  else (free(tsub); optn_vt_nil())
end//let
end//let
//end-of-[f2_svt1_tjp1(svt1,tjp1,tsub)]
//
fun
f1_svts_t2js
( svts
: s2vts
, t2js
: t2jaglst
, tsub
: s2vts_vt): optn_vt(s2vts_vt) =
(
case+ svts of
|list_nil() =>
(
  optn_vt_cons(tsub) )
|list_cons(svt1, svts) =>
(
  f1_svt1_svts_t2js
  (svt1, svts, t2js, tsub)) )
//
and
f1_svt1_svts_t2js
( svt1
: s2vt1
, svts
: s2vts
, t2js
: t2jaglst
, tsub
: s2vts_vt): optn_vt(s2vts_vt) =
//
(
case+ t2js of
|list_nil() =>
(
  optn_vt_cons(tsub) )
|list_cons(t2j1, t2js) =>
let
val tjps = t2j1.t2ps()
in//let
f1_svt1_svts_tjps_t2js
(svt1, svts, tjps, t2js, tsub)
end//let//end-of-[list_cons(...)]
)(*case+*)//end-of-[f1_svt1_svts_t2js]
//
and
f1_svt1_svts_tjps_t2js
( svt1
: s2vt1
, svts
: s2vts
, tjps
: s2typlst
, t2js
: t2jaglst
, tsub
: s2vts_vt): optn_vt(s2vts_vt) =
(
case+ tjps of
|
list_nil() =>
(
  f1_svt1_svts_t2js
  (svt1, svts, t2js, tsub) )
|
list_cons(tjp1, tjps) =>
let
val opt1 =
f2_svt1_tjp1(svt1, tjp1, tsub)
in//let
//
case+ opt1 of
| ~
optn_vt_nil() => optn_vt_nil()
| ~
optn_vt_cons(tsub) =>
(
case+ svts of
|list_nil((*0*)) =>
(
  optn_vt_cons(tsub) )
|list_cons(svt1, svts) =>
(
  f1_svt1_svts_tjps_t2js
  (svt1, svts, tjps, t2js, tsub)) )
//
endlet//end-of-[list_cons(t2j1,t2js)]
)(*case+*)//end-[f1_svt1_svts_tjps_t2js]
//
(*
val () =
  prerrln("f0_targmat: svts = ", svts)
val () =
  prerrln("f0_targmat: t2js = ", t2js)
val () =
  prerrln("f0_targmat: s2qs = ", s2qs)
val () =
  prerrln("f0_targmat: t2qs = ", t2qs)
*)
//
}(*where*)//end-of-[f0_targmat(svts,...)]
//
(* ****** ****** *)
in (*local*)
(* ****** ****** *)
//
#implfun
tr3benv_tapq_resolve
  (env0, d2c0, t2js) =
let
//
val
stmp =
tr3benv_getstmp(env0)
//
val
dcls =
tr3benv_search_cst(env0, d2c0)
//
in//let
//
let
val dcls = filter(dcls)
in//let
timpl_make_node
(stmp, TIMPLall1(d2c0, dcls)) end//let
//
end where
{
//
fun
filter
( dcls
: d3eclist_vt): d3eclist =
(
//
case+ dcls of
| ~
list_vt_nil() => list_nil()
| ~
list_vt_cons
(dcl1, dcls) =>
let
val opt1 =
  f0_d3clmat(dcl1, t2js)
in//let
case+ opt1 of
|optn_nil
((*void*)) => filter( dcls )
|optn_cons
(  tsub  ) =>
let
//
val
dcl1 = d3ecl_tmpsub(tsub,dcl1)
//
(*
val (  ) =
prerr("tr3benv_tapq_resolve:")
val (  ) =
prerrln("filter: dcl1 = ", dcl1)
*)
//
in//let
(
  list_cons(dcl1, filter(dcls)))
end//let
end//let//end-of-[list_cons(...)]
//
)(*case+*) // end of [ filter(dcls) ]
//
(*
val () =
prerrln("tr3benv_tapq_resolve: d2c0 = ", d2c0)
val () =
prerrln("tr3benv_tapq_resolve: t2js = ", t2js)
*)
//
}(*where*)//end-of-[tr3benv_tapq_resolve(env0,...)]
//
(* ****** ****** *)

end(*local*) // end-of-[local(tr3benv_tapq_resolve)]

(* ****** ****** *)

(* end of [ATS3/XATSOPT_srcgen2_trtmp3b_utils0.dats] *)

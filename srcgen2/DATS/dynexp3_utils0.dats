(***********************************************************************)
(*                                                                     *)
(*                         Applied Type System                         *)
(*                                                                     *)
(***********************************************************************)

(*
** ATS/Xanadu - Unleashing the Potential of Types!
** Copyright (C) 2022 Hongwei Xi, ATS Trustful Software, Inc.
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
Tue 25 Jul 2023 08:42:01 PM EDT
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
#staload "./../SATS/xsymmap.sats"
(* ****** ****** *)
#staload "./../SATS/lexing0.sats"
(* ****** ****** *)
#staload "./../SATS/staexp2.sats"
#staload "./../SATS/statyp2.sats"
(* ****** ****** *)
#staload "./../SATS/dynexp2.sats"
#staload "./../SATS/dynexp3.sats"
(* ****** ****** *)
#symload node with token_get_node
(* ****** ****** *)
#symload node with s2typ_get_node
(* ****** ****** *)
#symload lctn with simpl_get_lctn
#symload node with simpl_get_node
(* ****** ****** *)
#symload lctn with dimpl_get_lctn
#symload node with dimpl_get_node
(* ****** ****** *)
#symload lctn with d3ecl_get_lctn
#symload node with d3ecl_get_node
(* ****** ****** *)
#staload _ = "./xsymmap_topmap.dats"
(* ****** ****** *)
//
(*
HX-2023-11-19:
This one needs to be called on an
embedded impltmp before it is pushed
onto the search path for tmp resolution!
*)
#implfun
d3ecl_impsub
(knd0, tsub, d3cl) =
(
case+
d3cl.node() of
//
| D3Cimplmnt0 _ =>
(
  f0_implmnt0(d3cl) )
//
| _(*otherwise*) =>
(
  d3ecl_tmpsub(tsub, d3cl) )
) where
{
//
fun
f0_implmnt0
(d3cl: d3ecl): d3ecl =
let
//
val
loc0 = d3cl.lctn()
//
val-
D3Cimplmnt0
( tknd
, stmp
, sqas
, tqas
, dimp
, tias, f3as
, sres, dexp) = d3cl.node()
//
val dimp =
(
case+
dimp.node() of
|
DIMPLone2
(d2c0, svts) =>
let
val loc1 =
dimp.lctn((*0*))
val svts =
(
  list_map(svts)) where
{
#typedef
vt = (s2var, s2typ)
#impltmp
map$fopr<vt><vt>(vt) =
( vt.0
, s2typ_subst0(vt.1, tsub))}
//
in//let
//
dimpl_make_node
(loc1, DIMPLone2(d2c0, svts))
//
end//let
| _(* otherwise *) => ( dimp )
)
in//let
//
(
d3ecl_tmpsub(tsub, d3cl)
) where
{
//
val
d3cl =
d3ecl_make_node
(
loc0,
D3Cimplmnt0
(
tknd, stmp,
sqas, tqas,
dimp, tias, f3as, sres, dexp) )
where
{
(*
HX: re-stamping if knd0 > 0
*)
val stmp =
(
if
knd0 <= 0 then
stmp else the_d3imp_stamp_new())
//
}(*where*)
//
}(*where*)
//
end(*let*)//end-of-[f0_implmnt0(...)]
//
}(*where*)//end-of-[d3ecl_impsub(...)]
//
(* ****** ****** *)
//
#implfun
d3ecl_tmpsub
(tsub, d3cl) =
let
val loc0 = d3cl.lctn()
in//let
d3ecl(loc0, D3Ctmpsub(tsub, d3cl))
end(*let*)//end-of-[d3ecl_tmpsub(...)]
//
(* ****** ****** *)
(* ****** ****** *)
//
#implfun
d3imp_d2csteq
( d3cl, d2c0 ) =
(
case+
d3cl.node() of
|
D3Cfundclst _ => f0_fundclst(d3cl)
|
D3Cimplmnt0 _ => f0_implmnt0(d3cl)
//
| _(* otherwise *) => (   false   )
//
) where
{
//
fun
f0_fundclst
(d3cl: d3ecl): bool =
let
//
val-
D3Cfundclst
( tknd, tqas
, d2cs, d3fs) = d3cl.node()
//
in//let
(
list_exists(d2cs)
) where
{
#impltmp
exists$test
<  d2cst  >(d2c1) = (d2c0 = d2c1)
}
end (*let*) // end of [f0_fundclst(...)]
//
(* ****** ******)
//
fun
f0_implmnt0
(d3cl: d3ecl): bool =
let
//
val-
D3Cimplmnt0
( tknd
, stmp(*unicity*)
, sqas, tqas
, dimp
, tias, f3as
, sres, dexp) = d3cl.node()
//
in//let
//
case+
dimp.node() of
|DIMPLone1
(   d2c1   ) => (d2c0 = d2c1)
|DIMPLone2
(d2c1, svts) => (d2c0 = d2c1)
| _(* otherwise *) => (   false   )
//
end (*let*) // end of [f0_implmnt0(...)]
//
} (*where*) // end of [d3imp_d2csteq(...)]
//
(* ****** ****** *)
//
#implfun
d3imp_stampeq
( d3cl, tmp0 ) =
(
case+
d3cl.node() of
//
|
D3Ctmpsub
(svts, dcl1) =>
(
  d3imp_stampeq(dcl1, tmp0))
//
|
D3Cimplmnt0 _ => f0_implmnt0(d3cl)
//
| _(* otherwise *) => (   false   )
//
) where
{
//
fun
f0_implmnt0
(d3cl: d3ecl): bool =
let
//
val-
D3Cimplmnt0
( tknd
, tmp1(*unicity*)
, sqas, tqas
, dimp
, tias, f3as
, sres, dexp) = d3cl.node()
//
in//let
//
if tmp0 = tmp1 then true else false
//
end (*let*) // end of [f0_implmnt0(...)]
//
} (*where*) // end of [d3imp_stampeq(...)]
//
(* ****** ****** *)
//
#implfun
d3imp_get_stmp
  ( d3cl ) =
(
case+
d3cl.node() of
//
|
D3Cimplmnt0
( tknd
, stmp
, sqas, tqas
, dimp
, tias, f3as
, sres, dexp) => stmp
//
|
D3Ctmpsub
(svts, d3cl) =>
(
  d3imp_get_stmp(d3cl))
//
|
D3Ctmplocal
(d3cl, dcls) =>
(
  d3imp_get_stmp(d3cl))
//
|
_(* otherwise *) => the_stamp_nil(*0*)
//
)(*case+*) // end of [d3imp_get_stmp(...)]
//
(* ****** ****** *)
//
#implfun
d3ecl_impltmpq
  ( d3cl ) =
(
case+
d3cl.node() of
//
|
D3Ctmplocal _ => ( true )
//
|
D3Cfundclst
( tknd, tqas
, d2cs, d3fs) => list_consq(tqas)
//
|
D3Cimplmnt0
( tknd
, stmp
, sqas,tqas
, dimp,tias
, f3as,sres,dexp) => dimpl_tmpq(dimp)
//
| _(* otherwise *) => (    false    ))
//(*case+*)//end-of-[d3ecl_impltmpq(d3cl)]
//
(* ****** ****** *)
//
#implfun
d3ecl_impltmpr
( stmp, d3cl ) =
let
val loc0 = d3cl.lctn()
in//let
(
  d3ecl(loc0, D3Cimpltmpr(stmp, d3cl)))
end(*let*) // end-of-[d3ecl_impltmpr(...)]
//
(* ****** ****** *)
//
#implfun
d3ecl_impltmprq
  ( d3cl ) =
(
case+
d3cl.node() of
//
|
D3Ctmpsub
(svts, dcl1) =>
d3ecl_impltmprq(dcl1)
//
|
D3Ctmplocal
(dcl1, dcls) =>
d3ecl_impltmprq(dcl1)
//
|
D3Cimplmnt0
( tknd
, stmp
, sqas,tqas
, dimp,tias
, f3as,sres,dexp) =>
(
implknd_recq(knd0)) where
{
val-T_IMPLMNT(knd0) = tknd.node()
}
//
| _(* otherwise *) => (   false   )
) where
{
//
  val () =
  prerrln
  ("d3ecl_impltmprq: d3cl = ", d3cl)
//
}(*where*)//end-of-[d3ecl_impltmprq(d3cl)]
//
(* ****** ****** *)
(* ****** ****** *)

#implfun
static_search_dcst
  (d3cl, d2c0) =
(
case+
d3cl.node() of
| D3Cstaload _ =>
(
  f0_staload(d3cl, d2c0) )
| _(* otherwise *) => list_nil()
) where
{
//
fun
f0_staload
( d3cl: d3ecl
, d2c0: d2cst): d3eclist =
let
//
val-
D3Cstaload
( knd0
, tknd, gsrc
, fopt, dopt) = d3cl.node()
//
in//let
//
case+ dopt of
|
S3TALOADnone(s2ta) =>
(
  list_nil(*void*) )
|
S3TALOADdpar(shrd, dpar) =>
let
//
val
tenv =
d3parsed_get_t3penv(dpar)
//
(*
val () = prerrln
("static_search_dcst: shrd = ", shrd)
val () = prerrln
("static_search_dcst: tenv = ", tenv)
*)
//
in//let
//
case+ tenv of
|
D3TOPENVnone() =>
list_nil((*void*))
|
D3TOPENVsome(tmap) =>
let
val opt0 =
topmap_search_opt
(tmap, d2c0.name()) in//let
//
case+ opt0 of
| ~optn_vt_nil() => list_nil()
| ~optn_vt_cons(dcls) => ( dcls )
end//let//end-of-[D3TOPENVsome(...)]
//
end(*end-of-[S3TALOADdpar(sknd,dpar)]*)
//
end//let//end-of-[f0_staload(d3cl,d2c0)]
//
(*
val () =
prerrln("static_search_dcst: d3cl = ", d3cl)
val () =
prerrln("static_search_dcst: d2c0 = ", d2c0)
*)
//
}(*where*) // end of [static_search_dcst(...)]

(* ****** ****** *)
(* ****** ****** *)

local
//
fun
f0_targequ
(svts: s2vts
,t2js: t2jaglst): bool =
(
  f1_svts_t2js(svts, t2js)
) where {
//
fun
f1_svts_t2js
( svts: s2vts
, t2js: t2jaglst): bool =
(
case+ svts of
|
list_nil((*void*)) => true
|
list_cons(svt1, svts) =>
f1_svt1_svts_t2js(svt1,svts,t2js)
)(*case+*)//end-of-[f1_svts_t2js]
//
and
f1_svt1_svts_t2js
( svt1: s2vt1
, svts: s2vts
, t2js: t2jaglst): bool =
(
case+ t2js of
|
list_nil() => true
|
list_cons(t2j1, t2js) =>
let
val tjps = t2j1.t2ps()
in//let
(
  f1_svt1_svts_tjps_t2js
  ( svt1 , svts , tjps , t2js ) )
end//let//end-of-[list_cons(...)]
)(*case+*)//end-of-[f1_svt1_svts_t2js]
//
and
f1_svt1_svts_tjps_t2js
( svt1: s2vt1
, svts: s2vts
, tjps: s2typlst
, t2js: t2jaglst): bool =
(
case+ tjps of
|
list_nil() =>
(
f1_svt1_svts_t2js
(svt1 , svts , t2js))
|
list_cons(tjp1, tjps) =>
let
//
val
ans1 =
f2_svt1_tjp1(svt1, tjp1)
//
in//let
//
case+ ans1 of
| false => false
| (true) =>
(
case+ svts of
|list_nil((*0*)) => true
|list_cons(svt1, svts) =>
(
  f1_svt1_svts_tjps_t2js
  ( svt1 , svts , tjps , t2js ) ) )
//
endlet//end-of-[list_cons(t2j1,t2js)]
)(*case+*)//end-[f1_svt1_svts_tjps_t2js]
//
} where {
//
#typedef
s2vt1 = (s2var, s2typ)
//
fun
f2_svt1_tjp1
( svt1: s2vt1
, tjp1: s2typ): bool =
let
  val (_, tip1) = svt1
in//let
  f2_tip1_tjp1(tip1, tjp1) end
//
and
f2_tip1_tjp1
( tip1: s2typ
, tjp1: s2typ): bool =
(
case+
tip1.node() of
//
|T2Pvar _ =>
(
  g2_svar_tjp1(tip1, tjp1))
//
|T2Pcst _ =>
(
  g2_scst_tjp1(tip1, tjp1))
//
|T2Papps _ =>
(
  g2_apps_tjp1(tip1, tjp1))
//
|T2Ptext _ =>
(
  g2_text_tjp1(tip1, tjp1))
//
|T2Ptrcd _ =>
(
  g2_trcd_tjp1(tip1, tjp1))
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
fun
g2_svar_tjp1
( tip1: s2typ
, tjp1: s2typ): bool =
let
val-
T2Pvar(s2vi) = tip1.node()
in//let
case+
tjp1.node() of
|
T2Pvar(s2vj) => (s2vi = s2vj)
|
_(*non-T2Pvar*) => (   false   )
end//let//end-of-[g2_svar_tjp1(...)]
//
(* ****** ****** *)
//
fun
g2_scst_tjp1
( tip1: s2typ
, tjp1: s2typ): bool =
let
val-
T2Pcst(s2ci) = tip1.node()
in//let
case+
tjp1.node() of
|
T2Pcst(s2cj) => (s2ci = s2cj)
|
_(*non-T2Pvar*) => (    false    )
end(*let*)//end of [g2_scst_tjp1(...)]
//
(* ****** ****** *)
//
fun
g2_apps_tjp1
( tip1: s2typ
, tjp1: s2typ): bool =
let
val-
T2Papps
(t2fi, tips) = tip1.node()
in//let
case+
tjp1.node() of
|
T2Papps
(t2fj, tjps) =>
let
val res1 =
f2_tip1_tjp1(t2fi, t2fj)
in//let
if
res1
then
f2_tips_tjps
(tips, tjps) else false end//let
|
_(*non-T2Papps*) => (    false    )
end(*let*)//end of [g2_apps_tjp1(...)]
//
(* ****** ****** *)
//
fun
g2_text_tjp1
( tip1: s2typ
, tjp1: s2typ): bool =
let
val-
T2Ptext
(tnmi, tips) = tip1.node()
in//let
case+
tjp1.node() of
|
T2Ptext
(tnmj, tjps) =>
let
val res1 = (tnmi = tnmj)
in//let
if
res1
then
f2_tips_tjps
(tips, tjps) else false end//let
|
_(*non-T2Ptext*) => (    false    )
end(*let*)//end-of-[g2_text_tjp1(...)]
//
(* ****** ****** *)
//
fun
g2_trcd_tjp1
( tip1: s2typ
, tjp1: s2typ): bool =
let
val-
T2Ptrcd
(kndi
,npfi, ltis) = tip1.node()
in//let
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
if
res1
then
f2_ltis_ltjs
(ltis, ltjs) else false end//let
//
|
_(*non-T2Ptrcd*) => (    false    )
end(*let*)//end of [g2_trcd_tjp1(...)]
//
(* ****** ****** *)
//
}(*where*)//end-of-[f2_tip1_tjp1(...)]
//
(* ****** ****** *)
//
and
f2_tips_tjps
(
tips:s2typlst,
tjps:s2typlst): bool =
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
f2_tip1_tjp1(tip1, tjp1)
in//let
(if
 res1
 then
 f2_tips_tjps
 (tips, tjps) else false) end//let
)
)(*case+*)//end-of-[f2_tips_tjps(...)]
//
(* ****** ****** *)
//
and
f2_ltis_ltjs
(
ltis:l2t2plst,
ltjs:l2t2plst): bool =
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
if
(li = lj)
then
f2_tip1_tjp1
(tip1, tjp1) else false//end-if
//
in//let
if
res1
then
f2_ltis_ltjs
(ltis, ltjs) else false end//let
)
)(*case+*)
//end-of-[f2_ltis_ltjs( tips, tjps )]
//
(* ****** ****** *)
//
val () =
(
  prerrln("f0_targequ: svts = ", svts) )
val () =
(
  prerrln("f0_targequ: t2js = ", t2js) )
//
(* ****** ****** *)
//
}(*where*) // end-of-[ f0_targequ(svts,t2js) ]
//
(* ****** *)
in (*local*)
(* ****** *)
//
#implfun
tmpequal_d3cl_t2js
  (d3cl, t2js) =
(
  f0_main(d3cl, t2js)
) where
{
//
fun
f0_main
( d3cl
: d3ecl
, t2js
: t2jaglst): bool =
(
case+
d3cl.node() of
//
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
//
|
DIMPLone2
(_(*dcst*), svts) =>
(
  f0_targequ(svts, t2js) )
//
|
_(*otherwise*) => ( false )
//
) (*case+*)//end-of-[D3Cimplmnt0(...)]
//
|
D3Ctmpsub
(tsub, dcl1) => f0_main(dcl1, t2js)
//
| _(* otherwise *) => (     false     )
//
) (*case+*) // end-of-[f0_main(d3cl,t2js)]
//
} where {
//
(*
val () =
prerrln("tmpequal_d3cl_t2js: d3cl = ", d3cl)
val () =
prerrln("tmpequal_d3cl_t2js: t2js = ", t2js)
*)
//
}(*where*)//end-of-[tmpequal_d3cl_t2js(d3cl,t2js)]
//
(* ****** ****** *)
end(*local*)//end-of-[local(tmpequal_d3cl_t2js...)]
(* ****** ****** *)
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
case+
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
(* ****** ****** *)
//
and
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
_(*non-T2Pcst*) => (    false    ))
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
_(*non-T2Papps*) => (    false    ))
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
_(*non-T2Ptext*) => (    false    ))
end(*let*)//end-of-[g2_text_tjp1(...)]
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
_(*non-T2Ptrcd*) => (    false    ))
end(*let*)//end of [g2_trcd_tjp1(...)]
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
//end-of-[f2_ltis_ltjs(ltis,ltjs,tsub)]
//
(* ****** ****** *)
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
(
  prerrln("f0_targmat: svts = ", svts) )
val () =
(
  prerrln("f0_targmat: t2js = ", t2js) )
val () =
(
  prerrln("f0_targmat: s2qs = ", s2qs) )
val () =
(
  prerrln("f0_targmat: t2qs = ", t2qs) )
*)
//
}(*where*)//end-of-[f0_targmat(svts,...)]
//
(* ****** ****** *)
in (*local*)
(* ****** ****** *)
//
#implfun
tmpmatch_d3cl_t2js
  (d3cl, t2js) =
(
  f0_main(d3cl, t2js)
) where
{
(* ****** ****** *)
//
fun
f0_main
( d3cl
: d3ecl
, t2js
: t2jaglst): optn(s2vts) =
(
case+
d3cl.node() of
//
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
//
|
DIMPLone2
(_(*dcst*), svts) =>
(
  f0_targmat
  (svts, t2js, sqas, tqas) )
//
|
_(*otherwise*) => optn_nil((*void*))
//
) (*case+*)//end-of-[D3Cimplmnt0(...)]
//
|
D3Ctmpsub
(tsub, dcl1) =>
let
val
topt = f0_main(dcl1, t2js)
in//let
//
case+ topt of
|
optn_nil() => optn_nil()
|
optn_cons(svts) =>
optn_cons(list_append(svts, tsub))
//
end(*let*) // end of [ D3Ctmpsub(...) ]
//
| _(* otherwise *) => optn_nil((*void*))
//
) (*case+*) // end-of-[f0_main(d3cl,t2js)]
//
(* ****** ****** *)
//
} where {
//
(*
val () =
prerrln("tmpmatch_d3cl_t2js: d3cl = ", d3cl)
val () =
prerrln("tmpmatch_d3cl_t2js: t2js = ", t2js)
*)
//
}(*where*)//end-of-[tmpmatch_d3cl_t2js(d3cl,t2js)]
//
(* ****** ****** *)
end(*local*)//end-of-[local(tmpmatch_d3cl_t2js...)]
(* ****** ****** *)
(* ****** ****** *)

(* end of [ATS3/XATSOPT_srcgen2_dynexp3_utils0.dats] *)

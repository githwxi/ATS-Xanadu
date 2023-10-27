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
#staload "./../SATS/xstamp0.sats"
(* ****** ****** *)
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
#staload _ = "./xsymmap_topmap.dats"
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

#implfun
static_search_cst
  (d3cl, d2c0) =
(
case+
d3cl.node() of
| D3Cstaload _ =>
  f0_staload(d3cl, d2c0)
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
val () = prerrln
("static_search_cst: shrd = ", shrd)
val () = prerrln
("static_search_cst: tenv = ", tenv)
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
val () =
prerrln("static_search_cst: d3cl = ", d3cl)
val () =
prerrln("static_search_cst: d2c0 = ", d2c0)
//
} (*where*)//end of [static_search_cst(...)]

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
val () =
prerrln("f0_d3clmat: d3cl = ", d3cl)
val () =
prerrln("f0_d3clmat: t2js = ", t2js)
}(*where*)//end-of-[f0_d3clmat(d3cl,...)]
//
and
f0_targmat
(svts: s2vts
,t2js: t2jaglst
,s2qs: s2qaglst
,t2qs: t2qaglst): optn(s2vts) =
let
//
val () =
prerrln("f0_targmat: svts = ", svts)
val () =
prerrln("f0_targmat: t2js = ", t2js)
val () =
prerrln("f0_targmat: s2qs = ", s2qs)
val () =
prerrln("f0_targmat: t2qs = ", t2qs)
//
in//let
let
val tsub = list_vt_nil(*0*)
val opt0 =
f1_svts_t2js(svts, t2js, tsub)
in
case+ opt0 of
| ~
optn_vt_nil() => optn_nil(*0*)
| ~
optn_vt_cons(tsub) =>
optn_cons(list_vt2t(reverse0(tsub)))
end//let
end where
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
: s2vts_vt): optn_vt(s2vts_vt) =
(
case+
tip1.node() of
//
|T2Pvar _ =>
(
  g2_var1_tjp1(tip1,tjp1,tsub))
//
|_(*otherwise*) =>
(let
 val () =
 free(tsub) in optn_vt_nil() end)
//
) where
{
//
fun
g2_var1_tjp1
( tip1
: s2typ
, tjp1
: s2typ
, tsub
: s2vts_vt): optn_vt(s2vts_vt) =
let
val-
T2Pvar(s2vi) = tip1.node()
in//let
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
free(tsub) in optn_vt_nil() end)
end(*let*)//end of [g2_var1_tjp1(...)]
//
(* ****** ****** *)
//
val tip1 = s2typ_hnfiz0(tip1)
val tjp1 = s2typ_hnfiz0(tjp1)
//
val (  ) =
prerrln("f2_tip1_tjp1: tip1 = ", tip1)
val (  ) =
prerrln("f2_tip1_tjp1: tjp1 = ", tjp1)
//
}(*where*)
//end-of-[f2_tip1_tjp1(tip1,tjp1,tsub)]
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
(
  f2_tip1_tjp1(tip1, tjp1, tsub))
endlet
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
end//let//end-of-[list_cons(t2j1,t2js)]
)(*case+*)//end[f1_svt1_svts_tjps_t2js]
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
val (  ) =
prerr("tr3benv_tapq_resolve:")
val (  ) =
prerrln("filter: dcl1 = ", dcl1)
//
in//let
(
  list_cons(dcl1, filter(dcls)))
end//let
end//let//end-of-[list_cons(...)]
//
)(*case+*) // end of [ filter(dcls) ]
//
val () =
prerrln("tr3benv_tapq_resolve: d2c0 = ", d2c0)
val () =
prerrln("tr3benv_tapq_resolve: t2js = ", t2js)
//
}(*where*)//end-of-[tr3benv_tapq_resolve(env0,...)]
//
(* ****** ****** *)

end(*local*) // end-of-[local(tr3benv_tapq_resolve)]

(* ****** ****** *)

(* end of [ATS3/XATSOPT_srcgen2_trtmp3b_utils0.dats] *)

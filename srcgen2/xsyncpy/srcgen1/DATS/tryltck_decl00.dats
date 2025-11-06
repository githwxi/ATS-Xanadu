(***********************************************************************)
(*                                                                     *)
(*                         Applied Type System                         *)
(*                                                                     *)
(***********************************************************************)

(*
** ATS/Xanadu - Unleashing the Potential of Types!
** Copyright (C) 2025 Hongwei Xi, ATS Trustful Software, Inc.
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
(* ****** ****** *)
//
(*
Author: Hongwei Xi
(*
Thu Sep 18 02:06:27 AM EDT 2025
*)
Authoremail: gmhwxiATgmailDOTcom
*)
//
(* ****** ****** *)
(* ****** ****** *)
//
#staload
"./../SATS/statyp2.sats"
#staload
"./../SATS/dynexp2.sats"
#staload
"./../SATS/dynexp3.sats"
//
#staload
"./../SATS/tryltck.sats"
//
(* ****** ****** *)
(* ****** ****** *)
//
#include
"./../HATS/mytmplib00.hats"
//
(* ****** ****** *)
(* ****** ****** *)
//
#staload
"prelude/SATS/gsyn000.sats"
//
(* ****** ****** *)
(* ****** ****** *)
//
#symload <
with sint_lt$sint of 1099
#symload >
with sint_gt$sint of 1099
#symload =
with sint_eq$sint of 1099
#symload <=
with sint_lte$sint of 1099
#symload >=
with sint_gte$sint of 1099
#symload !=
with sint_neq$sint of 1099
//
#symload +
with sint_add$sint of 1099
#symload -
with sint_sub$sint of 1099
//
(* ****** ****** *)
(* ****** ****** *)
//
#staload
"./../../../SATS/statyp2.sats"
#staload
"./../../../SATS/dynexp3.sats"
//
(* ****** ****** *)
(* ****** ****** *)
//
fun
d3ecl1_errck
(lvl0: sint
,d3cl: d3ecl1): d3ecl1 =
(
let
val loc0 = d3cl.lctn()
in//let
(
d3ecl1_make_lctn$node
(loc0, D3C1errck(lvl0, d3cl)))
end//let
)(*case+*)//end(d3ecl1_errck(...))
//
(* ****** ****** *)
//
fun
d3ecl1_static_errck
( loc0: loc_t
, tknd: token
, dcl1: d3ecl1): d3ecl1 =
let
val lvl = 0
in//let
d3ecl1_errck
( lvl+1
, d3ecl1(loc0, D3C1static(tknd, dcl1)))
end(*let*)//end-of-[d3ecl1_static_errck]
//
fun
d3ecl1_extern_errck
( loc0: loc_t
, tknd: token
, dcl1: d3ecl1): d3ecl1 =
let
val lvl = 0
in//let
d3ecl1_errck
( lvl+1
, d3ecl1(loc0, D3C1extern(tknd, dcl1)))
end(*let*)//end-of-[d3ecl1_extern_errck]
//
(* ****** ****** *)
(* ****** ****** *)
//
fun
d3ecl1_valdclst_errck
( loc0
: loc_t
, tknd
: token
, d3vs
: d3valdcl1lst): d3ecl1 =
let
val lvl = 0
in//let
d3ecl1_errck
( lvl+1
, d3ecl1(loc0, D3C1valdclst(tknd, d3vs)))
end(*let*)//end-of-[d3ecl1_valdclst_errck]
//
(* ****** ****** *)
//
fun
d3ecl1_vardclst_errck
( loc0
: loc_t
, tknd
: token
, d3vs
: d3vardcl1lst): d3ecl1 =
let
val lvl = 0
in//let
d3ecl1_errck
( lvl+1
, d3ecl1(loc0, D3C1vardclst(tknd, d3vs)))
end(*let*)//end-of-[d3ecl1_vardclst_errck]
//
(* ****** ****** *)
//
fun
d3ecl1_fundclst_errck
( loc0
: loc_t
, tknd
: token
, tqas
: t2qaglst
, d2cs
: d2cstlst
, d3fs
: d3fundcl1lst): d3ecl1 =
let
val lvl = 0
in//let
d3ecl1_errck
(
lvl+1,
d3ecl1_make_lctn$node
( loc0
, D3C1fundclst(tknd, tqas, d2cs, d3fs)))
end(*let*)//end-of-[d3ecl1_fundclst_errck]
//
(* ****** ****** *)
//
fun
d3ecl1_implmnt0_errck
( loc0: loc_t
, tknd: token
, stmp: stamp
, sqas: s2qaglst
, tqas: t2qaglst
, dimp: dimpl
, tias: t2iaglst
, tibs: t2iag1lst
, f3as: f3arg1lst
, f3bs: f3axp1lst, sres: s2res
, dexp: d3exp1(*body*)
, vts1: dvdtp1lst, vts2: dvdtp1lst): d3ecl1 =
let
val lvl = 0
in//let
//
d3ecl1_errck
(
lvl+1,
d3ecl1_make_lctn$node
(loc0
,D3C1implmnt0
 ( tknd, stmp
 , sqas, tqas
 , dimp, tias, tibs
 , f3as, f3bs, sres, dexp, vts1, vts2)))
//
end(*let*)//end-of-[d3ecl1_implmnt0_errck]
//
(* ****** ****** *)
(* ****** ****** *)
//
#implfun
d3ecl1_tryltck
( d3cl, err0 ) =
(
case+
d3cl.node() of
//
(* ****** ****** *)
//
|D3C1static _ =>
(
  f0_static(d3cl, err0))
|D3C1extern _ =>
(
  f0_extern(d3cl, err0))
//
(* ****** ****** *)
//
|D3C1staload _ => (d3cl)
|D3C1include _ => (d3cl)
//
(* ****** ****** *)
//
|D3C1valdclst _ =>
(
  f0_valdclst(d3cl, err0))
|D3C1vardclst _ =>
(
  f0_vardclst(d3cl, err0))
//
(* ****** ****** *)
//
|D3C1fundclst _ =>
(
  f0_fundclst(d3cl, err0))
//
(* ****** ****** *)
//
|D3C1implmnt0 _ =>
(
  f0_implmnt0(d3cl, err0))
//
(* ****** ****** *)
//
|_(*otherwise*) =>
let
val lvl0 = 1
in//let
(
err0:=(err0+1); d3ecl1_errck(lvl0,d3cl))
endlet//end of [_(______otherwise______)]
//
) where
{
//
(* ****** ****** *)
//
fun
f0_static
(dcl0: d3ecl1
,err0: &sint >> _): d3ecl1 =
let
//
val nerr = err0
//
val-
D3C1static
( tknd, dcl1) = dcl0.node()
//
val dcl1 = d3ecl1_tryltck(dcl1, err0)
//
in
if // if
(err0=nerr)
then dcl0 else
let
val
loc0 = dcl0.lctn()
in//let
(
  d3ecl1_static_errck(loc0, tknd, dcl1))
end//let
end(*let*)//end-of-[f0_static(dcl0, err0)]
//
(* ****** ****** *)
//
fun
f0_extern
(dcl0: d3ecl1
,err0: &sint >> _): d3ecl1 =
let
//
val nerr = err0
//
val-
D3C1extern
( tknd, dcl1) = dcl0.node()
//
val dcl1 = d3ecl1_tryltck(dcl1, err0)
//
in
if // if
(err0=nerr)
then dcl0 else
let
val
loc0 = dcl0.lctn()
in//let
(
  d3ecl1_extern_errck(loc0, tknd, dcl1))
end//let
end(*let*)//end-of-[f0_extern(dcl0, err0)]
//
(* ****** ****** *)
(* ****** ****** *)
//
fun
f0_valdclst
(dcl0: d3ecl1
,err0: &sint >> _): d3ecl1 =
let
//
val nerr = err0
//
val-
D3C1valdclst
(tknd, d3vs) = dcl0.node()
//
val d3vs =
d3valdcl1lst_tryltck(d3vs, err0)
//
in//let
//
if
(err0=nerr)
then (dcl0) else
let
  val loc0 = dcl0.lctn()
in//let
(
  d3ecl1_valdclst_errck(loc0,tknd,d3vs))
end//let
//
end(*let*)//end-of-[f0_valdclst(dcl0,err0)]
//
(* ****** ****** *)
//
fun
f0_vardclst
(dcl0: d3ecl1
,err0: &sint >> _): d3ecl1 =
let
//
val nerr = err0
//
val-
D3C1vardclst
(tknd, d3vs) = dcl0.node()
//
val d3vs =
d3vardcl1lst_tryltck(d3vs, err0)
//
in//let
//
if
(err0=nerr)
then (dcl0) else
let
  val loc0 = dcl0.lctn()
in//let
(
  d3ecl1_vardclst_errck(loc0,tknd,d3vs))
end//let
//
end(*let*)//end-of-[f0_vardclst(dcl0,err0)]
//
(* ****** ****** *)
//
fun
f0_fundclst
( dcl0: d3ecl1
, err0: &sint >> _): d3ecl1 =
let
//
val nerr = err0
//
val-
D3C1fundclst
(tknd
,tqas
,d2cs, d3fs) = dcl0.node()
//
val d3fs =
(
d3fundcl1lst_tryltck(d3fs, err0))
//
in//let
//
if // if
(err0=nerr)
then (dcl0) else
(
  d3ecl1_fundclst_errck
  (dcl0.lctn(), tknd, tqas, d2cs, d3fs) )
//
end(*let*)//end-of-[f0_fundclst(dcl0,err0)]
//
(* ****** ****** *)
//
fun
f0_implmnt0
( dcl0: d3ecl1
, err0: &sint >> _): d3ecl1 =
let
//
val nerr = err0
//
val-
D3C1implmnt0
(tknd, stmp
,sqas, tqas
,dimp, tias, tibs
,f3as, f3bs, sres
,dexp ,vts1, vts2) =
(
  d3ecl1_node$get( dcl0 ))
//
(*
val farg =
(
  f3arg1lst_tryltck(farg, err0))
val faxp =
(
  f3axp1lst_tryltck(farg, err0))
*)
//
val
dexp = d3exp1_tryltck(dexp, err0)
//
in//let
//
if // if
(err0=nerr)
then (dcl0) else
let
val loc0 = dcl0.lctn()
in//let
(
  d3ecl1_implmnt0_errck
  ( loc0
  , tknd, stmp
  , sqas, tqas
  , dimp, tias, tibs
  , f3as, f3bs, sres, dexp, vts1, vts2) )
end//let
end(*let*)//end-of-[f0_implmnt0(dcl0,err0)]
//
(* ****** ****** *)
(* ****** ****** *)
//
val (  ) =
(
  prerrsln("d3ecl1_tryltck: d3cl = ", d3cl))
val (  ) =
(
  prerrsln("d3ecl1_tryltck: d3cl = ", d3cl))
//
(* ****** ****** *)
(* ****** ****** *)
//
}(*where*)//end-of-[d3ecl1_tryltck(d3cl,err0)]
//
(* ****** ****** *)
(* ****** ****** *)
//
//
#implfun
teqd3exp1_tryltck
  (tdxp, err0) =
(
case+ tdxp of
|TEQD3EXP1none
(  (*void*)  ) => (tdxp)
|TEQD3EXP1some
( teq1, d3e2 ) =>
let
//
val nerr = err0
(*
val ( ) =
prerrsln("\
teqd3exp1_tryltck: d3e2 = ", d3e2)
*)
val d3e2 = d3exp1_tryltck(d3e2, err0)
in//letp
(
if // if
(err0=nerr)
then tdxp else TEQD3EXP1some(teq1, d3e2))
end(*let*)//end-of-[TEQD3EXP1some(teq1,d3e2)]
)(*case+*)//end-of-(teqd3exp1_tryltck(tdxp,err))
//
(* ****** ****** *)
(* ****** ****** *)
//
#implfun
d3valdcl1_tryltck
  (dval, err0) =
let
//
val nerr = err0
//
val
dpat = d3valdcl1_dpat$get(dval)
val
tdxp = d3valdcl1_tdxp$get(dval)
val
wsxp = d3valdcl1_wsxp$get(dval)
//
val
dpat = d3pat1_tryltck(dpat, err0)
val
tdxp = teqd3exp1_tryltck(tdxp, err0)
//
in//let
if // if
(err0=nerr)
then (dval) else
let
val loc0 = dval.lctn()
in//let
(
  d3valdcl1( loc0, dpat, tdxp, wsxp ))
end//let
endlet//end-of-[d3valdcl1_tryltck(dval,err0)]
//
(* ****** ****** *)
//
#implfun
d3vardcl1_tryltck
  (dvar, err0) =
let
//
val nerr = err0
//
val
dpid = d3vardcl1_dpid$get(dvar)
val
styp = d3vardcl1_styp$get(dvar)
val
vpid = d3vardcl1_vpid$get(dvar)
val
sres = d3vardcl1_sres$get(dvar)
val
dini = d3vardcl1_dini$get(dvar)
//
val
dini = teqd3exp1_tryltck(dini, err0)
//
in//let
if // if
(err0=nerr)
then (dvar) else
let
val loc0 = dvar.lctn()
in//let
(
d3vardcl1
(loc0, dpid, styp, vpid, sres, dini))
end//let
endlet//end-of-[d3vardcl1_tryltck(dvar,err0)]
//
(* ****** ****** *)
//
#implfun
d3fundcl1_tryltck
  (dfun, err0) =
let
//
val nerr = err0
//
val
dpid = d3fundcl1_dpid$get(dfun)
val
styp = d3fundcl1_styp$get(dfun)
//
val
farg = d3fundcl1_farg$get(dfun)
val
faxp = d3fundcl1_faxp$get(dfun)
//
val
sres = d3fundcl1_sres$get(dfun)
val
tdxp = d3fundcl1_tdxp$get(dfun)
val
wsxp = d3fundcl1_wsxp$get(dfun)
//
val
vts1 = d3fundcl1_vts1$get(dfun)
val
vts2 = d3fundcl1_vts2$get(dfun)
//
(*
val farg =
(
  f3arg1lst_tryltck(farg, err0))
val faxp =
(
  f3axp1lst_tryltck(farg, err0))
*)
val tdxp =
(
  teqd3exp1_tryltck(tdxp, err0))
//
in//let
if // if
(err0=nerr)
then (dfun) else
let
val loc0 = dfun.lctn()
in//let
(
d3fundcl1(loc0,dpid,
  styp,farg,faxp,sres,tdxp,wsxp,vts1,vts2))
end//let
endlet // end-of-[tread3a_d3fundcl(dfun,err)]
//
(* ****** ****** *)
(* ****** ****** *)
//
#implfun
d3valdcl1lst_tryltck
  ( d3vs, err0  ) =
(
list_tryltck_fnp(d3vs, err0, d3valdcl1_tryltck))
//
(* ****** ****** *)
//
#implfun
d3vardcl1lst_tryltck
  ( d3vs, err0 ) =
(
list_tryltck_fnp(d3vs, err0, d3vardcl1_tryltck))
//
(* ****** ****** *)
//
#implfun
d3fundcl1lst_tryltck
  (  d3fs, err0  ) =
(
list_tryltck_fnp(d3fs, err0, d3fundcl1_tryltck))
//
(* ****** ****** *)
(* ****** ****** *)
//
(***********************************************************************)
(* end of [ATS3/XATSOPT_srcgen2_xsyncpy_srcgen1_DATS_tryltck_decl00.dats] *)
(***********************************************************************)

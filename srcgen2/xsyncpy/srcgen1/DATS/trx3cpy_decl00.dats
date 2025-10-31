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
Sun Jun  1 10:06:41 PM EDT 2025
*)
Authoremail: gmhwxiATgmailDOTcom
*)
//
(* ****** ****** *)
(* ****** ****** *)
//
#staload
"./../SATS/dynexp3.sats"
#staload
"./../SATS/trx3cpy.sats"
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
"./../../../SATS/dynexp2.sats"
#staload
"./../../../SATS/dynexp3.sats"
//
#symload styp with d2var_get_styp
#symload node with d3ecl_get_node
//
(* ****** ****** *)
(* ****** ****** *)
//
#implfun
d3ecl_trx3cpy
(d3cl, env0) =
(
case+
d3cl.node() of
//
|D3Cstatic _ =>
(
 f0_static(d3cl, env0))
|D3Cextern _ =>
(
 f0_extern(d3cl, env0))
//
(* ****** ****** *)
//
|D3Cdclst0 _ =>
(
 f0_dclst0(d3cl, env0))
|D3Clocal0 _ =>
(
 f0_local0(d3cl, env0))
//
(* ****** ****** *)
//
|D3Cinclude _ =>
(
 f0_include(d3cl, env0))
//
|D3Cstaload _ =>
(
 f0_staload(d3cl, env0))
//
(* ****** ****** *)
//
|D3Cvaldclst _ =>
(
 f0_valdclst(d3cl, env0))
|D3Cvardclst _ =>
(
 f0_vardclst(d3cl, env0))
//
|D3Cfundclst _ =>
(
 f0_fundclst(d3cl, env0))
//
(* ****** ****** *)
|D3Cimplmnt0 _ =>
(
 f0_implmnt0(d3cl, env0))
(* ****** ****** *)
//
|D3Cerrck
(lvl0, dcl1) =>
let
//
val dcl1 =
(
  d3ecl_trx3cpy(dcl1, env0))
//
in//
//
d3ecl1(loc0, D3C1errck(lvl0, dcl1))
//
end//let//end-of-[D3Cerrck(lvl0,dcl1)]
//
(* ****** ****** *)
//
|
_(*otherwise*) =>
let
  val node =
  D3C1d3ecl(d3cl) in d3ecl1(loc0, node)
end//let
//
(* ****** ****** *)
//
) where//end-of-[d3ecl_trx3cpy(d3cl,env0)]
{
//
val loc0 = d3cl.lctn()
//
fun
f0_static
(d3cl: d3ecl
,env0: !env3cpy): d3ecl1 =
let
//
val-
D3Cstatic
(tknd, dcl1) = d3cl.node()
val dcl1 =
(
  d3ecl_trx3cpy(dcl1, env0))
in//let
  d3ecl1
  (loc0, D3C1static(tknd, dcl1))
end//let
//
fun
f0_extern
(d3cl: d3ecl
,env0: !env3cpy): d3ecl1 =
let
//
val-
D3Cextern
(tknd, dcl1) = d3cl.node()
val dcl1 =
(
  d3ecl_trx3cpy(dcl1, env0))
in//let
  d3ecl1
  (loc0, D3C1extern(tknd, dcl1))
end//let
//
fun
f0_dclst0
(d3cl: d3ecl
,env0: !env3cpy): d3ecl1 =
let
//
val-
D3Cdclst0
(   dcls   ) = d3cl.node()
in//let
(
d3ecl1(loc0, D3C1dclst0(dcls))
) where
{
val dcls =
(
  d3eclist_trx3cpy(dcls, env0)) }
end//let
//
fun
f0_local0
(d3cl: d3ecl
,env0: !env3cpy): d3ecl1 =
let
//
val-
D3Clocal0
(head, body) = d3cl.node()
//
val head =
(
d3eclist_trx3cpy(head, env0))
val body =
(
d3eclist_trx3cpy(body, env0))
//
in//let
d3ecl1(loc0, D3C1local0(head, body))
end//let
//
(* ****** ****** *)
//
fun
f0_include
(d3cl: d3ecl
,env0: !env3cpy): d3ecl1 =
let
//
val-
D3Cinclude
(sd01
,tknd, gexp
,fopt, dopt) = d3cl.node()
//
val
dopt =
d3eclistopt_trx3cpy(dopt, env0)
//
in//let
//
d3ecl1
( loc0
, D3C1include
  (sd01, tknd, gexp, fopt, dopt))
//
end//let
//
(* ****** ****** *)
//
fun
f0_staload
(d3cl: d3ecl
,env0: !env3cpy): d3ecl1 =
let
//
val-
D3Cstaload
(sd01
,tknd, gexp
,fopt, dopt) = d3cl.node()
//
val
dopt =
s3taloadopt_trx3cpy(dopt, env0)
//
in//let
//
d3ecl1
( loc0
, D3C1staload
  (sd01, tknd, gexp, fopt, dopt))
//
end//let
//
(* ****** ****** *)
//
fun
f0_valdclst
(d3cl: d3ecl
,env0: !env3cpy): d3ecl1 =
let
//
val-
D3Cvaldclst
( tknd, d3vs) = d3cl.node()
//
val d3vs =
d3valdclist_trx3cpy(d3vs, env0)
//
in//let
(
d3ecl1(loc0,D3C1valdclst(tknd,d3vs)))
end//let
//
fun
f0_vardclst
(d3cl: d3ecl
,env0: !env3cpy): d3ecl1 =
let
//
val-
D3Cvardclst
( tknd, d3vs) = d3cl.node()
//
val d3vs =
d3vardclist_trx3cpy(d3vs, env0)
//
in//let
(
d3ecl1(loc0,D3C1vardclst(tknd,d3vs)))
end//let
//
(* ****** ****** *)
//
fun
f0_fundclst
(d3cl: d3ecl
,env0: !env3cpy): d3ecl1 =
let
//
val-
D3Cfundclst
( tknd, tqas
, d2cs, d3fs) = d3cl.node()
//
val d3fs =
d3fundclist_trx3cpy(d3fs, env0)
//
in//let
d3ecl1(loc0,
D3C1fundclst(tknd, tqas, d2cs, d3fs))
end//let
//
(* ****** ****** *)
//
fun
f0_implmnt0
(d3cl: d3ecl
,env0: !env3cpy): d3ecl1 =
let
//
val loc0 = d3cl.lctn()
//
val-
D3Cimplmnt0
( tknd, stmp
, sqas, tqas
, dimp//dcst
, tias, f3as
, sres, dexp) = d3cl.node()
//
val f3as =
f3arglst_trx3cpy(f3as, env0)
//
val
dexp =
(
  d3exp_trx3cpy(dexp, env0))
//
val f3bs = list_nil((*void*))
val vts1 = list_nil((*void*))
val vts2 = list_nil((*void*))
//
in//let
(
d3ecl1
(
loc0,
D3C1implmnt0
( tknd, stmp
, sqas, tqas
, dimp, tias
, f3as, f3bs, sres, dexp, vts1, vts2)))
end//let
//
(* ****** ****** *)
//
(*
val (  ) =
printsln("d3ecl_trx3cpy: loc0 = ", loc0)
val (  ) =
printsln("d3ecl_trx3cpy: d3cl = ", d3cl)
*)
//
}(*where*)//end-of-[d3ecl_trx3cpy(d3cl,env0)]
//
(* ****** ****** *)
(* ****** ****** *)
//
#implfun
teqd3exp_trx3cpy
  (tdxp, env0) =
(
case+ tdxp of
|
TEQD3EXPnone() =>
TEQD3EXP1none((*void*))
|
TEQD3EXPsome(teq1, d3e2) =>
TEQD3EXP1some(teq1, d3e2) where
{ val
  d3e2 = d3exp_trx3cpy(d3e2, env0) }
)(*case+*)//endof(teqd3exp_trx3cpy(tdxp,env0))
//
(* ****** ****** *)
(* ****** ****** *)
//
#implfun
d3valdcl_trx3cpy
  (dval, env0) = let
//
val loc0 =
d3valdcl_get_lctn(dval)
val dpat =
d3valdcl_get_dpat(dval)
val tdxp =
d3valdcl_get_tdxp(dval)
val wsxp =
d3valdcl_get_wsxp(dval)
//
val dpat =
(
  d3pat_trx3cpy(dpat, env0))
//
val tdxp =
(
  teqd3exp_trx3cpy(tdxp, env0))
//
in//let
d3valdcl1_make_args(loc0,dpat,tdxp,wsxp)
end//let
(*let*)//end-of-[d3valdcl_trx3cpy(dval,env0)]
//
(* ****** ****** *)
//
#implfun
d3vardcl_trx3cpy
  (dvar, env0) = let
//
val loc0 =
d3vardcl_get_lctn(dvar)
//
val dpid =
d3vardcl_get_dpid(dvar)
val t2q1 =
s2typ_trx3cpy
(
dpid.styp((*0*)), env0)
//
val vpid =
d3vardcl_get_vpid(dvar)
val sres =
d3vardcl_get_sres(dvar)
val dini =
d3vardcl_get_dini(dvar)
//
val dini =
teqd3exp_trx3cpy(dini, env0)
//
in//let
(
d3vardcl1
(loc0, dpid, t2q1, vpid, sres, dini))
end//let
(*let*)//end-of-[d3vardcl_trx3cpy(dvar,env0)]
//
(* ****** ****** *)
//
#implfun
d3fundcl_trx3cpy
  (dfun, env0) = let
//
val loc0 =
d3fundcl_get_lctn(dfun)
//
val dpid =
d3fundcl_get_dpid(dfun)
val t2q1 =
s2typ_trx3cpy
(
dpid.styp((*0*)), env0)
//
val f3as =
d3fundcl_get_farg(dfun)
val sres =
d3fundcl_get_sres(dfun)
val tdxp =
d3fundcl_get_tdxp(dfun)
val wsxp =
d3fundcl_get_wsxp(dfun)
//
(*
val (  ) = prerrsln
("d3fundcl_trx3cpy: f3as = ", f3as)
val (  ) = prerrsln
("d3fundcl_trx3cpy: tdxp = ", tdxp)
*)
//
val f3as =
(
f3arglst_trx3cpy(f3as, env0))
val tdxp =
(
teqd3exp_trx3cpy(tdxp, env0))
//
(*
val (  ) = prerrsln
("d3fundcl_trx3cpy: f3as = ", f3as)
val (  ) = prerrsln
("d3fundcl_trx3cpy: tdxp = ", tdxp)
*)
//
val f3bs = list_nil((*void*))
val vts1 = list_nil((*void*))
val vts2 = list_nil((*void*))
//
in//let
(
d3fundcl1_make_args
(loc0
,dpid
,t2q1,f3as,f3bs,sres,tdxp,wsxp,vts1,vts2))
end(*let*)//end-of-[d3fundcl_trx3cpy(dfun,env0)]
//
(* ****** ****** *)
(* ****** ****** *)
//
#implfun
s3taloadopt_trx3cpy
(dopt, env0) =
(
//
case dopt of
|
S3TALOADnone
(   dopt   ) => S3TALOAD1none(dopt)
|
S3TALOADdpar
(shrd, dpar) => S3TALOAD1dpar(shrd, dpar)
//
) where
{
//
val (  ) =
prerrsln("s3taloadopt_trx3cpy: dopt = ", dopt)
//
}(*where*)//end-of-[s3taloadopt_trx3cpy(d3cl,env0)]
//
(* ****** ****** *)
(* ****** ****** *)
//
(***********************************************************************)
(* end of [ATS3/XATSOPT_srcgen2_xsyncpy_srcgen1_DATS_trx3cpy_decl00.dats] *)
(***********************************************************************)

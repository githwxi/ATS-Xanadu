(***********************************************************************)
(*                                                                     *)
(*                         Applied Type System                         *)
(*                                                                     *)
(***********************************************************************)

(*
** ATS/Xanadu - Unleashing the Potential of Types!
** Copyright (C) 2026 Hongwei Xi, ATS Trustful Software, Inc.
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
Fri Jan 30 12:35:54 PM EST 2026
*)
Authoremail: gmhwxiATgmailDOTcom
*)
//
(* ****** ****** *)
(* ****** ****** *)
#define
ATS_PACKNAME
"ATS3.XANADU.xatsopt-20220500"
(* ****** ****** *)
(* ****** ****** *)
//
#include
"./../HATS/xatsopt_sats.hats"
(*
#include
"./../HATS/xatsopt_dats.hats"
*)
#include
"./../HATS/xatsopt_dpre.hats"
//
(* ****** ****** *)
(* ****** ****** *)
#staload "./../SATS/locinfo.sats"
(* ****** ****** *)
#staload "./../SATS/lexing0.sats"
(* ****** ****** *)
#staload "./../SATS/staexp1.sats"
#staload "./../SATS/dynexp1.sats"
(* ****** ****** *)
#staload "./../SATS/staexp2.sats"
#staload "./../SATS/dynexp2.sats"
(* ****** ****** *)
#staload "./../SATS/dynexp3.sats"
(* ****** ****** *)
#staload "./../SATS/t3read0.sats"
(* ****** ****** *)
//
(* ****** ****** *)
#symload lctn with token_get_lctn
#symload node with token_get_node
(* ****** ****** *)
#symload sexp with d2con_get_sexp
#symload sexp with d2cst_get_sexp
(* ****** ****** *)
(* ****** ****** *)
//
fun
d3ecl_errck
(
lvl0: sint,
d3cl: d3ecl): d3ecl =
let
val loc0 = d3cl.lctn()
in//let
d3ecl_make_node
(loc0, D3Cerrck(lvl0, d3cl))
end (*let*) // end-of(d3ecl_errck)
//
(* ****** ****** *)
(* ****** ****** *)
//
fun
d3ecl_tmpsub_errck
(
loc0: loc_t,
svts: s2vts,
dcl1: d3ecl): d3ecl =
let
val
lvl0 = 0 in//let
d3ecl_errck
(lvl0+1,d3ecl(loc0,D3Ctmpsub(svts,dcl1)))
end(*let*)//end-of-[d3ecl_tmpsub_errck(...)]
//
(* ****** ****** *)
//
fun
d3ecl_dclst0_errck
( loc0
: loc_t
, dcls
: d3eclist ): d3ecl =
let
val
lvl0 = 0 in//let
d3ecl_errck(
  lvl0+1, d3ecl(loc0, D3Cdclst0( dcls )))
end(*let*)//end-of-[d3ecl_dclst0_errck(...)]
//
(* ****** ****** *)
//
fun
d3ecl_local0_errck
( loc0
: loc_t
, dcs1
: d3eclist
, dcs2
: d3eclist ): d3ecl =
let
val
lvl0 = 0 in//let
d3ecl_errck
(lvl0+1,d3ecl(loc0,D3Clocal0(dcs1,dcs2)))
end(*let*)//end-of-[d3ecl_local0_errck(...)]
//
(* ****** ****** *)
//
fun
d3ecl_include_errck
( loc0: loc_t
, knd0: sint
, tknd: token
, g1e1: g1exp
, fopt: fpathopt
, dopt: d3eclistopt): d3ecl =
let
val
lvl0 = 0 in//let
d3ecl_errck
(
lvl0+1,
d3ecl_make_node(
loc0,
D3Cinclude(knd0, tknd, g1e1, fopt, dopt)))
end(*let*)//end-of-[d3ecl_include_errck(...)]
//
(* ****** ****** *)
(* ****** ****** *)
//
fun
d3ecl_valdclst_errck
( loc0
: loc_t
, tknd
: token
, d3vs
: d3valdclist): d3ecl =
let
val
lvl0 = 0 in//let
d3ecl_errck
(lvl0+1, d3ecl(loc0,D3Cvaldclst(tknd,d3vs)))
end(*let*)//end-of-[d3ecl_vardclst_errck(...)]
//
(* ****** ****** *)
//
fun
d3ecl_vardclst_errck
( loc0
: loc_t
, tknd
: token
, d3vs
: d3vardclist): d3ecl =
let
val
lvl0 = 0 in//let
d3ecl_errck
(lvl0+1, d3ecl(loc0,D3Cvardclst(tknd,d3vs)))
end(*let*)//end-of-[d3ecl_vardclst_errck(...)]
//
(* ****** ****** *)
//
fun
d3ecl_fundclst_errck
( loc0
: loc_t
, tknd
: token
, tqas
: t2qaglst
, d2cs
: d2cstlst
, d3fs
: d3fundclist): d3ecl =
let
val
lvl0 = 0 in//let
d3ecl_errck
(
lvl0+1,
d3ecl(
  loc0, D3Cfundclst(tknd, tqas, d2cs, d3fs))
)(*d3ecl_errck*)
end(*let*)//end-of-[d3ecl_fundclst_errck(...)]
//
(* ****** ****** *)
//
fun
d3ecl_implmnt0_errck
( loc0
: loc_t
, tknd
: token
, stmp
: stamp
, sqas
: s2qaglst
, tqas
: t2qaglst
, dqid
: dimpl
, tias
: t2iaglst
, fags
: f3arglst
, sres: s2res(*tret*)
, dexp: d3exp(*body*)): d3ecl =
let
val
lvl0 = 0 in//let
(
d3ecl_errck
(
lvl0+1
,
d3ecl_make_node
( loc0
, D3Cimplmnt0
  ( tknd,stmp
  , sqas,tqas,dqid,tias,fags,sres,dexp))))
end(*let*)//end-of-[d3ecl_implmnt0_errck(...)]
//
(* ****** ****** *)
(* ****** ****** *)
//
#implfun
t3read0_d3ecl
(evn0, d3cl, err0) =
let
//
(*
val
loc0 = d3cl.lctn()
val () =
prerrsln
("t3read0_d3ecl: loc0 = ", loc0)
val () =
prerrsln
("t3read0_d3ecl: d3cl = ", d3cl)
*)
//
in//let
//
(
case+
d3cl.node() of
//
(* ****** ****** *)
//
|D3Cnone0 _ => d3cl
|D3Cnone1 _ => d3cl
|D3Cnone2 _ => d3cl
//
(* ****** ****** *)
//
|D3Cd2ecl _ => d3cl
|D3Cerrck _ => d3cl
//
(* ****** ****** *)
//
|D3Cstatic _ => d3cl
|D3Cextern _ => d3cl
//
(* ****** ****** *)
//
|D3Ctmpsub _ =>
(
  f0_tmpsub(evn0, d3cl, err0))
//
(* ****** ****** *)
//
|D3Cdclst0 _ =>
(
  f0_dclst0(evn0, d3cl, err0))
//
|D3Clocal0 _ =>
(
  f0_local0(evn0, d3cl, err0))
//
(* ****** ****** *)
//
|
D3Cabsopen _ => (    d3cl    )
|
D3Cabsimpl _ => (    d3cl    )
//
(* ****** ****** *)
//
|D3Cinclude _ =>
(
  f0_include(evn0, d3cl, err0))
|D3Cstaload _ =>
(
  f0_staload(evn0, d3cl, err0))
//
(* ****** ****** *)
(* ****** ****** *)
//
|D3Cvaldclst _ =>
(
  f0_valdclst(evn0, d3cl, err0))
|D3Cvardclst _ =>
(
  f0_vardclst(evn0, d3cl, err0))
//
(* ****** ****** *)
//
|D3Cfundclst _ =>
(
  f0_fundclst(evn0, d3cl, err0))
//
(* ****** ****** *)
//
|D3Cimplmnt0 _ =>
(
  f0_implmnt0(evn0, d3cl, err0))
//
(* ****** ****** *)
//
|
_(*otherwise*) =>
let
val lvl0 = 1
in//let
(
err0 := err0+1; d3ecl_errck(lvl0, d3cl))
end(*let*)//end-of-[_(*otherwise*)]//temp
//
(* ****** ****** *)
(* ****** ****** *)
//
) where
{
//
(* ****** ****** *)
//
fun
f0_tmpsub
( evn0:
! t3r0evn
, dcl0: d3ecl
, err0: &sint >> _): d3ecl =
let
//
val nerr = err0
val loc0 = dcl0.lctn()
//
val-
D3Ctmpsub
(svts, dcl1) = dcl0.node()
//
val dcl1 =
(
  t3read0_d3ecl(evn0, dcl1, err0))
//
in//let
if // if
(nerr=err0)
then dcl0 else
(
  d3ecl_tmpsub_errck(loc0, svts, dcl1))
end(*let*)//end-of-[f0_tmpsub(evn0,dcl0,err0)]
//
(* ****** ****** *)
//
fun
f0_dclst0
( evn0:
! t3r0evn
, dcl0: d3ecl
, err0: &sint >> _): d3ecl =
let
//
val nerr = err0
val loc0 = dcl0.lctn()
//
val-
D3Cdclst0
(   dcls   ) = dcl0.node()
//
val dcls =
t3read0_d3eclist(evn0, dcls, err0)
//
in//let
if // if
(nerr=err0)
then dcl0 else
(
  d3ecl_dclst0_errck(  loc0 , dcls  ) )
end(*let*)//end-of-[f0_dclst0(evn0,dcl0,err0)]
//
(* ****** ****** *)
//
fun
f0_local0
( evn0:
! t3r0evn
, dcl0: d3ecl
, err0: &sint >> _): d3ecl =
let
//
val nerr = err0
val loc0 = dcl0.lctn()
//
val-
D3Clocal0
(dcs1, dcs2) = dcl0.node()
//
val dcs1 =
t3read0_d3eclist(evn0, dcs1, err0)
val dcs2 =
t3read0_d3eclist(evn0, dcs2, err0)
//
in
if // if
(err0=nerr)
then dcl0 else
(
  d3ecl_local0_errck(loc0, dcs1, dcs2))
end(*let*)//end-of-[f0_local0(evn0,dcl0,err0)]
//
(* ****** ****** *)
(* ****** ****** *)
//
fun
f0_include
( evn0:
! t3r0evn
, dcl0: d3ecl
, err0: &sint >> _): d3ecl =
let
//
val nerr = err0
val loc0 = dcl0.lctn()
//
val-
D3Cinclude
(knd0
,tknd, gsrc
,fopt, dopt) = dcl0.node()
//
val dopt =
(
case+ dopt of
|
optn_nil((*0*)) => optn_nil()
|
optn_cons(dcls) =>
optn_cons(
t3read0_d3eclist(evn0,dcls,err0)))
: d3eclistopt // end of [val(dopt)]
//
in//let
(
if // if
(err0=nerr)
then (dcl0) else
(
  d3ecl_include_errck
  (loc0, knd0, tknd, gsrc, fopt, dopt)))
//
end(*let*)//end-of-[f0_include(evn0,dcl0,err0)]
//
(* ****** ****** *)
//
fun
f0_staload
( evn0:
! t3r0evn
, dcl0: d3ecl
, err0: &sint >> _): d3ecl =
let
//
(*
HX-2026-02-03
Staloads are shared and
Checking for them is done elsewhere
*)
//
val-
D3Cstaload
(knd0
,tknd, gsrc
,fopt, dopt) = dcl0.node() in (  dcl0  )
end(*let*)//end-of-[f0_staload(evn0,dcl0,err0)]
//
(* ****** ****** *)
(* ****** ****** *)
//
fun
f0_valdclst
( evn0:
! t3r0evn
, dcl0: d3ecl
, err0: &sint >> _): d3ecl =
let
//
val nerr = err0
val loc0 = dcl0.lctn()
//
val-
D3Cvaldclst
(tknd, d3vs) = dcl0.node()
//
val d3vs =
t3read0_d3valdclist(evn0, d3vs, err0)
//
in//let
if // if
(err0=nerr)
then (dcl0) else
(
  d3ecl_valdclst_errck(loc0, tknd, d3vs))
end(*let*)//end-of-[f0_valdclst(evn0,dcl0,err0)]
//
(* ****** ****** *)
//
fun
f0_vardclst
( evn0:
! t3r0evn
, dcl0: d3ecl
, err0: &sint >> _): d3ecl =
let
//
val nerr = err0
val loc0 = dcl0.lctn()
//
val-
D3Cvardclst
(tknd, d3vs) = dcl0.node()
//
val d3vs =
t3read0_d3vardclist(evn0, d3vs, err0)
//
in//let
if // if
(err0=nerr)
then (dcl0) else
(
  d3ecl_vardclst_errck(loc0, tknd, d3vs))
end(*let*)//end-of-[f0_vardclst(evn0,dcl0,err0)]
//
(* ****** ****** *)
//
fun
f0_fundclst
( evn0:
! t3r0evn
, dcl0: d3ecl
, err0: &sint >> _): d3ecl =
let
//
val nerr = err0
//
val-
D3Cfundclst
(tknd
,tqas
,d2cs, d3fs) = dcl0.node()
//
val d3fs =
t3read0_d3fundclist(evn0, d3fs, err0)
//
in//let
if // if
(err0=nerr)
then (dcl0) else
(
d3ecl_fundclst_errck
( dcl0.lctn(), tknd, tqas, d2cs, d3fs ) )
end(*let*)//end-of-[f0_fundclst(evn0,dcl0,err0)]
//
(* ****** ****** *)
//
fun
f0_implmnt0
( evn0:
! t3r0evn
, dcl0: d3ecl
, err0: &sint >> _): d3ecl =
let
//
val nerr = err0
//
val-
D3Cimplmnt0
(tknd
,stmp
,sqas,tqas
,dimp
,tias,fags
,sres,dexp) = dcl0.node()
//
val dexp =
t3read0_d3exp(evn0, dexp, err0)
//
in//let
//
if // if
(err0=nerr)
then (dcl0) else
d3ecl_implmnt0_errck(
dcl0.lctn(), tknd, stmp,
sqas, tqas, dimp, tias, fags, sres, dexp)
//
end(*let*)//end-of-[f0_implmnt0(evn0,dcl0,err0)]
//
(* ****** ****** *)
//
(*
val (  ) =
(
  prerrsln(  "t3read0_d3ecl: dcl0 = ", dcl0)  ))
*)
//
(* ****** ****** *)
//
}(*where*)
//
end(*let*)//end-of-[t3read0_d3ecl(evn0,d3cl,err0)]
//
(* ****** ****** *)
(* ****** ****** *)
//
#implfun
t3read0_teqd3exp
(evn0, tdxp, err0) =
(
case+ tdxp of
//
|
TEQD3EXPnone() => tdxp
//
|
TEQD3EXPsome(teq1, d3e2) =>
let
val nerr = err0
(*
val ( ) =
prerrsln("\
t3read0_teqd3exp: d3e2 = ", d3e2)
*)
val d3e2 =
(
  t3read0_d3exp(evn0, d3e2, err0))
in//letp
if // if
(err0=nerr)
then tdxp else TEQD3EXPsome(teq1, d3e2)
end(*let*)//end-of-[ TEQD3EXPsome( _,_ ) ]
//
)(*case+*)//end(t3read0_teqd3exp(evn0,tdxp,err0))
//
(* ****** ****** *)
(* ****** ****** *)
//
#implfun
t3read0_d3valdcl
(evn0, dval, err0) =
let
//
val nerr = err0
//
val loc0 = dval.lctn()
//
val
dpat = d3valdcl_get_dpat(dval)
val
tdxp = d3valdcl_get_tdxp(dval)
val
wsxp = d3valdcl_get_wsxp(dval)
//
val
tdxp =
t3read0_teqd3exp(evn0,tdxp,err0)
//
in//let
if // if
(err0=nerr)
then (dval) else
(
  d3valdcl(loc0, dpat, tdxp, wsxp))
end(*let*)//end(t3read0_d3valdcl(evn0,dval,err0))
//
(* ****** ****** *)
//
#implfun
t3read0_d3vardcl
(evn0, dvar, err0) =
let
//
val nerr = err0
//
val loc0 = dvar.lctn()
//
val
dpid = d3vardcl_get_dpid(dvar)
val
vpid = d3vardcl_get_vpid(dvar)
val
sres = d3vardcl_get_sres(dvar)
val
dini = d3vardcl_get_dini(dvar)
//
val
dini =
t3read0_teqd3exp(evn0,dini,err0)
//
in//let
if // if
(err0=nerr)
then (dvar) else
(
  d3vardcl(loc0,dpid,vpid,sres,dini))
end(*let*)//end(t3read0_d3vardcl(evn0,dval,err0))
//
(* ****** ****** *)
//
#implfun
t3read0_d3fundcl
(evn0, dfun, err0) =
let
//
val nerr = err0
//
val loc0 = dfun.lctn()
//
val
dpid = d3fundcl_get_dpid(dfun)
val
farg = d3fundcl_get_farg(dfun)
val
sres = d3fundcl_get_sres(dfun)
val
tdxp = d3fundcl_get_tdxp(dfun)
val
wsxp = d3fundcl_get_wsxp(dfun)
//
val
tdxp =
t3read0_teqd3exp(evn0,tdxp,err0)
//
in//let
if
(err0=nerr)
then (dfun) else
(
  d3fundcl(loc0,dpid,farg,sres,tdxp,wsxp))
end(*let*)//end(t3read0_d3fundcl(evn0,dfun,err0))
//
(* ****** ****** *)
(* ****** ****** *)
//
#implfun
t3read0_d3valdclist
( evn0, d3vs, err0 ) =
(
list_t3read0_fnp(evn0, d3vs, err0, t3read0_d3valdcl))
//
#implfun
t3read0_d3vardclist
( evn0, d3vs, err0 ) =
(
list_t3read0_fnp(evn0, d3vs, err0, t3read0_d3vardcl))
//
(* ****** ****** *)
//
#implfun
t3read0_d3fundclist
( evn0, d3fs, err0 ) =
(
list_t3read0_fnp(evn0, d3fs, err0, t3read0_d3fundcl))
//
(* ****** ****** *)
(* ****** ****** *)
//
(***********************************************************************)
(* end of [ATS3/XATSOPT_srcgen2_DATS_t3read0_decl00.dats] *)
(***********************************************************************)

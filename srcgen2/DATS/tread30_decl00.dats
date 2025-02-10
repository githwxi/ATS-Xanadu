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
(* ****** ****** *)
//
(*
Author: Hongwei Xi
(*
Wed 26 Jul 2023 03:03:23 PM EDT
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
#staload "./../SATS/dynexp3.sats"
(* ****** ****** *)
#staload "./../SATS/tread30.sats"
(* ****** ****** *)
#symload lctn with token_get_lctn
#symload node with token_get_node
(* ****** ****** *)
#symload lctn with d3ecl_get_lctn
#symload node with d3ecl_get_node
(* ****** ****** *)
#symload lctn with d3valdcl_get_lctn
#symload lctn with d3vardcl_get_lctn
#symload lctn with d3fundcl_get_lctn
(* ****** ****** *)
//
fun
d3ecl_errck
(lvl0: sint
,d3cl: d3ecl): d3ecl =
let
val loc0 = d3cl.lctn()
in//let
d3ecl_make_node
(loc0, D3Cerrck(lvl0, d3cl))
end (*let*) // end-of(d3ecl_errck)
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
: d3eclist): d3ecl =
let
val lvl = 0
in//let
d3ecl_errck
(lvl+1,d3ecl(loc0,D3Clocal0(dcs1,dcs2)))
end (*let*) // end of [d3ecl_local0_errck]
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
val lvl = 0
in//let
d3ecl_errck
(
lvl+1,
d3ecl_make_node
( loc0
, D3Cinclude(knd0,tknd,g1e1,fopt,dopt)))
end (*let*) // end of [d3ecl_include_errck]
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
val lvl = 0
in//let
d3ecl_errck
(lvl+1, d3ecl(loc0,D3Cvaldclst(tknd,d3vs)))
end (*let*) // end of [d3ecl_valdclst_errck]
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
val lvl = 0
in//let
d3ecl_errck
(lvl+1, d3ecl(loc0,D3Cvardclst(tknd,d3vs)))
end (*let*) // end of [d3ecl_vardclst_errck]
//
(* ****** ****** *)
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
val lvl = 0
in//let
d3ecl_errck
( lvl+1
, d3ecl
  (loc0,D3Cfundclst(tknd,tqas,d2cs,d3fs)))
end (*let*) // end of [d3ecl_fundclst_errck]
//
(* ****** ****** *)
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
val lvl = 0
in//let
d3ecl_errck
(
lvl+1
,
d3ecl_make_node
( loc0
, D3Cimplmnt0
  ( tknd,stmp
  , sqas,tqas,dqid,tias,fags,sres,dexp ) ))
end (*let*) // end of [d3ecl_implmnt0_errck]
//
(* ****** ****** *)
(* ****** ****** *)
//
#implfun
tread30_d3ecl
  (d3cl, err) =
(
case+
d3cl.node() of
//
|D3Cnone0 _ => d3cl
|D3Cd2ecl _ => d3cl
|D3Cerrck _ => d3cl
//
|D3Cstatic _ => d3cl
|D3Cextern _ => d3cl
//
|D3Clocal0 _ =>
(
f0_local0(d3cl, err))
//
|D3Cabsopen _ => (d3cl)
|D3Cabsimpl _ => (d3cl)
//
|
D3Cinclude _ => f0_include(d3cl, err)
|
D3Cstaload _ => f0_staload(d3cl, err)
//
(* ****** ****** *)
//
(*
HX-2024-07-20:
Sat 20 Jul 2024 07:28:23 PM EDT
*)
//
|
D3Cdyninit _ => f0_dyninit(d3cl, err)
|
D3Cextcode _ => f0_extcode(d3cl, err)
//
(* ****** ****** *)
//
|
D3Cvaldclst _ => f0_valdclst(d3cl, err)
|
D3Cvardclst _ => f0_vardclst(d3cl, err)
|
D3Cfundclst _ => f0_fundclst(d3cl, err)
//
|
D3Cimplmnt0 _ => f0_implmnt0(d3cl, err)
//
|
_(*otherwise*) =>
let
val lvl0 = 1
in//let
(err := err+1; d3ecl_errck(lvl0, d3cl))
endlet // end of [  _(* otherwise *)  ]
//
) where// end of [ case+(d3cl.node()) ]
{
(* ****** ****** *)
//
fun
f0_local0
( dcl: d3ecl
, err: &sint >> _): d3ecl =
let
//
val e00 = err
val loc = dcl.lctn()
//
val-
D3Clocal0
(dcs1, dcs2) = dcl.node()
//
val dcs1 =
tread30_d3eclist(dcs1, err)
val dcs2 =
tread30_d3eclist(dcs2, err)
//
in
if
(err=e00)
then dcl else
d3ecl_local0_errck( loc, dcs1, dcs2 )
end (*let*) // end of [ f0_local0(dcl,err) ]
//
(* ****** ****** *)
//
fun
f0_include
( dcl: d3ecl
, err: &sint >> _): d3ecl =
let
//
val e00 = err
val loc = dcl.lctn()
//
val-
D3Cinclude
( knd0
, tknd, gsrc
, fopt, dopt) = dcl.node()
//
(*
val () =
prerrsln
("f0_include(30): loc = ", loc)
val () =
prerrsln
("f0_include(30): dopt = ", dopt)
*)
//
val dopt =
(
case+ dopt of
|optn_nil() =>
 (err := err+1; optn_nil(*0*))
|optn_cons(dcls) =>
 optn_cons
 (tread30_d3eclist(dcls, err)))
: d3eclistopt // end of [val(dopt)]
//
in//let
(
if
(err=e00)
then (dcl) else
d3ecl_include_errck
(loc, knd0, tknd, gsrc, fopt, dopt) )
end (*let*) // end of [f0_include(dcl,err)]
//
(* ****** ****** *)
//
fun
f0_staload
( dcl: d3ecl
, err: &sint >> _): d3ecl =
let
//
(*
HX-2023-08-02:
Staloads are shared and
Checking for them is done elsewhere
*)
//
val-
D3Cstaload
( knd0
, tknd, gsrc
, fopt, dopt) = dcl.node() in ( dcl )
end (*let*) // end of [f0_staload(dcl,err)]
//
(* ****** ****** *)
(* ****** ****** *)
//
(*
HX-2024-07-20:
Sat 20 Jul 2024 07:30:41 PM EDT
*)
fun
f0_dyninit
( dcl: d3ecl
, err: &sint >> _): d3ecl =
let
val-
D3Cdyninit
( tknd, gexp) = dcl.node() in ( dcl )
end (*let*) // end of [f0_dyninit(dcl,err)]
//
fun
f0_extcode
( dcl: d3ecl
, err: &sint >> _): d3ecl =
let
val-
D3Cextcode
( tknd, gexp) = dcl.node() in ( dcl )
end (*let*) // end of [f0_extcode(dcl,err)]
//
(* ****** ****** *)
(* ****** ****** *)
//
fun
f0_valdclst
( dcl: d3ecl
, err: &sint >> _): d3ecl =
let
//
val e00 = err
//
val-
D3Cvaldclst
(tknd, d3vs) = dcl.node()
//
val d3vs =
tread30_d3valdclist(d3vs, err)
//
in//let
if
(err=e00)
then (dcl) else
d3ecl_valdclst_errck(dcl.lctn(),tknd,d3vs)
end (*let*) // end of [f0_valdclst(dcl,err)]
//
(* ****** ****** *)
//
fun
f0_vardclst
( dcl: d3ecl
, err: &sint >> _): d3ecl =
let
//
val e00 = err
//
val-
D3Cvardclst
(tknd, d3vs) = dcl.node()
//
val d3vs =
tread30_d3vardclist(d3vs, err)
//
in//let
if
(err=e00)
then (dcl) else
d3ecl_vardclst_errck(dcl.lctn(),tknd,d3vs)
end (*let*) // end of [f0_vardclst(dcl,err)]
//
(* ****** ****** *)
//
fun
f0_fundclst
( dcl: d3ecl
, err: &sint >> _): d3ecl =
let
//
val e00 = err
val loc = dcl.lctn()
//
val-
D3Cfundclst
(tknd
,tqas
,d2cs, d3fs) = dcl.node()
//
(*
val tqas =
tread30_t2qaglst(tqas, err)
*)
val d3fs =
tread30_d3fundclist(d3fs, err)
//
in//let
if
(err=e00)
then (dcl) else
d3ecl_fundclst_errck
( dcl.lctn() , tknd , tqas , d2cs , d3fs )
end (*let*) // end of [f0_fundclst(dcl,err)]
//
(* ****** ****** *)
//
fun
f0_implmnt0
( dcl: d3ecl
, err: &sint >> _): d3ecl =
let
//
val e00 = err
//
val-
D3Cimplmnt0
(tknd
,stmp
,sqas,tqas
,dqid
,tias,fags
,sres,dexp) = dcl.node()
//
(*
val sqas =
  tread30_s2qaglst(sqas, err)
val tqas =
  tread30_t2qaglst(tqas, err)
val tias =
  tread30_t2iaglst(tias, err)
*)
//
val fags =
  tread30_f3arglst(fags, err)
//
(*
val sres = tread30_s2res(sres, err)
*)
//
val dexp = tread30_d3exp(dexp, err)
//
in//let
if
(err=e00)
then (dcl) else
d3ecl_implmnt0_errck
(dcl.lctn(), tknd, stmp
,sqas, tqas, dqid, tias, fags, sres, dexp)
end (*let*) // end-of-[f0_implmnt0(dcl,err)]
//
(* ****** ****** *)
//
(*
val () =
(
  prerrsln("tread30_d3ecl: d3cl = ", d3cl) )
*)
//
(* ****** ****** *)
//
} (*where*) // end-of-[tread30_d3ecl(d3cl,err)]

(* ****** ****** *)
//
#implfun
tread30_teqd3exp
  (tdxp, err) =
(
case+ tdxp of
|
TEQD3EXPnone() => tdxp
|
TEQD3EXPsome(teq1, d3e2) =>
let
val e00 = err
(*
val ( ) =
prerrsln
("tread30_teqd3exp: d3e2 = ", d3e2)
*)
val d3e2 = tread30_d3exp(d3e2, err)
in//letp
if
(err=e00)
then tdxp else TEQD3EXPsome(teq1, d3e2)
endlet // end of [ TEQD3EXPsome( _,_ ) ]
) (*case+*)//end-(tread30_teqd3exp(tdxp,err))
//
(* ****** ****** *)
//
#implfun
tread30_d3valdcl
  (dval, err) =
let
//
val e00 = err
//
val loc = dval.lctn()
//
val
dpat = d3valdcl_get_dpat(dval)
val
tdxp = d3valdcl_get_tdxp(dval)
val
wsxp = d3valdcl_get_wsxp(dval)
//
val
dpat = tread30_d3pat(dpat,err)
val
tdxp = tread30_teqd3exp(tdxp,err)
(*
val
wsxp = tread30_wths2exp(wsxp,err)
*)
//
in//let
if
(err=e00)
then (dval)
else d3valdcl( loc, dpat, tdxp, wsxp )
endlet // end-of-[tread30_d3valdcl(out,dval)]
//
(* ****** ****** *)
//
#implfun
tread30_d3vardcl
  (dvar, err) =
let
//
val e00 = err
//
val loc = dvar.lctn()
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
(*
val
sres = tread30_s2expopt(sres,err)
*)
val
dini = tread30_teqd3exp(dini,err)
//
in//let
if
(err=e00)
then (dvar)
else d3vardcl(loc,dpid,vpid,sres,dini)
endlet // end-of-[tread30_d3vardcl(out,dvar)]
//
(* ****** ****** *)
//
#implfun
tread30_d3fundcl
  (dfun, err) =
let
//
val e00 = err
//
val loc = dfun.lctn()
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
farg =
tread30_f3arglst(farg, err)
(*
val
sres = tread30_s3res(sres,err)
*)
val
tdxp = tread30_teqd3exp(tdxp,err)
(*
val
wsxp = tread30_wths3exp(wsxp,err)
*)
//
in//let
if
(err=e00)
then (dfun)
else d3fundcl(loc,dpid,farg,sres,tdxp,wsxp)
endlet // end-of-[tread30_d3fundcl(out,dfun)]
//
(* ****** ****** *)
//
#implfun
tread30_d3eclist
  (  dcls, err  ) =
(
  list_tread30_fnp(dcls, err, tread30_d3ecl))
//
(* ****** ****** *)
//
#implfun
tread30_d3valdclist
  (  d3vs, err  ) =
(
  list_tread30_fnp(d3vs, err, tread30_d3valdcl))
//
(* ****** ****** *)
//
#implfun
tread30_d3vardclist
  (  d3vs, err  ) =
(
  list_tread30_fnp(d3vs, err, tread30_d3vardcl))
//
(* ****** ****** *)
//
#implfun
tread30_d3fundclist
  (  d3fs, err  ) =
(
  list_tread30_fnp(d3fs, err, tread30_d3fundcl))
//
(* ****** ****** *)

(* end of [ATS3/XATSOPT_srcgen2_DATS_tread30_decl00.dats] *)

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
Sat 28 Jan 2023 04:13:53 PM EST
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
#staload "./../SATS/tread20.sats"
(* ****** ****** *)
#symload lctn with token_get_lctn
#symload node with token_get_node
(* ****** ****** *)
#symload lctn with d2ecl_get_lctn
#symload node with d2ecl_get_node
(* ****** ****** *)
#symload lctn with d2valdcl_get_lctn
#symload lctn with d2vardcl_get_lctn
#symload lctn with d2fundcl_get_lctn
#symload lctn with d2cstdcl_get_lctn
(* ****** ****** *)
//
fun
d2ecl_errck
(lvl0: sint
,d2cl: d2ecl): d2ecl =
let
val loc0 = d2cl.lctn()
in//let
d2ecl_make_node
(loc0, D2Cerrck(lvl0, d2cl))
end (*let*) // end-of(d2ecl_errck)
//
(* ****** ****** *)
//
fun
d2ecl_then0_errck
( loc0
: loc_t
, dcls
: d2eclist): d2ecl =
let
val lvl = 0
in//let
d2ecl_errck
(lvl+1, d2ecl(loc0, D2Cthen0(dcls)))
end (*let*) // end-of(d2ecl_then0_errck)
//
fun
d2ecl_else1_errck
( loc0
: loc_t
, dcls
: d2eclist): d2ecl =
let
val lvl = 0
in//let
d2ecl_errck
(lvl+1, d2ecl(loc0, D2Celse1(dcls)))
end (*let*) // end-of(d2ecl_else1_errck)
//
(* ****** ****** *)
//
fun
d2ecl_static_errck
( loc0: loc_t
, tknd: token
, dcl1: d2ecl): d2ecl =
let
val lvl = 0
in//let
d2ecl_errck
( lvl+1
, d2ecl(loc0, D2Cstatic(tknd, dcl1)) )
end (*let*)//end-of-[d2ecl_static_errck]
//
fun
d2ecl_extern_errck
( loc0: loc_t
, tknd: token
, dcl1: d2ecl): d2ecl =
let
val lvl = 0
in//let
d2ecl_errck
( lvl+1
, d2ecl(loc0, D2Cextern(tknd, dcl1)) )
end (*let*)//end-of-[d2ecl_extern_errck]
//
(* ****** ****** *)
//
fun
d2ecl_local0_errck
( loc0
: loc_t
, dcs1
: d2eclist
, dcs2
: d2eclist): d2ecl =
let
val lvl = 0
in//let
d2ecl_errck
(lvl+1,d2ecl(loc0,D2Clocal0(dcs1,dcs2)))
end (*let*) // end of [d2ecl_local0_errck]
//
(* ****** ****** *)
//
fun
d2ecl_include_errck
( loc0: loc_t
, knd0: sint
, tknd: token
, g1e1: g1exp
, fopt: fpathopt
, dopt: d2eclistopt): d2ecl =
let
val lvl = 0
in//let
d2ecl_errck
(
lvl+1,
d2ecl_make_node
( loc0
, D2Cinclude(knd0,tknd,g1e1,fopt,dopt)))
end (*let*) // end of [d2ecl_include_errck]
//
(* ****** ****** *)
//
(*
fun
d2ecl_staload_errck
( loc0: loc_t
, knd0: sint
, tknd: token
, g1e1: g1exp
, fopt: fpathopt
, dopt: s2taloadopt): d2ecl =
let
val lvl = 0
in//let
d2ecl_errck
(
lvl+1,
d2ecl_make_node
( loc0
, D2Cstaload(knd0,tknd,g1e1,fopt,dopt)))
end (*let*) // end of [d2ecl_staload_errck]
*)
//
(* ****** ****** *)
(* ****** ****** *)
//
fun
d2ecl_valdclst_errck
( loc0
: loc_t
, tknd
: token
, d2vs
: d2valdclist): d2ecl =
let
val lvl = 0
in//let
d2ecl_errck
(lvl+1, d2ecl(loc0,D2Cvaldclst(tknd,d2vs)))
end (*let*) // end of [d2ecl_valdclst_errck]
//
(* ****** ****** *)
//
fun
d2ecl_vardclst_errck
( loc0
: loc_t
, tknd
: token
, d2vs
: d2vardclist): d2ecl =
let
val lvl = 0
in//let
d2ecl_errck
(lvl+1, d2ecl(loc0,D2Cvardclst(tknd,d2vs)))
end (*let*) // end of [d2ecl_vardclst_errck]
//
(* ****** ****** *)
(* ****** ****** *)
//
fun
d2ecl_fundclst_errck
( loc0
: loc_t
, tknd
: token
, tqas
: t2qaglst
, d2cs
: d2cstlst
, d2fs
: d2fundclist): d2ecl =
let
val lvl = 0
in//let
d2ecl_errck
( lvl+1
, d2ecl
  (loc0,D2Cfundclst(tknd,tqas,d2cs,d2fs)))
end (*let*) // end of [d2ecl_fundclst_errck]
//
(* ****** ****** *)
(* ****** ****** *)
//
fun
d2ecl_implmnt0_errck
( loc0
: loc_t
, tknd
: token
, sqas
: s2qaglst
, tqas
: t2qaglst
, dqid
: dimpl
, tias
: t2iaglst
, fags
: f2arglst
, sres: s2res(*tret*)
, dexp: d2exp(*body*)): d2ecl =
let
val lvl = 0
in//let
d2ecl_errck
(
lvl+1
,
d2ecl_make_node
( loc0
, D2Cimplmnt0
  ( tknd
  , sqas,tqas,dqid,tias,fags,sres,dexp ) ))
end (*let*) // end of [d2ecl_implmnt0_errck]
//
(* ****** ****** *)
(* ****** ****** *)

#implfun
tread20_d2ecl
  (d2cl, err) =
(
case+
d2cl.node() of
//
|D2Cnone0 _ => d2cl
|D2Cd1ecl _ => d2cl
|D2Cerrck _ => d2cl
//
|D2Cabssort _ => d2cl
|D2Cstacst0 _ => d2cl
//
|D2Csortdef _ => d2cl
|D2Csexpdef _ => d2cl
//
|D2Cabstype _ => d2cl
//
|D2Cabsopen _ => d2cl
|D2Cabsimpl _ => d2cl
//
|D2Csymload _ => d2cl
//
(* ****** ****** *)
//
|D2Cthen0 _ => f0_then0(d2cl, err)
|D2Celse1 _ => f0_else1(d2cl, err)
//
(* ****** ****** *)
//
|D2Cstatic _ => f0_static(d2cl, err)
|D2Cextern _ => f0_extern(d2cl, err)
//
(* ****** ****** *)
//
|D2Clocal0 _ => f0_local0(d2cl, err)
//
(* ****** ****** *)
//
|D2Cinclude _ => f0_include(d2cl, err)
|D2Cstaload _ => f0_staload(d2cl, err)
//
(* ****** ****** *)
//
(*
HX-2024-07-20:
Sat 20 Jul 2024 08:02:15 PM EDT
*)
//
|D2Cdyninit _ => f0_dyninit(d2cl, err)
|D2Cextcode _ => f0_extcode(d2cl, err)
//
(* ****** ****** *)
//
|D2Cvaldclst _ => f0_valdclst(d2cl, err)
|D2Cvardclst _ => f0_vardclst(d2cl, err)
|D2Cfundclst _ => f0_fundclst(d2cl, err)
//
(* ****** ****** *)
//
|D2Cimplmnt0 _ => f0_implmnt0(d2cl, err)
//
(* ****** ****** *)
//
|D2Cexcptcon _ => f0_excptcon(d2cl, err)
|D2Cdatatype _ => f0_datatype(d2cl, err)
//
|D2Cdynconst _ => f0_dynconst(d2cl, err)
//
(* ****** ****** *)
//
|
_(*otherwise*) =>
let
val lvl0 = 1
in//let
(
  err := err+1; d2ecl_errck(lvl0, d2cl))
endlet // end of [   _(* otherwise *)   ]
//
) where// end of [ case+of(d2cl.node()) ]
{
(* ****** ****** *)
//
fun
f0_then0
( dcl: d2ecl
, err: &sint >> _): d2ecl =
let
//
val e00 = err
//
val-
D2Cthen0
(  dcls  ) = dcl.node()
//
val dcls =
(
  tread20_d2eclist(dcls, err))
//
in
if
(err=e00)
then dcl else
d2ecl_then0_errck(dcl.lctn(), dcls)
end (*let*) // end of [ f0_then0(dcl,err) ]
//
fun
f0_else1
( dcl: d2ecl
, err: &sint >> _): d2ecl =
let
//
val e00 = err
//
val-
D2Celse1
(  dcls  ) = dcl.node()
//
val dcls =
(
  tread20_d2eclist(dcls, err))
//
in
if
(err=e00)
then dcl else
d2ecl_else1_errck(dcl.lctn(), dcls)
end (*let*) // end of [ f0_else1(dcl,err) ]
//
(* ****** ****** *)
//
fun
f0_static
( dcl: d2ecl
, err: &sint >> _): d2ecl =
let
//
val e00 = err
//
val-
D2Cstatic
( tknd, dcl1) = dcl.node()
//
val dcl1 = tread20_d2ecl(dcl1, err)
//
in
if
(err=e00)
then dcl else
d2ecl_static_errck(dcl.lctn(),tknd,dcl1)
end (*let*) // end of [ f0_static(dcl,err) ]
//
(* ****** ****** *)
//
fun
f0_extern
( dcl: d2ecl
, err: &sint >> _): d2ecl =
let
//
val e00 = err
//
val-
D2Cextern
( tknd, dcl1) = dcl.node()
//
val dcl1 = tread20_d2ecl(dcl1, err)
//
in
if
(err=e00)
then dcl else
d2ecl_extern_errck(dcl.lctn(),tknd,dcl1)
end (*let*) // end of [ f0_extern(dcl,err) ]
//
(* ****** ****** *)
(* ****** ****** *)
//
fun
f0_local0
( dcl: d2ecl
, err: &sint >> _): d2ecl =
let
//
val e00 = err
val loc = dcl.lctn()
//
val-
D2Clocal0
(dcs1, dcs2) = dcl.node()
//
val dcs1 =
tread20_d2eclist(dcs1, err)
val dcs2 =
tread20_d2eclist(dcs2, err)
//
in
if
(err=e00)
then dcl else
d2ecl_local0_errck( loc, dcs1, dcs2 )
end (*let*) // end of [ f0_local0(dcl,err) ]
//
(* ****** ****** *)
(* ****** ****** *)
//
fun
f0_include
( dcl: d2ecl
, err: &sint >> _): d2ecl =
let
//
val e00 = err
val loc = dcl.lctn()
//
val-
D2Cinclude
( knd0
, tknd, gsrc
, fopt, dopt) = dcl.node()
//
(*
val () =
prerrsln
("f0_include(22): loc = ", loc)
val () =
prerrsln
("f0_include(22): dopt = ", dopt)
*)
//
val dopt =
(
case+ dopt of
|optn_nil() =>
 (err := err+1; optn_nil(*0*))
|optn_cons(dcls) =>
 optn_cons
 (tread20_d2eclist(dcls, err)))
: d2eclistopt // end of [val(dopt)]
//
in//let
if
(err=e00)
then (dcl) else
d2ecl_include_errck
( loc, knd0, tknd, gsrc, fopt, dopt )
end (*let*) // end of [f0_include(dcl,err)]
//
(* ****** ****** *)
//
fun
f0_staload
( dcl: d2ecl
, err: &sint >> _): d2ecl =
let
//
(*
HX-2023-06-21:
Staloads are shared and
Checking for them is done elsewhere
*)
//
val-
D2Cstaload
( knd0
, tknd, gsrc
, fopt, dopt) = dcl.node() in ( dcl )
end (*let*) // end of [f0_staload(dcl,err)]
//
(* ****** ****** *)
(* ****** ****** *)
//
fun
f0_dyninit
( dcl: d2ecl
, err: &sint >> _): d2ecl =
let
//
val-
D2Cdyninit
( tknd, gexp) = dcl.node() in ( dcl )
end (*let*) // end of [f0_dyninit(dcl,err)]
//
fun
f0_extcode
( dcl: d2ecl
, err: &sint >> _): d2ecl =
let
//
val-
D2Cextcode
( tknd, gexp) = dcl.node() in ( dcl )
end (*let*) // end of [f0_extcode(dcl,err)]
//
(* ****** ****** *)
(* ****** ****** *)
//
fun
f0_valdclst
( dcl: d2ecl
, err: &sint >> _): d2ecl =
let
//
val e00 = err
//
val-
D2Cvaldclst
(tknd, d2vs) = dcl.node()
//
val d2vs =
tread20_d2valdclist(d2vs, err)
//
in//let
if
(err=e00)
then (dcl) else
d2ecl_valdclst_errck(dcl.lctn(),tknd,d2vs)
end (*let*) // end of [f0_valdclst(dcl,err)]
//
(* ****** ****** *)
//
fun
f0_vardclst
( dcl: d2ecl
, err: &sint >> _): d2ecl =
let
//
val e00 = err
//
val-
D2Cvardclst
(tknd, d2vs) = dcl.node()
//
val d2vs =
tread20_d2vardclist(d2vs, err)
//
in//let
if
(err=e00)
then (dcl) else
d2ecl_vardclst_errck(dcl.lctn(),tknd,d2vs)
end (*let*) // end of [f0_vardclst(dcl,err)]
//
(* ****** ****** *)
//
fun
f0_fundclst
( dcl: d2ecl
, err: &sint >> _): d2ecl =
let
//
val e00 = err
val loc = dcl.lctn()
//
val-
D2Cfundclst
(tknd
,tqas
,d2cs, d2fs) = dcl.node()
//
(*
val tqas =
tread20_t2qaglst(tqas, err)
*)
val d2fs =
tread20_d2fundclist(d2fs, err)
//
in//let
if
(err=e00)
then (dcl) else
d2ecl_fundclst_errck
( dcl.lctn() , tknd , tqas , d2cs , d2fs )
end (*let*) // end of [f0_fundclst(dcl,err)]
//
(* ****** ****** *)
//
fun
f0_implmnt0
( dcl: d2ecl
, err: &sint >> _): d2ecl =
let
//
val e00 = err
//
val-
D2Cimplmnt0
(tknd
,sqas,tqas
,dqid
,tias,fags
,sres,dexp) = dcl.node()
//
(*
val sqas =
  tread20_s2qaglst(sqas, err)
val tqas =
  tread20_t2qaglst(tqas, err)
val tias =
  tread20_t2iaglst(tias, err)
*)
//
val fags =
  tread20_f2arglst(fags, err)
//
(*
val sres = tread20_s2res(sres, err)
*)
//
val dexp = tread20_d2exp(dexp, err)
//
in//let
if
(err=e00)
then (dcl) else
d2ecl_implmnt0_errck
(dcl.lctn(), tknd
,sqas, tqas, dqid, tias, fags, sres, dexp)
end (*let*) // end of [f0_implmnt0(dcl,err)]
//
(* ****** ****** *)
//
fun
f0_excptcon
( dcl: d2ecl
, err: &sint >> _): d2ecl =
let
val-
D2Cexcptcon
(d1cl, d2cs) = dcl.node() in (dcl) end//fun
//
fun
f0_datatype
( dcl: d2ecl
, err: &sint >> _): d2ecl =
let
val-
D2Cdatatype
(d1cl, s2cs) = dcl.node() in (dcl) end//fun
//
(* ****** ****** *)
//
fun
f0_dynconst
( dcl: d2ecl
, err: &sint >> _): d2ecl =
let
val-
D2Cdynconst
(tknd,tqas,d2cs) = dcl.node() in (dcl) end//fun
//
(* ****** ****** *)
(* ****** ****** *)
//
(*
val (  ) =
(
  prerrsln("tread20_d2ecl: d2cl = ", d2cl))
*)
(* ****** ****** *)
(* ****** ****** *)
//
} (*where*) // end of [tread20_d2ecl(d2cl,err)]

(* ****** ****** *)
//
#implfun
tread20_teqd2exp
  (tdxp, err) =
(
case+ tdxp of
|
TEQD2EXPnone() => tdxp
|
TEQD2EXPsome(teq1, d2e2) =>
let
val e00 = err
(*
val ( ) =
prerrsln
("tread20_teqd2exp: d2e2 = ", d2e2)
*)
val d2e2 = tread20_d2exp(d2e2, err)
in//letp
if
(err=e00)
then tdxp else TEQD2EXPsome(teq1, d2e2)
endlet // end of [ TEQD2EXPsome( _,_ ) ]
) (*case+*)//end-(tread20_teqd2exp(tdxp,err))
//
(* ****** ****** *)
//
#implfun
tread20_d2valdcl
  (dval, err) =
let
//
val e00 = err
//
val loc = dval.lctn()
//
val
dpat = d2valdcl_get_dpat(dval)
val
tdxp = d2valdcl_get_tdxp(dval)
val
wsxp = d2valdcl_get_wsxp(dval)
//
val
dpat = tread20_d2pat(dpat,err)
val
tdxp = tread20_teqd2exp(tdxp,err)
(*
val
wsxp = tread20_wths2exp(wsxp,err)
*)
//
in//let
if
(err=e00)
then (dval)
else d2valdcl( loc, dpat, tdxp, wsxp )
endlet // end-of-[tread20_d2valdcl(out,dval)]
//
(* ****** ****** *)
//
#implfun
tread20_d2vardcl
  (dvar, err) =
let
//
val e00 = err
//
val loc = dvar.lctn()
//
val
dpid = d2vardcl_get_dpid(dvar)
val
vpid = d2vardcl_get_vpid(dvar)
val
sres = d2vardcl_get_sres(dvar)
val
dini = d2vardcl_get_dini(dvar)
//
(*
val
sres = tread20_s2expopt(sres,err)
*)
val
dini = tread20_teqd2exp(dini,err)
//
in//let
if
(err=e00)
then (dvar)
else d2vardcl(loc,dpid,vpid,sres,dini)
endlet // end-of-[tread20_d2vardcl(out,dvar)]
//
(* ****** ****** *)
//
#implfun
tread20_d2fundcl
  (dfun, err) =
let
//
val e00 = err
//
val loc = dfun.lctn()
//
val
dpid = d2fundcl_get_dpid(dfun)
val
farg = d2fundcl_get_farg(dfun)
val
sres = d2fundcl_get_sres(dfun)
val
tdxp = d2fundcl_get_tdxp(dfun)
val
wsxp = d2fundcl_get_wsxp(dfun)
//
val
farg =
tread20_f2arglst(farg, err)
(*
val
sres = tread20_s2res(sres,err)
*)
val
tdxp = tread20_teqd2exp(tdxp,err)
(*
val
wsxp = tread20_wths2exp(wsxp,err)
*)
//
in//let
if
(err=e00)
then (dfun)
else d2fundcl(loc,dpid,farg,sres,tdxp,wsxp)
endlet // end-of-[tread20_d2fundcl(out,dfun)]
//
(* ****** ****** *)
//
#implfun
tread20_d2eclist
  (  dcls, err  ) =
list_tread20_fnp(dcls, err, tread20_d2ecl)
//
(* ****** ****** *)
#implfun
tread20_d2valdclist
  (  d2vs, err  ) =
list_tread20_fnp(d2vs, err, tread20_d2valdcl)
(* ****** ****** *)
#implfun
tread20_d2vardclist
  (  d2vs, err  ) =
list_tread20_fnp(d2vs, err, tread20_d2vardcl)
(* ****** ****** *)
#implfun
tread20_d2fundclist
  (  d2fs, err  ) =
list_tread20_fnp(d2fs, err, tread20_d2fundcl)
(* ****** ****** *)

(* end of [ATS3/XATSOPT_srcgen2_DATS_tread20_decl00.dats] *)

(***********************************************************************)
(*                                                                     *)
(*                         Applied Type System                         *)
(*                                                                     *)
(***********************************************************************)

(*
** ATS/Xanadu - Unleashing the Potential of Types!
** Copyright (C) 2024 Hongwei Xi, ATS Trustful Software, Inc.
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
//
Fri 15 Mar 2024 05:16:04 AM EDT
//
Authoremail: gmhwxiATgmailDOTcom
*)
//
(* ****** ****** *)
(*
#define
XATSOPT "./../../.."
*)
(* ****** ****** *)
#include
"./../../..\
/HATS/xatsopt_sats.hats"
#include
"./../../..\
/HATS/xatsopt_dats.hats"
(* ****** ****** *)
//
#include
"./../HATS/libxats2js.hats"
//
(* ****** ****** *)
//
#staload
"./../../../SATS/staexp2.sats"
#staload
"./../../../SATS/statyp2.sats"
//
(* ****** ****** *)
//
#staload
"./../../../SATS/dynexp3.sats"
//
(* ****** ****** *)
//
#staload "./../SATS/intrep0.sats"
#staload "./../SATS/trxd3i0.sats"
//
(* ****** ****** *)
//
#staload
_(*DATS*)="./../DATS/trxd3i0.dats"
//
(* ****** ****** *)
(* ****** ****** *)
#symload stmp with timpl_get_stmp
#symload node with timpl_get_node
(* ****** ****** *)
#symload lctn with d3ecl_get_lctn
#symload node with d3ecl_get_node
(* ****** ****** *)
(* ****** ****** *)
//
#implfun
trxd3i0_timpl
(env0 , timp) =
(
case+
timp.node() of
//
|TIMPLall1
(d2c1, dcls) =>
(
t0imp_make_node
(stmp,T0IMPall1(d2c1,dcls))
) where
{
val dcls =
trxd3i0_d3eclist(env0, dcls)}
//
|TIMPLallx
(d2c1, dcls) =>
(
t0imp_make_node
(stmp,T0IMPallx(d2c1,dcls))
) where
{
val dcls =
trxd3i0_d3eclist(env0, dcls)}
//
) where
{
//
val stmp = timp.stmp((*void*))
//
val (  ) =
prerrln("trxd3i0_timpl: timp = ", timp)
//
}(*where*)//end-of-[trxd3i0_timpl(env0,...)]
//
(* ****** ****** *)
(* ****** ****** *)
//
#implfun
trxd3i0_d3ecl
(env0 , d3cl) =
(
case+
d3cl.node() of
//
|D3Ctmpsub _ =>
(
  f0_tmpsub(env0, d3cl))
//
|D3Clocal0 _ =>
(
  f0_local0(env0, d3cl))
//
|D3Cvaldclst _ =>
(
  f0_valdclst(env0, d3cl))
|D3Cvardclst _ =>
(
  f0_vardclst(env0, d3cl))
//
|D3Cfundclst _ =>
(
  f0_fundclst(env0, d3cl))
//
|D3Cimplmnt0 _ =>
(
  f0_implmnt0(env0, d3cl))
//
|_(* otherwise *) => i0dcl_none1(d3cl)
//
) where
{
//
(* ****** ****** *)
//
fun
f0_tmpsub
( env0: 
! envd3i0
, d3cl: d3ecl): i0dcl =
let
//
val loc0 = d3cl.lctn()
val-
D3Ctmpsub
(svts, dcl1) = d3cl.node()
//
val i0d1 =
(
  trxd3i0_d3ecl(env0, dcl1))
//
in//let
//
i0dcl(loc0, I0Dtmpsub(svts, i0d1))
//
end//let//end-of-[f0_tmpsub(env0,d3cl)]
//
(* ****** ****** *)
//
fun
f0_local0
( env0: 
! envd3i0
, d3cl: d3ecl): i0dcl =
let
//
val loc0 = d3cl.lctn()
val-
D3Clocal0
(head, body) = d3cl.node()
//
val
head =
trxd3i0_d3eclist(env0, head)
val
body =
trxd3i0_d3eclist(env0, body)
//
in//let
//
i0dcl(loc0, I0Dlocal0(head, body))
//
end//let//end-of-[f0_local0(env0,d3cl)]
//
(* ****** ****** *)
//
fun
f0_valdclst
( env0:
! envd3i0
, d3cl: d3ecl): i0dcl =
let
//
val loc0 = d3cl.lctn()
val-
D3Cvaldclst
(tknd, d3vs) = d3cl.node()
//
val
i0vs =
trxd3i0_d3valdclist(env0, d3vs)
//
in//let
  i0dcl(loc0, I0Dvaldclst(tknd, i0vs))
end where
{
//
(*
val loc0 = d3cl.lctn()
val (  ) =
prerrln("f0_valdclst(d3i0): d3cl = ", d3cl)
*)
//
}(*where*) // end of [f0_valdclst(env0,d3cl)]
//
(* ****** ****** *)
//
fun
f0_vardclst
( env0:
! envd3i0
, d3cl: d3ecl): i0dcl =
let
//
val loc0 = d3cl.lctn()
val-
D3Cvardclst
(tknd, d3vs) = d3cl.node()
//
val
i0vs =
trxd3i0_d3vardclist(env0, d3vs)
//
in//let
  i0dcl(loc0, I0Dvardclst(tknd, i0vs))
end where
{
//
(*
val loc0 = d3cl.lctn()
val (  ) =
prerrln("f0_vardclst(d3i0): d3cl = ", d3cl)
*)
//
}(*where*) // end of [f0_vardclst(env0,d3cl)]
//
(* ****** ****** *)
//
fun
f0_fundclst
( env0:
! envd3i0
, d3cl: d3ecl): i0dcl =
let
//
val loc0 = d3cl.lctn()
val-
D3Cfundclst
( tknd
, tqas
, d2cs, d3fs) = d3cl.node()
//
val
i0fs =
trxd3i0_d3fundclist(env0, d3fs)
//
in//let
i0dcl_make_node
(loc0, I0Dfundclst(tknd, d2cs, i0fs))
//
end where
{
//
(*
//
val loc0 = d3cl.lctn((*void*))
//
val (  ) =
prerrln("f0_fundclst(d3i0): d3cl = ", d3cl)
*)
//
}(*where*) // end of [f0_fundclst(env0,d3cl)]
//
(* ****** ****** *)
(* ****** ****** *)
//
fun
f0_implmnt0
( env0:
! envd3i0
, d3cl: d3ecl): i0dcl =
let
//
val loc0 = d3cl.lctn()
val-
D3Cimplmnt0
( tknd
, stmp
, sqas, tqas
, dimp//dcst
, tias, f3as
, sres, dexp) = d3cl.node()
//
val fias =
(
  trxd3i0_f3arglst(env0, f3as))
//
val dexp = trxd3i0_d3exp(env0, dexp)
//
in//let
//
i0dcl_make_node
(
loc0,
I0Dimplmnt0(tknd,stmp,dimp,fias,dexp))
//
end where // end-of-[let]
{
//
(*
//
val loc0 = d3cl.lctn((*void*))
//
val (  ) =
prerrln("f0_implmnt0(d3i0): loc0 = ", loc0)
val (  ) =
prerrln("f0_implmnt0(d3i0): d3cl = ", d3cl)
*)
//
} (*where*) // end of [f0_implmnt0(env0,d3cl)]
//
(* ****** ****** *)
(* ****** ****** *)
//
val loc0 = d3cl.lctn((*void*))
//
val (  ) =
(
  prerrln("trxd3i0_i0dcl: loc0 = ", loc0) )
val () =
(
  prerrln("trxd3i0_d3ecl: d3cl = ", d3cl) )
//
(* ****** ****** *)
(* ****** ****** *)
//
} (*where*) // end of [trxd3i0_d3ecl(env0,...)]
//
(* ****** ****** *)
(* ****** ****** *)
//
#implfun
trxd3i0_teqd3exp
  (env0, tdxp) =
(
case+ tdxp of
|
TEQD3EXPnone() =>
TEQI0EXPnone((*void*))
|
TEQD3EXPsome(teq1, d3e2) =>
TEQI0EXPsome(teq1, i0e2) where
{ val
  i0e2 = trxd3i0_d3exp(env0, d3e2) }
) (*case+*)//end-of(trxd3i0_teqd3exp(...))
//
(* ****** ****** *)
(* ****** ****** *)
//
#implfun
trxd3i0_d3valdcl
  (env0, dval) = let
//
val loc0 =
d3valdcl_get_lctn(dval)
val dpat =
d3valdcl_get_dpat(dval)
val tdxp =
d3valdcl_get_tdxp(dval)
//
val ipat =
trxd3i0_d3pat(env0, dpat)
//
val tdxp =
trxd3i0_teqd3exp(env0, tdxp)
//
in//let
(
  i0valdcl_make_args(loc0, ipat, tdxp))
end//let
(*let*)//end-of-[trxd3i0_d3valdcl(env0,dval)]
//
(* ****** ****** *)

#implfun
trxd3i0_d3vardcl
  (env0, dvar) = let
//
val loc0 =
d3vardcl_get_lctn(dvar)
val dpid =
d3vardcl_get_dpid(dvar)
val dini =
d3vardcl_get_dini(dvar)
//
val dini =
trxd3i0_teqd3exp(env0, dini)
//
in//let
(
  i0vardcl_make_args(loc0, dpid, dini))
end//let
(*let*)//end-of-[trxd3i0_d3vardcl(env0,dvar)]

(* ****** ****** *)

#implfun
trxd3i0_d3fundcl
  (env0, dfun) = let
//
val loc0 =
d3fundcl_get_lctn(dfun)
//
val dvar =
d3fundcl_get_dpid(dfun)
val f3as =
d3fundcl_get_farg(dfun)
val tdxp =
d3fundcl_get_tdxp(dfun)
//
(*
val (  ) = prerrln
("trxd3i0_d3fundcl: f3as = ", f3as)
val (  ) = prerrln
("trxd3i0_d3fundcl: tdxp = ", tdxp)
*)
//
val fias =
trxd3i0_f3arglst(env0, f3as)
val tdxp =
trxd3i0_teqd3exp(env0, tdxp)
//
(*
val (  ) = prerrln
("trxd3i0_d3fundcl: f3as = ", f3as)
val (  ) = prerrln
("trxd3i0_d3fundcl: tdxp = ", tdxp)
*)
//
in//let
(
  i0fundcl(loc0, dvar, fias, tdxp))
end//let
(*let*)//end-of-[trxd3i0_d3fundcl(env0,dfun)]

(* ****** ****** *)
(* ****** ****** *)
//
#implfun
trxd3i0_d3eclist
( env0, dcls ) =
(
  list_trxd3i0_fnp(env0, dcls, trxd3i0_d3ecl))
//
(* ****** ****** *)
(* ****** ****** *)
//
#implfun
trxd3i0_d3valdclist
  ( env0 , d3vs ) =
(
  list_trxd3i0_fnp(env0, d3vs, trxd3i0_d3valdcl))
//
#implfun
trxd3i0_d3vardclist
  ( env0 , d3vs ) =
(
  list_trxd3i0_fnp(env0, d3vs, trxd3i0_d3vardcl))
//
(* ****** ****** *)
//
#implfun
trxd3i0_d3fundclist
  ( env0 , d3fs ) =
(
  list_trxd3i0_fnp(env0, d3fs, trxd3i0_d3fundcl))
//
(* ****** ****** *)
(* ****** ****** *)
//
#implfun
trxd3i0_d3eclistopt
  (env0, dopt) =
(
  optn_trxd3i0_fnp(env0, dopt, trxd3i0_d3eclist))
//
(* ****** ****** *)
(* ****** ****** *)
//
(***********************************************************************)
(* end of [ATS3/XANADU_srcgen2_xinterp_srcgen1_DATS_trxd3i0_decl00.dats] *)
(***********************************************************************)

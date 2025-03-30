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
//
Sat Nov 25 12:27:54 EST 2023
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
(*
#include
"./../../..\
/HATS/xatsopt_dats.hats"
*)
#include
"./../../..\
/HATS/xatsopt_dpre.hats"
(* ****** ****** *)
//
#staload
"./../../../SATS/xbasics.sats"
//
#staload
"./../../../SATS/lexing0.sats"
//
(* ****** ****** *)
//
#staload
"./../../../SATS/dynexp3.sats"
//
(* ****** ****** *)
//
#staload "./../SATS/intrep0.sats"
//
(* ****** ****** *)
//
#staload
_(*DATS*)="./../DATS/intrep0.dats"
//
(* ****** ****** *)
#symload lctn with token_get_lctn
#symload node with token_get_node
(* ****** ****** *)
#symload lctn with d3ecl_get_lctn
#symload node with d3ecl_get_node
(* ****** ****** *)
(* ****** ****** *)
//
fun
token_prvalq
(tknd: token): bool =
(
case+
tknd.node() of
|T_VAL(vlk) =>
(
case+ vlk of
| VLKprval() => ( true )
| _(*otherwise*) => false )
| _(*otherwise*) => ( false )
)
//
(* ****** ****** *)
//
fun
token_prfunq
(tknd: token): bool =
(
case+
tknd.node() of
|T_FUN(fnk) =>
(
case+ fnk of
| FNKprfn0() => ( true )
| FNKprfn1() => ( true )
| FNKprfun() => ( true )
| _(*otherwise*) => false )
| _(*otherwise*) => ( false )
)
//
(* ****** ****** *)
//
#implfun
trxd3ir_d3ecl
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
|
D3Cstaload _ =>
(
  f0_staload(env0, d3cl))
//
|
D3Cinclude _ =>
(
  f0_include(env0, d3cl))
//
|
D3Cvaldclst _ =>
(
  f0_valdclst(env0, d3cl))
|
D3Cvardclst _ =>
(
  f0_vardclst(env0, d3cl))
//
|
D3Cfundclst _ =>
(
  f0_fundclst(env0, d3cl))
//
|
D3Cimplmnt0 _ =>
(
  f0_implmnt0(env0, d3cl))
//
|_(* otherwise *) => irdcl_none1(d3cl)
//
) where
{
//
val
loc0 = d3cl.lctn()
//
(* ****** ****** *)
//
fun
f0_tmpsub
( env0: 
! trdienv
, d3cl: d3ecl): irdcl =
let
//
val-
D3Ctmpsub
(svts, dcl1) = d3cl.node()
//
val ird1 =
(
  trxd3ir_d3ecl(env0, dcl1))
//
in//let
//
irdcl(loc0, IRDtmpsub(svts, ird1))
//
end//let//end-of-[f0_local0(env0,d3cl)]
//
(* ****** ****** *)
//
fun
f0_local0
( env0: 
! trdienv
, d3cl: d3ecl): irdcl =
let
//
val-
D3Clocal0
(head, body) = d3cl.node()
//
val
head =
trxd3ir_d3eclist(env0, head)
val
body =
trxd3ir_d3eclist(env0, body)
//
in//let
//
irdcl(loc0, IRDlocal0(head, body))
//
end//let//end-of-[f0_local0(env0,d3cl)]
//
(* ****** ****** *)
//
fun
f0_staload
( env0:
! trdienv
, d3cl: d3ecl): irdcl =
(
  irdcl_d3ecl(d3cl) ) where
{
//
(*
val () =
println!
("f0_staload: d3ecl = ", d3cl)
*)
} (*where*) // end of [f0_staload(...)]
//
(* ****** ****** *)
//
fun
f0_include
( env0:
! trdienv
, d3cl: d3ecl): irdcl =
let
//
val
loc0 = d3cl.lctn()
val-
D3Cinclude
( knd0
, tknd, gsrc
, fopt, dopt) = d3cl.node()
//
val dopt =
trxd3ir_d3eclistopt(env0, dopt)
//
in//let
irdcl_make_node
(loc0
,IRDinclude(knd0,tknd,gsrc,fopt,dopt))
end(*let*)//end-of-[f0_include(env0,d3cl)]
//
(* ****** ****** *)
//
fun
f0_valdclst
( env0:
! trdienv
, d3cl: d3ecl): irdcl =
let
//
val
loc0 = d3cl.lctn()
val-
D3Cvaldclst
( tknd, d3vs) = d3cl.node()
//
(*
val () =
prerrsln
("f0_valdclst: loc0 = ", loc0)
val () =
prerrsln
("f0_valdclst: d3cl = ", d3cl)
*)
//
in//let
//
if
token_prvalq(tknd)
then
(
  irdcl_none1(d3cl))
else
let
val
d3vs =
trxd3ir_d3valdclist(env0, d3vs)
in//let
irdcl_make_node
( loc0, IRDvaldclst(tknd, d3vs) ) end
//
end(*let*)//end-of-[f0_valdclst(env0,d3cl)]
//
(* ****** ****** *)
//
fun
f0_vardclst
( env0:
! trdienv
, d3cl: d3ecl): irdcl =
let
//
val
loc0 = d3cl.lctn()
val-
D3Cvardclst
( tknd, d3vs) = d3cl.node()
//
(*
val () =
prerrsln
("f0_vardclst: loc0 = ", loc0)
val () =
prerrsln
("f0_vardclst: d3cl = ", d3cl)
*)
//
val
d3vs =
trxd3ir_d3vardclist(env0, d3vs)
//
in//let
//
irdcl_make_node
( loc0, IRDvardclst(tknd, d3vs) )
//
end(*let*)//end-of-[f0_vardclst(env0,d3cl)]
//
(* ****** ****** *)
//
fun
f0_fundclst
( env0:
! trdienv
, d3cl: d3ecl): irdcl =
let
//
val
loc0 = d3cl.lctn()
val-
D3Cfundclst
( tknd
, tqas
, d3cs, d3fs) = d3cl.node()
//
(*
val () =
prerrsln
("f0_fundclst: loc0 = ", loc0)
val () =
prerrsln
("f0_fundclst: d3cl = ", d3cl)
*)
//
val
d3fs =
trxd3ir_d3fundclist(env0, d3fs)
//
in//let
//
irdcl_make_node
( loc0
, IRDfundclst(tknd, tqas, d3cs, d3fs) )
//
end(*let*)//end-of-[f0_fundclst(env0,d3cl)]
//
(* ****** ****** *)
//
fun
f0_implmnt0
( env0:
! trdienv
, d3cl: d3ecl): irdcl =
let
//
val
loc0 = d3cl.lctn((*0*))
//
val-
D3Cimplmnt0
( tknd
, stmp
, sqas, tqas
, dimp//dcst
, tias, f3as
, sres, dexp) = d3cl.node()
//
val
fias =
trxd3ir_f3arglst(env0, f3as)
//
val
dexp = trxd3ir_d3exp(env0, dexp)
//
in//let
//
irdcl
(
loc0,
IRDimplmnt0
( tknd,stmp
, sqas,tqas,dimp,tias,fias,dexp ) )
//
end(*let*)//end-of-[f0_implmnt0(env0,d3cl)]
//
(* ****** ****** *)
//
val () =
(
prerrsln("trxd3ir_d3ecl: d3cl = ", d3cl) )
//
(* ****** ****** *)
//
} (*where*) // end of [trxd3ir_d3ecl(env0,...)]
//
(* ****** ****** *)
(* ****** ****** *)
//
#implfun
trxd3ir_d3valdcl
  (env0, dval) = let
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
trxd3ir_d3pat(env0, dpat)
val tdxp =
trxd3ir_teqd3exp(env0, tdxp)
//
in//let
(
  irvaldcl_make_args(loc0, dpat, tdxp))
end//let
//(*let*)//end-of[trxd3ir_d3valdcl(env0,dval)]
//
(* ****** ****** *)
//
#implfun
trxd3ir_d3vardcl
  (env0, dvar) =
let
//
val loc0 =
d3vardcl_get_lctn(dvar)
//
val dpid =
d3vardcl_get_dpid(dvar)
val vpid =
d3vardcl_get_vpid(dvar)
//
val dini =
d3vardcl_get_dini(dvar)
val dini =
trxd3ir_teqd3exp(env0, dini)
//
in//let
irvardcl_make_args(loc0,dpid,vpid,dini)
end//let
(*let*)//end-of-[trxd3ir_d3vardcl(env0,dvar)]
//
(* ****** ****** *)
//
#implfun
trxd3ir_d3fundcl
  (env0, dfun) = let
//
val loc0 =
d3fundcl_get_lctn(dfun)
//
val dvar =
d3fundcl_get_dpid(dfun)
val f3as =
d3fundcl_get_farg(dfun)
val sres =
d3fundcl_get_sres(dfun)
val tdxp =
d3fundcl_get_tdxp(dfun)
val wsxp =
d3fundcl_get_wsxp(dfun)
//
val fias =
trxd3ir_f3arglst(env0, f3as)
val tdxp =
trxd3ir_teqd3exp(env0, tdxp)
//
in//let
//
irfundcl(loc0,dvar,fias,tdxp)
//
end where
{
//
(*
val () =
prerrsln("trxd3ir_d3fundcl: dfun = ", dfun)
*)
//
}(*where*)//end-of-[trxd3ir_d3fundcl(env0,dfun)]
//
(* ****** ****** *)
(* ****** ****** *)
//
#implfun
trxd3ir_d3eclist
( env0, dcls ) =
(
  list_trxd3ir_fnp(env0, dcls, trxd3ir_d3ecl))
//
(* ****** ****** *)
(* ****** ****** *)
//
#implfun
trxd3ir_d3valdclist
  ( env0 , d3vs ) =
(
  list_trxd3ir_fnp(env0, d3vs, trxd3ir_d3valdcl))
//
#implfun
trxd3ir_d3vardclist
  ( env0 , d3vs ) =
(
  list_trxd3ir_fnp(env0, d3vs, trxd3ir_d3vardcl))
//
(* ****** ****** *)
//
#implfun
trxd3ir_d3fundclist
  ( env0 , d3fs ) =
(
  list_trxd3ir_fnp(env0, d3fs, trxd3ir_d3fundcl))
//
(* ****** ****** *)
(* ****** ****** *)
//
#implfun
trxd3ir_d3eclistopt
  (env0, dopt) =
(
  optn_trxd3ir_fnp(env0, dopt, trxd3ir_d3eclist))
//
(* ****** ****** *)
(* ****** ****** *)

(***********************************************************************)
(* end of [ATS3/XANADU_srcgen2_xinterp_srcgen1_DATS_intrep0_decl00.dats] *)
(***********************************************************************)

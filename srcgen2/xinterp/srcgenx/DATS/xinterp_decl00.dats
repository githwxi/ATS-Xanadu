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
Tue Nov 28 12:36:44 EST 2023
*)
Authoremail: gmhwxiATgmailDOTcom
*)
//
(* ****** ****** *)
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
"./../HATS/libxinterp.hats"
//
(* ****** ****** *)
#include
"./../HATS/xinterp_dats.hats"
(* ****** ****** *)
#staload "./../SATS/intrep0.sats"
(* ****** ****** *)
#staload "./../SATS/xinterp.sats"
(* ****** ****** *)
#staload
_(*DATS*)="./../DATS/xinterp.dats"
(* ****** ****** *)
(* ****** ****** *)
excptcon
XINTERP_IRDCL of irdcl
excptcon
XINTERP_IRVALDCL of irvaldcl
(* ****** ****** *)
(* ****** ****** *)
#symload
node with dimpl_get_node
(* ****** ****** *)
//
#symload
lctn with irdcl_get_lctn
#symload
node with irdcl_get_node
//
(* ****** ****** *)
//
#symload
lctn with irfundcl_get_lctn
#symload
dpid with irfundcl_get_dpid
#symload
farg with irfundcl_get_farg
#symload
tdxp with irfundcl_get_tdxp
//
(* ****** ****** *)
(* ****** ****** *)
//
fun
irexp_lam0
( loc0
: loctn
, tknd
: token
, fias
: fiarglst
, ire1: irexp): irexp =
(
case+ fias of
|
list_nil() => ire1
|
list_cons _ =>
irexp_make_node
( loc0
, IRElam0(tknd, fias, ire1)))
//
(* ****** ****** *)
(* ****** ****** *)
//
#implfun
xinterp_irdcl
  (env0, ird0) =
let
//
(*
val () =
println!
("xinterp_irdcl: ird0 = ", ird0)
*)
//
in//let
//
case+
ird0.node() of
//
|
IRDd3ecl _ => ((*0*))
//
|
IRDlocal0 _ =>
(
  f0_local0(env0, ird0) )
//
|
IRDinclude _ =>
(
  f0_include(env0, ird0) )
//
|
IRDvaldclst _ =>
(
  f0_valdclst(env0, ird0) )
|
IRDvardclst _ =>
(
  f0_vardclst(env0, ird0) )
//
|
IRDfundclst _ =>
(
  f0_fundclst(env0, ird0) )
//
|
IRDimplmnt0 _ =>
(
  f0_implmnt0(env0, ird0) )
//
|
IRDnone1(d3cl) => ( (*void*) )
//
|
_(*otherwise*) =>
(
$raise XINTERP_IRDCL(ird0)) where
{
//
val loc0 = ird0.lctn((*void*))
val (  ) =
prerrln("xinterp_irdcl: loc0 = ", loc0)
val (  ) =
prerrln("xinterp_irdcl: ird0 = ", ird0)
//
}(*where*)
//
end where
// end-of-[let] // xinterp_irdcl(env0,...)
{
//
(* ****** ****** *)
//
fun
f0_local0
( env0:
! xintenv
, ird0: irdcl): void =
let
//
val-
IRDlocal0
( head, body) = ird0.node()
//
val () = xinterp_irdclist(env0, head)
val () = xinterp_irdclist(env0, body)
//
end(*let*)//end-of-[f0_local0(env0,ird0)]
//
(* ****** ****** *)
//
fun
f0_include
( env0:
! xintenv
, ird0: irdcl): void =
let
val-
IRDinclude
( knd0
, tknd, gsrc
, fopt, dopt) = ird0.node()
in
case+ dopt of
|optn_nil
((*void*)) => ( (*void*) )
|optn_cons
(  irds  ) => xinterp_irdclist(env0,irds)
end(*let*)//end-of-[f0_include(env0,ird0)]
//
(* ****** ****** *)
//
fun
f0_valdclst
( env0:
! xintenv
, ird0: irdcl): void =
let
//
val-
IRDvaldclst
(tknd, irvs) = ird0.node()
//
in//let
  xinterp_irvaldclist(env0, irvs)
end(*let*)//end-of-[f0_valdclst(env0,ird0)]
//
(* ****** ****** *)
//
fun
f0_vardclst
( env0:
! xintenv
, ird0: irdcl): void =
let
//
val-
IRDvardclst
(tknd, irvs) = ird0.node()
//
in//let
  xinterp_irvardclist(env0, irvs)
end(*let*)//end-of-[f0_vardclst(env0,ird0)]
//
(* ****** ****** *)
//
fun
f0_fundclst
( env0:
! xintenv
, ird0: irdcl): void =
let
//
(* ****** ****** *)
//
val-
IRDfundclst
( tknd
, tqas
, d2cs, irfs) =
(
  ird0.node((*0*)))
//
(* ****** ****** *)
//
val
fenv =
xintenv_irsnap(env0)
//
(* ****** ****** *)
//
fun
f1_irfundcl
( env0:
! xintenv
, irf0
: irfundcl): irval =
let
//
val loc0 = irf0.lctn()
val dpid = irf0.dpid()
val fias = irf0.farg()
val tdxp = irf0.tdxp()
//
val body =
(
case+ tdxp of
|TEQIREXPnone
( (*void*) ) =>
irexp_none0(loc0)
|TEQIREXPsome
(teq1, body) => body): irexp
//
in//let
//
case+ fias of
|
list_nil() =>
xinterp_irexp(env0,body)
|
list_cons(farg, fias) =>
(
IRVfix0(dpid,farg,body,fenv)
) where
{
val
body =
(
if
list_nilq fias
then body else
irexp_make_node
( loc0
, IRElam0(tknd, fias, body))) }
//
end//let//end-of-[f1_irfundcl(env0,irf0)]
//
(* ****** ****** *)
//
fun
f1_irfundclist
( env0:
! xintenv
, irfs
: irfundclist): irvalist =
(
list_map_e1nv
< x0><y0 ><e1>
(irfs, env0)) where
{
//
#vwtpdef e1 = xintenv
#typedef y0 = (irval)
#typedef x0 = irfundcl
//
#impltmp
map$fopr_e1nv
<x0><y0><e1>(x0, e1) = f1_irfundcl(e1, x0)
}
//
(* ****** ****** *)
//
fun
f1_irfvs_match
( env0:
! xintenv
, irfs
: irfundclist
, irvs: irvalist): void =
(
case+ irfs of
|
list_nil
( (*0*) ) => ( (*void*) )
|
list_cons
(irf1, irfs) =>
let
val-
list_cons
(irv1, irvs) = irvs
val dpid = irf1.dpid((*0*))
in//let
  irvar_match(env0, dpid, irv1)
; f1_irfvs_match(env0, irfs, irvs)
end//let//end-of-[list_cons(irf1, irfs)]
)
//
in//let
//
case+ tqas of
//
|list_nil() =>
let
val irvs =
(
  f1_irfundclist(env0, irfs))
in//let
  f1_irfvs_match(env0,irfs,irvs)
end(*let*)//end-of-[list_nil(...)]
//
|list_cons(tqa1, tqas) => ((*template*))
//
end(*let*)//end-of-[f0_fundclst(env0,ird0)]
//
(* ****** ****** *)
//
fun
f0_implmnt0
( env0:
! xintenv
, ird0: irdcl): void =
let
val
IRDimplmnt0
( tknd
, stmp
, sqas, tqas
, dimp, t2is
, fias, ire1) = ird0.node()
in//let
//
case-
dimp.node() of
|
DIMPLone1
(  d2c1  ) =>
(
case+ fias of
//
|
list_nil
( (*0*) ) =>
let
val irv1 =
(
xinterp_irexp
(env0 , ire1))
in//let
ircst_match
(env0, d2c1, irv1) endlet
//
|
list_cons
(fia1, fias) =>
let
//
val
loc0 =
ird0.lctn((*0*))
val
fenv =
xintenv_irsnap(env0)
val
body =
irexp_lam0
(loc0,tknd,fias,ire1)
val
irv1 =
IRVlam0(fia1, body, fenv)
//
in//let
ircst_match(env0, d2c1, irv1) endlet
//
)(*case+*)//end-of-[DIMPLone1(d2c1)]
//
| _(*non-DIMPLone1*) => ((*skipped*))
//
end(*let*)//end-of-[f0_implmnt0(env0,ird0)]
//
(* ****** ****** *)
//
} where
{
//
val () =
(
  prerrln("xinterp_irdcl: ird0 = ", ird0) )
//
} (*where*)//end of [xinterp_irdcl(env0,ird0)]
//
(* ****** ****** *)
//
#implfun
xinterp_irvaldcl
  (env0, dval) = let
//
val tdxp =
irvaldcl_get_tdxp(dval)
//
in//let
//
case+ tdxp of
|
TEQIREXPnone
( (*void*) ) => ()
|
TEQIREXPsome
(teq0, ire1) =>
let
val dpat =
irvaldcl_get_dpat(dval)
val irv1 =
xinterp_irexp(env0, ire1)
in//let
//
if
irpat_valck
(dpat, irv1)
then
(
irpat_match(env0,dpat,irv1))
else
(
$raise XINTERP_IRVALDCL(dval)) where
{
val loc0 =
irvaldcl_get_lctn(dval)
val (  ) =
prerrln("xinterp_irvaldcl: ERROR!!!")
val (  ) =
prerrln("xinterp_irvaldcl: loc0 = ", loc0)
val (  ) =
prerrln("xinterp_irvaldcl: dpat = ", dpat)
val (  ) =
prerrln("xinterp_irvaldcl: irv1 = ", irv1)
}
//
end(*let*)//end-of-[TEQIREXPsome(teq0,ire1)]
//
end(*let*)//end-of-[xinterp_irvaldcl(env0,dval)]
//
(* ****** ****** *)
(* ****** ****** *)
//
#implfun
xinterp_irdclist
( env0, irds ) =
(
case+ irds of
|
list_nil() => ()
|
list_cons(ird1, irds) =>
(
xinterp_irdcl(env0, ird1);
xinterp_irdclist(env0, irds)))//xinterp_irdclist
//
(* ****** ****** *)
//
#implfun
xinterp_irdclistopt
  ( env0, dopt ) =
(
case+ dopt of
|optn_nil() => ( (*void*) )
|optn_cons(irds) => xinterp_irdclist(env0, irds))
//(*case+*)//end-of-[xinterp_irdclistopt(env0, dopt)
//
(* ****** ****** *)
//
#implfun
xinterp_irvaldclist
( env0, irvs ) =
(
case+ irvs of
|
list_nil() => ()
|
list_cons(irv1, irvs) =>
(
xinterp_irvaldcl(env0, irv1);
xinterp_irvaldclist(env0, irvs)))//xinterp_irvaldclist
//
(* ****** ****** *)
//
#implfun
xinterp_irvardclist
( env0, irvs ) =
(
case+ irvs of
|
list_nil() => ()
|
list_cons(irv1, irvs) =>
(
xinterp_irvardcl(env0, irv1);
xinterp_irvardclist(env0, irvs)))//xinterp_irvardclist
//
(* ****** ****** *)
//
(*
#implfun
xinterp_irfundclist
( env0, irfs ) =
(
case+ irfs of
|
list_nil() => ()
|
list_cons(irf1, irfs) =>
(
xinterp_irfundcl(env0, irf1);
xinterp_irfundclist(env0, irfs)))//xinterp_irvardclist
*)
//
(* ****** ****** *)
(* ****** ****** *)

(* end of [ATS3/XANADU_srcgen2_xinterp_srcgen1_DATS_xintrep_decl00.dats] *)

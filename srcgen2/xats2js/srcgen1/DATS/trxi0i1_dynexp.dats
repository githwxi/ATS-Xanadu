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
(* ****** ****** *)
//
(*
Author: Hongwei Xi
//
Tue 19 Mar 2024 01:11:37 PM EDT
//
Authoremail: gmhwxiATgmailDOTcom
*)
//
(* ****** ****** *)
(* ****** ****** *)
(*
#define
XATSOPT "./../../.."
*)
(* ****** ****** *)
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
(* ****** ****** *)
#include
"./../HATS/mytmplib00.hats"
(* ****** ****** *)
(* ****** ****** *)
#staload // LAB =
"./../../../SATS/xlabel0.sats"
(* ****** ****** *)
(* ****** ****** *)
//
#staload "./../SATS/intrep0.sats"
#staload "./../SATS/intrep1.sats"
#staload "./../SATS/trxi0i1.sats"
//
(* ****** ****** *)
(* ****** ****** *)
//
#staload
_(*DATS*)="./../DATS/trxi0i1.dats"
//
(* ****** ****** *)
(* ****** ****** *)
#symload lctn with i0pat_get_lctn
#symload node with i0pat_get_node
(* ****** ****** *)
#symload lctn with i0exp_get_lctn
#symload node with i0exp_get_node
(* ****** ****** *)
#symload lctn with fiarg_get_lctn
#symload node with fiarg_get_node
(* ****** ****** *)
//
#symload lctn with i0gua_get_lctn
#symload lctn with i0gpt_get_lctn
#symload lctn with i0cls_get_lctn
//
#symload node with i0gua_get_node
#symload node with i0gpt_get_node
#symload node with i0cls_get_node
//
(* ****** ****** *)
#symload lctn with i1val_get_lctn
#symload node with i1val_get_node
(* ****** ****** *)
(* ****** ****** *)
//
fun
i1val_i00
(loc:loc_t
,i00:(sint)): i1val =
(
i1val_make_node(loc,I1Vi00(i00)))
//
fun
i1val_b00
(loc:loc_t
,b00:(bool)): i1val =
(
i1val_make_node(loc,I1Vb00(b00)))
//
fun
i1val_c00
(loc:loc_t
,c00:(char)): i1val =
(
i1val_make_node(loc,I1Vc00(c00)))
//
fun
i1val_f00
(loc:loc_t
,f00:(dflt)): i1val =
(
i1val_make_node(loc,I1Vf00(f00)))
//
fun
i1val_s00
(loc:loc_t
,s00:(strn)): i1val =
(
i1val_make_node(loc,I1Vs00(s00)))
//
(* ****** ****** *)
(* ****** ****** *)
fun
i1val_int
( loc: loc_t
, tok: token): i1val =
(
i1val_make_node(loc,I1Vint(tok)))
(* ****** ****** *)
fun
i1val_btf
( loc: loc_t
, sym: sym_t): i1val =
(
i1val_make_node(loc,I1Vbtf(sym)))
(* ****** ****** *)
fun
i1val_chr
( loc: loc_t
, tok: token): i1val =
(
i1val_make_node(loc,I1Vchr(tok)))
(* ****** ****** *)
fun
i1val_flt
( loc: loc_t
, tok: token): i1val =
(
i1val_make_node(loc,I1Vflt(tok)))
(* ****** ****** *)
fun
i1val_str
( loc: loc_t
, tok: token): i1val =
(
i1val_make_node(loc,I1Vstr(tok)))
(* ****** ****** *)
(* ****** ****** *)
//
fun
i1val_top
( loc: loc_t
, sym: sym_t): i1val =
(
i1val_make_node(loc,I1Vtop(sym)))
//
(* ****** ****** *)
(* ****** ****** *)
//
fun
i1val_tnm
( loc0: loc_t
, itnm: i1tnm): i1val =
(
i1val_make_node(loc0,I1Vtnm(itnm)))
//
(* ****** ****** *)
(* ****** ****** *)
//
fun
i1val_addr
( ival: i1val ): i1val =
let
val loc0 = ival.lctn() in
i1val_make_node(loc0,I1Vaddr(ival))
end//let//end-of-[i1val_addr(iexp)]
//
fun
i1val_aexp
( iexp: i0exp ): i1val =
let
val loc0 = iexp.lctn() in
i1val_make_node(loc0,I1Vaexp(iexp))
end//let//end-of-[i1val_aexp(iexp)]
//
(* ****** ****** *)
(* ****** ****** *)
//
fun
i1val_timp
( env0:
! envi0i1
, loc0: loc_t
, i0f0: i0exp
, timp: t1imp
  (* impltmp *)): i1val =
(
i1val_tnm(loc0, itnm)) where
{
//
val itnm = i1tnm_new0((*0*))
val iins = I1INStimp(i0f0, timp)
val ilet = I1LETnew1(itnm, iins)
//
val (  ) =
(
  envi0i1_insert_ilet(env0, ilet) )
}(*where*)//end-of-[i1val_timp(env0,...)]
//
(* ****** ****** *)
(* ****** ****** *)
//
fun
i1val_dap0
( env0:
! envi0i1
, loc0: loc_t
, i1f0: i1val): i1val =
(
i1val_tnm(loc0, itnm)) where
{
//
val i1vs = list_nil(*void*)
val itnm = i1tnm_new0((*0*))
val iins = I1INSdapp(i1f0, i1vs)
val ilet = I1LETnew1(itnm, iins)
//
val (  ) =
(
  envi0i1_insert_ilet(env0, ilet) )
}(*where*)//end-of-[i1val_dap0(env0,...)]
//
(* ****** ****** *)
//
fun
i1val_dapp
( env0:
! envi0i1
, loc0: loc_t
, i1f0: i1val
, i1vs: i1valist): i1val =
(
i1val_tnm(loc0, itnm)) where
{
//
val itnm = i1tnm_new0((*0*))
val iins = I1INSdapp(i1f0, i1vs)
val ilet = I1LETnew1(itnm, iins)
//
val (  ) =
(
  envi0i1_insert_ilet(env0, ilet) )
}(*where*)//end-of-[i1val_dapp(env0,...)]
//
(* ****** ****** *)
(* ****** ****** *)
//
fun
i1val_pcon
( env0:
! envi0i1
, loc0: loc_t
, dlab: label
, icon:
  i1val(*tuple*)): i1val =
(
i1val_tnm(loc0, itnm)) where
{
//
val itnm = i1tnm_new0((*0*))
//
val iins = I1INSpcon(dlab, icon)
val ilet = I1LETnew1(itnm, iins)
//
val (  ) =
(
  envi0i1_insert_ilet(env0, ilet) )
}(*where*)//end-of-[i1val_pcon(env0,...)]
//
(* ****** ****** *)
//
fun
i1val_pflt
( env0:
! envi0i1
, loc0: loc_t
, dlab: label
, itup:
  i1val(*tuple*)): i1val =
(
i1val_tnm(loc0, itnm)) where
{
//
val itnm = i1tnm_new0((*0*))
//
val iins = I1INSpflt(dlab, itup)
val ilet = I1LETnew1(itnm, iins)
//
val (  ) =
(
  envi0i1_insert_ilet(env0, ilet) )
}(*where*)//end-of-[i1val_pflt(env0,...)]
//
(* ****** ****** *)
//
fun
i1val_proj
( env0:
! envi0i1
, loc0: loc_t
, dlab: label
, itup:
  i1val(*tuple*)): i1val =
(
i1val_tnm(loc0, itnm)) where
{
//
val itnm = i1tnm_new0((*0*))
//
val iins = I1INSproj(dlab, itup)
val ilet = I1LETnew1(itnm, iins)
//
val (  ) =
(
  envi0i1_insert_ilet(env0, ilet) )
}(*where*)//end-of-[i1val_proj(env0,...)]
//
(* ****** ****** *)
(* ****** ****** *)
//
fun
i1val_let0
( env0:
! envi0i1
, loc0: loc_t
, dcls: i1dclist
, icmp:
  i1cmp (*body*)): i1val =
(
i1val_tnm(loc0, itnm)) where
{
//
val
itnm = i1tnm_new0((*void*))
val
iins = I1INSlet0(dcls, icmp)
//
val ilet = I1LETnew1(itnm, iins)
//
val (  ) =
(
  envi0i1_insert_ilet(env0, ilet) )
}(*where*)//end-of-[i1val_let0(env0,...)]
//
(* ****** ****** *)
(* ****** ****** *)
//
fun
i1val_ift0
( env0:
! envi0i1
, loc0: loc_t
, i1v1: i1val
, ithn: i1cmpopt
, iels: i1cmpopt): i1val =
(
i1val_tnm(loc0, itnm)) where
{
//
val
itnm = i1tnm_new0((*void*))
val
iins =
(
  I1INSift0(i1v1, ithn, iels))
val ilet = I1LETnew1(itnm, iins)
//
val (  ) =
(
  envi0i1_insert_ilet(env0, ilet) )
}(*where*)//end-of-[i1val_ift0(env0,...)]
//
(* ****** ****** *)
(* ****** ****** *)
//
fun
i1val_cas0
( env0:
! envi0i1
, loc0: loc_t
, cask: token
, i1v1: i1val
, icls: i1clslst): i1val =
(
i1val_tnm(loc0, itnm)) where
{
//
val
itnm = i1tnm_new0((*void*))
val
iins =
(
  I1INScas0(cask, i1v1, icls))
val ilet = I1LETnew1(itnm, iins)
//
val (  ) =
(
  envi0i1_insert_ilet(env0, ilet) )
}(*where*)//end-of-[i1val_cas0(env0,...)]
//
(* ****** ****** *)
(* ****** ****** *)
//
fun
i1val_tup0
( env0:
! envi0i1
, loc0: loc_t
, i1vs: i1valist): i1val =
(
i1val_tnm(loc0, itnm)) where
{
//
val iins = I1INStup0( i1vs )
val itnm = i1tnm_new0((*void*))
val ilet = I1LETnew1(itnm, iins)
//
val (  ) =
(
  envi0i1_insert_ilet(env0, ilet) )
}(*where*)//end-of-[i1val_tup0(env0,...)]
//
(* ****** ****** *)
//
fun
i1val_tup1
( env0:
! envi0i1
, loc0: loc_t
, tknd: token
, i1vs: i1valist): i1val =
(
i1val_tnm(loc0, itnm)) where
{
//
val iins = I1INStup1(tknd,i1vs)
val itnm = i1tnm_new0((*void*))
val ilet = I1LETnew1(itnm, iins)
//
val (  ) =
(
  envi0i1_insert_ilet(env0, ilet) )
}(*where*)//end-of-[i1val_tup1(env0,...)]
//
(* ****** ****** *)
//
fun
i1val_rcd2
( env0:
! envi0i1
, loc0: loc_t
, tknd: token
, livs: l1i1vlst): i1val =
(
i1val_tnm(loc0, itnm)) where
{
//
val iins = I1INSrcd2(tknd,livs)
val itnm = i1tnm_new0((*void*))
val ilet = I1LETnew1(itnm, iins)
//
val (  ) =
(
  envi0i1_insert_ilet(env0, ilet) )
}(*where*)//end-of-[i1val_rcd2(env0,...)]
//
(* ****** ****** *)
(* ****** ****** *)
//
fun
i1val_lam0
( env0:
! envi0i1
, loc0: loc_t
, tknd: token
, fjas: fjarglst
, icmp: i1cmp
  (*lam0-fbody*)): i1val =
(
i1val_tnm(loc0, itnm)) where
{
//
val itnm = i1tnm_new0((*0*))
val iins =
  I1INSlam0(tknd, fjas, icmp)
//
val ilet = I1LETnew1(itnm, iins)
//
val (  ) =
(
  envi0i1_insert_ilet(env0, ilet) )
}(*where*)//end-of-[i1val_lam0(env0,...)]
//
(* ****** ****** *)
//
fun
i1val_fix0
( env0:
! envi0i1
, loc0: loc_t
, tknd: token
, dvar: d2var
, fjas: fjarglst
, icmp: i1cmp
  (*lam0-fbody*)): i1val =
(
i1val_tnm(loc0, itnm)) where
{
//
val itnm = i1tnm_new0((*0*))
val iins =
(
 I1INSfix0(tknd,dvar,fjas,icmp))
//
val ilet = I1LETnew1(itnm, iins)
//
val (  ) =
(
  envi0i1_insert_ilet(env0, ilet) )
}(*where*)//end-of-[i1val_fix0(env0,...)]
//
(* ****** ****** *)
(* ****** ****** *)
//
fun
i1val_try0
( env0:
! envi0i1
, loc0: loc_t
, tknd: token
, icmp: i1cmp
, iexn: i1val
, icls: i1clslst): i1val =
(
i1val_tnm(loc0, itnm)) where
{
//
val
itnm = i1tnm_new0((*void*))
//
val
iins =
(
 I1INStry0(tknd,icmp,iexn,icls))
//
val ilet = I1LETnew1(itnm, iins)
//
val (  ) =
(
  envi0i1_insert_ilet(env0, ilet) )
}(*where*)//end-of-[i1val_try0(env0,...)]
//
(* ****** ****** *)
(* ****** ****** *)
//
fun
i1val_p0rj
( env0:
! envi0i1
, ival: i1val
, iprj: (sint)): i1val =
let
val loc0 = ival.lctn()
in//let
i1val(loc0, I1Vp0rj(ival, iprj))
end(*let*)//end-of-[i1val_p0rj(env0,...)]
//
(* ****** ****** *)
//
fun
i1val_p1cn
( env0:
! envi0i1
, i0f0: i0pat
, ival: i1val
, ipcn: (sint)): i1val =
let
val loc0 = ival.lctn()
in//let
i1val_make_node
(loc0, I1Vp1cn(i0f0, ival, ipcn))
end(*let*)//end-of-[i1val_p1cn(env0,...)]
//
fun
i1val_p1rj
( env0:
! envi0i1
, tknd: token
, ival: i1val
, iprj: (sint)): i1val =
let
val loc0 = ival.lctn()
in//let
i1val_make_node
(loc0, I1Vp1rj(tknd, ival, iprj))
end(*let*)//end-of-[i1val_p1rj(env0,...)]
//
(* ****** ****** *)
(* ****** ****** *)
//
fun
i1val_flat
( env0:
! envi0i1
, loc0: loc_t
, i1v0: i1val
  (*left-value*)): i1val =
(
i1val_tnm(loc0, itnm)) where
{
//
val itnm = i1tnm_new0((*0*))
val iins =
(
  I1INSflat(i1v0(*left-val*)))
val ilet = I1LETnew1(itnm, iins)
//
val (  ) =
(
  envi0i1_insert_ilet(env0, ilet) )
}(*where*)//end-of-[i1val_flat(env0,...)]
//
(* ****** ****** *)
(* ****** ****** *)
//
fun
i1val_dl0az
( env0:
! envi0i1
, loc0: loc_t
, i1f0: i1val
  (*lazy-thunk*)): i1val =
(
i1val_tnm(loc0, itnm)) where
{
//
val itnm = i1tnm_new0((*0*))
val iins = I1INSdl0az( i1f0 )
val ilet = I1LETnew1(itnm, iins)
//
val (  ) =
(
  envi0i1_insert_ilet(env0, ilet) )
}(*where*)//end-of-[i1val_dl0az(env0,...)]
//
fun
i1val_dl1az
( env0:
! envi0i1
, loc0: loc_t
, i1f0: i1val
  (*lazy-thunk*)): i1val =
(
i1val_tnm(loc0, itnm)) where
{
//
val itnm = i1tnm_new0((*0*))
val iins = I1INSdl1az( i1f0 )
val ilet = I1LETnew1(itnm, iins)
//
val (  ) =
(
  envi0i1_insert_ilet(env0, ilet) )
}(*where*)//end-of-[i1val_dl1az(env0,...)]
//
(* ****** ****** *)
//
fun
i1val_dp2tr
( env0:
! envi0i1
, loc0: loc_t
, i1v0: i1val
  (*left-value*)): i1val =
(
i1val_tnm(loc0, itnm)) where
{
//
val itnm = i1tnm_new0((*0*))
val iins = I1INSdp2tr( i1v0 )
val ilet = I1LETnew1(itnm, iins)
//
val (  ) =
(
  envi0i1_insert_ilet(env0, ilet) )
}(*where*)//end-of-[i1val_dp2tr(env0,...)]
//
(* ****** ****** *)
(* ****** ****** *)
//
fun
i1val_fold
( env0:
! envi0i1
, loc0: loc_t
, i1v0: i1val
  (*left-value*)): i1val =
(
i1val_nil(loc0)) where
{
//
val ilet =
I1LETnew0(I1INSfold(i1v0))
//
val (  ) =
(
  envi0i1_insert_ilet(env0, ilet) )
}(*where*)//end-of-[i1val_fold(env0,...)]
//
(* ****** ****** *)
//
fun
i1val_free
( env0:
! envi0i1
, loc0: loc_t
, i1v0: i1val
  (*left-value*)): i1val =
(
i1val_nil(loc0)) where
{
//
val ilet =
I1LETnew0(I1INSfree(i1v0))
//
val (  ) =
(
  envi0i1_insert_ilet(env0, ilet) )
}(*where*)//end-of-[i1val_free(env0,...)]
//
(* ****** ****** *)
//
fun
i1val_assgn
( env0:
! envi0i1
, loc0: loc_t
, i1vl: i1val
  (*left-i1val*)
, i1vr: i1val
  (*right-i1val*)): i1val =
(
i1val_nil(loc0)) where
{
//
val ilet =
I1LETnew0
(I1INSassgn(i1vl, i1vr))
//
val (  ) =
(
  envi0i1_insert_ilet(env0, ilet) )
}(*where*)//end-of-[i1val_assgn(env0,...)]
//
(* ****** ****** *)
(* ****** ****** *)
//
fun
i1val_raise
( env0:
! envi0i1
, loc0: loc_t
, tknd: token
, i1v0: i1val
  (*except-con*)): i1val =
(
i1val_tnm(loc0, itnm)) where
{
//
val itnm = i1tnm_new0((*0*))
//
val
iins = I1INSraise(tknd, i1v0)
//
val ilet = I1LETnew1(itnm, iins)
//
val (  ) =
(
  envi0i1_insert_ilet(env0, ilet) )
}(*where*)//end-of-[i1val_raise(env0,...)]
//
(* ****** ****** *)
(* ****** ****** *)
//
fun
i1val_l0azy
( env0:
! envi0i1
, loc0: loc_t
, dknd: d1exp
, icmp: i1cmp
  (*l0azy-thunk*)): i1val =
(
i1val_tnm(loc0, itnm)) where
{
//
val itnm = i1tnm_new0((*0*))
//
val
iins = I1INSl0azy(dknd, icmp)
//
val ilet = I1LETnew1(itnm, iins)
//
val (  ) =
(
  envi0i1_insert_ilet(env0, ilet) )
}(*where*)//end-of-[i1val_l0azy(env0,...)]
//
(* ****** ****** *)
//
fun
i1val_l1azy
( env0:
! envi0i1
, loc0: loc_t
, dknd: d1exp
, icmp: i1cmp
  (*l1azy-thunk*)
, i1fs: i1cmplst
  (*l1azy-frees*)): i1val =
(
i1val_tnm(loc0, itnm)) where
{
//
val itnm = i1tnm_new0((*0*))
//
val
iins =
(
 I1INSl1azy(dknd, icmp, i1fs))
//
val ilet = I1LETnew1(itnm, iins)
//
val (  ) =
(
  envi0i1_insert_ilet(env0, ilet) )
}(*where*)//end-of-[i1val_l1azy(env0,...)]
//
(* ****** ****** *)
(* ****** ****** *)

#implfun
trxi0i1_i0pat
( env0, ipat ) =
(
case+
ipat.node() of
//
|I0Pint _ => f0_nil(ipat)
|I0Pbtf _ => f0_nil(ipat)
|I0Pchr _ => f0_nil(ipat)
|I0Pflt _ => f0_nil(ipat)
|I0Pstr _ => f0_nil(ipat)
//
|_(*else*) => f0_main(env0, ipat)
//
) where
{
//
(* ****** ****** *)
(* ****** ****** *)
//
fun
f0_nil(ipat: i0pat) =
let
val
itnm = i1tnm_new0()
in//let
I1BNDcons
(itnm, ipat, list_nil(*void*))
end//let//end-of-[f0_nil(ipat)]
//
(* ****** ****** *)
(* ****** ****** *)
//
fun
f0_main
( env0:
! envi0i1
, ipat: i0pat): i1bnd =
let
//
val loc0 = ipat.lctn()
//
val itnm = i1tnm_new0()
val ival =
i1val(loc0, I1Vtnm(itnm))
//
in
//
I1BNDcons
(itnm, ipat, dvvs) where
{
val dvvs =
trxi0i1_i0bnd(env0, ipat, ival) }
//
end // end-of-[f0_main(env0,ipat)]
//
(* ****** ****** *)
(* ****** ****** *)
//
(*
val () =
prerrsln("trxi0i1_i0pat: ipat = ", ipat)
*)
//
(* ****** ****** *)
(* ****** ****** *)
//
}(*where*)//end-of-[trxi0i1_i0pat(env0,ipat)]

(* ****** ****** *)
(* ****** ****** *)

#implfun
trxi0i1_i0bnd
( env0
, ipat, ival ) =
(
case+
ipat.node() of
//
|I0Pint _ => list_nil()
|I0Pbtf _ => list_nil()
|I0Pchr _ => list_nil()
|I0Pflt _ => list_nil()
|I0Pstr _ => list_nil()
//
|
I0Pvar _ =>
(
f0_var(env0, ipat, ival))
|
I0Pany _ => list_nil((*0*))
//
(* ****** ****** *)
//
|I0Pbang _ =>
(
  f0_bang(env0, ipat, ival))
//
|I0Pflat _ =>
(
  f0_flat(env0, ipat, ival))
//
|I0Pfree _ =>
(
  f0_free(env0, ipat, ival))
//
(* ****** ****** *)
//
|I0Pdap1 _ =>
(
  f0_dap1(env0, ipat, ival))
//
|
I0Pdapp _ =>
(
  f0_dapp(env0, ipat, ival))
//
(* ****** ****** *)
//
|
I0Ptup0 _ =>
(
  f0_tup0(env0, ipat, ival))
|
I0Ptup1 _ =>
(
  f0_tup1(env0, ipat, ival))
//
(* ****** ****** *)
//
|_(*else*) => list_nil( (*void*) )
//
(* ****** ****** *)
//
) where
{
//
(* ****** ****** *)
(* ****** ****** *)
//
fun
f0_var
( env0:
! envi0i1
, ipat: i0pat
, ival: i1val): d2sublst =
(
list_sing(@(dvar, ival))
) where
{
//
val-
I0Pvar(dvar) = ipat.node((*0*))
//
val ((*nil*)) =
envi0i1_insert_dvar(env0, dvar, ival)
}(*where*)//end-of-[f0_var(env0, ...)]
//
(* ****** ****** *)
(* ****** ****** *)
//
fun
f0_bang
( env0:
! envi0i1
, ipat: i0pat
, ival: i1val): d2sublst =
let
//
val-
I0Pbang i0p1 = ipat.node()
//
in//let
//
let
  val ival = f1_addr(ival)
in//let
(
trxi0i1_i0bnd(env0,i0p1,ival))
end//let
//
end where
{
//
fun
f1_addr
(ival: i1val): i1val =
(
case+
ival.node() of
//
|I1Vp1cn
(_, i1v0, idx1) =>
let
//
val lctn = ival.lctn()
val lab1 = LABint(idx1)
//
in//let
(
  i1val_make_node
  (lctn, I1Vlpcn(lab1, i1v0)))
end//let
//
|I1Vp1rj
(_, i1v0, idx1) =>
let
val lctn = ival.lctn()
val lab1 = LABint(idx1)
in//let
(
  i1val_make_node
  (lctn, I1Vlpbx(lab1, i1v0)))
end//let
//
|I1Vp2rj
(_, i1v0, lab1) =>
let
val lctn = ival.lctn()
in//let
(
  i1val_make_node
  (lctn, I1Vlpbx(lab1, i1v0)))
end//let
//
| _(*otherwise: non-proj*) => (ival)
//
) (*case+*) // end of [f1_addr(ival)]
//
}(*where*)//end-of-[f0_bang(env0, ...)]
//
(* ****** ****** *)
//
fun
f0_flat
( env0:
! envi0i1
, ipat: i0pat
, ival: i1val): d2sublst =
let
//
val-
I0Pflat i0p1 = ipat.node()
//
in//let
  trxi0i1_i0bnd(env0,i0p1,ival)
end(*let*)//end-of-[f0_flat(env0, ...)]
//
(* ****** ****** *)
//
fun
f0_free
( env0:
! envi0i1
, ipat: i0pat
, ival: i1val): d2sublst =
let
//
val-
I0Pfree i0p1 = ipat.node()
//
in//let
  trxi0i1_i0bnd(env0,i0p1,ival)
end(*let*)//end-of-[f0_free(env0, ...)]
//
(* ****** ****** *)
(* ****** ****** *)
//
fun
f0_dap1
( env0:
! envi0i1
, ipat: i0pat
, ival: i1val): d2sublst =
(
  list_nil((*void*))) where
{
val-I0Pdap1 i0f0 = ipat.node()}
(*where*)//end-of-[f0_dap1(env0, ...)]
//
(* ****** ****** *)
//
fun
f0_dapp
( env0:
! envi0i1
, ipat: i0pat
, ival: i1val): d2sublst =
let
//
val-
I0Pdapp
(i0f0, i0ps) = ipat.node()
//
fun
f1_i0ps
( env0:
! envi0i1
, ipcn: sint
, i0ps: i0patlst): d2sublst =
(
case+ i0ps of
|
list_nil() =>
list_nil((*void*))
|
list_cons(i0p1, i0ps) =>
let
val i1v1 =
i1val_p1cn
(env0, i0f0, ival, ipcn)
val dvvs =
trxi0i1_i0bnd(env0,i0p1,i1v1)
in//let
(
list_append
( dvvs
, f1_i0ps(env0, ipcn+1, i0ps)))
end//let
)(*case+*)//end-of-[f0_i0ps(...)]
//
in//let
(
  f1_i0ps(env0, 0(*ipcn*), i0ps) )
end(*let*)//end-of-[f0_dapp(env0, ...)]
//
(* ****** ****** *)
(* ****** ****** *)
//
fun
f0_tup0
( env0:
! envi0i1
, ipat: i0pat
, ival: i1val): d2sublst =
let
//
val-
I0Ptup0 i0ps = ipat.node()
//
fun
f1_i0ps
( env0:
! envi0i1
, iprj: sint
, i0ps: i0patlst): d2sublst =
(
case+ i0ps of
|
list_nil() =>
list_nil((*void*))
|
list_cons(i0p1, i0ps) =>
let
val i1v1 =
i1val_p0rj
(env0, ival, iprj)
val dvvs =
trxi0i1_i0bnd(env0,i0p1,i1v1)
in//let
(
list_append
( dvvs
, f1_i0ps(env0, iprj+1, i0ps)))
end//let
)(*case+*)//end-of-[f0_i0ps(...)]
//
in//let
(
  f1_i0ps(env0, 0(*iprj*), i0ps) )
end(*let*)//end-of-[f0_tup0(env0, ...)]
//
(* ****** ****** *)
//
fun
f0_tup1
( env0:
! envi0i1
, ipat: i0pat
, ival: i1val): d2sublst =
let
//
val-
I0Ptup1
(tknd, i0ps) = ipat.node()
//
fun
f1_i0ps
( env0:
! envi0i1
, iprj: sint
, i0ps: i0patlst): d2sublst =
(
case+ i0ps of
|
list_nil() =>
list_nil((*void*))
|
list_cons(i0p1, i0ps) =>
let
val i1v1 =
i1val_p1rj
(env0, tknd, ival, iprj)
val dvvs =
trxi0i1_i0bnd(env0,i0p1,i1v1)
in//let
(
list_append
( dvvs
, f1_i0ps(env0, iprj+1, i0ps)))
end//let
)(*case+*)//end-of-[f0_i0ps(...)]
//
in//let
(
  f1_i0ps(env0, 0(*iprj*), i0ps) )
end(*let*)//end-of-[f0_tup1(env0, ...)]
//
(* ****** ****** *)
(* ****** ****** *)
//
(*
val () =
prerrsln("trxi0i1_i0bnd: ipat = ", ipat)
val () =
prerrsln("trxi0i1_i0bnd: ival = ", ival)
*)
//
(* ****** ****** *)
(* ****** ****** *)
//
}(*where*)//end-of-[trxi0i1_i0bnd(env0,ipat)]

(* ****** ****** *)
(* ****** ****** *)

#implfun
trxi0i1_i0exp
( env0, iexp ) =
(
case+
iexp.node() of
//
(* ****** ****** *)
//
|I0Eint _ => f0_int(env0, iexp)
|I0Ebtf _ => f0_btf(env0, iexp)
|I0Echr _ => f0_chr(env0, iexp)
|I0Eflt _ => f0_flt(env0, iexp)
|I0Estr _ => f0_str(env0, iexp)
//
(* ****** ****** *)
//
|I0Ei00 _ => f0_i00(env0, iexp)
|I0Eb00 _ => f0_b00(env0, iexp)
|I0Ec00 _ => f0_c00(env0, iexp)
|I0Ef00 _ => f0_f00(env0, iexp)
|I0Es00 _ => f0_s00(env0, iexp)
//
(* ****** ****** *)
|I0Etop _ => f0_top(env0, iexp)
(* ****** ****** *)
//
|I0Econ _ => f0_con(env0, iexp)
|I0Ecst _ => f0_cst(env0, iexp)
|I0Evar _ => f0_var(env0, iexp)
//
(* ****** ****** *)
//
|I0Etimp _ => f0_timp(env0, iexp)
//
|I0Etapp _ => f0_tapp(env0, iexp)
|I0Etapq _ => f0_tapq(env0, iexp)
//
(* ****** ****** *)
//
|I0Edap0 _ => f0_dap0(env0, iexp)
|I0Edapp _ => f0_dapp(env0, iexp)
//
(* ****** ****** *)
//
|I0Epcon _ => f0_pcon(env0, iexp)
|I0Epflt _ => f0_pflt(env0, iexp)
|I0Eproj _ => f0_proj(env0, iexp)
//
(* ****** ****** *)
//
|I0Elet0 _ => f0_let0(env0, iexp)
//
(* ****** ****** *)
//
|I0Eift0 _ => f0_ift0(env0, iexp)
|I0Ecas0 _ => f0_cas0(env0, iexp)
//
(* ****** ****** *)
//
|I0Eseqn _ => f0_seqn(env0, iexp)
//
(* ****** ****** *)
//
|I0Etup0 _ => f0_tup0(env0, iexp)
|I0Etup1 _ => f0_tup1(env0, iexp)
|I0Ercd2 _ => f0_rcd2(env0, iexp)
//
(* ****** ****** *)
//
|I0Elam0 _ => f0_lam0(env0, iexp)
|I0Efix0 _ => f0_fix0(env0, iexp)
//
(* ****** ****** *)
//
|I0Etry0 _ => f0_try0(env0, iexp)
//
(* ****** ****** *)
//
|I0Eaddr _ => f0_addr(env0, iexp)
//
|I0Eflat _ => f0_flat(env0, iexp)
//
(* ****** ****** *)
//
|I0Efold _ => f0_fold(env0, iexp)
//
|I0Efree _ => f0_free(env0, iexp)
//
(* ****** ****** *)
//
|I0Edl0az _ => f0_dl0az(env0, iexp)
|I0Edl1az _ => f0_dl1az(env0, iexp)
//
|I0Edp2tr _ => f0_dp2tr(env0, iexp)
//
(* ****** ****** *)
//
|I0Ewhere _ => f0_where(env0, iexp)
//
(* ****** ****** *)
//
|I0Eassgn _ => f0_assgn(env0, iexp)
//
(* ****** ****** *)
//
|I0Eraise _ => f0_raise(env0, iexp)
//
(* ****** ****** *)
//
|I0El0azy _ => f0_l0azy(env0, iexp)
|I0El1azy _ => f0_l1azy(env0, iexp)
//
(* ****** ****** *)
//
|I0Enone0 _ => f0_none0(env0, iexp)
//
(* ****** ****** *)
//
|
I0Eextnam _ => f0_extnam(env0, iexp)
//
(* ****** ****** *)
(* ****** ****** *)
| _(*otherwise*) => i1val_none1(iexp)
(* ****** ****** *)
(* ****** ****** *)
//
) where
{
//
(* ****** ****** *)
(* ****** ****** *)
//
fun
f0_int
( env0:
! envi0i1
, iexp: i0exp): i1val =
(
  i1val_int(loc, tok) ) where
{
  val loc = iexp.lctn()
  val-I0Eint(tok) = iexp.node() }
//
(* ****** ****** *)
//
fun
f0_btf
( env0:
! envi0i1
, iexp: i0exp): i1val =
(
  i1val_btf(loc, sym) ) where
{
  val loc = iexp.lctn()
  val-I0Ebtf(sym) = iexp.node() }
//
(* ****** ****** *)
//
fun
f0_chr
( env0:
! envi0i1
, iexp: i0exp): i1val =
(
  i1val_chr(loc, tok) ) where
{
  val loc = iexp.lctn()
  val-I0Echr(tok) = iexp.node() }
//
(* ****** ****** *)
//
fun
f0_flt
( env0:
! envi0i1
, iexp: i0exp): i1val =
(
  i1val_flt(loc, tok) ) where
{
  val loc = iexp.lctn()
  val-I0Eflt(tok) = iexp.node() }
//
(* ****** ****** *)
//
fun
f0_str
( env0:
! envi0i1
, iexp: i0exp): i1val =
(
  i1val_str(loc, tok) ) where
{
  val loc = iexp.lctn()
  val-I0Estr(tok) = iexp.node() }
//
(* ****** ****** *)
(* ****** ****** *)
//
fun
f0_i00
( env0:
! envi0i1
, iexp: i0exp): i1val =
(
  i1val_i00(loc, i00) ) where
{
  val loc = iexp.lctn()
  val-I0Ei00(i00) = iexp.node() }
//
(* ****** ****** *)
//
fun
f0_b00
( env0:
! envi0i1
, iexp: i0exp): i1val =
(
  i1val_b00(loc, b00) ) where
{
  val loc = iexp.lctn()
  val-I0Eb00(b00) = iexp.node() }
//
(* ****** ****** *)
//
fun
f0_c00
( env0:
! envi0i1
, iexp: i0exp): i1val =
(
  i1val_c00(loc, c00) ) where
{
  val loc = iexp.lctn()
  val-I0Ec00(c00) = iexp.node() }
//
(* ****** ****** *)
//
fun
f0_f00
( env0:
! envi0i1
, iexp: i0exp): i1val =
(
  i1val_f00(loc, f00) ) where
{
  val loc = iexp.lctn()
  val-I0Ef00(f00) = iexp.node() }
//
(* ****** ****** *)
//
fun
f0_s00
( env0:
! envi0i1
, iexp: i0exp): i1val =
(
  i1val_s00(loc, s00) ) where
{
  val loc = iexp.lctn()
  val-I0Es00(s00) = iexp.node() }
//
(* ****** ****** *)
(* ****** ****** *)
//
fun
f0_top
( env0:
! envi0i1
, iexp: i0exp): i1val =
(
  i1val_top(loc, sym) ) where
{
  val loc = iexp.lctn()
  val-I0Etop(sym) = iexp.node() }
//
(* ****** ****** *)
(* ****** ****** *)
//
fun
f0_con
( env0:
! envi0i1
, iexp: i0exp): i1val =
let
//
val loc0 = iexp.lctn()
//
val-
I0Econ(d2c1) = iexp.node()
//
in//let
(
  i1val(loc0, I1Vcon(d2c1)))
end where
{
//
(*
val () =
(
prerr("trxi0i1_i0exp:");
prerrsln("f0_con(01): iexp = ", iexp))
*)
//
}(*where*)//end-of-[f0_con(env0,iexp)]
//
(* ****** ****** *)
//
fun
f0_cst
( env0:
! envi0i1
, iexp: i0exp): i1val =
let
//
val loc0 = iexp.lctn()
//
val-
I0Ecst(d2c1) = iexp.node()
//
in//let
(
  i1val(loc0, I1Vcst(d2c1)))
end where
{
//
(*
val () =
(
prerr("trxi0i1_i0exp:");
prerrsln("f0_cst(01): iexp = ", iexp))
*)
//
}(*where*)//end-of-[f0_cst(env0,iexp)]
//
(* ****** ****** *)
//
fun
f0_var
( env0:
! envi0i1
, iexp: i0exp): i1val =
let
//
val loc0 = iexp.lctn()
//
val-
I0Evar(d2v1) = iexp.node()
//
in//let
envi0i1_search_dvar(env0, d2v1)
end where
{
//
(*
val () =
(
prerr("trxi0i1_i0exp:");
prerrsln("f0_var(01): iexp = ", iexp))
*)
//
}(*where*)//end-of-[f0_var(env0,iexp)]
//
(* ****** ****** *)
(* ****** ****** *)
//
fun
f0_timp
( env0:
! envi0i1
, iexp: i0exp): i1val =
let
//
val loc0 = iexp.lctn()
//
val-
I0Etimp
(i0e1, timp) = iexp.node()
//
val
timp =
(
  trxi0i1_t0imp(env0, timp))
//
in//let
(
i1val_timp(env0,loc0,i0e1,timp))
end where
{
//
(*
val () =
(
prerr("trxi0i1_i0exp:");
prerrsln("f0_timp(01): iexp = ", iexp))
*)
//
}(*where*)//end-of-[f0_timp(env0,iexp)]
//
(* ****** ****** *)
(* ****** ****** *)
//
fun
f0_tapp
( env0:
! envi0i1
, iexp: i0exp): i1val =
let
//
val loc0 = iexp.lctn()
//
val-
I0Etapp(i0f0) = iexp.node()
in//let
(
  trxi0i1_i0exp(env0, i0f0)) end//let
//
fun
f0_tapq
( env0:
! envi0i1
, iexp: i0exp): i1val =
let
//
val loc0 = iexp.lctn()
//
val-
I0Etapq
(i0f0, tjas) = iexp.node()
in//let
(
  trxi0i1_i0exp(env0, i0f0)) end//let
//
(* ****** ****** *)
(* ****** ****** *)
//
fun
f0_dap0
( env0:
! envi0i1
, iexp: i0exp): i1val =
let
//
val loc0 = iexp.lctn()
//
val-
I0Edap0(i0f0) = iexp.node()
//
val i1f0 =
(
  trxi0i1_i0exp(env0, i0f0))
//
in//let
(
i1val_dap0(env0, loc0, i1f0))
end where
{
//
(*
val () =
(
prerr("trxi0i1_i0exp:");
prerrsln("f0_dap0(01): iexp = ", iexp))
*)
//
}(*where*)//end-of-[f0_dap0(env0,iexp)]
//
(* ****** ****** *)
//
fun
f0_dapp
( env0:
! envi0i1
, iexp: i0exp): i1val =
let
//
val loc0 = iexp.lctn()
//
val-
I0Edapp
(i0f0, i0es) = iexp.node()
//
val i1f0 =
trxi0i1_i0exp(env0, i0f0)
val i1vs =
trxi0i1_i0explst(env0, i0es)
//
in//let
(
i1val_dapp(env0,loc0,i1f0,i1vs))
end where
{
//
(*
val () =
(
prerr("trxi0i1_i0exp:");
prerrsln("f0_dapp(01): iexp = ", iexp))
*)
//
}(*where*)//end-of-[f0_dapp(env0,iexp)]
//
(* ****** ****** *)
(* ****** ****** *)
//
fun
f0_pcon
( env0:
! envi0i1
, iexp: i0exp): i1val =
let
//
val loc0 = iexp.lctn()
//
val-
I0Epcon
(dlab, icon) = iexp.node()
//
val icon =
(
  trxi0i1_i0exp(env0, icon))
//
in//let
i1val_pcon(env0, loc0, dlab, icon)
end where
{
//
(*
val () =
(
prerr("trxi0i1_i0exp:");
prerrsln("f0_pcon(01): iexp = ", iexp))
*)
//
}(*where*)//end-of-[f0_pcon(env0,iexp)]
//
(* ****** ****** *)
//
fun
f0_pflt
( env0:
! envi0i1
, iexp: i0exp): i1val =
let
//
val loc0 = iexp.lctn()
//
val-
I0Epflt
(dlab, itup) = iexp.node()
//
val itup =
(
  trxi0i1_i0exp(env0, itup))
//
in//let
i1val_pflt(env0, loc0, dlab, itup)
end where
{
//
(*
val () =
(
prerr("trxi0i1_i0exp:");
prerrsln("f0_pflt(01): iexp = ", iexp))
*)
//
}(*where*)//end-of-[f0_pflt(env0,iexp)]
//
(* ****** ****** *)
//
fun
f0_proj
( env0:
! envi0i1
, iexp: i0exp): i1val =
let
//
val loc0 = iexp.lctn()
//
val-
I0Eproj
(dlab, itup) = iexp.node()
//
val itup =
(
  trxi0i1_i0exp(env0, itup))
//
in//let
i1val_proj(env0, loc0, dlab, itup)
end where
{
//
(*
val () =
(
prerr("trxi0i1_i0exp:");
prerrsln("f0_proj(01): iexp = ", iexp))
*)
//
}(*where*)//end-of-[f0_proj(env0,iexp)]
//
(* ****** ****** *)
(* ****** ****** *)
//
fun
f0_let0
( env0:
! envi0i1
, iexp: i0exp): i1val =
let
//
val loc0 = iexp.lctn()
//
val-
I0Elet0
(
dcls, body) = iexp.node()
//
val (  ) =
envi0i1_pshlet0(env0)
//
val dcls =
trxi0i1_i0dclist(env0, dcls)
//
val
iret =
trxi0i1_i0exp(env0, body)
val
ilts = envi0i1_poplet0( env0 )
//
val icmp = I1CMPcons(ilts, iret)
//
in//let
(
  i1val_let0(env0,loc0,dcls,icmp))
end(*let*)//end-of-[f0_let0(env0,iexp)]
//
(* ****** ****** *)
//
fun
f0_ift0
( env0:
! envi0i1
, iexp: i0exp): i1val =
let
//
val loc0 = iexp.lctn()
//
val-
I0Eift0
(
i0e1,
ithn, iels) = iexp.node()
//
val i1v1 =
trxi0i1_i0exp(env0, i0e1)
//
val ithn =
(
case+ ithn of
|
optn_nil() => optn_nil()
|
optn_cons(i0e2) =>
optn_cons
(trxi0i1_i0blk(env0, i0e2)))
//
val iels =
(
case+ iels of
|
optn_nil() => optn_nil()
|
optn_cons(i0e2) =>
optn_cons
(trxi0i1_i0blk(env0, i0e2)))
//
in//let
(
  i1val_ift0
  (env0, loc0, i1v1, ithn, iels))
end where
{
//
(*
val () =
(
prerr("trxi0i1_i0exp:");
prerrsln("f0_ift0(01): iexp = ", iexp))
*)
//
}(*where*)//end-of-[f0_ift0(env0,iexp)]
//
(* ****** ****** *)
(* ****** ****** *)
//
fun
f0_cas0
( env0:
! envi0i1
, iexp: i0exp): i1val =
let
//
val loc0 = iexp.lctn()
//
val-
I0Ecas0
(
cask,
i0e1, icls) = iexp.node()
//
val i1v1 =
trxi0i1_i0exp(env0, i0e1)
//
val icls =
trxi0i1_i0clslst(env0, icls)
//
in//let
(
  i1val_cas0
  (env0, loc0, cask, i1v1, icls))
end where
{
//
(*
val () =
(
prerr("trxi0i1_i0exp:");
prerrsln("f0_cas0(01): iexp = ", iexp))
*)
//
}(*where*)//end-of-[f0_cas0(env0,iexp)]
//
(* ****** ****** *)
(* ****** ****** *)
//
fun
f0_seqn
( env0:
! envi0i1
, iexp: i0exp): i1val =
let
//
val loc0 = iexp.lctn()
//
val-
I0Eseqn
(i0es, i0e1) = iexp.node()
//
val () =
(
  feach(env0, i0es)) where
{
//
fun
feach
( env0:
! envi0i1
, i0es: i0explst): void =
(
case+ i0es of
|
list_nil
( (*0*) ) => ((*0*))
|
list_cons
(i0e1, i0es) =>
(
  feach(env0, i0es)) where
{
  val _(*i1v1*) =
  trxi0i1_i0exp(env0, i0e1) }
)
//
}(*where*)//end-[val()=feach...]
//
in//let
(
  trxi0i1_i0exp(env0, i0e1) )
end where
{
//
(*
val () =
(
prerr("trxi0i1_i0exp:");
prerrsln("f0_seqn(01): iexp = ", iexp))
*)
//
}(*where*)//end-of-[f0_seqn(env0,iexp)]
//
(* ****** ****** *)
(* ****** ****** *)
//
fun
f0_tup0
( env0:
! envi0i1
, iexp: i0exp): i1val =
let
//
val loc0 = iexp.lctn()
//
val-
I0Etup0(i0es) = iexp.node()
val i1vs =
trxi0i1_i0explst(env0, i0es)
//
in
(
  i1val_tup0(env0, loc0, i1vs) )
end where
{
//
(*
val () =
(
prerr("trxi0i1_i0exp:");
prerrsln("f0_tup0(01): iexp = ", iexp))
*)
//
}(*where*)//end-of-[f0_tup0(env0,iexp)]
//
(* ****** ****** *)
//
fun
f0_tup1
( env0:
! envi0i1
, iexp: i0exp): i1val =
let
//
val loc0 = iexp.lctn()
//
val-
I0Etup1
(tknd, i0es) = iexp.node()
val i1vs =
trxi0i1_i0explst(env0, i0es)
//
in
(
i1val_tup1(env0, loc0, tknd, i1vs))
end where
{
//
(*
val () =
(
prerr("trxi0i1_i0exp:");
prerrsln("f0_tup1(01): iexp = ", iexp))
*)
//
}(*where*)//end-of-[f0_tup1(env0,iexp)]
//
(* ****** ****** *)
//
fun
f0_rcd2
( env0:
! envi0i1
, iexp: i0exp): i1val =
let
//
val loc0 = iexp.lctn()
//
val-
I0Ercd2
(tknd, lies) = iexp.node()
val livs =
trxi0i1_l0i0elst(env0, lies)
//
in
(
i1val_rcd2(env0, loc0, tknd, livs))
end where
{
//
(*
val () =
(
prerr("trxi0i1_i0exp:");
prerrsln("f0_rcd2(01): iexp = ", iexp))
*)
//
}(*where*)//end-of-[f0_rcd2(env0,iexp)]
//
(* ****** ****** *)
(* ****** ****** *)
//
fun
f0_lam0
( env0:
! envi0i1
, iexp: i0exp): i1val =
let
//
val loc0 = iexp.lctn()
//
val-
I0Elam0
(tknd
,fias,body) = iexp.node()
//
val (  ) =
envi0i1_pshlam0(env0)
//
val fjas =
trxi0i1_fiarglst(env0,fias)
//
val iret =
(
  trxi0i1_i0exp(env0, body))
//
val
ilts = envi0i1_poplam0( env0 )
//
val icmp = I1CMPcons(ilts, iret)
//
in//let
(
  i1val_lam0
  (env0, loc0, tknd, fjas, icmp))
end(*let*)//end-of-[f0_lam0(env0,iexp)]
//
(* ****** ****** *)
//
fun
f0_fix0
( env0:
! envi0i1
, iexp: i0exp): i1val =
let
//
val loc0 = iexp.lctn()
//
val-
I0Efix0
(tknd
,dvar
,fias,body) = iexp.node()
//
val (  ) =
envi0i1_pshlam0(env0)
//
val (  ) =
(
envi0i1_d2vins_self
( env0, dvar(*recursive*)))
//
val fjas =
trxi0i1_fiarglst(env0,fias)
val iret =
(
  trxi0i1_i0exp(env0, body))
//
val
ilts = envi0i1_poplam0( env0 )
//
val icmp = I1CMPcons(ilts, iret)
//
in//let
(
  i1val_fix0
  (env0,loc0,tknd,dvar,fjas,icmp))
end(*let*)//end-of-[f0_fix0(env0,iexp)]
//
(* ****** ****** *)
(* ****** ****** *)
//
fun
f0_try0
( env0:
! envi0i1
, iexp: i0exp): i1val =
let
//
val loc0 = iexp.lctn()
//
val-
I0Etry0
(tknd
,i0e1,icls) = iexp.node()
//
val icmp =
(
 trxi0i1_i0blk(env0, i0e1))
//
val iexn =
i1val_tnm(loc0, i1tnm_new0())
//
val icls =
(
 trxi0i1_i0clslst(env0, icls))
//
in//let
(
  i1val_try0
  (env0,loc0,tknd,icmp,iexn,icls))
end(*let*)//end-of-[f0_try0(env0,iexp)]
//
(* ****** ****** *)
(* ****** ****** *)
//
fun
f0_addr
( env0:
! envi0i1
, iexp: i0exp): i1val =
let
//
val loc0 = iexp.lctn()
//
val-
I0Eaddr(i0e1) = iexp.node()
//
in
//
(
  trxi0i1_i0lft(env0, i0e1))
//
end where
{
//
(*
val () =
(
prerr("trxi0i1_i0exp:");
prerrsln("f0_addr(01): iexp = ", iexp))
*)
//
}(*where*)//end-of-[f0_addr(env0,iexp)]
//
(* ****** ****** *)
//
fun
f0_flat
( env0:
! envi0i1
, iexp: i0exp): i1val =
let
//
val loc0 = iexp.lctn()
//
val-
I0Eflat(i0e1) = iexp.node()
//
val i1v1 =
(
  trxi0i1_i0exp(env0, i0e1))
//
in//let
(
  i1val_flat(env0, loc0, i1v1))
end where
{
//
(*
val () =
(
prerr("trxi0i1_i0exp:");
prerrsln("f0_flat(01): iexp = ", iexp))
*)
//
}(*where*)//end-of-[f0_flat(env0,iexp)]
//
(* ****** ****** *)
(* ****** ****** *)
//
fun
f0_fold
( env0:
! envi0i1
, iexp: i0exp): i1val =
let
//
val loc0 = iexp.lctn()
//
val-
I0Efold(i0e1) = iexp.node()
//
val i1v1 =
(
  trxi0i1_i0exp(env0, i0e1))
//
in//let
(
  i1val_fold(env0, loc0, i1v1))
end where
{
//
(*
val () =
(
prerr("trxi0i1_i0exp:");
prerrsln("f0_fold(01): iexp = ", iexp))
*)
//
}(*where*)//end-of-[f0_fold(env0,iexp)]
//
(* ****** ****** *)
//
fun
f0_free
( env0:
! envi0i1
, iexp: i0exp): i1val =
let
//
val loc0 = iexp.lctn()
//
val-
I0Efree(i0e1) = iexp.node()
//
val i1v1 =
(
  trxi0i1_i0exp(env0, i0e1))
//
in//let
(
  i1val_free(env0, loc0, i1v1))
end where
{
//
(*
val () =
(
prerr("trxi0i1_i0exp:");
prerrsln("f0_free(01): iexp = ", iexp))
*)
//
}(*where*)//end-of-[f0_free(env0,iexp)]
//
(* ****** ****** *)
(* ****** ****** *)
//
fun
f0_dl0az
( env0:
! envi0i1
, iexp: i0exp): i1val =
let
//
val loc0 = iexp.lctn()
//
val-
I0Edl0az i0f0 = iexp.node()
//
val i1f0 =
(
  trxi0i1_i0exp(env0, i0f0))
//
in//let
(
i1val_dl0az( env0, loc0, i1f0 ))
end where
{
//
(*
val () =
(
prerr("trxi0i1_i0exp:");
prerrsln("f0_dl0az(01): iexp = ", iexp))
*)
//
}(*where*)//end-of-[f0_dl0az(env0,iexp)]
//
(* ****** ****** *)
//
fun
f0_dl1az
( env0:
! envi0i1
, iexp: i0exp): i1val =
let
//
val loc0 = iexp.lctn()
//
val-
I0Edl1az i0f0 = iexp.node()
//
val i1f0 =
(
  trxi0i1_i0exp(env0, i0f0))
//
in//let
(
i1val_dl1az( env0, loc0, i1f0 ))
end where
{
//
(*
val () =
(
prerr("trxi0i1_i0exp:");
prerrsln("f0_dl1az(01): iexp = ", iexp))
*)
//
}(*where*)//end-of-[f0_dl1az(env0,iexp)]
//
(* ****** ****** *)
//
fun
f0_dp2tr
( env0:
! envi0i1
, iexp: i0exp): i1val =
let
//
val loc0 = iexp.lctn()
//
val-
I0Edp2tr i0e1 = iexp.node()
//
val i1e1 =
(
  trxi0i1_i0exp(env0, i0e1))
//
in//let
(
i1val_dp2tr( env0, loc0, i1e1 ))
end where
{
//
(*
val () =
(
prerr("trxi0i1_i0exp:");
prerrsln("f0_dp2tr(01): iexp = ", iexp))
*)
//
}(*where*)//end-of-[f0_dp2tr(env0,iexp)]
//
(* ****** ****** *)
(* ****** ****** *)
//
fun
f0_where
( env0:
! envi0i1
, iexp: i0exp): i1val =
let
//
val loc0 = iexp.lctn()
//
val-
I0Ewhere
( body, dcls) = iexp.node()
//
val (  ) =
envi0i1_pshlet0(env0)
//
val dcls =
trxi0i1_i0dclist(env0, dcls)
//
val
iret =
trxi0i1_i0exp(env0, body)
val
ilts = envi0i1_poplet0( env0 )
//
val icmp = I1CMPcons(ilts, iret)
//
in//let
(
  i1val_let0(env0,loc0,dcls,icmp))
end(*let*)//end-of-[f0_where(env0,iexp)]
//
(* ****** ****** *)
(* ****** ****** *)
//
fun
f0_assgn
( env0:
! envi0i1
, iexp: i0exp): i1val =
let
//
val loc0 = iexp.lctn()
//
val-
I0Eassgn
( i0el, i0er) = iexp.node()
//
val i1vl =
(
  trxi0i1_i0lft(env0, i0el))
val i1vr =
(
  trxi0i1_i0exp(env0, i0er))
//
in//let
(
i1val_assgn(env0,loc0,i1vl,i1vr))
end where
{
//
(*
val () =
(
prerr("trxi0i1_i0exp:");
prerrsln("f0_assgn(01): iexp = ", iexp))
*)
//
}(*where*)//end-of-[f0_assgn(env0,iexp)]
//
(* ****** ****** *)
//
fun
f0_raise
( env0:
! envi0i1
, iexp: i0exp): i1val =
let
//
val loc0 = iexp.lctn()
//
val-
I0Eraise
( tknd, i0e1) = iexp.node() 
//
val i1v1 =
(
  trxi0i1_i0exp(env0, i0e1))
//
in//let
(
i1val_raise(env0,loc0,tknd,i1v1))
//
end where // end-of-[let]
{
//
(*
val () =
(
prerr("trxi0i1_i0exp:");
prerrsln("f0_raise(01): iexp = ", iexp))
*)
//
}(*where*)//end-of-[f0_raise(env0,iexp)]
//
(* ****** ****** *)
(* ****** ****** *)
//
fun
f0_l0azy
( env0:
! envi0i1
, iexp: i0exp): i1val =
let
//
val loc0 = iexp.lctn()
//
val-
I0El0azy
( dknd, body) = iexp.node()
//
val (  ) =
envi0i1_pshlam0(env0)
//
val iret =
trxi0i1_i0exp(env0, body)
//
val
ilts = envi0i1_poplam0( env0 )
//
val icmp = I1CMPcons(ilts, iret)
//
in//let
(
i1val_l0azy(env0,loc0,dknd,icmp))
end where
{
//
(*
val () =
(
prerr("trxi0i1_i0exp:");
prerrsln("f0_l0azy(01): iexp = ", iexp))
*)
//
}(*where*)//end-of-[f0_l0azy(env0,iexp)]
//
(* ****** ****** *)
//
fun
f0_l1azy
( env0:
! envi0i1
, iexp: i0exp): i1val =
let
//
val loc0 = iexp.lctn()
//
val-
I0El1azy
( dknd
, body, i0fs) = iexp.node()
//
val (  ) =
envi0i1_pshlam0(env0)
//
val iret =
trxi0i1_i0exp(env0, body)
val i1fs =
trxi0i1_i0blklst(env0, i0fs)
//
val
ilts = envi0i1_poplam0( env0 )
//
val icmp = I1CMPcons(ilts, iret)
//
in//let
(
  i1val_l1azy
  (env0, loc0, dknd, icmp, i1fs) )
end where
{
//
(*
val () =
(
prerr("trxi0i1_i0exp:");
prerrsln("f0_l1azy(01): iexp = ", iexp))
*)
//
}(*where*)//end-of-[f0_l1azy(env0,iexp)]
//
(* ****** ****** *)
//
fun
f0_none0
( env0:
! envi0i1, iexp: i0exp): i1val =
(
  i1val_nil(loc0)) where
{
  val loc0 = iexp.lctn((*0*))
  val-I0Enone0() = iexp.node() }
(*where*)//end-of-[f0_none0(env0,iexp)]
//
(* ****** ****** *)
//
(*
fun
f0_none1
( env0:
! envi0i1, iexp: i0exp): i1val =
(
  i1val_none1(iexp)) where
{
  val-I0Enone1(d3e1) = iexp.node() }
end(*let*)//end-of-[f0_none1(env0,iexp)]
*)
//
(* ****** ****** *)
(* ****** ****** *)
//
fun
f0_extnam
( env0:
! envi0i1, iexp: i0exp): i1val =
let
//
val loc0 = iexp.lctn()
//
val-
I0Eextnam
(tknd, gnam) = iexp.node()
//
val i1nm =
envi0i1_search_exnm(env0, loc0)
//
in//let
(
i1val_make_node
(loc0, I1Vextnam(tknd, i1nm, gnam)))
end(*let*)//end-of-[f0_extnam(env0,iexp)]
//
(* ****** ****** *)
(* ****** ****** *)
//
(*
val () =
(
 prerrsln("trxi0i1_i0exp: iexp = ", iexp))
*)
//
(* ****** ****** *)
(* ****** ****** *)
//
}(*where*)//end-of-[trxi0i1_i0exp(env0,iexp)]

(* ****** ****** *)
//
#implfun
trxi0i1_i0lft
( env0, iexp ) =
let
//
(* ****** ****** *)
(* ****** ****** *)
//
fun
f0_flat
( env0:
! envi0i1
, iexp: i0exp): i1val =
let
//
val loc0 = iexp.lctn()
//
val-
I0Eflat(i0e1) = iexp.node()
//
in//let
i1val_addr
(
  trxi0i1_i0exp(env0, i0e1))
end//let//end-of-[f0_flat(env0,iexp)]
//
(* ****** ****** *)
(* ****** ****** *)
//
fun
f0_pcon
( env0:
! envi0i1
, iexp: i0exp): i1val =
let
//
val loc0 = iexp.lctn()
//
val-
I0Epcon
(lab0, i0e1) = iexp.node()
//
in//let
//
i1val_make_node
( loc0
, I1Vlpcn(lab0, i1v1)) where
{
val
i1v1 = trxi0i1_i0exp(env0, i0e1) }
//
end//let//end-of-[f0_pcon(env0,iexp)]
//
(* ****** ****** *)
(* ****** ****** *)
//
fun
f0_pflt
( env0:
! envi0i1
, iexp: i0exp): i1val =
let
//
val loc0 = iexp.lctn()
//
val-
I0Epflt
(lab0, i0e1) = iexp.node()
//
in//let
//
i1val_make_node
( loc0
, I1Vlpft(lab0, i1v1)) where
{
val
i1v1 = trxi0i1_i0lft(env0, i0e1) }
//
end//let//end-of-[f0_pflt(env0,iexp)]
//
(* ****** ****** *)
//
fun
f0_proj
( env0:
! envi0i1
, iexp: i0exp): i1val =
let
//
val loc0 = iexp.lctn()
//
val-
I0Eproj
(lab0, i0e1) = iexp.node()
//
in//let
//
i1val_make_node
( loc0
, I1Vlpbx(lab0, i1v1)) where
{
val
i1v1 = trxi0i1_i0exp(env0, i0e1) }
//
end//let//end-of-[f0_proj(env0,iexp)]
//
(* ****** ****** *)
//
fun
f0_dp2tr
( env0:
! envi0i1
, iexp: i0exp): i1val =
(
trxi0i1_i0exp(env0, i0e1)
) where
{
//
val-I0Edp2tr(i0e1) = iexp.node() }
(*where*)//end-of-[f0_dp2tr(env0,iexp)]
//
(* ****** ****** *)
(* ****** ****** *)
//
in//let
//
case+
iexp.node() of
//
|I0Eflat _ => f0_flat(env0, iexp)
//
|I0Epcon _ => f0_pcon(env0, iexp)
//
|I0Epflt _ => f0_pflt(env0, iexp)
|I0Eproj _ => f0_proj(env0, iexp)
//
|
I0Edp2tr _ => f0_dp2tr(env0, iexp)
//
|
_(*otherwise*) => i1val_aexp( iexp )
//
end where
{
//
(*
val () =
(
 prerrsln("trxi0i1_i0lft: iexp = ", iexp))
*)
//
(* ****** ****** *)
(* ****** ****** *)
//
}(*where*)//end-of-[trxi0i1_i0lft(env0,iexp)]
//
(* ****** ****** *)
//
#implfun
trxi0i1_i0blk
( env0, iexp ) =
(
I1CMPcons(ilts, ival)
) where
{
val () =
(
  envi0i1_pshblk0(env0))
//
val ival =
(
  trxi0i1_i0exp(env0, iexp))
//
val ilts = envi0i1_popblk0(env0)
//
}(*where*)//end-of-[trxi0i1_i0blk(env0,iexp)]
//
(* ****** ****** *)
(* ****** ****** *)
//
#implfun
trxi0i1_i0gua
( env0, igua ) =
(
case+
igua.node() of
|
I0GUAexp
(  iexp  ) =>
i1gua
(
loc0,
I1GUAexp(icmp)) where
{
val icmp =
trxi0i1_i0blk(env0, iexp)}
|
I0GUAmat
(iexp, ipat) =>
let
//
val icmp =
trxi0i1_i0blk(env0, iexp)
val ibnd =
trxi0i1_i0pat(env0, ipat)
//
in//let
  i1gua
  (loc0, I1GUAmat(icmp,ibnd))
end//let
) where
{
//
val loc0 = igua.lctn((*void*))
//
(*
val (  ) =
(
 prerrsln("trxi0i1_i0gua: igua = ", igua))
*)
//
}(*where*)//end-of-[trxi0i1_i0cls(env0,iexp)]
//
(* ****** ****** *)
//
#implfun
trxi0i1_i0gpt
( env0, igpt ) =
(
case+
igpt.node() of
//
|
I0GPTpat
(  ipat  ) =>
(
i1gpt
(
loc0,
I1GPTpat(ibnd))) where
{
//
val loc0 = igpt.lctn()
//
val ibnd =
trxi0i1_i0pat(env0, ipat)}
//
|
I0GPTgua
(ipat, i0gs) =>
let
//
val ibnd =
trxi0i1_i0pat(env0, ipat)
val i1gs =
trxi0i1_i0gualst(env0, i0gs)
//
in//let
//
let
val loc0 = igpt.lctn()
in//let
i1gpt(loc0,I1GPTgua(ibnd,i1gs))
end//let
//
end//let//end of [I0GPTgua(ipat,i0gs)]
//
) where
{
//
(*
val (  ) =
(
 prerrsln("trxi0i1_i0gpt: igpt = ", igpt))
*)
//
}(*where*)//end-of-[trxi0i1_i0cls(env0,iexp)]
//
(* ****** ****** *)
//
#implfun
trxi0i1_i0cls
( env0, icls ) =
(
case+
icls.node() of
//
|
I0CLSgpt
(  igpt  ) =>
(
i1cls
(
loc0,
I1CLSgpt(igpt))) where
{
//
val (  ) =
envi0i1_pshlam0(env0)
//
val loc0 = icls.lctn()
//
val igpt =
trxi0i1_i0gpt(env0, igpt)
//
val // HX: [ilts] is empty
ilts = envi0i1_poplam0( env0 )
//
}(*where*)//end of [I0CLSgpt(igpt)]
//
|
I0CLScls
(igpt, iexp) =>
let
//
val (  ) =
envi0i1_pshlam0(env0)
//
val igpt =
trxi0i1_i0gpt(env0, igpt)
//
val ival =
trxi0i1_i0exp(env0, iexp)
//
val
ilts = envi0i1_poplam0( env0 )
//
val icmp = I1CMPcons(ilts, ival)
//
in
let
val loc0 = icls.lctn()
in//let
  i1cls(loc0, I1CLScls(igpt, icmp))
end//let
end//let//end of [I0CLScls(igpt,iexp)]
//
) where
{
//
(*
val (  ) =
(
 prerrsln("trxi0i1_i0cls: icls = ", icls))
*)
//
}(*where*)//end-of-[trxi0i1_i0cls(env0,iexp)]
//
(* ****** ****** *)
(* ****** ****** *)
//
#implfun
trxi0i1_t0imp
( env0, timp ) =
let
//
val stmp =
t0imp_get_stmp(timp)
val node =
t0imp_get_node(timp)
//
in//let
t1imp_make_node(stmp, node) where
{
val node =
(
case+ node of
|T0IMPall1
(dcst, dcls) =>
(
case+ dcls of
|list_nil() =>
T1IMPall1(dcst, optn_nil())
|list_cons(dcl1, _) =>
T1IMPall1(dcst,
optn_cons(trxi0i1_i0dcl(env0, dcl1))))
//
|T0IMPallx
(dcst, dcls) =>
(
case+ dcls of
|list_nil() =>
T1IMPallx(dcst, optn_nil())
|list_cons(dcl1, _) =>
T1IMPallx(dcst,
optn_cons(trxi0i1_i0dcl(env0, dcl1))))
) : t1imp_node // end of [ val(node) ]
}
end(*let*)//end-of-[trxi0i1_t0imp(env0,timp)]
//
(* ****** ****** *)
(* ****** ****** *)
//
#implfun
trxi0i1_i0patlst
( env0, i0ps ) =
(
list_trxi0i1_fnp(env0, i0ps, trxi0i1_i0pat))
//
(* ****** ****** *)
(* ****** ****** *)
//
#implfun
trxi0i1_fiarglst
( env0, fias ) =
(
case+ fias of
|
list_nil
( (*0*) ) =>
list_nil((*void*))
|
list_cons
(fia1, fias) =>
(
case+
fia1.node() of
|
FIARGdapp _ =>
list_cons(fja1, fjas) where
{
//
val
fja1 = f0_dapp(env0, fia1)
val
fjas =
trxi0i1_fiarglst(env0, fias)
//
}(*where*)//end-[FIARGdapp(...)]
)
) where // end-of-[case+of(fia1)]
{
//
fun
f0_dapp
( env0:
! envi0i1
, fia1: fiarg): fjarg =
let
//
val loc0 = fia1.lctn()
//
val-
FIARGdarg(i0ps) = fia1.node()
//
in//let
(
fjarg
(loc0, FJARGdarg(i1bs))) where
{
val
i1bs = trxi0i1_i0patlst(env0, i0ps)} end
}(*where+*)//end-[trxi0i1_fiarglst(env0,fias)]
//
(* ****** ****** *)
(* ****** ****** *)
//
#implfun
trxi0i1_i0explst
( env0, i0es ) =
(
 list_trxi0i1_fnp(env0, i0es, trxi0i1_i0exp))
//
#implfun
trxi0i1_i0blklst
( env0, i0es ) =
(
 list_trxi0i1_fnp(env0, i0es, trxi0i1_i0blk))
//
(* ****** ****** *)
//
#implfun
trxi0i1_l0i0elst
( env0, lies ) =
let
fun
trxi0i1_l0i0e
(env0:
!envi0i1, l0x1: l0i0e): l1i1v =
let
val
I0LAB(l0, x1) = l0x1 in//let
I1LAB(l0, trxi0i1_i0exp(env0, x1)) end
in//let
  list_trxi0i1_fnp(env0, lies, trxi0i1_l0i0e)
end//let//end-of-[trxi0i1_l0i0elst(env0,lies)]
//
(* ****** ****** *)
(* ****** ****** *)
//
#implfun
trxi0i1_i0gualst
( env0, i0gs ) =
(
  list_trxi0i1_fnp(env0, i0gs, trxi0i1_i0gua))
//
(* ****** ****** *)
//
#implfun
trxi0i1_i0clslst
( env0, icls ) =
(
  list_trxi0i1_fnp(env0, icls, trxi0i1_i0cls))
//
(* ****** ****** *)
(* ****** ****** *)
//
(*
(*
HX:
This one is implemented directly
*)
#implfun
trxi0i1_fiarglst
( env0, fias ) =
(
  list_trxi0i1_fnp(env0, fias, trxi0i1_fiarg))
*)
//
(* ****** ****** *)
(* ****** ****** *)

(***********************************************************************)
(* end of [ATS3/XANADU_srcgen2_xats2js_srcgen1_DATS_trxi0i1_dynexp.dats] *)
(***********************************************************************)

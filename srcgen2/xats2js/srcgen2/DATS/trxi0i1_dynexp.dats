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
//
Sun Apr 26 12:37:10 AM EDT 2026
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
#staload ".\
/../../../xats2cc\
/srcgen1/SATS/intrep0.sats"//...
//
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
#symload lctn with i0pat_lctn$get
#symload node with i0pat_node$get
(* ****** ****** *)
#symload lctn with i0exp_lctn$get
#symload node with i0exp_node$get
(* ****** ****** *)
#symload lctn with fiarg_lctn$get
#symload node with fiarg_node$get
(* ****** ****** *)
//
#symload lctn with i0gua_lctn$get
#symload lctn with i0gpt_lctn$get
#symload lctn with i0cls_lctn$get
//
#symload node with i0gua_node$get
#symload node with i0gpt_node$get
#symload node with i0cls_node$get
//
(* ****** ****** *)
#symload lctn with i1val_lctn$get
#symload node with i1val_node$get
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
  envi0i1_ilet$insert(env0, ilet) )
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
  envi0i1_ilet$insert(env0, ilet) )
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
  envi0i1_ilet$insert(env0, ilet) )
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
  envi0i1_ilet$insert(env0, ilet) )
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
  envi0i1_ilet$insert(env0, ilet) )
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
  envi0i1_ilet$insert(env0, ilet) )
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
  envi0i1_ilet$insert(env0, ilet) )
}(*where*)//end-of-[i1val_let0(env0,...)]
//
(* ****** ****** *)
////
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
  envi0i1_ilet$insert(env0, ilet) )
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
  envi0i1_ilet$insert(env0, ilet) )
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
  envi0i1_ilet$insert(env0, ilet) )
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
  envi0i1_ilet$insert(env0, ilet) )
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
val livs = f0_orderize(livs)
//
val iins = I1INSrcd2(tknd,livs)
val itnm = i1tnm_new0((*void*))
val ilet = I1LETnew1(itnm, iins)
//
val (  ) =
(
  envi0i1_ilet$insert(env0, ilet) )
} where {
//
fun
f0_orderize
(livs: l1i1vlst): l1i1vlst =
let
//
#typedef x0 = l1i1v
//
fun
f1_test
( livs
: list(x0)): bool =
(
  list_sortedq<x0>(livs))
fun
f1_sort
( livs
: l1i1vlst): l1i1vlst =
(
  list_mergesort<x0>(livs))
//
in//let
//
(
  if // if
  f1_test(livs)
  then livs else f1_sort(livs) )
//
end (*let*) // end-[f0_orderize(...)]
//
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
  envi0i1_ilet$insert(env0, ilet) )
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
  envi0i1_ilet$insert(env0, ilet) )
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
  envi0i1_ilet$insert(env0, ilet) )
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
  envi0i1_ilet$insert(env0, ilet) )
}(*where*)//end-of-[i1val_flat(env0,...)]
//
(* ****** ****** *)
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
  envi0i1_ilet$insert(env0, ilet) )
}(*where*)//end-of-[i1val_dp2tr(env0,...)]
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
  envi0i1_ilet$insert(env0, ilet) )
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
  envi0i1_ilet$insert(env0, ilet) )
}(*where*)//end-of-[i1val_dl1az(env0,...)]
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
  envi0i1_ilet$insert(env0, ilet) )
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
  envi0i1_ilet$insert(env0, ilet) )
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
  envi0i1_ilet$insert(env0, ilet) )
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
  envi0i1_ilet$insert(env0, ilet) )
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
  envi0i1_ilet$insert(env0, ilet) )
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
  envi0i1_ilet$insert(env0, ilet) )
}(*where*)//end-of-[i1val_l1azy(env0,...)]
//
(* ****** ****** *)
(* ****** ****** *)
//
(***********************************************************************)
(* end of [ATS3/XANADU_srcgen2_xats2js_srcgen2_DATS_trxi0i1_dynexp.dats] *)
(***********************************************************************)

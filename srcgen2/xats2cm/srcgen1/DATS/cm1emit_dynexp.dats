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
Thu Jul  2 11:24:48 PM EDT 2026
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
/HATS/xatsopt_dpre.hats"
(* ****** ****** *)
#include
"./../HATS/mytmplib00.hats"
(* ****** ****** *)
(* ****** ****** *)
//
#include
"./../HATS/libxatsopt.hats"
#include
"./../HATS/libxats2js.hats"
//
(* ****** ****** *)
(* ****** ****** *)
//
#staload "./../SATS/xats2cm.sats"
#staload "./../SATS/cm1emit.sats"
//
(* ****** ****** *)
//
#staload
_(*DATS*)="./../DATS/cm1emit.dats"
//
(* ****** ****** *)
(* ****** ****** *)
#symload lctn with token_get_lctn
#symload node with token_get_node
(* ****** ****** *)
#symload lctn with d2con_get_lctn
#symload lctn with d2cst_get_lctn
(* ****** ****** *)
#symload lctn with i1val_lctn$get
(* ****** ****** *)
#symload lctn with i1cmp_lctn$get
#symload ival with i1cmp_ival$get
#symload ilts with i1cmp_ilts$get
(* ****** ****** *)
#symload node with i1cls_node$get
(* ****** ****** *)
#symload node with t1imp_node$get
(* ****** ****** *)
#symload lctn with i1dcl_lctn$get
#symload node with i1dcl_node$get
(* ****** ****** *)
(* ****** ****** *)
#symload filr with envx2js_filr$get
#symload nind with envx2js_nind$get
(* ****** ****** *)
(* ****** ****** *)
//
val
EXCPTCON_BASE = 10000
//
(* ****** ****** *)
//
fun
d2con_ctag$get
(dcon: d2con): sint =
let
//
val
ctag =
d2con_get_ctag(dcon)
//
in//let
//
if ctag >= 0
then ctag else
let
val loc0 = dcon.lctn()
in//let
EXCPTCON_BASE + 
postn_get_ntot(loc0.pbeg())
end//let
//
end//end-of-[d2con_ctag$get]
//
(* ****** ****** *)
(* ****** ****** *)
//
fun
fprintln
(filr: FILR): void =
(
strn_fprint("\n",filr))//endfun
//
(* ****** ****** *)
//
fun
loctnfpr
(filr: FILR
,loc0: loctn): void =
(
loctn_fprint(loc0,filr))//endfun
//
(* ****** ****** *)
(* ****** ****** *)
//
fun
i0expfpr
(filr: FILR
,iexp: i0exp): void =
(
i0exp_fprint(iexp,filr))//endfun
//
(* ****** ****** *)
(* ****** ****** *)
//
fun
d2concm1
(filr: FILR
,dcon: d2con): void =
let
#impltmp
g_print$out<>() = filr
//
val name =
(
  d2con_get_name(dcon))
//
in//let
(
  prints('"', name, '"') )
end(*let*)//end-of-[d2concm1(...)]
//
(* ****** ****** *)
//
fun
d2ctgcm1
(filr: FILR
,dcon: d2con): void =
let
//
val ctag =
d2con_ctag$get(dcon)
//
in//let
(
  print(ctag) ) where
{
#impltmp g_print$out<>() = filr
}
end(*let*)//end-of-[d2ctgcm1(...)]
//
(* ****** ****** *)
//
fun
i0ctgcm1
(filr: FILR
,ipat: i0pat): void =
let
#impltmp
g_print$out<>() = filr
in//let
case+
ipat.node() of
//
|I0Pcon(d2c0) =>
(
prints
("XATSCTAG("
,'"', name, '"', ",", ctag, ")")
) where
{
  val ctag = d2con_ctag$get(d2c0)
  val name = d2con_get_name(d2c0) }
//
|
_(*non-I0Pcon*) => prints('"',ipat,'"')
//
end(*let*)//end-of-[i0ctgcm1(filr,ipat)]
//
(* ****** ****** *)
//
fun
i0pcncm1
(filr: FILR
,ipat: i0pat): void =
let
#impltmp
g_print$out<>() = filr
in//let
case+
ipat.node() of
//
|I0Pcon(d2c0) =>
(
  prints('"', name, '"')) where
{
  val name = d2con_get_name(d2c0)
}
//
|
_(*non-I0Pcon*) => prints('"',ipat,'"')
//
end(*let*)//end-of-[i0pcncm1(filr,ipat)]
//
(* ****** ****** *)
(* ****** ****** *)
//
#implfun
i0pckcm1
( filr
, ival, ipat) =
let
#impltmp
g_print$out<>() = filr
in//let
(
prints("i0pckcm1(",ival,",",ipat, ")"))
end//let//endof(i0pckcm1(filr,ival,ipat))
//
(* ****** ****** *)
(* ****** ****** *)
//
#implfun
i1valcm1(filr, ival) =
let
//
(*
val () =
prerrsln
("i1valcm1: ival = ", ival)
*)
//
in//let
//
case+
ival.node() of
//
(* ****** ****** *)
(* ****** ****** *)
|I1Vnil
((*0*)) => prints("[", "]")
(* ****** ****** *)
(* ****** ****** *)
|I1Vint
( tint ) => i0intcm1(filr,tint)
(* ****** ****** *)
|I1Vbtf
( btf0 ) => i0btfcm1(filr,btf0)
(* ****** ****** *)
|I1Vchr
( tchr ) => i0chrcm1(filr,tchr)
(* ****** ****** *)
|I1Vflt
( tflt ) => i0fltcm1(filr,tflt)
(* ****** ****** *)
|I1Vstr
( tstr ) => i0strcm1(filr,tstr)
(* ****** ****** *)
(* ****** ****** *)
//
|I1Vi00
( int0 ) => i0i00cm1(filr,int0)
|I1Vb00
( btf0 ) => i0b00cm1(filr,btf0)
|I1Vc00
( chr0 ) => i0c00cm1(filr,chr0)
|I1Vf00
( flt0 ) => i0f00cm1(filr,flt0)
|I1Vs00
( str0 ) => i0s00cm1(filr,str0)
//
(* ****** ****** *)
(* ****** ****** *)
//
|I1Vtop
( sym0 ) => print( "XATSTOP0" )
//
(* ****** ****** *)
|I1Vtnm
( itnm ) => i1tnmcm1(filr,itnm)
(* ****** ****** *)
|I1Vcon
( dcon ) => d2concm1(filr,dcon)
(* ****** ****** *)
|I1Vcst
( dcst ) => d2cstcm1(filr,dcst)
(* ****** ****** *)
|I1Vvar
( dvar ) => d2varcm1(filr,dvar)
(* ****** ****** *)
(* ****** ****** *)
//
|I1Vaddr(i1v1) =>
(
  prints("XATSADDR(", i1v1, ")") )
|I1Vaexp(i0e1) =>
(
  prints("XATSAEXP(", i0e1, ")") )
//
(* ****** ****** *)
(* ****** ****** *)
|I1Vp0rj
( itup,pind ) =>
(
prints
("XATSP0RJ(",itup,"[",pind,"]", ")"))
(* ****** ****** *)
//
|I1Vp1cn
( ipat
, icon, pind) =>
(
print("XATSP1CN(");
prints
(ipat, ", ", icon, "[",pind,"+1]", ")")
) where
{ #impltmp
  g_print<i0pat>(x) = i0pcncm1(filr,x) }
//
(*
|I1Vp1rj
( trcd
, itup, pind) =>
(
print("XATSP1RJ(");
prints
(trcd, ", ", itup, "[", pind, "]", ")")
) where
{ #impltmp
  g_print<token>(x) = xtrcdcm1(filr,x) }
*)
//
(* ****** ****** *)
(* ****** ****** *)
//
(*
|I1Vlpcn
(plab, itup) =>
( prints
  ("XATSLPCN(", plab, ", ", itup, ")")
) where
{ #impltmp
  g_print<label>(x) = labelcm1(filr,x) }
*)
//
(*
|I1Vlpft
(plab, itup) =>
( prints
  ("XATSLPFT(", plab, ", ", itup, ")")
) where
{ #impltmp
  g_print<label>(x) = labelcm1(filr,x) }
*)
//
(*
|I1Vlpbx
(plab, itup) =>
( prints
  ("XATSLPBX(", plab, ", ", itup, ")")
) where
{ #impltmp
  g_print<label>(x) = labelcm1(filr,x) }
*)
//
(* ****** ****** *)
(* ****** ****** *)
|
_(*otherwise*) => i1val_fprint(ival,filr)
//
end where
{
//
  #impltmp g_print$out<>() = ( filr )
//
  #impltmp
  g_print<i1val>(x) = i1valcm1(filr, x)
//
}(*where*)//end-of-[ i1valcm1(filr,ival) ]
//
(* ****** ****** *)
(* ****** ****** *)
//
#implfun
i1let_cm1emit
(ilet, env0) =
(
case+ ilet of
|I1LETnew0
(   iins   ) =>
xats2cm_i1let(env0, ilet)
|I1LETnew1
(itnm, iins) =>
xats2cm_i1let(env0, ilet)
) where
{
//
val filr =
envx2js_filr$get(env0)
val nind =
envx2js_nind$get(env0)
//
#impltmp
g_print$out
<(*0*)>(    ) = ( filr )
#impltmp
g_print
<i1tnm>(itnm) = i1tnmcm1(filr, itnm)
//
}(*where*)//end-of-[i1let_cm1emit(ilet,env0)]
//
(* ****** ****** *)
(* ****** ****** *)
//
#implfun
i1letlst_cm1emit
  (ilts, env0) =
(
  list_cm1emit_fnp(ilts, env0, i1let_cm1emit))
//
(* ****** ****** *)
(* ****** ****** *)
//
(***********************************************************************)
(* end of [ATS3/XANADU_srcgen2_xats2cm_srcgen1_DATS_cm1emit_dynexp.dats] *)
(***********************************************************************)

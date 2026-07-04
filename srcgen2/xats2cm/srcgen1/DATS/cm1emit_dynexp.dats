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
//
#implfun
i1vlsif1
(filr, i1vs) =
(
case+ i1vs of
|list_nil() => ()
|list_cons _ => strnfpr(filr, " ")
)(*where*)//end-of-[i1vlsif1(filr,i1vs)]
//
#implfun
i1vlscm1
(filr, i1vs) =
(
loop(i1vs, 0(*i0*))
) where
{
fun loop
( i1vs
: i1valist, i0: sint): void =
(
case+ i1vs of
|list_nil
( (*void*) ) => ( (*void*) )
|list_cons
(i1v1, i1vs) =>
(
(
if
(i0 >= 1) then
strnfpr(filr, " "));
i1valcm1(filr, i1v1);loop(i1vs, i0+1)))
}(*where*)//end-of-[i1vlscm1(filr,i1vs)]
//
(* ****** ****** *)
(* ****** ****** *)
//
#implfun
i1let_cm1emit
(ilet, env0) =
(
case+ ilet of
//
|I1LETnew0
(   iins   ) =>
(
fprintln(filr))
where{
val () =
f0_i1ins(env0, iins)}
//
|I1LETnew1
(itnm, iins) =>
(
fprintln(filr))
where{
val () =
f0_i1tnmins(env0, itnm, iins)}
//
) where
{
//
val filr =
envx2js_filr$get(env0)
val nind =
envx2js_nind$get(env0)
//
(*
#impltmp
g_print$out<(*0*)>((*0*)) = (filr)
#impltmp
g_print<i1tnm>(itnm) = i1tnmcm1(filr, itnm)
*)
//
fun
f0_i1ins
( env0:
! envx2cm
, iins: i1ins): void =
let
//
val filr =
(
  envx2js_filr$get(env0))
val nind =
(
  envx2js_nind$get(env0))
//
in//let
//
case+ iins of
//
|I1INSdapp
(i1f0, i1vs) =>
(
if
i1val_conq
(  i1f0  )
then//then
let
val-
I1Vcon(dcon) = i1f0.node()
in//(*let*)
(
strnfpr(
filr,"(XATSCAPP ");
d2concm1(filr, dcon);strnfpr(filr," ");
d2ctgcm1(filr, dcon);
i1vlsif1(filr, i1vs);
i1vlscm1(filr, i1vs);strnfpr(filr, ")"))
end else//else
(
if
i1val_cfnq
(  i1f0  )
then//then
let
in//(*let*)
(
strnfpr(
filr, "(XATSCAST ");
strnfpr(filr, "\"");
i1valcm1(filr, i1f0);strnfpr(filr,"\"");
i1vlsif1(filr, i1vs);
i1vlscm1(filr, i1vs);strnfpr(filr, ")"))
end else//else
(
strnfpr(
filr, "(XATSDAPP ");
i1valcm1(filr, i1f0);
i1vlsif1(filr, i1vs);
i1vlscm1(filr, i1vs);strnfpr(filr, ")"))
)
)
(* ****** ****** *)
//
|I1INStimp
(i0f1, timp) =>
(
t1imp_cm1emit(timp, env0))
where
{
//
val
loc1 = i0f1.lctn((*0*))
//
val () = (
nindstrnfpr
(filr, nind, ";; ");
loctnfpr(filr, loc1);fprintln(filr))
val () = (
nindstrnfpr
(filr, nind, ";; ");
i0expfpr(filr, i0f1);fprintln(filr))
}
//
(* ****** ****** *)
(* ****** ****** *)
| _(*otherwise*) => i1ins_fprint(iins, filr)
(* ****** ****** *)
(* ****** ****** *)
//
end(*let*)//end-of-[f0_i1ins(env0,iins)]
//
fun
f0_i1tnmins
( env0:
! envx2cm
, itnm: i1tnm
, iins: i1ins): void =
let
//
val filr =
(
  envx2js_filr$get(env0))
val nind =
(
  envx2js_nind$get(env0))
//
in//let
(
nindfpr
(filr, nind);strnfpr(filr, "(");
i1tnmcm1(filr, itnm);strnfpr(filr, " ");
f0_i1ins(env0, iins);strnfpr(filr, ")"))
end(*let*)//end[f0_i1tnmins(env0,itnm,iins)]
//
}(*where*)//end-of-[i1let_cm1emit(ilet,env0)]
//
(* ****** ****** *)
(* ****** ****** *)
//
#implfun
i1cmp_cm1emit
(icmp, env0) =
let
//
val filr =
(
  envx2js_filr$get(env0))
val nind =
(
  envx2js_nind$get(env0))
//
in//let
//
case+ icmp of
|
I1CMPcons
(ilts, ival) =>
(
nindfpr(filr, nind);
strnfpr(filr, "(let*\n");
nindfpr(filr, nind);strnfpr(filr, "(\n");
//
(
envx2js_incnind(env0,2(*++*));
(
envx2js_decnind(env0,2(*--*)))
where
{ val () =
  i1letlst_cm1emit(ilts, env0)});
//
nindfpr(filr, nind);strnfpr(filr, ") ");
i1valcm1(filr, ival);strnfpr(filr, ")");fprintln(filr)
)
end(*let*)//end[i1cmp_ind$cm1emit(icmp,env0)]
//
(* ****** ****** *)
//
#implfun
i1cmp_ind$cm1emit
(icmp, env0) =
let
//
val () =
(
  envx2js_incnind(env0, 2))
val () =
(
  i1cmp_cm1emit(icmp, env0))
//
val () = envx2js_decnind(env0, 2)
//
end(*let*)//end(i1cmp_ind$cm1emit(icmp,env0)]
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

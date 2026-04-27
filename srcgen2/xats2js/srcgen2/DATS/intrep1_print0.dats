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
Sat Apr 11 02:32:04 PM EDT 2026
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
#staload // D2E =
"./../../../SATS/dynexp2.sats"
(* ****** ****** *)
(* ****** ****** *)
//
#staload ".\
/../../../xats2cc\
/srcgen1/SATS/intrep0.sats"//...
#staload "./../SATS/intrep1.sats"
//
(* ****** ****** *)
(* ****** ****** *)
//
#implfun
i1let_fprint
(ilet, out0) =
let
#impltmp
g_print$out<>() = out0
in//let
//
case+ ilet of
|I1LETnew0(iins) =>
(
prints("I1LETnew0(", iins, ")"))
|I1LETnew1(itnm, iins) =>
(
prints
("I1LETnew1(", itnm, ";", iins, ")"))
//
end(*let*)//end-of-[i1let_fprint(ilet,out0)]
//
(* ****** ****** *)
(* ****** ****** *)
//
#implfun
i1bnd_fprint
(ibnd, out0) =
let
//
#impltmp
g_print$out
<(*0*)>((*0*)) = out0
//
#impltmp
g_print
<d2var>( dvar ) =
d2var_fprint(dvar, out0)
//
in//let
//
case+ ibnd of
|I1BNDcons
(itnm, ipat, dsub) =>
( print("I1BNDcons(")
; prints(itnm, ";", ipat, ";", dsub, ")"))
//
end(*let*)//end-of-[i1bnd_fprint(ibnd,out0)]
//
(* ****** ****** *)
//
#implfun
i1cmp_fprint
(icmp, out0) =
let
#impltmp
g_print$out<>() = out0
in//let
//
case+ icmp of
|I1CMPcons(ilts, ival) =>
prints("I1CMPcons(", ilts, ";", ival, ")")
//
end(*let*)//end-of-[i1cmp_fprint(icmp,out0)]
//
(* ****** ****** *)
(* ****** ****** *)
//
#implfun
i1val_fprint
(i1v0, out0) =
let
#impltmp
g_print$out<>() = out0
in//let
//
case+
i1v0.node() of
//
(* ****** ****** *)
//
|I1Vnil() =>
(
prints("I1Vnil(",")"))
//
(* ****** ****** *)
//
|I1Vint(int) =>
prints("I1Vint(",int,")")
|I1Vbtf(btf) =>
prints("I1Vbtf(",btf,")")
|I1Vchr(chr) =>
prints("I1Vchr(",chr,")")
|I1Vflt(flt) =>
prints("I1Vflt(",flt,")")
|I1Vstr(str) =>
prints("I1Vstr(",str,")")
//
(* ****** ****** *)
//
|I1Vi00(i00) =>
prints("I1Vi00(",i00,")")
|I1Vb00(b00) =>
prints("I1Vb00(",b00,")")
|I1Vc00(c00) =>
prints("I1Vc00(",c00,")")
|I1Vf00(f00) =>
prints("I1Vf00(",f00,")")
|I1Vs00(s00) =>
prints("I1Vs00(",s00,")")
//
(* ****** ****** *)
//
|I1Vtnm(itnm) =>
prints("I1Vtnm(",itnm,")")
//
(* ****** ****** *)
//
|I1Vcon(dcon) =>
prints("I1Vcon(",dcon,")")
|I1Vcst(dcst) =>
prints("I1Vcst(",dcst,")")
//
(* ****** ****** *)
(* ****** ****** *)
|I1Vaexp(iexp) =>
prints("I1Vaexp(", iexp, ")")
|I1Vaddr(ival) =>
prints("I1Vaddr(", ival, ")")
(* ****** ****** *)
(* ****** ****** *)
//
|I1Vp0rj
(i1v1, idx2) =>
(
print("I1Vp0rj(");
prints(i1v1, ";", idx2, ")"))
//
|I1Vp1cn
(i0f0
,i1v1, idx2) =>
(
print("I1Vp1cn(");
prints(
i0f0, ";", i1v1, ";", idx2, ")"))
//
|I1Vp1rj
(tknd
,i1v1, idx2) =>
(
print("I1Vp1rj(");
prints(
tknd, ";", i1v1, ";", idx2, ")"))
//
|I1Vp2rj
(tknd
,i1v1, lab2) =>
(
print("I1Vp2rj(");
prints(
tknd, ";", i1v1, ";", lab2, ")"))
//
(* ****** ****** *)
(* ****** ****** *)
//
|I1Vnone0() => prints( "I1Vnone0(",")" )
|I1Vnone1(i0e1) => prints("I1Vnone1(", i0e1, ")")
//
(* ****** ****** *)
//
end(*let*)//end-of-[i1val_fprint(i1v0,out0)]
//
(* ****** ****** *)
(* ****** ****** *)
//
#implfun
i1ins_fprint
(iins, out0) =
let
#impltmp
g_print$out<>() = out0
in//let
//
case+ iins of
//
(* ****** ****** *)
//
|I1INSopr
( iopr, i1vs) =>
(
print("I1INSopr(");
prints(iopr, ";", i1vs, ")"))
//
(* ****** ****** *)
//
|I1INSdapp
( i1f0, i1vs) =>
(
print("I1INSdapp(");
prints(i1f0, ";", i1vs, ")"))
//
(* ****** ****** *)
//
|I1INStimp
( i0e1,timp ) =>
(
print("I1INStimp(");
prints
(i0e1, ";", "...", ")"))
where
{
val
i0e1 =
(
  detapq(i0e1)) where
{
fun
detapq
( i0e1
: i0exp): i0exp =
(
case+
i0e1.node() of
|
I0Etapq
(i0e1, _) => detapq(i0e1)
|
_(*otherwise*) => ( i0e1 ))}
}(*where*)//end-of(I1INStimp)
//
(* ****** ****** *)
//
|I1INStup0
(   i1vs   ) =>
(
prints
("I1INStup0(", i1vs, ")"))
//
|I1INStup1
(tknd, i1vs) =>
( print("I1INStup1(")
; prints(tknd, ";", i1vs, ")"))
//
|I1INSrcd2
(tknd, livs) =>
( print("I1INSrcd2(")
; prints(tknd, ";", livs, ")"))
//
(* ****** ****** *)
//
|I1INSpcon
(dlab, icon) =>
( print("I1INSpcon(")
; prints(dlab, ";", icon, ")"))
//
|I1INSpflt
(dlab, itup) =>
( print("I1INSpflt(")
; prints(dlab, ";", itup, ")"))
//
|I1INSproj
(dlab, itup) =>
( print("I1INSproj(")
; prints(dlab, ";", itup, ")"))
//
(* ****** ****** *)
//
|I1INSlet0
(dcls, icmp) =>
( print("I1INSlet0(")
; prints(dcls, ";", icmp, ")"))
//
(* ****** ****** *)
//
|I1INSift0
(test
,ithn, iels) =>
(
print("I1INSift0(");
prints(
test,";", ithn,";", iels,")"))
//
|I1INScas0
(cask
,i1v1, icls) =>
(
print("I1INScas0(");
prints(
cask,";", i1v1,";", icls,")"))
//
(* ****** ****** *)
//
|I1INSlam0
(tknd
,fjas, icmp) =>
( print
( "I1INSlam0(" )
; prints
( tknd,";",fjas,";",icmp,")"))
//
|I1INSfix0
(tknd, dvar
,fjas, icmp) =>
( print
( "I1INSfix0(" )
; prints
( tknd,";"
, dvar,";",fjas,";",icmp,")"))
//
(* ****** ****** *)
//
|I1INStry0
(tknd
,icmp
,iexn, icls) =>
( print
( "I1INStry0(" )
; prints
( tknd,";"
, icmp,";",iexn,";",icls,")"))
//
(* ****** ****** *)
//
|I1INSflat
(   i1v0   ) =>
(prints("I1INSflat(",i1v0,")"))
//
(* ****** ****** *)
//
|I1INSfold
(   i1v0   ) =>
(prints("I1INSfold(",i1v0,")"))
//
|I1INSfree
(   i1v0   ) =>
(prints("I1INSfree(",i1v0,")"))
//
(* ****** ****** *)
//
|I1INSdp2tr
(   iptr   ) =>
(
prints("I1INSdp2tr(",iptr,")"))
//
(* ****** ****** *)
//
|I1INSdl0az
(   i1f0   ) =>
(
prints("I1INSdl0az(",i1f0,")"))
|I1INSdl1az
(   i1f0   ) =>
(
prints("I1INSdl1az(",i1f0,")"))
//
(* ****** ****** *)
//
|I1INSl0azy
(dknd, icmp) =>
( print("I1INSl0azy(")
; prints(dknd, ";", icmp, ")"))
//
|I1INSl1azy
(dknd, icmp, i1fs) =>
(
print("I1INSl1azy(");
prints
(dknd, ";", icmp, ";", i1fs, ")"))
//
(* ****** ****** *)
//
|I1INSraise
(tknd, iexn) => // iexp: i1val
(
 prints("I1INSraise(", iexn, ")"))
//
(* ****** ****** *)
//
|I1INSassgn
(i1vl, i1vr) =>
(
prints
("I1INSassgn(", i1vl, ";", i1vr, ")"))
//
(* ****** ****** *)
//
end(*let*)//end-of-[i1ins_fprint(iins,out0)]
//
(* ****** ****** *)
(* ****** ****** *)
//
#implfun
i1dcl_fprint
(dcl0, out0) =
let
#impltmp
g_print$out<>() = out0
in//let
//
case+
dcl0.node() of
//
(* ****** ****** *)
//
|I1Di0dcl
(  dcl1  ) =>
(
prints("I1Di0dcl(", dcl1, ")"))
//
(* ****** ****** *)
//
|I1Dextern
(tknd, dcl1) =>
prints
("I1Dextern(", tknd, ";", dcl1, ")")
|I1Dstatic
(tknd, dcl1) =>
prints
("I1Dstatic(", tknd, ";", dcl1, ")")
//
(* ****** ****** *)
//
|I1Ddclst0
(   dcls   ) =>
(
  prints("I1Ddclst0(", dcls, ")"))
//
|I1Dlocal0
(head, body) =>
prints
("I1Dlocal0(", head, ";", body, ")")
//
(* ****** ****** *)
//
|I1Dtmpsub
(svts, idcl) =>
prints
("I1Dtmpsub(", svts, ";", idcl, ")")
//
(* ****** ****** *)
//
|I1Dinclude
( knd0, tknd
, gsrc, fopt, dopt ) =>
(
print("I1Dinclude(");
prints
(
knd0,";",
tknd,";",gsrc,";",fopt,";","...",")"))
//
(* ****** ****** *)
//
|
I1Dvaldclst
(tknd, i1vs) =>
prints
("I1Dvaldclst(", tknd, ";", i1vs, ")")
|
I1Dvardclst
(tknd, i1vs) =>
prints
("I1Dvardclst(", tknd, ";", i1vs, ")")
//
|
I1Dfundclst
( tknd, tqas
, d2cs, i1fs) =>
( prints
  ("I1Dfundclst(", tknd, ";")
; prints(tqas, ";", d2cs, ";", i1fs,")"))
//
(* ****** ****** *)
//
|
I1Dimplmnt0
(tknd
,stmp, dimp
,farg, body) =>
( print("I1Dimplmnt0(")
; prints(tknd,";",stmp,";")
; prints(dimp, ";", farg, ";", body, ")"))
//
(* ****** ****** *)
//
|I1Dnone0() => prints( "I1Dnone0(",")" )
|I1Dnone1(dcl1) => prints("I1Dnone1(", dcl1, ")")
//
(* ****** ****** *)
//
end(*let*)//end-of-[i1dcl_fprint(dcl0,out0)]
//
(* ****** ****** *)
(* ****** ****** *)
//
#implfun
i1valdcl_fprint
  (ival, out0) = let
//
val dpat =
i1valdcl_dpat$get(ival)
val tdxp =
i1valdcl_tdxp$get(ival)
//
#impltmp g_print$out<>() = out0
//
in//let
(
prints("I1VALDCL(", dpat, ";", tdxp, ")"))
end(*let*)//end-of-[i1valdcl_fprint(ival,out0)]
//
(* ****** ****** *)
//
#implfun
i1vardcl_fprint
  (ivar, out0) = let
//
val dpid =
i1vardcl_dpid$get(ivar)
val dini =
i1vardcl_dini$get(ivar)
//
#impltmp g_print$out<>() = out0
//
in//let
(
prints("I1VARDCL(", dpid, ";", dini, ")"))
end(*let*)//end-of-[i1vardcl_fprint(ivar,out0)]
//
(* ****** ****** *)
(* ****** ****** *)
//
#implfun
i1fundcl_fprint
  (ifun, out0) = let
//
val dpid =
i1fundcl_dpid$get(ifun)
val farg =
i1fundcl_farg$get(ifun)
val tdxp =
i1fundcl_tdxp$get(ifun)
//
#impltmp g_print$out<>() = out0
//
in//let
(
prints
("I1FUNDCL(",dpid,";",farg,";",tdxp,")"))
end(*let*)//end-of-[i1fundcl_fprint(ifun,out0)]
//
(* ****** ****** *)
(* ****** ****** *)
//
#implfun
i1parsed_fprint
  (ipar, out0) = let
//
val
stadyn =
i1parsed_stadyn$get(ipar)
val
nerror =
i1parsed_nerror$get(ipar)
val
source =
i1parsed_source$get(ipar)
val
parsed =
i1parsed_parsed$get(ipar)
//
#impltmp g_print$out<>() = out0
//
in//let
(
print("I1PARSED(");
prints
(stadyn,";",nerror,";",source,";",parsed,")"))
end(*let*)//end-of-[i1parsed_fprint(ipar,out0)]
//
(* ****** ****** *)
(* ****** ****** *)
//
(***********************************************************************)
(* end of [ATS3/XANADU_srcgen2_xats2js_srcgen2_DATS_intrep1_print0.dats] *)
(***********************************************************************)

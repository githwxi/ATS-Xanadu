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
Sat 16 Mar 2024 01:21:12 PM EDT
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
#include
"./../../..\
/HATS/xatsopt_sats.hats"
#include
"./../../..\
/HATS/xatsopt_dats.hats"
(* ****** ****** *)
#include
"./../HATS/mytmplib00.hats"
(* ****** ****** *)
(* ****** ****** *)
#staload // D2E =
"./../../../SATS/dynexp2.sats"
(* ****** ****** *)
(* ****** ****** *)
#staload "./../SATS/intrep0.sats"
#staload "./../SATS/intrep1.sats"
(* ****** ****** *)
(* ****** ****** *)
#symload name with d2var_get_name
(* ****** ****** *)
#symload lctn with i1val_get_lctn
#symload node with i1val_get_node
(* ****** ****** *)
#symload lctn with fjarg_get_lctn
#symload node with fjarg_get_node
(* ****** ****** *)
#symload node with i1gua_get_lctn
#symload node with i1gpt_get_lctn
#symload node with i1cls_get_lctn
(* ****** ****** *)
#symload node with i1gua_get_node
#symload node with i1gpt_get_node
#symload node with i1cls_get_node
(* ****** ****** *)
#symload lctn with t1imp_get_stmp
#symload node with t1imp_get_node
(* ****** ****** *)
#symload lctn with i1dcl_get_lctn
#symload node with i1dcl_get_node
(* ****** ****** *)
(* ****** ****** *)
//
#implfun
i1val_fprint
(out, i1v0) =
let
#impltmp
g_print$out<>() = out
in//let
//
case+
i1v0.node() of
//
(* ****** ****** *)
//
|I1Vnil() =>
prints("I1Vnil(",")")
//
|I1Vint(int) =>
prints("I1Vint(",int,")")
|I1Vbtf(btf) =>
prints("I1Vbtf(",btf,")")
|I1Vchr(chr) =>
prints("I1Vchr(",chr,")")
|I1Vstr(str) =>
prints("I1Vstr(",str,")")
//
(* ****** ****** *)
//
|I1Vtop(sym) =>
prints("I1Vtop(",sym,")")
//
(* ****** ****** *)
//
(*
|I1Varg(iarg) =>
prints("I1Varg(",iarg,")")
*)
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
//
|I1Vvar(dvar) =>
let
val name = dvar.name()
in//end
prints("I1Vvar(",name,")")
end//let//end-[I1Vvar...]
//
(* ****** ****** *)
(* ****** ****** *)
(*
|I1Vtimp
( i0e1,timp ) =>
(
prints("I1Vtimp(");
prints(i0e1, ";", "...", ")"))
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
case+ i0e1.node() of
|
I0Etapq(i0e1) => detapq(i0e1)
| _ (*otherwise*) => ( i0e1 ) ) } }
*)
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
(*
|I1Vtup0
(  i1vs  ) =>
prints("I1Vtup0(", i1vs, ")")
|I1Vtup1
( tknd, i1vs) =>
prints("I1Vtup1(",tknd,";",i1vs,")")
|I1Vrcd2
( tknd, livs) =>
prints("I1Vrcd2(",tknd,";",livs,")")
*)
//
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
prints
(i0f0, ";", i1v1, ";", idx2, ")"))
//
|I1Vp1rj
(tknd
,i1v1, idx2) =>
(
print("I1Vp1rj(");
prints
(tknd, ";", i1v1, ";", idx2, ")"))
//
|I1Vp2rj
(tknd
,i1v1, lab2) =>
(
print("I1Vp2rj(");
prints
(tknd, ";", i1v1, ";", lab2, ")"))
//
(* ****** ****** *)
//
(*
HX-2024-05-15:
For flat left-values
*)
//
|I1Vlpft
(lab0, i1v1) =>
(
prints("I1Vlpft(",lab0,";",i1v1,")"))
//
(*
HX-2024-05-15:
For boxed left-values
*)
|I1Vlpbx
(lab0, i1v1) =>
(
prints("I1Vlpbx(",lab0,";",i1v1,")"))
//
(*
HX-2024-07-18:
For consd left-values
*)
|I1Vlpcn
(lab0, i1v1) =>
(
prints("I1Vlpcn(",lab0,";",i1v1,")"))
//
(* ****** ****** *)
//
(*
|I1Vlam0
(tknd
,fjas, icmp) =>
(
prints("I1Vlam0(");
prints(tknd, ";", fjas, ";", icmp, ")"))
*)
//
|I1Vfix0
(tknd, dvar
,fjas, icmp) =>
(
print("I1Vfix0(");
prints( tknd, ";");
prints( dvar, ";", fjas, ";", icmp, ")"))
//
(* ****** ****** *)
//
(*
|I1Vl0azy
(dknd, icmp) =>
(
prints("I1Vl0azy(", dknd, ";", icmp, ")"))
*)
//
(*
|I1Vl1azy
(dknd, icmp, i1fs) =>
( prints("I1Vl1azy(") // i1fs: frees
; prints(dknd, ";", icmp, ";", i1fs, ")"))
*)
//
(* ****** ****** *)
//
|I1Vextnam
(tknd
,i1v1, g1ns) =>
( print("I1Vextnam(")
; prints(tknd, ";", i1v1, ";", g1ns, ")"))
//
(* ****** ****** *)
//
|I1Vnone0() => prints( "I1Vnone0(",")" )
|I1Vnone1(i0e1) => prints("I1Vnone1(", i0e1, ")")
//
(* ****** ****** *)
//
end(*let*)//end-of-[i1val_fprint(out, i1v0)]
//
(* ****** ****** *)
(* ****** ****** *)
//
#implfun
i1ins_fprint
(out, iins) =
let
#impltmp
g_print$out<>() = out
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
prints(i0e1, ";", "...", ")"))
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
case+ i0e1.node() of
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
|I1INSlam0
(tknd
,fjas, icmp) =>
( print
( "I1INSlam0(" )
; prints
( tknd,";",fjas,";",icmp,")"))
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
(print("I1INSift0(");
 prints
 (test,";",ithn,";",iels,")"))
//
|I1INScas0
(cask
,i1v1, icls) =>
(print("I1INScas0(");
 prints
 (cask,";",i1v1,";",icls,")"))
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
|I1INSdl0az
(   i1f0   ) =>
(
prints("I1INSdl0az(",i1f0,")"))
|I1INSdl1az
(   i1f0   ) =>
(
prints("I1INSdl1az(",i1f0,")"))
//
|I1INSdp2tr
(   iptr   ) =>
(
prints("I1INSdp2tr(",iptr,")"))
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
|I1INSassgn
(i1vl, i1vr) =>
(
prints
("I1INSassgn(", i1vl, ";", i1vr, ")"))
//
(* ****** ****** *)
//
end(*let*)//end-of-[i1ins_fprint(out, iins)]
//
(* ****** ****** *)
(* ****** ****** *)
//
#implfun
i1let_fprint
(out, ilet) =
let
#impltmp
g_print$out<>() = out
in//let
//
case+ ilet of
|I1LETnew0(iins) =>
(
  prints("I1LETnew0(", iins, ")"))
|I1LETnew1(itnm, iins) =>
( prints
  ("I1LETnew1(", itnm, ";", iins, ")"))
//
end(*let*)//end-of-[i1let_fprint(out, ilet)]
//
(* ****** ****** *)
//
#implfun
i1bnd_fprint
(out, ibnd) =
let
//
#impltmp
g_print$out
<(*0*)>((*0*)) = out
//
#impltmp
g_print
<d2var>( dvar ) =
d2var_fprint(out, dvar)
//
in//let
//
case+ ibnd of
|I1BNDcons
(itnm, ipat, dsub) =>
( print("I1BNDcons(")
; prints(itnm, ";", ipat, ";", dsub, ")"))
//
end(*let*)//end-of-[i1bnd_fprint(out, ibnd)]
//
(* ****** ****** *)
//
#implfun
i1cmp_fprint
(out, icmp) =
let
#impltmp
g_print$out<>() = out
in//let
//
case+ icmp of
|I1CMPcons(ilts, ival) =>
prints("I1CMPcons(", ilts, ";", ival, ")")
//
end(*let*)//end-of-[i1cmp_fprint(out, icmp)]
//
(* ****** ****** *)
(* ****** ****** *)
//
#implfun
fjarg_fprint
(out, farg) =
let
#impltmp
g_print$out<>() = out
in//let
//
case+
farg.node() of
|FJARGdarg(i1bs) =>
(
  prints("FJARGdarg(", i1bs, ")"))
//
end (*let*) // end of [fjarg_fprint(out,farg)]
//
(* ****** ****** *)
(* ****** ****** *)
//
#implfun
i1gua_fprint
(out, igua) =
let
#impltmp
g_print$out<>() = out
in//let
//
case+
igua.node() of
|
I1GUAexp(icmp) =>
prints("I1GUAexp(",icmp,")")
|
I1GUAmat(icmp,ibnd) =>
prints("I1GUAmat(",icmp,";",ibnd,")")
//
end (*let*) // end of [i1gua_fprint(out,igua)]
//
(* ****** ****** *)
//
#implfun
i1gpt_fprint
(out, igpt) =
let
#impltmp
g_print$out<>() = out
in//let
case+
igpt.node() of
|
I1GPTpat(ibnd) =>
prints("I1GPTpat(",ibnd,")")
|
I1GPTgua(ibnd,i1gs) =>
prints("I1GPTgua(",ibnd,";",i1gs,")")
end (*let*) // end of [i1gpt_fprint(out,igpt)]
//
#implfun
i1cls_fprint
(out, icls) =
let
#impltmp
g_print$out<>() = out
in//let
case+
icls.node() of
|
I1CLSgpt(igpt) =>
prints("I1CLSgpt(",igpt,")")
|
I1CLScls(igpt,icmp) =>
prints("I1CLScls(",igpt,";",icmp,")")
end (*let*) // end of [i1cls_fprint(out,icls)]
//
(* ****** ****** *)
(* ****** ****** *)
//
#implfun
t1imp_fprint
(out, timp) =
let
#implfun
g_print$out<>() = out
in//let
case+
timp.node() of
//
(*
|T1IMPone1
(  dcl1  ) =>
prints("T1IMPone1(", dcl1 ,")")
*)
//
|T1IMPall1
(d2c1, dopt) =>
prints("T1IMPall1(",d2c1,";",dopt,")")
//
|T1IMPallx
(d2c1, dopt) =>
prints("T1IMPallx(",d2c1,";",dopt,")")
//
end (*let*) // end of [t1imp_fprint(...)]
//
(* ****** ****** *)
(* ****** ****** *)
//
#implfun
i1dcl_fprint
(out, dcl0) =
let
#impltmp
g_print$out<>() = out
in//let
//
case+
dcl0.node() of
//
(* ****** ****** *)
//
|I1Di0dcl
(  dcl1  ) =>
prints("I1Di0dcl(", dcl1, ")")
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
( tknd
, d2cs, i1fs) =>
( print("I1Dfundclst(")
; prints(tknd, ";", d2cs, ";", i1fs,")"))
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
end(*let*)//end-of-[i1dcl_fprint(out, dcl0)]
//
(* ****** ****** *)
(* ****** ****** *)
//
#implfun
i1valdcl_fprint
  (out, ival) = let
//
val dpat =
i1valdcl_get_dpat(ival)
val tdxp =
i1valdcl_get_tdxp(ival)
//
#impltmp g_print$out<>() = out
//
in//let
(
prints("I1VALDCL(", dpat, ";", tdxp, ")"))
end(*let*)//end-of-[i1valdcl_fprint(out,ival)]
//
(* ****** ****** *)
//
#implfun
i1vardcl_fprint
  (out, ivar) = let
//
val dpid =
i1vardcl_get_dpid(ivar)
val dini =
i1vardcl_get_dini(ivar)
//
#impltmp g_print$out<>() = out
//
in//let
(
prints("I1VARDCL(", dpid, ";", dini, ")"))
end(*let*)//end-of-[i1vardcl_fprint(out,ivar)]
//
(* ****** ****** *)
(* ****** ****** *)
//
#implfun
i1fundcl_fprint
  (out, ifun) = let
//
val dpid =
i1fundcl_get_dpid(ifun)
val farg =
i1fundcl_get_farg(ifun)
val tdxp =
i1fundcl_get_tdxp(ifun)
//
#impltmp g_print$out<>() = out
//
in//let
(
prints
("I1FUNDCL(",dpid,";",farg,";",tdxp,")"))
end(*let*)//end-of-[i1fundcl_fprint(out,ifun)]
//
(* ****** ****** *)
(* ****** ****** *)
//
(***********************************************************************)
(* end of [ATS3/XANADU_srcgen2_xats2js_srcgen1_DATS_intrep1_print0.dats] *)
(***********************************************************************)

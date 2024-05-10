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
"./../HATS/xats2js_dats.hats"
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
|I1Vnil() =>
print("I1Vnil(",")")
//
|I1Vint(int) =>
print("I1Vint(",int,")")
|I1Vbtf(btf) =>
print("I1Vbtf(",btf,")")
|I1Vchr(chr) =>
print("I1Vchr(",chr,")")
|I1Vstr(str) =>
print("I1Vstr(",str,")")
//
|I1Vtnm(itnm) =>
print("I1Vtnm(",itnm,")")
//
|I1Vcon(dcon) =>
print("I1Vcon(",dcon,")")
|I1Vcst(dcst) =>
print("I1Vcst(",dcst,")")
|I1Vvar(dvar) =>
let
val name = dvar.name()
in//end
print("I1Vvar(",name,")")
end//let//end-[I1Vvar...]
//
|I1Vtimp
( i0e1,timp ) =>
(
print("I1Vtimp(");
print(i0e1, ";", "...", ")"))
where
{
val
i0e1 =
(
  detapp(i0e1)) where
{
fun
detapp
( i0e1
: i0exp): i0exp =
(
case+ i0e1.node() of
|
I0Etapp(i0e1) => detapp(i0e1)
| _ (*otherwise*) => ( i0e1 ) ) } }
//
(* ****** ****** *)
//
(*
|I1Vtup0(i1vs) =>
print("I1Vtup0(", i1vs, ")")
|I1Vtup1(tknd, i1vs) =>
print("I1Vtup1(",tknd,";",i1vs,")")
|I1Vrcd2(tknd, livs) =>
print("I1Vrcd2(",tknd,";",livs,")")
*)
//
(* ****** ****** *)
//
|I1Vp0rj
( i1v1,idx2 ) =>
(
print("I1Vp0rj(");
print(i1v1, ";", idx2, ")"))
//
|I1Vp1cn
(dcon, i1v1, idx2) =>
(
print("I1Vp1cn(");
print(dcon, ";", i1v1, ";", idx2, ")"))
//
|I1Vp1rj
(tknd, i1v1, idx2) =>
(
print("I1Vp1rj(");
print(tknd, ";", i1v1, ";", idx2, ")"))
//
|I1Vp2rj
(tknd, i1v1, lab2) =>
(
print("I1Vp2rj(");
print(tknd, ";", i1v1, ";", lab2, ")"))
//
(* ****** ****** *)
//
|I1Vlam0
(tknd, fjas, icmp) =>
(
print("I1Vlam0(");
print(tknd, ";", fjas, ";", icmp, ")"))
|I1Vfix0
(tknd
,dvar, fjas, icmp) =>
(
print("I1Vfix0(");
print( tknd, ";");
print( dvar, ";", fjas, ";", icmp, ")"))
//
|I1Vnone0() => print( "I1Vnone0(",")" )
|I1Vnone1(i0e1) => print("I1Vnone1(", i0e1, ")")
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
|I1INSopr
( iopr, i1vs) =>
(
print("I1INSopr(");
print(iopr, ";", i1vs, ")"))
//
|I1INSdapp
( i1f0, i1vs) =>
(
print("I1INSdapp(");
print(i1f0, ";", i1vs, ")"))
//
(* ****** ****** *)
//
|I1INStup0(i1vs) =>
( print
  ("I1INStup0(", i1vs, ")"))
//
|I1INStup1
(tknd, i1vs) =>
( print("I1INStup1(")
; print(tknd, ";", i1vs, ")"))
//
|I1INSrcd2
( tknd, livs) =>
( print("I1INSrcd2(")
; print(tknd, ";", livs, ")"))
//
(* ****** ****** *)
//
|I1INSproj
( tknd
, dlab, itup) =>
(print("I1INSproj(");
 print
 (tknd,";",dlab,";",itup,")"))
//
(* ****** ****** *)
//
|I1INSlet0
( dcls, icmp) =>
( print("I1INSlet0(")
; print(dcls, ";", icmp, ")"))
//
|I1INSift0
( test
, ithn, iels) =>
(print("I1INSift0(");
 print
 (test,";",ithn,";",iels,")"))
//
|I1INSassgn
( i1vl, i1vr) =>
( print("I1INSassgn(")
; print(i1vl, ";", i1vr, ")"))
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
print("I1LETnew0(", iins, ")")
|I1LETnew1(itnm, iins) =>
print("I1LETnew1(", itnm, ";", iins, ")")
//
end(*let*)//end-of-[i1let_fprint(out, ilet)]
//
(* ****** ****** *)
//
#implfun
i1bnd_fprint
(out, ibnd) =
let
#impltmp
g_print$out<>() = out
in//let
//
case+ ibnd of
|I1BNDnone() =>
print("I1BNDnone(", ")")
|I1BNDsome(itnm, dsub) =>
print("I1BNDsome(", itnm, ";", dsub, ")")
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
print("I1CMPcons(", ilts, ";", ival, ")")
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
|FJARGdapp(i1bs) =>
(
  print("FJARGdapp(", i1bs, ")"))
//
end (*let*) // end of [fjarg_fprint(out,farg)]
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
print("T1IMPone1(", dcl1 ,")")
*)
//
|T1IMPall1
(d2c1, i0ds) =>
print("T1IMPall1(",d2c1,";",i0ds,")")
//
|T1IMPallx
(d2c1, i0ds) =>
print("T1IMPallx(",d2c1,";",i0ds,")")
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
|I1Dtmpsub
(svts, idcl) =>
print
("I1Dtmpsub(", svts, ";", idcl, ")")
//
|I1Dlocal0
(head, body) =>
print
("I1Dlocal0(", head, ";", body, ")")
//
|
I1Dvaldclst
(tknd, i1vs) =>
print
("I1Dvaldclst(", tknd, ";", i1vs, ")")
|
I1Dvardclst
(tknd, i1vs) =>
print
("I1Dvardclst(", tknd, ";", i1vs, ")")
//
|
I1Dfundclst
( tknd
, d2cs, i1fs) =>
( print("I1Dfundclst(")
; print(tknd, ";", d2cs, ";", i1fs,")"))
//
(* ****** ****** *)
//
|
I1Dimplmnt0
(tknd
,stmp, dimp
,farg, body) =>
( print("I1Dimplmnt0(")
; print(tknd,";",stmp,";")
; print(dimp, ";", farg, ";", body, ")"))
//
(* ****** ****** *)
//
|I1Dnone0() => print( "I1Dnone0(",")" )
|I1Dnone1(dcl1) => print("I1Dnone1(", dcl1, ")")
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
print("I1VALDCL(", dpat, ";", tdxp, ")"))
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
print("I1VARDCL(", dpid, ";", dini, ")"))
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
print
("I1FUNDCL(",dpid,";",farg,";",tdxp,")"))
end(*let*)//end-of-[i1fundcl_fprint(out,ifun)]
//
(* ****** ****** *)
(* ****** ****** *)
//
(***********************************************************************)
(* end of [ATS3/XANADU_srcgen2_xats2js_srcgen1_DATS_intrep1_print0.dats] *)
(***********************************************************************)

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
Fri Nov 24 13:33:19 EST 2023
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
#include
"./../HATS/xinterp_dats.hats"
(* ****** ****** *)
#staload
"./../../../SATS/xbasics.sats"
(* ****** ****** *)
//
#staload "./../SATS/intrep0.sats"
//
(* ****** ****** *)
#symload lctn with irpat_get_lctn
#symload node with irpat_get_node
(* ****** ****** *)
#symload lctn with irexp_get_lctn
#symload node with irexp_get_node
(* ****** ****** *)
#symload lctn with irdcl_get_lctn
#symload node with irdcl_get_node
(* ****** ****** *)
(* ****** ****** *)
//
#implfun
irpat_fprint
(out, irp0) =
let
#impltmp
g_print$out<>() = out
in//let
//
case+
irp0.node() of
//
|
IRPany _ =>
print("IRPany(", ")")
|
IRPvar(d2v) =>
print("IRPvar(", d2v, ")")
//
|
IRPint(int) =>
print("IRPint(", int, ")")
|
IRPbtf(btf) =>
print("IRPbtf(", btf, ")")
|
IRPchr(chr) =>
print("IRPchr(", chr, ")")
|
IRPflt(flt) =>
print("IRPflt(", flt, ")")
|
IRPstr(str) =>
print("IRPstr(", str, ")")
//
|IRPnone0() => print( "IRPnone0(",")" )
|IRPnone1(d3p1) => print( "IRPnone1(", d3p1, ")" )
//
end//let//end-of-[irpat_fprint(out, irp0)]
//
(* ****** ****** *)
(* ****** ****** *)
//
#implfun
irexp_fprint
(out, ire0) =
let
#impltmp
g_print$out<>() = out
in//let
//
case+
ire0.node() of
//
|IREvar(d2v) =>
(
 print("IREvar(", d2v, ")"))
//
|IREint(int) =>
(
 print("IREint(", int, ")"))
|IREchr(btf) =>
(
 print("IREchr(", btf, ")"))
|IREchr(chr) =>
(
 print("IREchr(", chr, ")"))
|IREchr(str) =>
(
 print("IREstr(", str, ")"))
//
|IREcon(d2c) =>
(
 print("IREcon(", d2c, ")"))
|IREcst(d2c) =>
(
 print("IREcst(", d2c, ")"))
//
|IREtimp
( dcst, dimp) =>
print("IREtimp(", dcst, ";", dimp, ")")
//
|IREdapp
( irf0, ires) =>
print("IREdapp(", irf0, ";", ires, ")")
//
|IREift0
( test
, ithn, iels) =>
(
print
("IREift0(", test, ";", ithn, ";", iels, ")"))
//
(* ****** ****** *)
//
|IREtup0
( ires  ) =>
print("IREtup0(", ires, ")")
|IREtup1
( tknd, ires) =>
print("IREtup1(", tknd, ";", ires, ")")
|IRErcd2
( tknd, lirs) =>
print("IREtup1(", tknd, ";", lirs, ")")
//
(* ****** ****** *)
//
|IREnone0() => print( "IREnone0(",")" )
|IREnone1(d3e1) => print( "IREnone1(", d3e1, ")" )
//
(* ****** ****** *)
//
end//let//end-of-[irexp_fprint(out, ire0)]
//
(* ****** ****** *)
(* ****** ****** *)
//
#implfun
irdcl_fprint
(out, ird0) =
let
#impltmp
g_print$out<>() = out
in//let
//
case+
ird0.node() of
//
|IRDd3ecl
(  ird1  ) =>
print("IRDd3ecl(", ird1, ")")
//
|IRDtmpsub
(svts, ird1) =>
print
("IRDtmpsub(", svts, ";", ird1, ")")
//
|IRDlocal0
(head, body) =>
print
("IRDlocal0(", head, ";", body, ")")
//
|IRDinclude
(knd0,tknd
,gsrc,fopt,dopt ) =>
(
print("IRDinclude(");
print
(knd0,";"
,tknd,";",gsrc,";",fopt,";","...",")"))
//
|IRDvaldclst
(tknd, irvs) =>
(
print
("IRDvaldclst(");print(tknd,";",irvs,")"))
|IRDvardclst
(tknd, irvs) =>
(
print
("IRDvardclst(");print(tknd,";",irvs,")"))
//
|IRDfundclst
(tknd
,tqas
,d2cs,irfs) =>
(
print("IRDfundclst(");
print(tknd,";",tqas,";",d2cs,";",irfs,")"))
//
|IRDimplmnt0
(tknd
,stmp
,sqas,tqas
,dqid,tias
,farg,body) =>
(
print("IRDimplmnt0(");
print(tknd,";",stmp,";");
print(sqas,";",tqas,";");
print(dqid,";",tias,";",farg,";",body,")"))
//
|IRDnone1(d3cl) => print( "IRDnone1(", d3cl, ")" )
//
end//let//end-of-[irdcl_fprint(out, ird0)]
//
(* ****** ****** *)
(* ****** ****** *)
//
#implfun
irvaldcl_fprint
  (out, dval) = let
//
val dpat =
irvaldcl_get_dpat(dval)
val tdxp =
irvaldcl_get_tdxp(dval)
//
#impltmp g_print$out<>() = out
//
in//let
print("IRVALDCL(", dpat, ";", tdxp, ")")
end(*let*)//end-of-[irvaldcl_fprint(out,dval)]
//
#implfun
irvardcl_fprint
  (out, dvar) = let
//
val dpid =
irvardcl_get_dpid(dvar)
val vpid =
irvardcl_get_vpid(dvar)
val dini =
irvardcl_get_dini(dvar)
//
#impltmp g_print$out<>() = out
//
in//let
print
("IRVARDCL(",dpid,";",vpid,";",dini,")")
end(*let*)//end-of-[irvardcl_fprint(out,dvar)]
//
(* ****** ****** *)
//
#implfun
irfundcl_fprint
  (out, dfun) = let
//
val dpid =
irfundcl_get_dpid(dfun)
val farg =
irfundcl_get_farg(dfun)
val tdxp =
irfundcl_get_tdxp(dfun)
//
#impltmp g_print$out<>() = out
//
in//let
(
print
("IRFUNDCL(",dpid,";",farg,";",tdxp,")"))
end(*let*)//end-of-[irfundcl_fprint(out,dfun)]
//
(* ****** ****** *)
(* ****** ****** *)

(* end of [ATS3/XANADU_srcgen2_xinterp_srcgen1_DATS_intrep0_print0.dats] *)

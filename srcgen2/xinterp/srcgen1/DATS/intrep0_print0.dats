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
(*
#include
"./../../..\
/HATS/xatsopt_dats.hats"
*)
#include
"./../../..\
/HATS/xatsopt_dpre.hats"
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
//
#symload lctn with irgua_get_lctn
#symload node with irgua_get_node
//
#symload lctn with irgpt_get_lctn
#symload node with irgpt_get_node
//
#symload lctn with ircls_get_lctn
#symload node with ircls_get_node
//
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
prints("IRPany(", ")")
|
IRPvar(d2v) =>
prints("IRPvar(", d2v, ")")
//
|
IRPint(int) =>
prints("IRPint(", int, ")")
|
IRPbtf(btf) =>
prints("IRPbtf(", btf, ")")
|
IRPchr(chr) =>
prints("IRPchr(", chr, ")")
|
IRPflt(flt) =>
prints("IRPflt(", flt, ")")
|
IRPstr(str) =>
prints("IRPstr(", str, ")")
//
|
IRPbang(irp1) =>
prints("IRPbang(", irp1, ")")
//
|
IRPcapp(d2c1, irps) =>
prints("IRPcapp(", d2c1, ";", irps, ")")
//
|
IRPtup0(irps) =>
prints("IRPtup0(", irps, ")")
|
IRPtup1(tknd, irps) =>
prints("IRPtup1(", tknd, ";", irps, ")")
|
IRPrcd2(tknd, lips) =>
prints("IRPrcd2(", tknd, ";", lips, ")")
//
|IRPnone0() => prints( "IRPnone0(",")" )
|IRPnone1(d3p1) => prints("IRPnone1(", d3p1, ")")
//
end(*let*)//end-of-[irpat_fprint(out, irp0)]
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
 prints("IREvar(", d2v, ")"))
//
|IREint(int) =>
(
 prints("IREint(", int, ")"))
|IREbtf(btf) =>
(
 prints("IREbtf(", btf, ")"))
|IREchr(chr) =>
(
 prints("IREchr(", chr, ")"))
|IREstr(str) =>
(
 prints("IREstr(", str, ")"))
//
|IREtop(sym) =>
(
 prints("IREtop(", sym, ")"))
//
|IREcon(d2c) =>
(
 prints("IREcon(", d2c, ")"))
|IREcst(d2c) =>
(
 prints("IREcst(", d2c, ")"))
//
(* ****** ****** *)
//
|IREtimp
( dcst, dimp) =>
prints
("IREtimp(", dcst, ";", dimp, ")")
//
(* ****** ****** *)
//
|IREdap0
( irf0 ) =>
(
 prints("IREdap0(", irf0, ")") )
|IREdapp
( irf0, ires) =>
prints
("IREdapp(", irf0, ";", ires, ")")
//
(* ****** ****** *)
//
|IREpcon
( tknd
, lab1, ire1) =>
prints
("IREpcon(",tknd,";",lab1,";",ire1,")")
|IREproj
( tknd
, lab1, ire1) =>
prints
("IREproj(",tknd,";",lab1,";",ire1,")")
//
(* ****** ****** *)
//
|IRElet0
( irds, ire1) =>
prints("IRElet0(", irds, ";", ire1, ")")
//
(* ****** ****** *)
//
|IREift0
( test
, ithn, iels) =>
(print("IREift0(")
;prints(test, ";", ithn, ";", iels, ")"))
//
|IREcas0
( tknd
, ire1, dcls) =>
(print("IREcas0(")
;prints(tknd, ";", ire1, ";", dcls, ")"))
//
(* ****** ****** *)
//
|IREseqn
( ires, ire1) =>
(
prints("IREseqn(", ires, ";", ire1, ")"))
//
(* ****** ****** *)
//
|IREtup0
( ires ) =>
prints("IREtup0(", ires, ")")
|IREtup1
( tknd, ires) =>
prints("IREtup1(", tknd, ";", ires, ")")
|IRErcd2
( tknd, lies) =>
prints("IRErcd2(", tknd, ";", lies, ")")
//
(* ****** ****** *)
//
|IRElam0
(tknd,fias,body) =>
(print("IRElam0(")
;prints(tknd, ";", fias, ";", body, ")"))
//
|IREfix0
(tknd
,fid0,fias,body) =>
(prints("IREfix0(",tknd,";")
;prints(fid0, ";", fias, ";", body, ")"))
//
(* ****** ****** *)
//
|IREaddr
( ire1 ) =>
(
  prints("IREaddr(", ire1, ")") )
|IREflat
( ire1 ) =>
(
  prints("IREflat(", ire1, ")") )
//
(* ****** ****** *)
|IREfold
( ire1 ) =>
(
  prints("IREfold(", ire1, ")") )
(* ****** ****** *)
|IREfree
( ire1 ) =>
(
  prints("IREfree(", ire1, ")") )
(* ****** ****** *)
//
|
IREdp2tr
( ire1 ) =>
(
  prints("IREdp2tr(", ire1, ")") )
//
|
IREdl0az
( ire1 ) =>
(
  prints("IREdl0az(", ire1, ")") )
|
IREdl1az
( ire1 ) =>
(
  prints("IREdl1az(", ire1, ")") )
//
(* ****** ****** *)
//
|
IREwhere
( ire1, irds) =>
prints("IREwhere(", ire1, ";", irds, ")")
//
(* ****** ****** *)
//
|
IREassgn
( lval, rval) =>
prints("IREassgn(", lval, ";", rval, ")")
//
(* ****** ****** *)
//
|
IREraise
( tknd, ire1) =>
prints("IREraise(", tknd, ";", ire1, ")")
//
(* ****** ****** *)
//
|
IREl0azy
( ire1 ) =>
(
  prints("IREl0azy(", ire1, ")") )
//
|
IREl1azy
( ire1, ires ) =>
prints("IREl1azy(", ire1, ";", ires, ")")
//
(* ****** ****** *)
//
|IREnone0() => prints(  "IREnone0(",")"  )
|IREnone1(d3e1) => prints("IREnone1(", d3e1, ")")
//
(* ****** ****** *)
//
end(*let*)//end-of-[irexp_fprint(out, ire0)]
//
(* ****** ****** *)
//
#implfun
irgua_fprint
(out, dgua) =
let
#impltmp
g_print$out<>() = out
in//let
//
case+
dgua.node() of
|
IRGUAexp(ire1) =>
prints("IRGUAexp(",ire1,")")
|
IRGUAmat(ire1,irp2) =>
prints("IRGUAmat(",ire1,";",irp2,")")
//
end(*let*)//end-of-[irgua_fprint(out,dgua)]
//
(* ****** ****** *)
//
#implfun
irgpt_fprint
(out, dgpt) =
let
#impltmp
g_print$out<>() = out
in//let
case+
dgpt.node() of
|
IRGPTpat(irp1) =>
prints("IRGPTpat(",irp1,")")
|
IRGPTgua(irp1,irgs) =>
prints("IRGPTgua(",irp1,";",irgs,")")
end(*let*)//end-of-[irgpt_fprint(out, dgpt)]
//
#implfun
ircls_fprint
(out, dcls) =
let
#impltmp
g_print$out<>() = out
in//let
case+
dcls.node() of
|
IRCLSgpt(dgpt) =>
prints("IRCLSgpt(",dgpt,")")
|
IRCLScls(irg1,ire2) =>
prints("IRCLScls(",irg1,";",ire2,")")
end(*let*)//end-of-[ircls_fprint(out, ircl)]
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
prints("IRDd3ecl(", ird1, ")")
//
|IRDtmpsub
(svts, ird1) =>
prints
("IRDtmpsub(", svts, ";", ird1, ")")
//
|IRDlocal0
(head, body) =>
prints
("IRDlocal0(", head, ";", body, ")")
//
|IRDinclude
(knd0,tknd
,gsrc,fopt,dopt ) =>
(
print("IRDinclude(");
prints
(knd0,";"
,tknd,";",gsrc,";",fopt,";","...",")"))
//
|IRDvaldclst
(tknd, irvs) =>
(
print
("IRDvaldclst(");prints(tknd,";",irvs,")"))
|IRDvardclst
(tknd, irvs) =>
(
print
("IRDvardclst(");prints(tknd,";",irvs,")"))
//
|IRDfundclst
(tknd
,tqas
,d2cs,irfs) =>
(
print("IRDfundclst(");
prints(tknd,";",tqas,";",d2cs,";",irfs,")"))
//
|IRDimplmnt0
(tknd
,stmp
,sqas,tqas
,dqid,tias
,farg,body) =>
(
print("IRDimplmnt0(");
prints(tknd,";",stmp,";");
prints(sqas,";",tqas,";");
prints(dqid,";",tias,";",farg,";",body,")"))
//
|IRDnone0() => prints(   "IRDnone0(",")"   )
|IRDnone1(d3cl) => prints("IRDnone1(", d3cl, ")")
//
end(*let*)//end-of-[irdcl_fprint(out, ird0)]
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
prints("IRVALDCL(", dpat, ";", tdxp, ")")
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
prints
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
prints
("IRFUNDCL(",dpid,";",farg,";",tdxp,")"))
end(*let*)//end-of-[irfundcl_fprint(out,dfun)]
//
(* ****** ****** *)
(* ****** ****** *)

(***********************************************************************)
(* end of [ATS3/XANADU_srcgen2_xinterp_srcgen1_DATS_intrep0_print0.dats] *)
(***********************************************************************)

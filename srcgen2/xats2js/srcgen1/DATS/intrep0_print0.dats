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
(*
HX: Implementation in ATS3
*)
(* ****** ****** *)
//
// Author: Hongwei Xi
(*
Mon 11 Mar 2024 02:29:52 PM EDT
*)
// Authoremail: gmhwxiATgmailDOTcom
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
//
#include
"share/atspre_staload.hats"
#staload
UN = "prelude/SATS/unsafe.sats"
//
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
#staload
"./../../../SATS/xbasics.sats"
(* ****** ****** *)
#staload // D2E =
"./../../../SATS/dynexp2.sats"
#staload // D3E =
"./../../../SATS/dynexp3.sats"
(* ****** ****** *)
(* ****** ****** *)
#staload "./../SATS/intrep0.sats"
(* ****** ****** *)
(* ****** ****** *)
#symload lctn with d3pat_get_lctn
#symload lctn with d3exp_get_lctn
#symload lctn with d3ecl_get_lctn
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
#symload lctn with i0gua_get_lctn
#symload lctn with i0gpt_get_lctn
#symload lctn with i0cls_get_lctn
(* ****** ****** *)
#symload node with i0gua_get_node
#symload node with i0gpt_get_node
#symload node with i0cls_get_node
(* ****** ****** *)
#symload lctn with t0imp_get_stmp
#symload node with t0imp_get_node
(* ****** ****** *)
#symload lctn with i0dcl_get_lctn
#symload node with i0dcl_get_node
(* ****** ****** *)
(* ****** ****** *)
//
#implfun
i0pat_fprint
(out, i0p0) =
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
case+
i0p0.node() of
//
(* ****** ****** *)
//
(*
|I0Pnil() =>
prints("I0Pnil(",")")
*)
//
(* ****** ****** *)
//
|I0Pany() =>
prints("I0Pany(",")")
|I0Pvar(d2v) =>
prints("I0Pvar(",d2v,")")
//
(* ****** ****** *)
//
|I0Pint(tok) =>
prints("I0Pint(",tok,")")
|I0Pbtf(sym) =>
prints("I0Pbtf(",sym,")")
|I0Pchr(tok) =>
prints("I0Pchr(",tok,")")
|I0Pstr(tok) =>
prints("I0Pstr(",tok,")")
//
(* ****** ****** *)
|I0Pcon(d2c) =>
prints("I0Pcon(",d2c,")")
(* ****** ****** *)
//
|I0Pbang i0p1 =>
prints("I0Pbang(",i0p1,")")
|I0Pflat i0p1 =>
prints("I0Pflat(",i0p1,")")
|I0Pfree i0p1 =>
prints("I0Pfree(",i0p1,")")
//
(* ****** ****** *)
|I0Pdap1 i0f0 =>
prints("I0Pdap1(",i0f0,")")
(* ****** ****** *)
//
|I0Pdapp
( i0f0,i0ps ) =>
prints("I0Pdapp(",i0f0,";",i0ps,")")
//
(* ****** ****** *)
//
|I0Ptup0(i0ps) =>
prints("I0Ptup0(",i0ps,")")
|I0Ptup1
( tknd,i0ps ) =>
prints("I0Ptup1(",tknd,";",i0ps,")")
//
(* ****** ****** *)
//
|I0Pnone0() =>
(
  prints( "I0Pnone0(",")" ))
//
|I0Pnone1(d3p1) =>
let
val loc0 = d3p1.lctn() in//let
prints
("I0Pnone1(", loc0, ";", d3p1, ")") end
//
(* ****** ****** *)
//
end(*let*)//end-of-[i0pat_fprint(out, i0p0)]
//
(* ****** ****** *)
(* ****** ****** *)
//
#implfun
i0exp_fprint
(out, i0e0) =
let
#impltmp
g_print$out<>() = out
in//let
//
case+
i0e0.node() of
//
|I0Eint(int) =>
(
 prints("I0Eint(", int, ")"))
|I0Ebtf(btf) =>
(
 prints("I0Ebtf(", btf, ")"))
|I0Echr(chr) =>
(
 prints("I0Echr(", chr, ")"))
|I0Estr(str) =>
(
 prints("I0Estr(", str, ")"))
//
(* ****** ****** *)
//
|I0Evar(d2v) =>
(
 prints("I0Evar(", d2v, ")"))
//
(* ****** ****** *)
//
|I0Econ(d2c) =>
(
 prints("I0Econ(", d2c, ")"))
|I0Ecst(d2c) =>
(
 prints("I0Ecst(", d2c, ")"))
//
(* ****** ****** *)
//
|I0Etimp
(i0e1, timp) =>
(
prints
("I0Etimp(", i0e1, ";", timp, ")"))
//
(* ****** ****** *)
//
|I0Etapp
(  i0f0  ) =>
(
  prints("I0Etapp(", i0f0, ")"))
//
|I0Etapq
(i0f0, tjas) =>
(
prints
("I0Etapq(", i0f0, ";", tjas, ")"))
//
(* ****** ****** *)
//
|I0Edap0
(  i0f0  ) =>
(
  prints("I0Edap0(", i0f0, ")"))
//
|I0Edapp
(i0f0, i0es) =>
prints("I0Edapp(", i0f0, ";", i0es, ")")
//
(* ****** ****** *)
//
|I0Epcon
(lab0, i0e1) =>
prints("I0Epcon(", lab0, ";", i0e1, ")")
//
|I0Epflt
(lab0, i0e1) =>
prints("I0Epflt(", lab0, ";", i0e1, ")")
//
|I0Eproj
(lab0, i0e1) =>
prints("I0Eproj(", lab0, ";", i0e1, ")")
//
(* ****** ****** *)
//
|I0Elet0
(dcls, i0e1) =>
(
prints("I0Elet0(", dcls, ";", i0e1, ")"))
//
(* ****** ****** *)
//
|I0Eift0
(test
,ithn, iels) =>
(print("I0Eift0(")
;prints(test, ";", ithn, ";", iels, ")"))
//
|I0Ecas0
(tknd
,i0e1, icls) =>
(print("I0Ecas0(")
;prints(tknd, ";", i0e1, ";", icls, ")"))
//
(* ****** ****** *)
//
|I0Eseqn
(i0es, i0e1) =>
(
prints("I0Eseqn(", i0es, ";", i0e1, ")"))
//
(* ****** ****** *)
//
|I0Etup0
( i0es ) =>
prints("I0Etup0(", i0es, ")")
|I0Etup1
(tknd, i0es) =>
(
prints("I0Etup1(", tknd, ";", i0es, ")"))
|I0Ercd2
(tknd, lies) =>
(
prints("I0Ercd2(", tknd, ";", lies, ")"))
//
(* ****** ****** *)
//
|I0Elam0
(tknd,fias,body) =>
(print("I0Elam0(")
;prints(tknd, ";", fias, ";", body, ")"))
//
|I0Efix0
(tknd
,fid0,fias,body) =>
(prints("I0Efix0(",tknd,";")
;prints(fid0, ";", fias, ";", body, ")"))
//
(* ****** ****** *)
//
|I0Eaddr
( i0e1 ) =>
(
  prints("I0Eaddr(", i0e1, ")") )//I0Eaddr
//
|I0Eflat
( i0e1 ) =>
(
  prints("I0Eflat(", i0e1, ")") )//I0Eflat
//
|I0Eeval
( i0e1 ) =>
(
  prints("I0Eeval(", i0e1, ")") )//I0Eeval
//
|I0Efold
( i0e1 ) =>
(
  prints("I0Efold(", i0e1, ")") )//I0Efold
//
|I0Efree
( i0e1 ) =>
(
  prints("I0Efree(", i0e1, ")") )//I0Efree
//
(* ****** ****** *)
//
|
I0Edl0az
( i0e1 ) =>
(
 prints("I0Edl0az(", i0e1, ")") )//de-l0az
|
I0Edl1az
( i0e1 ) =>
(
 prints("I0Edl1az(", i0e1, ")") )//de-l1az
//
|
I0Edp2tr
( i0e1 ) =>
(
 prints("I0Edp2tr(", i0e1, ")") )//de-p2tr
//
(* ****** ****** *)
//
|I0Ewhere
(i0e1, dcls) =>
(
 prints("I0Ewhere(", i0e1, ";", dcls, ")"))
//
(* ****** ****** *)
//
|I0Eassgn
(i0el, i0er) =>
(
 prints("I0Eassgn(", i0el, ";", i0er, ")"))
//
|I0Eraise
(tknd, iexn) =>
(
 prints("I0Eraise(", tknd, ";", iexn, ")"))
//
(* ****** ****** *)
//
|I0El0azy
(dknd, i0e1) =>
(
prints
("I0El0azy(", dknd, ";", i0e1, ")"))
|I0El1azy
(dknd
,i0e1, i0es) =>
( print("I0El1azy(")
; prints( dknd, ";", i0e1, ";", i0es, ")"))
//
(* ****** ****** *)
(* ****** ****** *)
//
|I0Eextnam
(tknd, gnam) =>
(
prints("I0Eextnam(", tknd, ";", gnam, ")"))
//
(* ****** ****** *)
//
|I0Esynext
(tknd, gexp) =>
(
prints("I0Esynext(", tknd, ";", gexp, ")"))
//
(* ****** ****** *)
(* ****** ****** *)
//
|I0Enone0() =>
(
  prints( "I0Enone0(",")" ))
|I0Enone1(d3e1) =>
let
val
loc0 = d3e1.lctn() in//let
(
  prints("I0Enone1(", loc0, ";", d3e1, ")"))
end//let//end-of-[I0Enone1(d3e1)]
//
(* ****** ****** *)
(* ****** ****** *)
//
end(*let*)//end-of-[i0exp_fprint(out, i0e0)]
//
(* ****** ****** *)
(* ****** ****** *)
//
#implfun
fiarg_fprint
(out, farg) =
let
#impltmp
g_print$out<>() = out
in//let
//
case+
farg.node() of
|FIARGdarg(i0ps) =>
(
  prints("FIARGdarg(", i0ps, ")"))
//
end (*let*) // end of [fiarg_fprint(out,farg)]
//
(* ****** ****** *)
(* ****** ****** *)
//
#implfun
i0gua_fprint
(out, igua) =
let
#impltmp
g_print$out<>() = out
in//let
//
case+
igua.node() of
|
I0GUAexp(i0e1) =>
prints("I0GUAexp(",i0e1,")")
|
I0GUAmat(i0e1,i0p2) =>
prints("I0GUAmat(",i0e1,";",i0p2,")")
//
end (*let*) // end of [i0gua_fprint(out,igua)]
//
(* ****** ****** *)
//
#implfun
i0gpt_fprint
(out, igpt) =
let
#impltmp
g_print$out<>() = out
in//let
case+
igpt.node() of
|
I0GPTpat(i0p1) =>
prints("I0GPTpat(",i0p1,")")
|
I0GPTgua(i0p1,i0gs) =>
prints("I0GPTgua(",i0p1,";",i0gs,")")
end (*let*) // end of [i0gpt_fprint(out,igpt)]
//
#implfun
i0cls_fprint
(out, icls) =
let
#impltmp
g_print$out<>() = out
in//let
case+
icls.node() of
|
I0CLSgpt(igpt) =>
prints("I0CLSgpt(",igpt,")")
|
I0CLScls(i0g1,i0e2) =>
prints("I0CLScls(",i0g1,";",i0e2,")")
end (*let*) // end of [i0cls_fprint(out,icls)]
//
(* ****** ****** *)
(* ****** ****** *)
//
#implfun
t0imp_fprint
(out, timp) =
let
#implfun
g_print$out<>() = out
in//let
case+
timp.node() of
//
(*
|T0IMPone1
(  dcl1  ) =>
prints("T0IMPone1(", dcl1 ,")")
*)
//
|T0IMPall1
(d2c1, i0ds) =>
prints("T0IMPall1(",d2c1,";",i0ds,")")
//
|T0IMPallx
(d2c1, i0ds) =>
prints("T0IMPallx(",d2c1,";",i0ds,")")
//
end (*let*) // end of [t0imp_fprint(...)]
//
(* ****** ****** *)
(* ****** ****** *)
//
#implfun
i0dcl_fprint
(out, dcl0) =
let
#impltmp
g_print$out<>() = out
in//let
//
case+
dcl0.node() of
//
|I0Dd3ecl
(  d3cl  ) =>
prints("I0Dd3ecl(", d3cl, ")")
//
(* ****** ****** *)
//
|I0Dstatic
(tknd, dcl1) =>
prints
("I0Dstatic(", tknd, ";", dcl1, ")")
//
|I0Dextern
(tknd, dcl1) =>
prints
("I0Dextern(", tknd, ";", dcl1, ")")
//
(* ****** ****** *)
//
|I0Dlocal0
(head, body) =>
prints
("I0Dlocal0(", head, ";", body, ")")
//
(* ****** ****** *)
//
|I0Dtmpsub
(svts, idcl) =>
prints
("I0Dtmpsub(", svts, ";", idcl, ")")
//
(* ****** ****** *)
|
I0Dinclude
( knd0, tknd
, gsrc, fopt, dopt ) =>
(
print("I0Dinclude(");
prints
(
knd0,";",
tknd,";",gsrc,";",fopt,";","...",")"))
//
(* ****** ****** *)
(* ****** ****** *)
//
(*
HX-2024-07-20:
Sat 20 Jul 2024 07:38:45 PM EDT
*)
//
|I0Ddyninit
( tknd, gexp) =>
(
prints("I0Ddyninit(",tknd,";",gexp,")"))
//
|I0Dextcode
( tknd, gexp) =>
(
prints("I0Dextcode(",tknd,";",gexp,")"))
//
(* ****** ****** *)
(* ****** ****** *)
//
|I0Dvaldclst
( tknd, i0vs) =>
(
prints("I0Dvaldclst(",tknd,";",i0vs,")"))
//
|I0Dvardclst
( tknd, i0vs) =>
(
prints("I0Dvardclst(",tknd,";",i0vs,")"))
//
(* ****** ****** *)
//
|I0Dfundclst
( tknd
, d2cs, i0fs) =>
( print("I0Dfundclst(")
; prints(tknd, ";", d2cs, ";", i0fs, ")"))
//
(* ****** ****** *)
//
|I0Dimplmnt0
( tknd
, stmp, dimp
, farg, body) =>
( print("I0Dimplmnt0(")
; prints(tknd,";",stmp,";")
; prints(dimp, ";", farg, ";", body, ")"))
//
(* ****** ****** *)
//
|I0Dnone0() =>
(
  prints( "I0Dnone0(",")" ))
//
|I0Dnone1(d3cl) =>
let
val
loc0 = d3cl.lctn() in//let
(
  prints("I0Dnone1(", loc0, ";", d3cl, ")"))
end//let//end-of-[I0Dnone1(d3cl)]
//
(* ****** ****** *)
//
end(*let*)//end-of-[i0dcl_fprint(out, dcl0)]
//
(* ****** ****** *)
(* ****** ****** *)

#implfun
i0valdcl_fprint
  (out, ival) = let
//
val dpat =
i0valdcl_get_dpat(ival)
val tdxp =
i0valdcl_get_tdxp(ival)
//
#impltmp g_print$out<>() = out
//
in//let
(
prints("I0VALDCL(", dpat, ";", tdxp, ")"))
end(*let*)//end-of-[i0valdcl_fprint(out,ival)]

(* ****** ****** *)
//
#implfun
i0vardcl_fprint
  (out, ivar) = let
//
val dpid =
i0vardcl_get_dpid(ivar)
val dini =
i0vardcl_get_dini(ivar)
//
#impltmp g_print$out<>() = out
//
in//let
(
prints("I0VARDCL(", dpid, ";", dini, ")"))
end(*let*)//end-of-[i0vardcl_fprint(out,ivar)]
//
(* ****** ****** *)
//
#implfun
i0fundcl_fprint
  (out, ifun) = let
//
val dpid =
i0fundcl_get_dpid(ifun)
val farg =
i0fundcl_get_farg(ifun)
val tdxp =
i0fundcl_get_tdxp(ifun)
//
#impltmp g_print$out<>() = out
//
in//let
(
prints
("I0FUNDCL(",dpid,";",farg,";",tdxp,")"))
end(*let*)//end-of-[i0fundcl_fprint(out,ifun)]
//
(* ****** ****** *)
(* ****** ****** *)
//
#implfun
i0parsed_fprint
  (out, ipar) = let
//
val
stadyn =
i0parsed_get_stadyn(ipar)
val
nerror =
i0parsed_get_nerror(ipar)
val
source =
i0parsed_get_source(ipar)
val
parsed =
i0parsed_get_parsed(ipar)
//
#impltmp g_print$out<>() = out
//
in//let
(
print("I0PARSED(");
prints
(stadyn,";",nerror,";",source,";",parsed,")"))
end (*let*) // end-of-[i0parsed_fprint(out,ipar)]
//
(* ****** ****** *)
(* ****** ****** *)
//
(***********************************************************************)
(* end of [ATS3/XANADU_srcgen2_xats2js_srcgen1_DATS_intrep0_print0.sats] *)
(***********************************************************************)

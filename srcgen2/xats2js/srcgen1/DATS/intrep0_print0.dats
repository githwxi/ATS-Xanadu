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
"./../HATS/xats2js_dats.hats"
(* ****** ****** *)
#staload
"./../../../SATS/xbasics.sats"
(* ****** ****** *)
#staload // D2E =
"./../../../SATS/dynexp2.sats"
(* ****** ****** *)
(* ****** ****** *)
#staload "./../SATS/intrep0.sats"
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
print("I0Pnil(",")")
*)
//
(* ****** ****** *)
//
|I0Pany() =>
print("I0Pany(",")")
|I0Pvar(d2v) =>
print("I0Pvar(",d2v,")")
//
(* ****** ****** *)
//
|I0Pint(tok) =>
print("I0Pint(",tok,")")
|I0Pbtf(sym) =>
print("I0Pbtf(",sym,")")
|I0Pchr(tok) =>
print("I0Pchr(",tok,")")
|I0Pstr(tok) =>
print("I0Pstr(",tok,")")
//
(* ****** ****** *)
|I0Pcon(d2c) =>
print("I0Pcon(",d2c,")")
(* ****** ****** *)
//
|
I0Pbang i0p1 =>
print("I0Pbang(",i0p1,")")
|
I0Pflat i0p1 =>
print("I0Pflat(",i0p1,")")
|
I0Pfree i0p1 =>
print("I0Pfree(",i0p1,")")
//
(* ****** ****** *)
//
|
I0Pdapp
( i0f0,i0ps ) =>
print("I0Pdapp(",i0f0,";",i0ps,")")
//
(* ****** ****** *)
//
|
I0Ptup0(i0ps) =>
print("I0Ptup0(",i0ps,")")
|
I0Ptup1
( tknd,i0ps ) =>
print("I0Ptup1(",tknd,";",i0ps,")")
//
(* ****** ****** *)
//
|I0Pnone0() => print( "I0Pnone0(",")" )
|I0Pnone1(d3p1) => print("I0Pnone1(", d3p1, ")")
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
 print("I0Eint(", int, ")"))
|I0Ebtf(btf) =>
(
 print("I0Ebtf(", btf, ")"))
|I0Echr(chr) =>
(
 print("I0Echr(", chr, ")"))
|I0Estr(str) =>
(
 print("I0Estr(", str, ")"))
//
(* ****** ****** *)
//
|I0Evar(d2v) =>
(
 print("I0Evar(", d2v, ")"))
//
(* ****** ****** *)
//
|I0Econ(d2c) =>
(
 print("I0Econ(", d2c, ")"))
|I0Ecst(d2c) =>
(
 print("I0Ecst(", d2c, ")"))
//
(* ****** ****** *)
//
|I0Etimp
(i0e1, timp) =>
(
print("I0Etimp(",i0e1,";",timp,")"))
//
(* ****** ****** *)
//
|I0Etapp(i0f0) =>
(
  print("I0Etapp(", i0f0, ")"))
|I0Etapq(i0f0) =>
(
  print("I0Etapq(", i0f0, ")"))
//
(* ****** ****** *)
//
|I0Edapp
(i0f0, i0es) =>
print("I0Edapp(", i0f0, ";", i0es, ")")
//
(* ****** ****** *)
//
|I0Epcon
(tknd
,lab0, i0e1) =>
(
print("I0Epcon(");
print(tknd, ";", lab0, ";", i0e1, ")"))
//
|I0Epflt
(tknd
,lab0, i0e1) =>
(
print("I0Epflt(");
print(tknd, ";", lab0, ";", i0e1, ")"))
//
|I0Eproj
(tknd
,lab0, i0e1) =>
(
print("I0Eproj(");
print(tknd, ";", lab0, ";", i0e1, ")"))
//
(* ****** ****** *)
//
|I0Elet0
(dcls, i0e1) =>
(
print("I0Elet0(", dcls, ";", i0e1, ")"))
//
(* ****** ****** *)
//
|I0Eift0
(test
,ithn, iels) =>
(print("I0Eift0(")
;print(test, ";", ithn, ";", iels, ")"))
//
|I0Ecas0
(tknd
,i0e1, icls) =>
(print("I0Ecas0(")
;print(tknd, ";", i0e1, ";", icls, ")"))
//
(* ****** ****** *)
//
|I0Eseqn
(i0es, i0e1) =>
(
print("I0Eseqn(", i0es, ";", i0e1, ")"))
//
(* ****** ****** *)
//
|I0Etup0
( i0es ) =>
print("I0Etup0(", i0es, ")")
|I0Etup1
(tknd, i0es) =>
(
print("I0Etup1(", tknd, ";", i0es, ")"))
|I0Ercd2
(tknd, lies) =>
(
print("I0Ercd2(", tknd, ";", lies, ")"))
//
(* ****** ****** *)
//
|I0Elam0
(tknd,fias,body) =>
(print("I0Elam0(")
;print(tknd, ";", fias, ";", body, ")"))
//
|I0Efix0
(tknd
,fid0,fias,body) =>
(print("I0Efix0(",tknd,";")
;print(fid0, ";", fias, ";", body, ")"))
//
(* ****** ****** *)
//
|I0Eaddr
( i0e1 ) =>
(
  print("I0Eaddr(", i0e1, ")") )//I0Eaddr
//
|I0Eflat
( i0e1 ) =>
(
  print("I0Eflat(", i0e1, ")") )//I0Eflat
//
|I0Efold
( i0e1 ) =>
(
  print("I0Efold(", i0e1, ")") )//I0Efold
|I0Efree
( i0e1 ) =>
(
  print("I0Efree(", i0e1, ")") )//I0Efree
//
(* ****** ****** *)
//
|
I0Edl0az
( i0e1 ) =>
(
 print("I0Edl0az(", i0e1, ")") )//de-l0az
|
I0Edl1az
( i0e1 ) =>
(
 print("I0Edl1az(", i0e1, ")") )//de-l1az
//
|
I0Edp2tr
( i0e1 ) =>
(
 print("I0Edp2tr(", i0e1, ")") )//de-p2tr
//
(* ****** ****** *)
//
|I0Ewhere
(i0e1, dcls) =>
(
 print("I0Ewhere(", i0e1, ";", dcls, ")"))
//
(* ****** ****** *)
//
|I0Eassgn
(i0el, i0er) =>
(
 print("I0Eassgn(", i0el, ";", i0er, ")"))
//
|I0Eraise
(tknd, iexn) =>
(
 print("I0Eraise(", tknd, ";", iexn, ")"))
//
(* ****** ****** *)
//
|I0El0azy
(dknd, i0e1) =>
(
 print("I0El0azy(", dknd, ";", i0e1, ")"))
|I0El1azy
(dknd
,i0e1, i0es) =>
( print("I0El1azy(")
; print( dknd, ";", i0e1, ";", i0es, ")"))
//
(* ****** ****** *)
(* ****** ****** *)
//
|I0Eextnam
(tknd, gnam) =>
(
print("I0Eextnam(", tknd, ";", gnam, ")"))
//
(* ****** ****** *)
(* ****** ****** *)
//
|I0Enone0() => print( "I0Enone0(",")" )
|I0Enone1(d3e1) => print("I0Enone1(", d3e1, ")")
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
  print("FIARGdarg(", i0ps, ")"))
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
print("I0GUAexp(",i0e1,")")
|
I0GUAmat(i0e1,i0p2) =>
print("I0GUAmat(",i0e1,";",i0p2,")")
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
print("I0GPTpat(",i0p1,")")
|
I0GPTgua(i0p1,i0gs) =>
print("I0GPTgua(",i0p1,";",i0gs,")")
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
print("I0CLSgpt(",igpt,")")
|
I0CLScls(i0g1,i0e2) =>
print("I0CLScls(",i0g1,";",i0e2,")")
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
print("T0IMPone1(", dcl1 ,")")
*)
//
|T0IMPall1
(d2c1, i0ds) =>
print("T0IMPall1(",d2c1,";",i0ds,")")
//
|T0IMPallx
(d2c1, i0ds) =>
print("T0IMPallx(",d2c1,";",i0ds,")")
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
print("I0Dd3ecl(", d3cl, ")")
//
(* ****** ****** *)
//
|I0Dextern
(tknd, dcl1) =>
print
("I0Dextern(", tknd, ";", dcl1, ")")
//
|I0Dstatic
(tknd, dcl1) =>
print
("I0Dstatic(", tknd, ";", dcl1, ")")
//
(* ****** ****** *)
//
|I0Dlocal0
(head, body) =>
print
("I0Dlocal0(", head, ";", body, ")")
//
(* ****** ****** *)
//
|I0Dtmpsub
(svts, idcl) =>
print
("I0Dtmpsub(", svts, ";", idcl, ")")
//
(* ****** ****** *)
|
I0Dinclude
( knd0, tknd
, gsrc, fopt, dopt ) =>
(
print("I0Dinclude(");
print
(
knd0,";",
tknd,";",gsrc,";",fopt,";","...",")"))
(* ****** ****** *)
//
|I0Dvaldclst
(  tknd, i0vs  ) =>
(
print("I0Dvaldclst(",tknd,";",i0vs,")"))
//
|I0Dvardclst
(  tknd, i0vs  ) =>
(
print("I0Dvardclst(",tknd,";",i0vs,")"))
//
(* ****** ****** *)
//
|I0Dfundclst
(tknd,d2cs,i0fs) =>
( print("I0Dfundclst(")
; print(tknd, ";", d2cs, ";", i0fs, ")"))
//
(* ****** ****** *)
//
|I0Dimplmnt0
(tknd
,stmp
,dimp,farg,body) =>
( print("I0Dimplmnt0(")
; print(tknd,";",stmp,";")
; print(dimp, ";", farg, ";", body, ")"))
//
(* ****** ****** *)
//
|I0Dnone0() => print( "I0Dnone0(",")" )
|I0Dnone1(d3cl) => print("I0Dnone1(", d3cl, ")")
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
print("I0VALDCL(", dpat, ";", tdxp, ")"))
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
print("I0VARDCL(", dpid, ";", dini, ")"))
end(*let*)//end-of-[i0vardcl_fprint(out,ivar)]
//
(* ****** ****** *)

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
print
("I0FUNDCL(",dpid,";",farg,";",tdxp,")"))
end(*let*)//end-of-[i0fundcl_fprint(out,ifun)]

(* ****** ****** *)
(* ****** ****** *)

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
print
("I0PARSED(");
print
(stadyn,";",nerror,";",source,";",parsed,")"))
end (*let*) // end-of-[i0parsed_fprint(out,ipar)]

(* ****** ****** *)
(* ****** ****** *)

(***********************************************************************)
(* end of [ATS3/XANADU_srcgen2_xats2js_srcgen1_DATS_intrep0_print0.sats] *)
(***********************************************************************)

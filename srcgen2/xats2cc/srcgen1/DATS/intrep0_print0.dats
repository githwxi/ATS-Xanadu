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
Mon Mar  9 02:57:23 PM EDT 2026
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
/HATS/xatsopt_dpre.hats"
(* ****** ****** *)
(* ****** ****** *)
#include
"./../HATS/mytmplib00.hats"
(* ****** ****** *)
#staload
"./../../../SATS/dynexp2.sats"
#staload
"./../../../SATS/dynexp3.sats"
(* ****** ****** *)
//
#staload "./../SATS/intrep0.sats"
//
(* ****** ****** *)
(* ****** ****** *)
//
#symload node with i0typ_node$get
#symload node with i0pat_node$get
#symload node with i0exp_node$get
//
(* ****** ****** *)
(* ****** ****** *)
//
#implfun
i0typ_fprint
(ityp, out0) =
let
//
#impltmp
g_print$out
<(*0*)>((*0*)) = out0
//
in//let
//
case+
ityp.node() of
(* ****** ****** *)
//
|I0Tcst(s2c) =>
prints("I0Tcst(", s2c, ")")
|I0Tvar(s2v) =>
prints("I0Tvar(", s2v, ")")
//
(* ****** ****** *)
//
|I0Tlft
(   i0t1   ) =>
(
prints("I0Tlft(", i0t1, ")"))
//
(* ****** ****** *)
//
|I0Ttop0
(   i0t1   ) =>
prints("I0Ttop0(", i0t1, ")")
|I0Ttop1
(   i0t1   ) =>
prints("I0Ttop1(", i0t1, ")")
//
(* ****** ****** *)
//
|I0Tapps
(i0f0, i0ts) =>
prints
("I0Tapps(", i0f0, ";", i0ts, ")")
|I0Tlam1
(s2vs, i0t1) =>
prints
("I0Tlam1(", s2vs, ";", i0t1, ")")
//
(* ****** ****** *)
//
|I0Texi0
(s2vs, i0t1) =>
prints
("I0Texi0(", s2vs, ";", i0t1, ")")
|I0Tuni0
(s2vs, i0t1) =>
prints
("I0Tuni0(", s2vs, ";", i0t1, ")")
//
(* ****** ****** *)
//
|I0Ttcon
(d2c1, i0ts) =>
prints
("I0Ttcon(", d2c1, ";", i0ts, ")")
|I0Ttrcd
(tknd
,npf1, lits) =>
(
prints("I0Ttcon(",
  tknd, ";", npf1, ";", lits, ")"))
//
(* ****** ****** *)
//
|I0Ttext
(name, i0ts) =>
(
prints
("I0Ttext(", name, ";", i0ts, ")"))
//
(* ****** ****** *)
//
|I0Tnone0() =>
(
  prints("I0Tnone0(", ")"))
|I0Tnone1
(   t2p1   ) =>
(
  prints( "I0Tnone1(", t2p1, ")" ))
//
(* ****** ****** *)
//
end(*let*)//end-of-[i0typ_fprint(ityp,out0)]
//
(* ****** ****** *)
(* ****** ****** *)
//
#implfun
i0pat_fprint
(ipat, out0) =
let
//
#impltmp
g_print$out
<(*0*)>((*0*)) = out0
//
in//let
//
case+
ipat.node() of
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
|I0Pbang
(   i0p1   ) =>
prints("I0Pbang(",i0p1,")")
|I0Pflat
(   i0p1   ) =>
prints("I0Pflat(",i0p1,")")
|I0Pfree
(   i0p1   ) =>
prints("I0Pfree(",i0p1,")")
//
(* ****** ****** *)
//
|I0Pdap1
(   i0f0   ) =>
prints("I0Pdap1(",i0f0,")")
|I0Pdapp
(i0f0
,npf1, i0ps) =>
(
print("I0Pdapp(");
prints(i0f0,";",npf1,";",i0ps,")"))
//
(* ****** ****** *)
//
|I0Ptup0
(   i0ps   ) =>
prints("I0Ptup0(",i0ps,")")
|I0Ptup1
(tknd, i0ps) =>
prints("I0Ptup1(",tknd,";",i0ps,")")
//
(* ****** ****** *)
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
(* ****** ****** *)
//
end(*let*)//end-of-[i0pat_fprint(ipat,out0)]
//
(* ****** ****** *)
(* ****** ****** *)
//
#implfun
i0var_fprint
(ivar, out0) =
let
//
#impltmp
g_print$out
<(*0*)>((*0*)) = out0
//
val lvl0 = ivar.lvl0()
val dvar = ivar.dvar()
val ityp = ivar.ityp()
//
in//let
(
print("I0VAR(");
prints(lvl0,";",dvar,";",ityp,")"))
end(*let*)//end-of-[i0var_fprint(ivar,out0)]
//
(* ****** ****** *)
(* ****** ****** *)
//
#implfun
i0exp_fprint
(iexp, out0) =
let
//
#impltmp
g_print$out
<(*0*)>((*0*)) = out0
//
(*
val () =
prints("\
i0exp_fprint: \
loc0 = ", iexp.lctn())
*)
//
in//let
//
case+
iexp.node() of
//
(* ****** ****** *)
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
|I0Eflt(flt) =>
(
prints("I0Eflt(", flt, ")"))
|I0Estr(str) =>
(
prints("I0Estr(", str, ")"))
//
(* ****** ****** *)
//
|I0Evar
(   i0v1   ) =>
(
prints("I0Evar(", i0v1, ")"))
//
(* ****** ****** *)
//
|I0Econ
(   d2c1   ) =>
(
prints("I0Econ(", d2c1, ")"))
//
|I0Ecst
(   d2c1   ) =>
(
prints("I0Ecst(", d2c1, ")"))
//
(* ****** ****** *)
//
|I0Esapp
(i0f0, s2es) =>
(
prints("\
I0Esapp(", i0f0, ";", s2es, ")"))
//
|I0Esapq
(i0f0, i0ts) =>
(
prints("\
I0Esapq(", i0f0, ";", i0ts, ")"))
//
(* ****** ****** *)
//
|I0Etapp
(i0f0, s2es) =>
(
prints(
"I0Etapp(", i0f0, ";", s2es, ")"))
//
|I0Etapq
(i0f0, ijgs) =>
(
prints(
"I0Etapq(", i0f0, ";", ijgs, ")"))
//
(* ****** ****** *)
//
|I0Edap0
(   i0f0   ) =>
prints("I0Edap0(", ")")
|I0Edapp
(i0f0
,npf1, i0es) =>
(
print("I0Edapp(");
prints(i0f0,";", npf1,";", i0es,")"))
//
(* ****** ****** *)
//
|I0Elam0
(lvl0
,tknd
,fias
,body, denv) =>
(
print("I0Elam0(");
prints(lvl0,";", tknd,";");
prints(fias,";", body,";", denv,")"))
//
|I0Efix0
(lvl0
,tknd
,fid0, fias
,body, denv) =>
(
print("I0Efix0(");
prints(
lvl0,";", tknd,";");
prints(
fid0,";", fias,";", body,";", denv,")"))
//
(* ****** ****** *)
//
|I0Edp2tr
(   i0e1    ) =>
(
prints("I0Edp2tr(", i0e1, ")"))//de-p2tr
//
|I0Edl0az
(   i0e1    ) =>
(
prints("I0Edl0az(", i0e1, ")"))//de-l0az
|I0Edl1az
(   i0e1    ) =>
(
prints("I0Edl1az(", i0e1, ")"))//de-l1az
//
(* ****** ****** *)
(* ****** ****** *)
//
|
I0Enone0() =>
let
val
loc0 = iexp.lctn() in//let
(
prints( "I0Enone0(", loc0, ")" )) end
//
|
I0Enone1(d3e1) =>
let
val
loc0 = iexp.lctn() in//let
(
prints
("I0Enone1(", loc0, ";", d3e1, ")")) end
//
(* ****** ****** *)
//
end(*let*)//end-of-[i0exp_fprint(iexp,out0)]
//
(* ****** ****** *)
(* ****** ****** *)
//
#implfun
fiarg_fprint
(farg, out0) =
let
#impltmp
g_print$out<>() = out0
in//let
//
case+
farg.node() of
|FIARGsapp
(s2vs, s2ps) =>
(
prints("\
FIARGsapp(",s2vs,";",s2ps,")"))
|FIARGmets
(   s2es   ) =>
(
prints("FIARGmets(", s2es, ")"))
//
|FIARGdapp
(npf1, i0ps) =>
(
prints("\
FIARGdapp(", npf1, ";", i0ps, ")"))
//
end(*let*)//end-of-[fiarg_fprint(farg,out0)]
//
(* ****** ****** *)
(* ****** ****** *)
//
#implfun
i0dcl_fprint
(idcl, out0) =
let
//
#impltmp
g_print$out
<(*0*)>((*0*)) = out0
//
in//let
//
case+
idcl.node() of
(* ****** ****** *)
(* ****** ****** *)
//
|I0Dd3ecl(d3cl) =>
(
 prints("I0Dd3ecl(", d3cl, ")"))
//
(* ****** ****** *)
(* ****** ****** *)
//
|I0Dstatic
(tknd, dcl1) =>
prints("\
I0Dstatic(", tknd, ";", dcl1, ")")
//
|I0Dextern
(tknd, dcl1) =>
prints("\
I0Dextern(", tknd, ";", dcl1, ")")
//
(* ****** ****** *)
//
|I0Ddclst0
(   dcls   ) =>
(
  prints("I0Ddclst0(", dcls, ")"))
//
|I0Dlocal0
(head, body) =>
prints
("I0Dlocal0(", head, ";", body, ")")
//
(* ****** ****** *)
//
|I0Dinclude
(knd0
,tknd, gsrc
,fopt, dopt) =>
(
print("I0Dinclude(");
prints
(
knd0,";",
tknd,";",gsrc,";",fopt,";","...",")"))
//
(*
|I0Dstaload _ => (*HX: I0Dd3ecl(...)*)
*)
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
( tknd, tqas
, d2cs, i0fs) =>
( prints
  ("I0Dfundclst(", tknd, ";")
; prints(tqas, ";", d2cs, ";", i0fs, ")"))
//
(* ****** ****** *)
(* ****** ****** *)
//
|
I0Dnone0() =>
let
val
loc0 = idcl.lctn() in//let
prints("I0Dnone0(", loc0, ")") end
//
|
I0Dnone1(d3cl) =>
let
val
loc0 = idcl.lctn() in//let
(
prints
( "I0Dnone1(", loc0, ";", d3cl, ")") ) end
//
(* ****** ****** *)
(* ****** ****** *)
//
end(*let*)//end-of-[i0dcl_fprint(idcl,out0)]
//
(* ****** ****** *)
(* ****** ****** *)
//
#implfun
i0valdcl_fprint
  (ival, out0) = let
//
val ipat =
i0valdcl_ipat$get(ival)
val tdxp =
i0valdcl_tdxp$get(ival)
//
#impltmp g_print$out<>() = out0
//
in//let
(
prints("I0VALDCL(", ipat, ";", tdxp, ")"))
end(*let*)//end-of-[i0valdcl_fprint(ival,out0)]
//
(* ****** ****** *)
//
#implfun
i0vardcl_fprint
  (ivar, out0) = let
//
val dpid =
i0vardcl_dpid$get(ivar)
val dini =
i0vardcl_dini$get(ivar)
//
#impltmp g_print$out<>() = out0
//
in//let
(
prints("I0VARDCL(", dpid, ";", dini, ")"))
end(*let*)//end-of-[i0vardcl_fprint(ivar,out0)]
//
(* ****** ****** *)
(* ****** ****** *)
//
#implfun
i0parsed_fprint
  (ipar, out0) = let
//
val
stadyn =
i0parsed_stadyn$get(ipar)
val
nerror =
i0parsed_nerror$get(ipar)
val
source =
i0parsed_source$get(ipar)
val
parsed =
i0parsed_parsed$get(ipar)
//
#impltmp g_print$out<>() = out0
//
in//let
(
print("I0PARSED(");
prints
(stadyn,";",nerror,";",source,";",parsed,")"))
end(*let*)//end-of-[i0parsed_fprint(ipar,out0)]
//
(* ****** ****** *)
(* ****** ****** *)
//
(***********************************************************************)
(* end of [ATS3/XANADU_srcgen2_xats2js_srcgen1_DATS_intrep0_print0.dats] *)
(***********************************************************************)

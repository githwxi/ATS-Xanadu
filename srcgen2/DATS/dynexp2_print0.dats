(***********************************************************************)
(*                                                                     *)
(*                         Applied Type System                         *)
(*                                                                     *)
(***********************************************************************)

(*
** ATS/Xanadu - Unleashing the Potential of Types!
** Copyright (C) 2022 Hongwei Xi, ATS Trustful Software, Inc.
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
Sat 27 Aug 2022 02:44:07 AM EDT
*)
Authoremail: gmhwxiATgmailDOTcom
*)
//
(* ****** ****** *)
(* ****** ****** *)
#define
ATS_PACKNAME
"ATS3.XANADU.xatsopt-20220500"
(* ****** ****** *)
(* ****** ****** *)
//
#include
"./../HATS/xatsopt_sats.hats"
#include
"./../HATS/xatsopt_dpre.hats"
//
(* ****** ****** *)
(* ****** ****** *)
#staload
_(*?*) = "./lexing0_print0.dats"
(* ****** ****** *)
#staload "./../SATS/lexing0.sats"
(* ****** ****** *)
(*
#staload "./../SATS/staexp0.sats"
#staload "./../SATS/dynexp0.sats"
*)
(* ****** ****** *)
#staload "./../SATS/staexp1.sats"
#staload "./../SATS/dynexp1.sats"
(* ****** ****** *)
#staload "./../SATS/staexp2.sats"
#staload "./../SATS/dynexp2.sats"
(* ****** ****** *)
(* ****** ****** *)
#symload lctn with d2con_get_lctn
#symload name with d2con_get_name
#symload lctn with d2cst_get_lctn
#symload name with d2cst_get_name
(* ****** ****** *)
#symload lctn with d2pat_get_lctn
#symload node with d2pat_get_node
#symload styp with d2pat_get_styp
(* ****** ****** *)
#symload lctn with d2exp_get_lctn
#symload node with d2exp_get_node
#symload styp with d2exp_get_styp
(* ****** ****** *)
#symload lctn with f2arg_get_lctn
#symload node with f2arg_get_node
(* ****** ****** *)
#symload lctn with d2gua_get_lctn
#symload lctn with d2gpt_get_lctn
#symload lctn with d2cls_get_lctn
#symload node with d2gua_get_node
#symload node with d2gpt_get_node
#symload node with d2cls_get_node
(* ****** ****** *)
#symload lctn with d2ecl_get_lctn
#symload node with d2ecl_get_node
(* ****** ****** *)
#symload lctn with simpl_get_lctn
#symload node with simpl_get_node
#symload lctn with dimpl_get_lctn
#symload node with dimpl_get_node
(* ****** ****** *)
#symload lctn with d2arg_get_lctn
#symload node with d2arg_get_node
(* ****** ****** *)
#symload dpat with d2rpt_get_dpat
#symload dexp with d2rxp_get_dexp
(* ****** ****** *)
(* ****** ****** *)

#implfun
x2nam_fprint
(xnam, out0) =
let
//
#impltmp
g_print$out<>() = out0
//
in//let
case+ xnam of
|
X2NAMnone() =>
(
  prints("X2NAMnone(", ")"))
|
X2NAMsome(dexp) =>
(
  prints("X2NAMsome(", dexp, ")"))
end(*let*)//end-of-[x2nam_fprint(xnam,out0)]
//
(* ****** ****** *)

#implfun
d2con_fprint
(d2c0, out0) =
let
//
#impltmp
g_print$out<>() = out0
//
val
sym0 = d2con_get_name(d2c0)
val
stmp = d2con_get_stmp(d2c0)
//
in//let
  prints(sym0, "(", stmp, ")")
end(*let*)//end-of-[d2con_fprint(d2c0,out0)]

(* ****** ****** *)

#implfun
d2cst_fprint
(d2c0, out0) =
let
//
#impltmp
g_print$out<>() = out0
//
val
sym0 = d2cst_get_name(d2c0)
val
stmp = d2cst_get_stmp(d2c0)
//
in//let
  prints(sym0, "(", stmp, ")")
end(*let*)//end-of-[d2cst_fprint(d2c0,out0)]

(* ****** ****** *)

#implfun
d2var_fprint
(d2v0, out0) =
let
//
#impltmp
g_print$out<>() = out0
//
val
sym0 = d2var_get_name(d2v0)
val
stmp = d2var_get_stmp(d2v0)
//
in//let
  prints(sym0, "(", stmp, ")")
end(*let*)//end-of-[d2var_fprint(d2v0,out0)]

(* ****** ****** *)

#implfun
d2pat_fprint
(d2p0, out0) =
let
#impltmp
g_print$out<>() = out0
in//let
//
case+
d2p0.node() of
//
|D2Pnil() =>
prints("D2Pnil(",")")
|D2Pany() =>
prints("D2Pany(",")")
|D2Parg() =>
prints("D2Parg(",")")
//
|D2Pvar(d2v) =>
prints("D2Pvar(",d2v,")")
//
|D2Pint(tok) =>
prints("D2Pint(",tok,")")
|D2Pbtf(sym) =>
prints("D2Pbtf(",sym,")")
|D2Pchr(tok) =>
prints("D2Pchr(",tok,")")
|D2Pflt(tok) =>
prints("D2Pflt(",tok,")")
|D2Pstr(tok) =>
prints("D2Pstr(",tok,")")
//
|D2Pi00(int) =>
prints("D2Pi00(",int,")")
|D2Pb00(btf) =>
prints("D2Pb00(",btf,")")
|D2Pc00(chr) =>
prints("D2Pc00(",chr,")")
|D2Pf00(flt) =>
prints("D2Pf00(",flt,")")
|D2Ps00(str) =>
prints("D2Ps00(",str,")")
//
|D2Pcon(d2c) =>
prints("D2Pcon(",d2c,")")
//
|D2Pbang(d2p1) =>
prints("D2Pbang(",d2p1,")")
|D2Pflat(d2p1) =>
prints("D2Pflat(",d2p1,")")
|D2Pfree(d2p1) =>
prints("D2Pfree(",d2p1,")")
//
(*
|
D2Psym0
(drpt,
 d1p1, dpis) =>
prints
( "D2Psym0("
, drpt,";",d1p1,";",dpis,")" )
*)
//
|
D2Pcons
(drpt, d2cs) =>
prints
("D2Pcons(",drpt,";",d2cs,")")
//
|
D2Psapp
(d2f0, s2vs) =>
prints
("D2Psapp(",d2f0,";",s2vs,")")
//
|
D2Pdap0(d1p1) =>
(prints("D2Pdap0(", d1p1, ")"))
|
D2Pdap1(d1p1) =>
(prints("D2Pdap1(", d1p1, ")"))
//
|
D2Pdapp
( d2f0
, npf1, d2ps) =>
(
print("D2Pdapp(");
prints(d2f0,";",npf1,";",d2ps,")"))
//
|
D2Prfpt
( d2p1
, tknd, d2p2) =>
(
print("D2Prfpt(");
prints(d2p1,";",tknd,";",d2p2,")"))
//
|
D2Ptup0
( npf1, d2ps) =>
prints("D2Ptup0(",npf1,";",d2ps,")")
|
D2Ptup1
( tknd
, npf1, d2ps) =>
( print("D2Ptup1(")
; prints(tknd,";",npf1,";",d2ps,")"))
|
D2Prcd2
( tknd
, npf1, ldps) =>
( print("D2Prcd2(")
; prints(tknd,";",npf1,";",ldps,")"))
//
|
D2Pargtp
( d2p1, t2p2) =>
(
prints("D2Pargtp(",d2p1,";",t2p2,")"))
|
D2Pannot
( d2p1
, s1e2, s2e2) =>
( print("D2Pannot(")
; prints( d2p1,";",s1e2,";",s2e2,")"))
//
|D2Pg1mac
 (   g1m1   ) =>
(
 prints("D2Pg1mac(",g1m1,")"))//D2Pg1mac
//
|D2Pt2pck
( d2p1 , t2p2 ) =>
let
val
t2p1 = d2p1.styp() in
( print("D2Pt2pck(")
; prints( d2p1,";",t2p1,";",t2p2,")"))
endlet // end of [ D2Pt2pck(d2p1, t2p2) ]
//
|D2Pt2pkc
( d2p1 , t2p2 ) =>
let
val
t2p1 = d2p1.styp() in
( print("D2Pt2pkc(")
; prints( d2p1,";",t2p1,";",t2p2,")"))
endlet // end of [ D2Pt2pkc(d2p1, t2p2) ]
//
|D2Pnone0() => prints( "D2Pnone0(",")" )
|D2Pnone1(d1p1) => prints("D2Pnone1(",d1p1,")")
|D2Pnone2(d2p1) => prints("D2Pnone2(",d2p1,")")
//
|
D2Perrck // HX: generated by [tread12]
( lvl1
(*err-level*),d2p2) => prints("D2Perrck(",lvl1,";",d2p2,")")
//
end (*let*) // end of [d2pat_fprint(d2p0,out0)]

(* ****** ****** *)

#implfun
d2rpt_fprint
(drpt, out0) =
let
#impltmp
g_print$out<>() = out0
in//let
  prints("D2RPT(", drpt.dpat(), ")")
end (*let*) // end of [d2rpt_fprint(drpt,out0)]

(* ****** ****** *)

#implfun
d2exp_fprint
(d2e0, out0) =
let
#impltmp
g_print$out<>() = out0
in//let
//
case+
d2e0.node() of
//
|D2Eint(tok) =>
prints("D2Eint(",tok,")")
|D2Ebtf(sym) =>
prints("D2Ebtf(",sym,")")
|D2Echr(tok) =>
prints("D2Echr(",tok,")")
|D2Eflt(tok) =>
prints("D2Eflt(",tok,")")
|D2Estr(tok) =>
prints("D2Estr(",tok,")")
//
|D2Ei00(int) =>
prints("D2Ei00(",int,")")
|D2Eb00(btf) =>
prints("D2Eb00(",btf,")")
|D2Ec00(chr) =>
prints("D2Ec00(",chr,")")
|D2Ef00(flt) =>
prints("D2Ef00(",flt,")")
|D2Es00(str) =>
prints("D2Es00(",str,")")
//
|D2Etop(sym) =>
prints("D2Etop(", sym, ")")
//
(* ****** ****** *)
//
|D2Evar(d2v) =>
prints("D2Evar(", d2v, ")")
//
|D2Econ(d2c) =>
prints("D2Econ(", d2c, ")")
|D2Ecst(d2c) =>
prints("D2Ecst(", d2c, ")")
//
(* ****** ****** *)
//
|
D2Econs(d2cs) =>
(
prints
("D2Econs(", d2cs, ")"))
where
{
#impltmp
g_print<d2con>(x) =
prints
(x.name(),"(",x.lctn(),")") }
|
D2Ecsts(d2cs) =>
(
prints
("D2Ecsts(", d2cs, ")"))
where
{
#impltmp
g_print<d2cst>(x) =
prints
(x.name(),"(",x.lctn(),")") }
//
(* ****** ****** *)
//
|
D2Esym0
( drxp
, d1e1, dpis) =>
prints
( "D2Esym0("
, drxp,";",d1e1,";",dpis,")")
//
(* ****** ****** *)
//
|
D2Esapp
( d2e1, s2es) =>
prints("D2Esapp(",d2e1,";",s2es,")")
|
D2Etapp
( d2e1, s2es) =>
prints("D2Etapp(",d2e1,";",s2es,")")
//
(* ****** ****** *)
//
|
D2Edap0(d2f0) =>
prints( "D2Edap0(", d2f0, ")" )
|
D2Edapp
( d2f0
, npf1, d2es) =>
( print("D2Edapp(")
; prints(d2f0,";",npf1,";",d2es,")"))
//
(* ****** ****** *)
//
|
D2Eproj
( tknd
, drxp
, dlab, dtup) =>
( prints
  ("D2Eproj(",tknd,";")
; prints(drxp,";",dlab,";",dtup,")"))
//
(* ****** ****** *)
//
|
D2Elet0
( dcls, d2e1) =>
(
prints("D2Elet0(",dcls,";",d2e1,")"))
//
(* ****** ****** *)
//
|D2Eift0
( d2e1
, dthn, dels) =>
( print("D2Eift0(")
; prints(d2e1,";",dthn,";",dels,")"))
//
|
D2Ecas0
( tknd
, d2e1, d2cs) =>
( print("D2Ecas0(");
  prints(tknd,";",d2e1,";",d2cs,")"))
//
(* ****** ****** *)
//
|D2Eseqn
( d2es, d2e1) =>
(
prints("D2Eseqn(",d2es,";",d2e1,")"))
//
(* ****** ****** *)
//
|D2Etup0
( npf1, d2es) =>
(
prints("D2Etup0(",npf1,";",d2es,")"))
(*
|D2Ercd0
(npf1, ldes) =>
(
prints("D2Ercd0(",npf1,";",ldes,")"))
*)
//
|
D2Etup1
( tknd
, npf1, d2es) =>
( print("D2Etup1(")
; prints(tknd,";",npf1,";",d2es,")") )
|
D2Ercd2
( tknd
, npf1, ldes) =>
( print("D2Ercd2(")
; prints(tknd,";",npf1,";",ldes,")") )
//
(* ****** ****** *)
//
|
D2Elam0
( tknd
, f2as, sres
, arrw, body) =>
(
prints
("D2Elam0(",tknd,";");
prints
(f2as,";",sres,";",arrw,";",body,")"))
//
|
D2Efix0
( tknd
, fid0
, f2as, sres
, arrw, body) =>
(
prints
("D2Efix0(",tknd,";",fid0,";");
prints
(f2as,";",sres,";",arrw,";",body,")"))
//
(* ****** ****** *)
//
|
D2Etry0
( tknd
, d2e1, dcls) =>
(
print("D2Etry0(");
prints
(tknd, ";", d2e1, ";",dcls,")"))
//
(* ****** ****** *)
//
|
D2Eaddr(d2e1) =>
(
  prints("D2Eaddr(", d2e1, ")"))
|
D2Eview(d2e1) =>
(
  prints("D2Eview(", d2e1, ")"))
//
|
D2Eeval(d2e1) =>
(
  prints("D2Eeval(", d2e1, ")"))
//
|
D2Efold(d2e1) =>
(
  prints("D2Efold(", d2e1, ")"))
|
D2Efree(d2e1) =>
(
  prints("D2Efree(", d2e1, ")"))
//
|
D2Ewhere
( d2e1, dcls) =>
(
prints("D2Ewhere(",d2e1,";",dcls,")"))
//
(* ****** ****** *)
|
D2Eassgn
( d2el, d2er) =>
(
prints("D2Eassgn(",d2el,";",d2er,")"))
//
|
D2Exazgn
( d2el, d2er) =>
(
prints("D2Exazgn(",d2el,";",d2er,")"))
//
|
D2Exchng
( d2el, d2er) =>
(
prints("D2Exchng(",d2el,";",d2er,")"))
//
(* ****** ****** *)
|
D2Ebrget
( dpis, d2es) =>
(
prints("D2Ebrget(",dpis,";",d2es,")"))
|
D2Ebrset
( dpis, d2es) =>
(
prints("D2Ebrset(",dpis,";",d2es,")"))
//
(* ****** ****** *)
|
D2Edtsel
( tknd
, lab1, dpis
, npf1, opt2) =>
(
print("D2Edtsel(");
prints(tknd,";", lab1,";");
prints(dpis, ";",npf1, ";",opt2, ")"))
//
(* ****** ****** *)
//
|
D2Eraise
( tknd, d2e1) =>
(
prints("D2Eraise(",tknd,";",d2e1,")"))
//
(* ****** ****** *)
//
|
D2El0azy
( dsym, d2e1) =>
(
prints("D2El0azy(",dsym,";",d2e1,")"))
|
D2El1azy
( dsym
, d2e1, d2es) =>
(
print("D2El1azy(");
prints(dsym, ";",d2e1, ";",d2es, ")"))
//
(* ****** ****** *)
//
|
D2Eannot
( d2e1
, s1e2, s2e2) =>
(
print("D2Eannot(");
prints(d2e1, ";",s1e2, ";",s2e2, ")"))
//
(* ****** ****** *)
//
|D2Eg1mac
(    g1m1    ) =>
(
prints("D2Eg1mac(",g1m1,")"))//D2Eg1mac
//
(* ****** ****** *)
//
|D2Elabck
( d2e1, lab2 ) =>
let
val
t2p1 = d2e1.styp() in
(
print("D2Elabck(");
prints(d2e1, ";",t2p1, ";",lab2, ")"))
endlet // end of [D2Elabck(d2e1, lab2)]
//
|D2Et2pck
( d2e1, t2p2 ) =>
let
val
t2p1 = d2e1.styp() in
(
print("D2Et2pck(");
prints(d2e1, ";",t2p1, ";",t2p2, ")"))
endlet // end of [D2Et2pck(d2e1, t2p2)]
|D2Et2ped
( d2e1, t2p2 ) =>
let
val
t2p1 = d2e1.styp() in
(
print("D2Et2ped(");
prints(d2e1, ";",t2p1, ";",t2p2, ")"))
endlet // end of [D2Et2ped(d2e1, t2p2)]
//
(* ****** ****** *)
//
|
D2Eexists
( s2es, d2e1) =>
(
prints("D2Eexists(",s2es,";",d2e1,")"))
//
(* ****** ****** *)
//
|
D2Eextnam
( tknd, gnam) =>
(
prints("D2Eextnam(",tknd,";",gnam,")"))
//
|
D2Esynext
( tknd, gexp) =>
(
prints("D2Esynext(",tknd,";",gexp,")"))
//
(* ****** ****** *)
//
|D2Enone0() => prints( "D2Enone0(",")" )
|D2Enone1(d1e1) => prints("D2Enone1(",d1e1,")")
|D2Enone2(d2e1) => prints("D2Enone2(",d2e1,")")
//
(* ****** ****** *)
//
|
D2Eerrck // HX: generated by [tread12]
( lvl1
(*err-level*),d2e2) => prints("D2Eerrck(",lvl1,";",d2e2,")")
//
(* ****** ****** *)
//
end (*let*) // end-of-[ d2exp_fprint(d2e0,out0) ]

(* ****** ****** *)

#implfun
d2rxp_fprint
(drxp, out0) =
let
#impltmp
g_print$out<>() = out0
in//let
(
  prints("D2RXP(", drxp.dexp(), ")"))
end (*let*) // end of [d2rxp_fprint(drxp,out0)]

(* ****** ****** *)

#implfun
f2arg_fprint
(farg, out0) =
let
#impltmp
g_print$out<>() = out0
in//let
//
case+
farg.node() of
//
|
F2ARGdapp
(npf1, d2ps) =>
prints
("F2ARGdapp(",npf1,";",d2ps,")")
//
|
F2ARGsapp
(s2vs, s2ps) =>
prints
("F2ARGsapp(",s2vs,";",s2ps,")")
|
F2ARGmets
(   s2es   ) => prints("F2ARGmets(",s2es,")")
//
end (*let*) // end of [f2arg_fprint(farg,out0)]

(* ****** ****** *)

#implfun
d2gua_fprint
(dgua, out0) =
let
#impltmp
g_print$out<>() = out0
in//let
//
case+
dgua.node() of
|
D2GUAexp(d2e1) =>
prints("D2GUAexp(",d2e1,")")
|
D2GUAmat(d2e1,d2p2) =>
prints("D2GUAmat(",d2e1,";",d2p2,")")
//
end (*let*) // end of [d2gua_fprint(dgua,out0)]
//
(* ****** ****** *)
//
#implfun
d2gpt_fprint
(dgpt, out0) =
let
#impltmp
g_print$out<>() = out0
in//let
case+
dgpt.node() of
|
D2GPTpat(d2p1) =>
prints("D2GPTpat(",d2p1,")")
|
D2GPTgua(d2p1,d2gs) =>
prints("D2GPTgua(",d2p1,";",d2gs,")")
end (*let*) // end of [d2gpt_fprint(dgpt,out0)]
//
#implfun
d2cls_fprint
(dcls, out0) =
let
#impltmp
g_print$out<>() = out0
in//let
case+
dcls.node() of
|
D2CLSgpt(dgpt) =>
prints("D2CLSgpt(",dgpt,")")
|
D2CLScls(d2g1,d2e2) =>
prints("D2CLScls(",d2g1,";",d2e2,")")
end (*let*) // end of [d2cls_fprint(dcls,out0)]
//
(* ****** ****** *)

#implfun
d2itm_fprint
(d2i0, out0) =
let
#impltmp
g_print$out<>() = out0
in//let
//
case+ d2i0 of
//
|
D2ITMvar(d2v1) =>
prints("D2ITMvar(", d2v1, ")")
|
D2ITMcon(d2cs) =>
prints("D2ITMcon(", d2cs, ")")
|
D2ITMcst(d2cs) =>
prints("D2ITMcst(", d2cs, ")")
|
D2ITMsym(sym1, d2ps) =>
prints("D2ITMsym(", sym1, ";", d2ps, ")")
//
end (*let*) // end of [d2itm_fprint(d2i0,out0)]

(* ****** ****** *)
//
#implfun
d2ptm_fprint
(dptm, out0) =
let
#impltmp
g_print$out<>() = out0
in//let
//
case+ dptm of
|
D2PTMnone(dqid) =>
prints("D2PTMnone(", dqid, ")")
|
D2PTMsome(pval, d2i1) =>
prints("D2PTMsome(", pval, ";", d2i1, ")")
//
end (*let*) // end of [d2ptm_fprint(dptm,out0)]
//
(* ****** ****** *)

#implfun
d2ecl_fprint
(dcl0, out0) =
let
//
#impltmp
g_print$out<>() = out0
//
in//let
//
case+
dcl0.node() of
//
|D2Cd1ecl
(  d1cl  ) =>
prints("D2Cd1ecl(",d1cl,")")
//
(* ****** ****** *)
|
D2Cstatic
( tknd , dcl1 ) =>
prints("D2Cstatic(",tknd,";",dcl1,")")
|
D2Cextern
( tknd , dcl1 ) =>
prints("D2Cextern(",tknd,";",dcl1,")")
//
(* ****** ****** *)
//
|
D2Clocal0
( head , body ) =>
prints( "D2Clocal(",head,";",body,")" )
//
|
D2Cabssort
(  tid0  ) =>
prints("D2Cabssort(",tid0,")")
//
|
D2Cstacst0
( s2c1 , s2t2 ) =>
prints("D2Cstacst0(",s2c1,";",s2t2,")")
//
|
D2Csortdef
( tid1 , s2tx ) =>
prints("D2Csortdef(",tid1,";",s2tx,")")
//
|
D2Csexpdef
( s2c1 , s2e2 ) =>
prints("D2Csexpdef(",s2c1,";",s2e2,")")
//
|
D2Cabstype
( s2c1 , atdf ) =>
prints("D2Cabstype(",s2c1,";",atdf,")")
//
|
D2Cabsopen
( tknd , simp ) =>
prints("D2Cabsopen(",tknd,";",simp,")")
|
D2Cabsimpl
(tknd,simp,sdef) =>
( print("D2Cabsimpl(")
; prints( tknd,";", simp,";",sdef,")"))
//
|
D2Csymload
(tknd,sym0,dptm) =>
( print("D2Csymload(")
; prints( tknd,";",sym0,";",dptm,")" ))
//
|
D2Cinclude
(knd0,tknd
,gsrc,fopt,dopt) =>
(
print("D2Cinclude(");
prints
(knd0,";"
,tknd,";",gsrc,";",fopt,";",dopt,")"))
//
|
D2Cstaload
(knd0,tknd
,gsrc,fopt,dopt) =>
(
print("D2Cstaload(");
prints
(knd0,";"
,tknd,";",gsrc,";",fopt,";","...",")"))
//
(* ****** ****** *)
//
(*
HX-2024-07-20:
Sat 20 Jul 2024 01:33:42 PM EDT
*)
//
|
D2Cdyninit(tknd,g1e1) =>
(
prints("D2Cdyninit(",tknd,";",g1e1,")"))
|
D2Cextcode(tknd,g1e1) =>
(
prints("D2Cextcode(",tknd,";",g1e1,")"))
//
(* ****** ****** *)
//
|
D2Cdatasort
( d1cl , s2cs ) =>
prints("D2Cdatasort(",d1cl,";",s2cs,")")
//
|
D2Cvaldclst
( tknd , d2vs ) =>
prints("D2Cvaldclst(",tknd,";",d2vs,")")
|
D2Cvardclst
( tknd , d2vs ) =>
prints("D2Cvardclst(",tknd,";",d2vs,")")
//
|
D2Cfundclst
(tknd
,tqas,d2cs,d2fs) =>
(
print("D2Cfundclst(");
prints(tknd,";",tqas,";",d2cs,";",d2fs,")"))
//
|
D2Cimplmnt0
(tknd
,sqas,tqas
,dqid,tias
,farg,sres,body) =>
(
print("D2Cimplmnt0(");
prints(tknd,";",sqas,";",tqas,";");
prints(dqid,";",tias,";",farg,";",sres,";",body,")"))
(*
|
D2Cimplmnt1
(tknd
,sqas,tqas
,dqid,tias
,farg,sres,body) =>
(
print("D2Cimplmnt1(");
prints(tknd,";",sqas,";",tqas,";");
prints(dqid,";",tias,";",farg,";",sres,";",body,")"))
*)
//
|
D2Cexcptcon
( d1cl , d2cs ) =>
prints("D2Cexcptcon(",d1cl,";",d2cs,")")
|
D2Cdatatype
( d1cl , s2cs ) =>
prints("D2Cdatatype(",d1cl,";",s2cs,")")
//
|
D2Cdynconst
(tknd,tqas,d2cs) =>
prints
("D2Cdynconst(",tknd,";",tqas,";",d2cs,")")
//
(* ****** ****** *)
//
|
D2Cnone0((*0*)) => prints("D2Cnone0(", ")")
//
|D2Cnone1(d1cl) => prints("D2Cnone1(", d1cl, ")")
|D2Cnone2(d2cl) => prints("D2Cnone2(", d2cl, ")")
//
(* ****** ****** *)
//
(*
HX-2025-04-20: for if-guarded declarations!
*)
|D2Cthen0(dcls) => prints("D2Cthen0(", dcls, ")")
|D2Celse1(dcls) => prints("D2Celse1(", dcls, ")")
//
(* ****** ****** *)
//
|
D2Cerrck // HX: generated by [tread12]
( lvl1
(*err-level*),d2cl) => prints("D2Cerrck(",lvl1,";",d2cl,")")
//
end (*let*) // end of [ d2ecl_fprint( dcl0 , out0 ) ]

(* ****** ****** *)
//
#implfun
s2qag_fprint
(sqag, out0) =
let
#impltmp
g_print$out<>() = out0
in//in-of-let
  prints("S2QAG(", sqag.s2vs(), ")")
end (*let*) // end of [s2qag_fprint(sqag,out0)]
//
(* ****** ****** *)
//
#implfun
t2qag_fprint
(tqag, out0) =
let
#impltmp
g_print$out<>() = out0
in//in-of-let
  prints("T2QAG(", tqag.s2vs(), ")")
end (*let*) // end of [t2qag_fprint(tqag,out0)]
//
(* ****** ****** *)
//
#implfun
t2iag_fprint
(tiag, out0) =
let
#impltmp
g_print$out<>() = out0
in//in-of-let
  prints("T2IAG(", tiag.s2es(), ")")
end (*let*) // end of [t2iag_fprint(tiag,out0)]
//
(* ****** ****** *)
//
#implfun
t2jag_fprint
(tjag, out0) =
let
#impltmp
g_print$out<>() = out0
in//in-of-let
  prints("T2JAG(", tjag.t2ps(), ")")
end (*let*) // end of [t2jag_fprint(tjag,out0)]
//
(* ****** ****** *)
//
#implfun
a2tdf_fprint
(atdf, out0) =
let
#impltmp
g_print$out<>() = out0
//
in//let
//
case+ atdf of
|
A2TDFsome() =>
prints("A2TDFsome(", ")")
|
A2TDFlteq(s2e1) =>
prints("A2TDFlteq(",s2e1,")")
|
A2TDFeqeq(s2e1) =>
prints("A2TDFeqeq(",s2e1,")")
|
A2TDFdefn(s2e1) =>
prints("A2TDFdefn(",s2e1,")")
//
end (*let*) // end-of-[a2tdf_fprint(atdf,out0)]
//
(* ****** ****** *)
(* ****** ****** *)
//
#implfun
s2eff_fprint
(seff, out0) =
let
#implfun
g_print$out<>() = out0
in//let
case+ seff of
|
S2EFFnone() =>
(
  prints("S2EFFnone(", ")"))
|
S2EFFsome(s2fs) =>
(
  prints("S2EFFsome(",s2fs,")"))
end (*let*) // end-of-[s2eff_fprint(seff,out0)]
//
(* ****** ****** *)
//
#implfun
s2res_fprint
(sres, out0) =
let
#implfun
g_print$out<>() = out0
in//let
case+ sres of
|
S2RESnone() =>
prints("S2RESnone(",")")
|
S2RESsome(seff, s2e1) =>
prints
("S2RESsome(",seff,";",s2e1,")")
end (*let*) // end-of-[s2res_fprint(sres,out0)]
//
(* ****** ****** *)
(* ****** ****** *)
//
#implfun
simpl_fprint
(simp, out0) =
let
#implfun
g_print$out<>() = out0
in//let
case+
simp.node() of
|
SIMPLone1(s2c1) =>
prints("SIMPLone1(",s2c1,")")
|
SIMPLall1
(sqid,s2cs) =>
prints
("SIMPLall1(",sqid,";",s2cs,")")
|
SIMPLopt2
(sqid,scs1,scs2) =>
prints
("SIMPLopt2(",sqid,";",scs1,";",scs2,")")
end (*let*) // end of [simpl_fprint(simp,out0)]
//
(* ****** ****** *)
//
#implfun
dimpl_fprint
(dimp, out0) =
let
//
#impltmp
g_print$out<>() = out0
//
in//let
//
case+
dimp.node() of
|DIMPLnon1
(  dqid  ) =>
(
  prints("DIMPLnon1(",dqid,")"))
|DIMPLone1
(  d2c1  ) =>
(
  prints("DIMPLone1(",d2c1,")"))
|
DIMPLone2
(d2c1, svts) =>
( prints
  ("DIMPLone2(",d2c1,";",svts,")"))
//
end (*let*) // end-of-[dimpl_fprint(dimp,out0)]
//
(* ****** ****** *)
(* ****** ****** *)
//
#implfun
d2arg_fprint
(darg, out0) =
let
#impltmp
g_print$out<>() = out0
in//let
//
case
darg.node() of
| // dpid:s2exp
D2ARGdyn1
(   dpid   ) =>
prints("D2ARGdyn1(",dpid,")")
|
D2ARGdyn2
(npf1, s2es) =>
prints("D2ARGdyn2(",npf1,";",s2es,")")
//
|
D2ARGsta0
(s2vs, s2ps) =>
prints("D2ARGsta0(",s2vs,";",s2ps,")")
//
end (*let*) // end-of-[d2arg_fprint(darg,out0)]
//
(* ****** ****** *)
(* ****** ****** *)

#implfun
d2valdcl_fprint
 (dval, out0) = let
//
val dpat =
d2valdcl_get_dpat(dval)
val tdxp =
d2valdcl_get_tdxp(dval)
val wsxp =
d2valdcl_get_wsxp(dval)
//
#impltmp
g_print$out<>() = (  out0  )
//
in//let
(
prints
("D2VALDCL(",dpat,";",tdxp,";",wsxp,")"))
end (*let*) // end-of-[d2valdcl_fprint(dval,out0)]
//
(* ****** ****** *)
//
#implfun
d2vardcl_fprint
 (dvar, out0) = let
//
val dpid =
d2vardcl_get_dpid(dvar)
val vpid =
d2vardcl_get_vpid(dvar)
val sres =
d2vardcl_get_sres(dvar)
val dini =
d2vardcl_get_dini(dvar)
//
#impltmp
g_print$out<>() = (  out0  )
//
in//let
(
print("D2VARDCL(");
prints
(dpid,";",vpid,";",sres,";",dini,")"))
end (*let*) // end-of-[d2vardcl_fprint(dvar,out0)]
//
(* ****** ****** *)
(* ****** ****** *)
//
#implfun
d2fundcl_fprint
 (dfun, out0) = let
//
val dpid =
d2fundcl_get_dpid(dfun)
val farg =
d2fundcl_get_farg(dfun)
val sres =
d2fundcl_get_sres(dfun)
val tdxp =
d2fundcl_get_tdxp(dfun)
val wsxp =
d2fundcl_get_wsxp(dfun)
//
#impltmp
g_print$out<>() = (  out0 )
//
in//let
(
prints("D2FUNDCL(",dpid,";");
prints
(farg,";",sres,";",tdxp,";",wsxp,")"))
end (*let*) // end-of-[d2fundcl_fprint(dfun,out0)]
//
(* ****** ****** *)
(* ****** ****** *)
//
#implfun
d2cstdcl_fprint
 (dcst, out0) = let
//
val dpid =
d2cstdcl_get_dpid(dcst)
val darg =
d2cstdcl_get_darg(dcst)
val sres =
d2cstdcl_get_sres(dcst)
val dres =
d2cstdcl_get_dres(dcst)
//
#impltmp
g_print$out<>() = (  out0  )
//
in//let
(
print("D2CSTDCL(");
prints
(dpid,";",darg,";",sres,";",dres,")"))
end (*let*) // end-of-[d2cstdcl_fprint(dcst,out0)]
//
(* ****** ****** *)
(* ****** ****** *)

#implfun
d2parsed_fprint
 (dpar, out0) = let
//
val
stadyn =
d2parsed_get_stadyn(dpar)
val
nerror =
d2parsed_get_nerror(dpar)
val
source =
d2parsed_get_source(dpar)
val
parsed =
d2parsed_get_parsed(dpar)
//
#impltmp
g_print$out<>() = (  out0  )
//
in//let
(
print("D2PARSED(");
prints
(stadyn,";",nerror,";",source,";",parsed,")"))
end (*let*) // end-of-[d2parsed_fprint(dpar,out0)]

(* ****** ****** *)
(* ****** ****** *)
//
(***********************************************************************)
(* end of [ATS3/XATSOPT_srcgen2_DATS_dynexp2_print0.dats] *)
(***********************************************************************)

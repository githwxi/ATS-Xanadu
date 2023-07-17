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
//
(*
Author: Hongwei Xi
Start Time: June 19th, 2022
Authoremail: gmhwxiATgmailDOTcom
*)
//
(* ****** ****** *)
#include
"./../HATS/xatsopt_sats.hats"
#include
"./../HATS/xatsopt_dats.hats"
(* ****** ****** *)
#define
ATS_PACKNAME
"ATS3.XANADU.xatsopt-20220500"
(* ****** ****** *)
#staload "./../SATS/locinfo.sats"
(* ****** ****** *)
#staload "./../SATS/lexing0.sats"
(* ****** ****** *)
#staload "./../SATS/staexp0.sats"
#staload "./../SATS/dynexp0.sats"
(* ****** ****** *)
#symload node with q0arg_get_node
#symload node with s0qag_get_node
#symload node with t0qag_get_node
#symload node with t0iag_get_node
(* ****** ****** *)
#symload node with d0exp_get_node
#symload node with d0pat_get_node
#symload node with d0ecl_get_node
(* ****** ****** *)
#symload dpid with d0cstdcl_get_dpid
#symload darg with d0cstdcl_get_darg
#symload sres with d0cstdcl_get_sres
#symload dres with d0cstdcl_get_dres
(* ****** ****** *)
#symload dpat with d0valdcl_get_dpat
#symload wsxp with d0valdcl_get_wsxp
#symload tdxp with d0valdcl_get_tdxp
(* ****** ****** *)
#symload dpid with d0vardcl_get_dpid
#symload vpid with d0vardcl_get_vpid
#symload sres with d0vardcl_get_sres
#symload dini with d0vardcl_get_dini
(* ****** ****** *)
#symload dpid with d0fundcl_get_dpid
#symload farg with d0fundcl_get_farg
#symload sres with d0fundcl_get_sres
#symload tdxp with d0fundcl_get_tdxp
#symload wsxp with d0fundcl_get_wsxp
(* ****** ****** *)

#implfun
d0pat_fprint
(out, d0p) =
let
#impltmp
g_print$out<>() = out
in//let
//
case+
d0p.node() of
//
|
D0Pid0(id0) =>
print("D0Pid0(",id0,")")
//
|
D0Pint(int) =>
print("D0Pint(",int,")")
|
D0Pchr(chr) =>
print("D0Pchr(",chr,")")
|
D0Pflt(flt) =>
print("D0Pflt(",flt,")")
|
D0Pstr(str) =>
print("D0Pstr(",str,")")
//
|
D0Papps(d0ps) =>
print("D0Papps(", d0ps, ")")
//
|
D0Psarg
(tbeg,s0as,tend) =>
print
("D0Psarg(",tbeg,";",s0as,";",tend,")")
//
|
D0Plpar
(tbeg,t0ps,tend) =>
print
("D0Plpar(",tbeg,";",t0ps,";",tend,")")
//
|
D0Ptup1
(tbeg,topt,d0ps,tend) =>
print
("D0Ptup1(",tbeg,";",topt,";",d0ps,";",tend,")")
|
D0Prcd2
(tbeg,topt,ldps,tend) =>
print
("D0Prcd2(",tbeg,";",topt,";",ldps,";",tend,")")
//
|
D0Pannot(d0p1,s0e2) =>
print("D0Pannot(",d0p1,";",s0e2,")")
//
|
D0Ptkerr(tok) => print("D0Ptkerr(",tok,")")
|
D0Perrck // HX: generated by [preadx0]
(lvl1(*err-level*),d0p2) => print("D0Perrck(",lvl1,";",d0p2,")")
//
end (*let*) // end of [d0pat_fprint(out,d0p)]

(* ****** ****** *)

#implfun
f0arg_fprint
(out, f0a) =
let
#impltmp
g_print$out<>() = out
in//let
//
case+
f0a.node() of
|
F0ARGnone(tok) =>
print("F0ARGnone(",tok,")")
|
F0ARGdyn0(d0p) =>
print("F0ARGdyn0(",d0p,")")
|
F0ARGsta0(tkb,sqs,tke) =>
print
("F0ARGsta0(",tkb,";",sqs,";",tke,")")
|
F0ARGmet0(tkb,ses,tke) =>
print
("F0ARGmet0(",tkb,";",ses,";",tke,")")
//
end (*let*) // end of [f0arg_fprint(out,f0a)]

(* ****** ****** *)

#implfun
d0gua_fprint
(out, dgua) =
let
#impltmp
g_print$out<>() = out
in//let
//
case+
dgua.node() of
|
D0GUAexp(d0e1) =>
print("D0GUAexp(",d0e1,")")
|
D0GUAmat(d0e1,tkas,d0p2) =>
print("D0GUAmat(",d0e1,";",tkas,";",d0p2,")")
//
end (*let*) // end of [d0gua_fprint(out,dgua)]

(* ****** ****** *)
//
#implfun
d0cls_fprint
(out, dcls) =
let
#impltmp
g_print$out<>() = out
in//let
case+
dcls.node() of
|
D0CLSgpt(dgpt) =>
print("D0CLSgpt(",dgpt,")")
|
D0CLScls
(d0g1,tsep,d0e2) =>
print("D0CLScls(",d0g1,";",tsep,";",d0e2,")")
end (*let*) // end of [d0cls_fprint(out,dcls)]
//
#implfun
d0gpt_fprint
(out, dgpt) =
let
#impltmp
g_print$out<>() = out
in//let
case+
dgpt.node() of
|
D0GPTpat(d0p1) =>
print("D0GPTpat(",d0p1,")")
|
D0GPTgua
(d0p1,tsep,d0gs) =>
print("D0GPTgua(",d0p1,";",tsep,";",d0gs,")")
end (*let*) // end of [d0gpt_fprint(out,dgpt)]
//
(* ****** ****** *)

#implfun
d0exp_fprint
(out, d0e) =
let
#impltmp
g_print$out<>() = out
in//let
//
case+
d0e.node() of
//
|
D0Eid0(id0) =>
print("D0Eid0(",id0,")")
//
|
D0Eint(int) =>
print("D0Eint(",int,")")
|
D0Echr(chr) =>
print("D0Echr(",chr,")")
|
D0Eflt(flt) =>
print("D0Eflt(",flt,")")
|
D0Estr(str) =>
print("D0Estr(",str,")")
//
|
D0Eapps(d0es) =>
print("D0Eapps(",d0es,")")
//
|
D0Esarg
(tbeg,s0es,tend) =>
print
("D0Esarg(",tbeg,";",s0es,";",tend,")")
|
D0Etarg
(tbeg,s0es,tend) =>
print
("D0Etarg(",tbeg,";",s0es,";",tend,")")
//
|
D0Elpar
(tbeg,d0es,tend) =>
print
( "D0Elpar(",tbeg,";",d0es,";",tend,")" )
//
|
D0Eift0
(tknd,d0e1,dthn,dels) =>
(
print
("D0Eift0(", tknd,";");
print(d0e1,";",dthn,";",dels,")"))
|
D0Eift1
(tknd,d0e1,dthn,dels,tinv) =>
(
print
("D0Eift1(",tknd,";");
print(d0e1,";",dthn,";",dels,";",tinv,")"))
//
|
D0Ecas0
(tknd,d0e1,tof0,tbar,dcls) =>
(
print
("D0Ecas0(",tknd,";");
print(d0e1,";",tof0,";",tbar,";",dcls,")"))
|
D0Ecas1
(tknd
,d0e1,tof0,tbar,dcls,tinv) =>
(
print
("D0Ecas1(",tknd,";",d0e1,";");
print(tof0,";",tbar,";",dcls,";",tinv,")"))
//
|
D0Etup1
(tbeg,topt,d0es,tend) =>
print
("D0Etup1(",tbeg,";",topt,";",d0es,";",tend,")")
|
D0Ercd2
(tbeg,topt,ldes,tend) =>
print
("D0Ercd2(",tbeg,";",topt,";",ldes,";",tend,")")
//
|
D0Elet0
(tknd,dcls,topt,d0es,tend) =>
(
print("D0Elet0(",tknd,";");
print(dcls,";",topt,";",d0es,";",tend,")"))
//
|
D0Etry0
(tknd
,d0es,twth,tbar,dcls,tend) =>
//
(
print
("D0Etry0(",tknd,";",d0es,";");
print(twth,";",tbar,";",dcls,";",tend,")"))
|
D0Elam0
(tknd
,farg,sres,arrw,body,tend) =>
(
print
("D0Elam0(",tknd,";",farg,";");
print(sres,";",arrw,";",body,";",tend,")"))
//
|
D0Efix0
(tknd,fid0
,farg,sres,arrw,body,tend) =>
(
print
("D0Efix0(");
print(tknd,";",fid0,";",farg,";");
print(sres,";",arrw,";",body,";",tend,")"))
//
|
D0Ewhere(d0e1,dcl2) =>
print
("D0Ewhere(",d0e1,";",dcl2,")")
//
|
D0Ebrckt
(tbeg, d0es, tend) =>
print
( "D0Ebrckt("
, tbeg , ";" , d0es , ";" , tend , ")")
|
D0Edtsel
(tknd, lab1, opt2) =>
print
( "D0Edtsel("
, tknd , ";" , lab1 , ";" , opt2 , ")")
//
|
D0Eraise(tknd,d0e1) =>
print("D0Eraise(", tknd, ";", d0e1, ")")
//
|
D0Eannot(d0e1,s0e2) =>
print("D0Eannot(", d0e1, ";", s0e2, ")")
//
|
D0Equal0(tok1,d0e2) =>
print("D0Equal0(", tok1, ";", d0e2, ")")
//
|
D0Eextnam
(tknd,gnam) =>
print("D0Eextnam(", tknd, ";", gnam, ")")
|
D0Eexists
(tknd,d0es,d0e1) =>
print("D0Eexists(",tknd,";",d0es,";",d0e1,")")
//
|
D0Etkerr(terr) => print("D0Etkerr(", terr, ")")
//
|
D0Eerrck // HX: generated by [preadx0]
(lvl1(*err-level*),d0e2) => print("D0Eerrck(",lvl1,";",d0e2,")")
//
end (*let*) // end of [ d0exp_fprint(out,d0e) ]

(* ****** ****** *)
//
#implfun
t0qua_fprint
(out, tqua) =
let
#impltmp
g_print$out<>() = out
in//let
//
case+ tqua of
|
T0QUAnone(terr) =>
print("T0QUAnone(",terr,")")
|
T0QUAsome(tbeg,s0qs,tend) =>
print("T0QUAsome(",tbeg,";",s0qs,";",tend,")")
//
end (*let*) // end of [t0qua_fprint(out,tqua)]
#implfun
t0inv_fprint
(out, tinv) =
let
#impltmp
g_print$out<>() = out
in//let
case+ tinv of
|
T0INVnone(tqua,terr) =>
print("T0INVnone(",tqua,";",terr,")")
|
T0INVsome(tqas,tbeg,d0ps,tend) =>
(
print("T0INVsome(");
print(tqas,";",tbeg,";",d0ps,";",tend,")"))
end (*let*) // end of [t0inv_fprint(out,tinv)]
//
(* ****** ****** *)

#implfun
f0unarrw_fprint
  (out, arrw) =
let
#impltmp
g_print$out<>() = out
in//let
//
case+ arrw of
|
F0UNARRWnone(tok) =>
print("F0UNARRWnone(",tok,")")
|
F0UNARRWdflt(tok) =>
print("F0UNARRWdflt(",tok,")")
|
F0UNARRWlist(tkb,ses,tke) =>
print("F0UNARRWlist(",tkb,";",ses,";",tke,")")
//
end (*let*)//end-of-[f0unarrw_fprint(out,arrw)]

(* ****** ****** *)

#implfun
d0exp_THEN_fprint
  (out, gthn) =
(
case+ gthn of
|
d0exp_THEN_none(tok) =>
print("d0exp_THEN_none(",tok,")")
|
d0exp_THEN_some(tok,d0e) =>
print("d0exp_THEN(",tok,";",d0e,")")
) where
{
#impltmp g_print$out<>() = out
} (*where*) // end of [d0exp_THEN_fprint]
#implfun
d0exp_ELSE_fprint
  (out, gels) =
(
case+ gels of
|
d0exp_ELSE_none(tok) =>
print("d0exp_ELSE_none(",tok,")")
|
d0exp_ELSE_some(tok, d0e) =>
print("d0exp_ELSE_some(",tok,";",d0e,")")
) where
{
#impltmp g_print$out<>() = out
} (*where*) // end of [d0exp_ELSE_fprint]

(* ****** ****** *)

#implfun
d0pat_RPAREN_fprint
  (out, drp) =
let
#impltmp
g_print$out<>() = out
in//let
case+ drp of
|
d0pat_RPAREN_cons0(tbar) =>
print("d0pat_RPAREN_cons0(",tbar,")")
|
d0pat_RPAREN_cons1(tok1, d0ps, tok2) =>
print("d0pat_RPAREN_cons1(",tok1,";",d0ps,";",tok2,")")
end (*let*) // end of [d0pat_RPAREN_fprint]

(* ****** ****** *)

#implfun
l0d0p_RBRACE_fprint
  (out, ldrb) =
let
//
#impltmp
g_print$out<>() = out
//
in//let
case+ ldrb of
|
l0d0p_RBRACE_cons0(tbar) =>
print("l0d0p_RBRACE_cons0(",tbar,")")
|
l0d0p_RBRACE_cons1(tok1, lses, tok2) =>
print("l0d0p_RBRACE_cons1(",tok1,";",lses,";",tok2,")")
end (*let*) // end of [l0d0p_RBRACE_fprint]

(* ****** ****** *)

#implfun
d0exp_RPAREN_fprint
  (out, drp) =
let
#impltmp
g_print$out<>() = out
in//let
case+ drp of
|
d0exp_RPAREN_cons0(tbar) =>
print("d0exp_RPAREN_cons0(",tbar,")")
|
d0exp_RPAREN_cons1(tok1, d0es, tok2) =>
print("d0exp_RPAREN_cons1(",tok1,";",d0es,";",tok2,")")
|
d0exp_RPAREN_cons2(tok1, d0es, tok2) =>
print("d0exp_RPAREN_cons2(",tok1,";",d0es,";",tok2,")")
end (*let*) // end of [d0exp_RPAREN_fprint]

(* ****** ****** *)

#implfun
l0d0e_RBRACE_fprint
  (out, ldrb) =
let
//
#impltmp
g_print$out<>() = out
//
in//let
case+ ldrb of
|
l0d0e_RBRACE_cons0(tbar) =>
print("l0d0e_RBRACE_cons0(",tbar,")")
|
l0d0e_RBRACE_cons1(tok1, lses, tok2) =>
print("l0d0e_RBRACE_cons1(",tok1,";",lses,";",tok2,")")
end (*let*) // end of [l0d0e_RBRACE_fprint]

(* ****** ****** *)

#implfun
d0ecl_fprint
(out, dcl) =
let
#impltmp
g_print$out<>() = out
in//let
//
case+
dcl.node() of
//
|
D0Ctkerr(tok) =>
print("D0Ctkerr(",tok,")")
|
D0Ctkskp(tok) =>
print("D0Ctkskp(",tok,")")
//
|
D0Cnonfix
(tknd,dnts) =>
print("D0Cnonfix(",tknd,";",dnts,")")
|
D0Cfixity
(tknd,dnts,prec) =>
print
("D0Cfixity(",tknd,";",dnts,";",prec,")")
//
|
D0Cstatic
(tknd,dcl1) =>
print
("D0Cstatic(",tknd,";",dcl1,")")
|
D0Cextern
(tknd,dcl1) =>
print
("D0Cextern(",tknd,";",dcl1,")")
//
|
D0Cdefine
(tknd,geid,gmas,gedf) =>
(
print("D0Cdefine(",tknd,";");
print(geid,";",gmas,";",gedf,")"))
|
D0Cmacdef
(tknd,geid,gmas,dedf) =>
(
print("D0Cmacdef(",tknd,";");
print(geid,";",gmas,";",dedf,")"))
//
|
D0Clocal0
(tknd,head,tin1,body,tend) =>
(
print("D0Clocal0(",tknd,";");
print(head,";",tin1,";",body,";",tend,")"))
//
|
D0Cabssort
(tknd,tid0) =>
print
("D0Cabssort(",tknd,";",tid0,")")
|
D0Cstacst0
(tknd
,seid,tmas,tcln,s0t0) =>
(
print("D0Cstacst0(",tknd,";");
print(seid,";",tmas,";");print(tcln,";",s0t0,")"))
|
D0Csortdef
(tknd,tid0,teq1,def2) =>
(
print("D0Csortdef(",tknd,";");
print(tid0,";",teq1,";",def2,")"))
//
|
D0Csexpdef
(tknd,sid0,smas,tres,teq1,def2) =>
(
print("D0Csexpdef(",tknd,";");
print(sid0,";",smas,";",tres,";");print(teq1,";",def2,")"))
//
|
D0Cabstype
(tknd,seid,tmas,tres,atdf) =>
(
print("D0Cabstype(",tknd,";");
print
(seid,";",tmas,";",tres,";",atdf,")"))
|
D0Cabsopen(tknd, sqid) =>
print("D0Cabsopen(",tknd,";",sqid,")")
|
D0Cabsimpl
(tknd,sid0,smas,tres,teq1,def2) =>
(
print("D0Cabsimpl(",tknd,";");
print(sid0,";",smas,";",tres,";");print(teq1,";",def2,")"))
//
|
D0Csymload
(tknd,symb,twth,dqid,pval) =>
(
print("D0Csymload(",tknd,";");
print
(symb,";",twth,";",dqid,";",pval,")"))
//
|
D0Cinclude
(knd0,tknd,g0e1) =>
print
("D0Cinclude(",knd0,";",tknd,";",g0e1,")")
|
D0Cstaload
(knd0,tknd,g0e1) =>
print
("D0Cstaload(",knd0,";",tknd,";",g0e1,")")
//
|
D0Cdyninit(tknd,g0e1) =>
print("D0Cdyninit(",tknd,";",g0e1,")")
//
|
D0Cdatasort(tknd,dtcs) =>
print("D0Cdatasort(",tknd,";",dtcs,")")
//
|
D0Cvaldclst(tknd,dcls) =>
print("D0Cvaldclst(",tknd,";",dcls,")")
|
D0Cvardclst(tknd,dcls) =>
print("D0Cvardclst(",tknd,";",dcls,")")
|
D0Cfundclst(tknd,t0qs,dcls) =>
print("D0Cfundclst(",tknd,";",t0qs,";",dcls,")")
//
|
D0Cexcptcon(tknd,tbar,tcns) =>
print("D0Cexcptcon(",tknd,";",tbar,";",tcns,")")
|
D0Cdatatype(tknd,dtps,wdcs) =>
print("D0Cdatatype(",tknd,";",dtps,";",wdcs,")")
//
|
D0Cdynconst(tknd,tqas,dcls) =>
print("D0Cdynconst(",tknd,";",tqas,";",dcls,")")
//
|
D0Cimplmnt0
(tknd,s0qs,t0qs,dqid
,t0is,farg,sres,teq1,d0e2) =>
(
print("D0Cimplmnt0(",tknd,";");
print(s0qs,";",t0qs,";",dqid,";");
print(t0is,";",farg,";",sres,";",teq1,";",d0e2,")"))
//
|
D0Cerrck(lvl(*err-level*),dcl) => print("D0Cerrck(",lvl,";",dcl,")")
//
end (*let*) // end of [d0ecl_fprint(out,dcl)]

(* ****** ****** *)
//
#implfun
q0arg_fprint
(out, qag) =
let
#impltmp
g_print$out<>() = out
in//in-of-let
case+
qag.node() of
| Q0ARGsome(id0,opt) =>
  print("Q0ARGsome(",id0,";",opt,")")
end (*let*) // end of [q0arg_fprint(out,qag)]
//
#implfun
s0qag_fprint
(out, s0q) =
let
#impltmp
g_print$out<>() = out
in//in-of-let
case+
s0q.node() of
|
S0QAGnone(tok) =>
print("S0QAGnone(",tok,")")
|
S0QAGsome(tkb,qas,tke) =>
print("S0QAGsome(",tkb,";",qas,";",tke,")")
end (*let*) // end of [s0qag_fprint(out,s0q)]
//
#implfun
t0qag_fprint
(out, t0q) =
let
#impltmp
g_print$out<>() = out
in//in-of-let
case+
t0q.node() of
|
T0QAGnone(tok) =>
print("T0QAGnone(",tok,")")
|
T0QAGsome(tkb,qas,tke) =>
print("T0QAGsome(",tkb,";",qas,";",tke,")")
end (*let*) // end of [t0qag_fprint(out,t0q)]
//
(* ****** ****** *)
//
#implfun
t0iag_fprint
(out, t0i) =
let
#impltmp
g_print$out<>() = out
in//in-of-let
case+
t0i.node() of
|
T0IAGnone(tok) =>
print("T0IAGnone(",tok,")")
|
T0IAGsome(tkb,ses,tke) =>
print("T0IAGsome(",tkb,";",ses,";",tke,")")
end (*let*) // end of [t0iag_fprint(out,t0i)]
//
(* ****** ****** *)
//
#implfun
a0typ_fprint
(out, a0t) =
let
#impltmp
g_print$out<>() = out
in//in-of-let
//
case+
a0t.node() of
|
A0TYPsome(s0e1,topt) =>
print("A0TYPsome(",s0e1,";",topt,")")
end (*let*) // end of [a0typ_fprint(out,a0t)]
//
(* ****** ****** *)
//
#implfun
d0arg_fprint
(out, d0a) =
let
#impltmp
g_print$out<>() = out
in//let
//
case+
d0a.node() of
|
D0ARGnone
(  tok0  ) =>
print("D0ARGnone(",tok0,")")
|
D0ARGsta0
(tbeg,sqas,tend) =>
print("D0ARGsta0(",tbeg,";",sqas,";",tend,")")
|
D0ARGdyn1
(  dpid  ) =>
print("D0ARGdyn1(",dpid,")")
|
D0ARGdyn2
(tbeg,a0ts,atsq,tend) =>
print("D0ARGdyn2(",tbeg,";",a0ts,";",atsq,";",tend,")")
//
end (*let*) // end of [d0arg_fprint(out,d0a)]
//
(* ****** ****** *)

#implfun
g0edf_fprint
(out, gedf) =
let
#impltmp
g_print$out<>() = out
in//let
//
case+ gedf of
|
G0EDFnone() =>
print("G0EDFnone(", ")")
|
G0EDFsome(topt,g0e1) =>
print("G0EDFsome(",topt,";",g0e1,")")
//
end (*let*) // end of [g0edf_fprint(out,gedf)]

(* ****** ****** *)

#implfun
d0edf_fprint
(out, dedf) =
let
#impltmp
g_print$out<>() = out
in//let
//
case+ dedf of
|
D0EDFnone() =>
print("D0EDFnone(", ")")
|
D0EDFsome(topt,d0e1) =>
print("D0EDFsome(",topt,";",d0e1,")")
//
end (*let*) // end of [d0edf_fprint(out,dedf)]

(* ****** ****** *)

#implfun
a0tdf_fprint
(out, atdf) =
let
#impltmp
g_print$out<>() = out
in//let
//
case+ atdf of
|
A0TDFsome() =>
print("A0TDFsome(", ")")
|
A0TDFlteq(tok,s0e) =>
print("A0TDFlteq(",tok,";",s0e,")")
|
A0TDFeqeq(tok,s0e) =>
print("A0TDFeqeq(",tok,";",s0e,")")
//
end (*let*) // end of [a0tdf_fprint(out,atdf)]

(* ****** ****** *)
//
#implfun
precopt_fprint
  (out, opt) =
(
case+ opt of
|
PRECnil0() =>
print("PRECnil0()")
|
PRECint1(int) =>
print("PRECint1(", int, ")")
|
PRECopr2(opr, pmd) =>
print("PRECopr2(", opr, ";", pmd, ")")
) where
{
  #impltmp g_print$out<>() = out
} (*where*) // end of [precopt_fprint]
//
#implfun
precint_fprint
  (out, int) =
(
case+ int of
|
PINTint1(int) =>
print("PINTint1(", int, ")")
|
PINTopr2(opr, int) =>
print("PINTopr2(", opr, ";", int, ")")
) where
{
  #impltmp g_print$out<>() = out
} (*where*) // end of [precint_fprint]
//
#implfun
precmod_fprint
  (out, pmd) =
let
#impltmp
g_print$out<>() = out
in//let
case+ pmd of
|
PMODnone() => print("PRECMODnone(", ")")
|
PMODsome(tkb, int, tke) =>
print
("PMODsome(", tkb, ";", int, ";", tke, ")")
end (*let*) // end of [precmod_fprint]
//
(* ****** ****** *)
//
#implfun
s0res_fprint
(out, sres) =
let
#implfun
g_print$out<>() = out
in//let
case+ sres of
|
S0RESnone() =>
print("S0RESnone(",")")
|
S0RESsome(seff, s0e1) =>
print("S0RESsome(",seff,";",s0e1,")")
end (*let*) // end of [s0res_fprint]
//
#implfun
s0eff_fprint
(out, seff) =
let
#implfun
g_print$out<>() = out
in//let
case+ seff of
|
S0EFFnone(tok0) =>
print("S0EFFnone(",tok0,")")
|
S0EFFsome(tbeg,s0fs,tend) =>
print
("S0EFFsome(",tbeg,";",s0fs,";",tend,")")
end (*let*) // end of [s0eff_fprint]
//
(* ****** ****** *)
//
#implfun
d0res_fprint
(out, dres) =
let
#implfun
g_print$out<>() = out
in//let
case+ dres of
|
D0RESnone() =>
print("D0RESnone(",")")
|
D0RESsome(teq0, s0e1) =>
print("D0RESsome(",teq0,";",s0e1,")")
end (*let*) // end of [d0res_fprint]
//
(* ****** ****** *)

#implfun
d0valdcl_fprint
  (out, d0cl) = let
//
val dpat = d0cl.dpat()
val tdxp = d0cl.tdxp()
val wsxp = d0cl.wsxp()
//
#impltmp g_print$out<>() = out
//
in//let
print("D0VALDCL(",dpat,";",tdxp,",",wsxp,")")
end(*let*)//end-of-[d0valdcl_fprint(out,d0cl)]

(* ****** ****** *)

#implfun
d0vardcl_fprint
  (out, d0cl) = let
//
val dpid = d0cl.dpid()
val vpid = d0cl.vpid()
val sres = d0cl.sres()
val dini = d0cl.dini()
//
#impltmp g_print$out<>() = out
//
in//let
(
print("D0VARDCL(");
print(dpid,";",vpid,";",sres,",",dini,")"))
end(*let*)//end-of-[d0vardcl_fprint(out,d0cl)]

(* ****** ****** *)

#implfun
d0fundcl_fprint
  (out, d0cl) = let
//
val dpid = d0cl.dpid()
val farg = d0cl.farg()
val sres = d0cl.sres()
val tdxp = d0cl.tdxp()
val wsxp = d0cl.wsxp()
//
#impltmp g_print$out<>() = out
//
in//let
(
print("D0FUNDCL(",dpid,";");
print(farg,";",sres,";",tdxp,",",wsxp,")"))
end(*let*)//end-of-[d0fundcl_fprint(out,d0cl)]

(* ****** ****** *)

#implfun
d0cstdcl_fprint
  (out, dcst) =
let
//
(*
val lctn = dcst.lctn()
*)
val dpid = dcst.dpid()
val darg = dcst.darg()
val sres = dcst.sres()
val dres = dcst.dres()
//
#impltmp g_print$out<>() = out
//
in//let
print
("D0CSTDCL("
,dpid,";",darg,";",sres,";",dres,")")
end (*let*) // end of [d0cstdcl_fprint]

(* ****** ****** *)

#implfun
d0parsed_fprint
  (out, dpar) = let
//
val
stadyn =
d0parsed_get_stadyn(dpar)
val
nerror =
d0parsed_get_nerror(dpar)
val
source =
d0parsed_get_source(dpar)
val
parsed =
d0parsed_get_parsed(dpar)
//
#impltmp g_print$out<>() = out
//
in//let
(
print("D0PARSED(");
print(stadyn,";",nerror,";",source,";",parsed,")"))
end(*let*)//end-of-[d0parsed_fprint(out,dpar)]

(* ****** ****** *)
//
#implfun
wd0eclseq_fprint
(out, wdc1) =
let
#impltmp g_print$out<>() = out
in//let
case+ wdc1 of
|
WD0CSnone() =>
print("WD0CSnone(", ")")
|
WD0CSsome(tbeg, topt, dcls, tend) =>
(
print
("WD0CSsome(",tbeg,";",topt,";",dcls,";",tend,")"))
end (*let*) // end of [ wd0eclseq_fprint(out,wdc1) ]
//
(* ****** ****** *)
//
#implfun
tkend_WHERE_fprint
(out, tend) =
let
#impltmp g_print$out<>() = out
//
in//let
case+ tend of
|
tkend_WHERE_cons1(tok1) =>
print("tkend_WHERE_cons1(",tok1,")")
(*
|
tkend_WHERE_cons2(tok1,topt) =>
print("tkend_WHERE_cons2(",tok1,";",topt,")")
*)
end (*let*) // end of [ tkend_WHERE_fprint(out,wdc1) ]
//
(* ****** ****** *)
//
#implfun
d0eclseq_WHERE_fprint
(out, wdc1) =
let
#impltmp g_print$out<>() = out
//
in//let
case+ wdc1 of
|
d0eclseq_WHERE
(tbeg, topt, dcls, tend) =>
(
print
("d0eclseq_WHERE(",tbeg,";",topt,";",dcls,";",tend,")"))
end (*let*) // end of [ d0eclseq_WHERE_fprint(out,wdc1) ]
//
(* ****** ****** *)

(* end of [ATS3/XATSOPT_srcgen2_dynexp0_print0.dats] *)
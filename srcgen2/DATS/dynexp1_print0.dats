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
(*
Sun Jul 24 18:09:47 EDT 2022
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
#staload "./../SATS/staexp0.sats"
#staload "./../SATS/dynexp0.sats"
(* ****** ****** *)
#staload "./../SATS/staexp1.sats"
#staload "./../SATS/dynexp1.sats"
(* ****** ****** *)
#symload lctn with d1pat_get_lctn
#symload node with d1pat_get_node
(* ****** ****** *)
#symload lctn with d1exp_get_lctn
#symload node with d1exp_get_node
(* ****** ****** *)
#symload lctn with d1ecl_get_lctn
#symload node with d1ecl_get_node
(* ****** ****** *)
#symload lctn with q1arg_get_lctn
#symload node with q1arg_get_node
(* ****** ****** *)
#symload lctn with s1qag_get_lctn
#symload node with s1qag_get_node
#symload lctn with t1qag_get_lctn
#symload node with t1qag_get_node
(* ****** ****** *)
#symload lctn with t1iag_get_lctn
#symload node with t1iag_get_node
(* ****** ****** *)
#symload lctn with f1arg_get_lctn
#symload node with f1arg_get_node
(* ****** ****** *)
#symload lctn with d1gua_get_lctn
#symload node with d1gua_get_node
#symload lctn with d1gpt_get_lctn
#symload node with d1gpt_get_node
#symload lctn with d1cls_get_lctn
#symload node with d1cls_get_node
(* ****** ****** *)
#symload lctn with a1typ_get_lctn
#symload node with a1typ_get_node
#symload lctn with d1arg_get_lctn
#symload node with d1arg_get_node
(* ****** ****** *)

#implfun
d1pat_fprint
( d1p, out ) =
let
#impltmp
g_print$out<>() = out
in//let
//
case+
d1p.node() of
|
D1Pid0(id0) =>
prints("D1Pid0(",id0,")")
//
|
D1Pint(int) =>
prints("D1Pint(",int,")")
|
D1Pchr(chr) =>
prints("D1Pchr(",chr,")")
|
D1Pflt(flt) =>
prints("D1Pflt(",flt,")")
|
D1Pstr(str) =>
prints("D1Pstr(",str,")")
//
|
D1Pb0sh
( (*0*) ) =>
prints( "D1Pb0sh(" , ")" )
|
D1Pb1sh
(  d1p  ) =>
prints("D1Pb1sh(",d1p,")")
//
|
D1Paspt
(tok, d1p) =>
prints(
"D1Paspt(",tok,";",d1p,")")
//
|
D1Pa0pp(   ) =>
(
  prints(  "D1Pa0pp(",")"  )
)
|
D1Pa1pp
(d1f0, d1p1) =>
prints("D1Pa1pp(",d1f0,";",d1p1,")")
|
D1Pa2pp
(d1f0, d1p1, d1p2) =>
prints(
"D1Pa2pp(",d1f0,";",d1p1,";",d1p2,")")
|
D1Pl1st(d1ps) =>
prints( "D1Pl1st(", d1ps ,")" )
|
D1Pl2st(dps1, dps2) =>
prints
("D1Pl2st(", dps1, ";", dps2 ,")")
//
|
D1Pt1up(tok0, d1ps) =>
prints
("D1Pt1up(", tok0, ";", d1ps ,")")
|
D1Pt2up(tok0, dps1, dps2) =>
prints
("D1Pt2up(",tok0,";",dps1,";",dps2,")")
//
|
D1Pannot(d1p1,s1e2) =>
prints("D1Pannot(",d1p1,";",s1e2,")")
|
D1Pqual0(tok1,d1p2) =>
prints("D1Pqual0(",tok1,";",d1p2,")")
//
(*
|
D1Pg1mac(gmac) =>
(
  prints("D1Pg1mac(", gmac ,")"))
*)
//
|
D1Pnone0() => prints("D1Pnone0(", ")")
|
D1Pnone1(dpat) => prints("D1Pnone1(", dpat ,")")
//
|
D1Perrck // HX: generated by [tread01]
( lvl1
(*err-level*),d1p2) => prints("D1Perrck(",lvl1,";",d1p2,")")
//
end(*let*)//end-of-[implfun(d1pat_fprint(d1p,out))]

(* ****** ****** *)

#implfun
f1arg_fprint
( farg, out ) =
let
#impltmp
g_print$out<>() = out
in//let
//
case+
farg.node() of
|
F1ARGdapp(d1p1) =>
(
  prints("F1ARGdapp(",d1p1,")") )
|
F1ARGsapp(s1qs) =>
(
  prints("F1ARGsapp(",s1qs,")") )
|
F1ARGmets(s1es) =>
(
  prints("F1ARGmets(",s1es,")") )
//
end (*let*) // end of [f1arg_fprint(farg,out)]

(* ****** ****** *)

#implfun
d1gua_fprint
( dgua, out ) =
let
#impltmp
g_print$out<>() = out
in//let
//
case+
dgua.node() of
|
D1GUAexp(d1e1) =>
prints("D1GUAexp(",d1e1,")")
|
D1GUAmat(d1e1,d1p2) =>
prints("D1GUAmat(",d1e1,";",d1p2,")")
//
end (*let*) // end of [d1gua_fprint(dgua,out)]

(* ****** ****** *)
//
#implfun
d1cls_fprint
( dcls, out ) =
let
#impltmp
g_print$out<>() = out
in//let
case+
dcls.node() of
|
D1CLSgpt(dgpt) =>
(
  prints("D1CLSgpt(",dgpt,")"))
|
D1CLScls(d1g1,d1e2) =>
(
  prints("D1CLScls(",d1g1,";",d1e2,")"))
end (*let*) // end of [d1cls_fprint(dcls,out)]
//
#implfun
d1gpt_fprint
( dgpt, out ) =
let
#impltmp
g_print$out<>() = out
in//let
case+
dgpt.node() of
|
D1GPTpat(d1p1) =>
prints("D1GPTpat(",d1p1,")")
|
D1GPTgua(d1p1,d1gs) =>
prints("D1GPTgua(",d1p1,";",d1gs,")")
end (*let*) // end of [d1gpt_fprint(dgpt,out)]
//
(* ****** ****** *)
//
#implfun
d1exp_fprint
( d1e, out ) =
let
#impltmp
g_print$out<>() = out
in//let
//
case+
d1e.node() of
//
|
D1Eid0(id0) =>
prints("D1Eid0(",id0,")")
//
|
D1Eint(int) =>
prints("D1Eint(",int,")")
|
D1Echr(chr) =>
prints("D1Echr(",chr,")")
|
D1Eflt(flt) =>
prints("D1Eflt(",flt,")")
|
D1Estr(str) =>
prints("D1Estr(",str,")")
//
|
D1Eb0sh(   ) =>
prints( "D1Eb0sh(" , ")" )
|
D1Eb1sh(d1e) =>
prints("D1Eb1sh(",d1e,")")
//
|
D1Ea0pp() =>
prints("D1Ea0pp(",")")
|
D1Ea1pp
(d1f0,d1e1) =>
prints
("D1Ea1pp(",d1f0,";",d1e1,")")
|
D1Ea2pp
(d1f0,d1e1,d1e2) =>
prints
("D1Ea2pp(",d1f0,";",d1e1,";",d1e2,")")
//
|
D1Esarg
(  s1es  ) =>
prints("D1Esarg(",s1es,")")
|
D1Etarg
(  s1es  ) =>
prints("D1Etarg(",s1es,")")
//
|
D1El1st
(  d1es  ) =>
prints("D1El1st(",d1es,")")
|
D1El2st
(des1,des2) =>
prints
("D1El2st(",des1,";",des2,")")
//
|
D1Es1eq
(  d1es  ) =>
prints("D1Es1eq(",d1es,")")
|
D1Es2eq
(des1,des2) =>
prints
("D1Es2eq(",des1,";",des2,")")
//
|
D1Eift0
(d1e1,dthn,dels) =>
(
print("D1Eift0(");
prints(d1e1,";",dthn,";",dels,")"))
//
|
D1Ecas0
(tknd,d1e1,d1cs) =>
(
print("D1Ecas0(");
prints(tknd,";",d1e1,";",d1cs,")"))
//
|
D1Elet0
(d1cs,d1e1) =>
prints("D1Elet0(",d1cs,";",d1e1,")")
//
|
D1Et1up
(tknd,d1es) =>
(
prints("D1Et1up(",tknd,";",d1es,")"))
|
D1Et2up
(tknd,des1,des2) =>
( print("D1Et2up(")
; prints(tknd,";",des1,";",des2,")"))
//
|
D1Er1cd
(tknd,ldes) =>
(
prints("D1Er1cd(",tknd,";",ldes,")"))
|
D1Er2cd
(tknd,lds1,lds2) =>
( print("D1Er2cd(")
; prints(tknd,";",lds1,";",lds2,")"))
//
|
D1Elam0
(tknd,f1as
,sres,arrw,d1e1) =>
(
prints
("D1Elam0(",tknd,";");
prints
(f1as,";",sres,";",arrw,";",d1e1,")"))
//
|
D1Efix0
(tknd,fid0,f1as
,sres,arrw,d1e1) =>
(
prints
("D1Efix0(",tknd,";",fid0,";");
prints
(f1as,";",sres,";",arrw,";",d1e1,")"))
//
|
D1Etry0
(tknd,d1e1,d1cs) =>
(
print("D1Etry0(");
prints(tknd,";",d1e1,";",d1cs,")"))
//
|
D1Ewhere
(d1e1,d1cs) =>
prints("D1Ewhere(",d1e1,";",d1cs,")")
//
|
D1Ebrckt
(  d1es  ) =>
prints("D1Ebrckt(",d1es,")")
|
D1Edtsel
(tknd,lab1,dopt) =>
( print("D1Edtsel(")
; prints(tknd,";",lab1,";",dopt,")"))
//
|
D1Eraise
(tknd,d1e1) =>
prints("D1Eraise(",tknd,";",d1e1,")")
//
|
D1Eannot
(d1e1,s1e2) =>
prints("D1Eannot(",d1e1,";",s1e2,")")
//
|
D1Equal0
(tok1,d1e2) =>
prints("D1Equal0(",tok1,";",d1e2,")")
//
(* ****** ****** *)
|
D1Eexists
(tknd,d1es,d1e1) =>
prints
("D1Eexists(",tknd,";",d1es,";",d1e1,")")
//
(* ****** ****** *)
//
(*
|
D1Eg1mac
( gmac ) => prints("D1Eg1mac(", gmac ,")")
*)
//
(* ****** ****** *)
//
|
D1Eextnam
(tknd,gnam) =>
prints("D1Eextnam(", tknd, ";", gnam, ")")
//
|
D1Esynext
(tknd,gexp) =>
prints("D1Esynext(", tknd, ";", gexp, ")")
//
(* ****** ****** *)
//
|D1Enone0() => prints("D1Enone0(", ")")
|D1Enone1(dexp) => prints("D1Enone1(", dexp ,")")
//
(* ****** ****** *)
//
|
D1Eerrck // HX: generated by [tread01]
( lvl1
(*err-level*),d1e2) => prints("D1Eerrck(",lvl1,";",d1e2,")")
//
(* ****** ****** *)
//
end(*let*)//end-of-[implfun(d1exp_fprint(d1e,out))]
//
(* ****** ****** *)
//
#implfun
d1ecl_fprint
( dcl, out ) =
let
#impltmp
g_print$out<>() = out
in//let
//
case+
dcl.node() of
//
|
D1Cd0ecl
( d0cl ) =>
prints("D1Cd0ecl(",d0cl,")")
//
|
D1Cextern
(tknd,dcl1) =>
prints
("D1Cextern(",tknd,";",dcl1,")")
|
D1Cstatic
(tknd,dcl1) =>
prints
("D1Cstatic(",tknd,";",dcl1,")")
//
|
D1Cdefine
(tknd
,geid,gmas,gopt) =>
(
print("D1Cdefine(");
prints
(tknd,";",geid,";",gmas,";",gopt,")"))
|
D1Cmacdef
(tknd
,geid,gmas,dopt) =>
(
print("D1Cmacdef(");
prints
(tknd,";",geid,";",gmas,";",dopt,")"))
//
|
D1Clocal0
(head,body) =>
(
prints("D1Clocal0(",head,";",body,")"))
//
|
D1Cabssort
(tknd,tid0) =>
prints("D1Cabssort(",tknd,";",tid0,")")
//
|
D1Cstacst0
(tknd
,sid0,tmas,s1t1) =>
(
print("D1Cstacst0(");
prints(tknd,";",sid0,";",tmas,";",s1t1,")"))
//
|
D1Csortdef
(tknd,tid0,stdf) =>
prints
("D1Csortdef(",tknd,";",tid0,";",stdf,")")
//
|
D1Csexpdef
(tknd,seid
,smas,tres,s1e1) =>
(
prints("D1Csexpdef(",tknd,";");
prints(seid,";",smas,";",tres,";",s1e1,")"))
//
|
D1Cabstype
(tknd,seid
,tmas,tres,atdf) =>
(
prints("D1Cabstype(",tknd,";");
prints(seid,";",tmas,";",tres,";",atdf,")"))
|
D1Cabsopen
(  tknd, sqid  ) =>
prints("D1Cabsopen(",tknd,";",sqid,")")
|
D1Cabsimpl
(tknd,sid1
,smas,tres,sdef) =>
(
prints
("D1Cabsimpl(",tknd,";");
prints
(sid1,";",smas,";",tres,";",sdef,")"))
//
|
D1Csymload
(tknd
,deid,dqid,gopt) =>
(
print
("D1Csymload(");
prints
(tknd,";",deid,";",dqid,";",gopt,")"))
//
|
D1Cinclude
(knd0,tknd
,g1e1,fopt,dopt) =>
(
(*
prints("\n\
D1Cinclude: dopt =", "\n", dopt, "\n")
*)
) where
{
val () =
(
print
("D1Cinclude(");
prints
( knd0, ";", tknd, ";"
, g1e1, ";", fopt, ";", "...", ")"))
}
|
D1Cstaload
(knd0,tknd
,g1e1,fopt,dopt) =>
(
(*
prints("\n\
D1Cstaload: dopt =", "\n", dopt, "\n")
*)
) where
{
val () =
(
print
("D1Cstaload(");
prints
( knd0, ";", tknd, ";"
, g1e1, ";", fopt, ";", "...", ")"))
}
//
(* ****** ****** *)
|
D1Cdyninit(tknd,g1e1) =>
(
prints("D1Cdyninit(",tknd,";",g1e1,")"))
//
(* ****** ****** *)
//
(*
HX-2024-07-20:
Sat 20 Jul 2024 01:33:42 PM EDT
*)
|
D1Cextcode(tknd,g1e1) =>
(
prints("D1Cextcode(",tknd,";",g1e1,")"))
//
(* ****** ****** *)
//
|
D1Cdatasort
(  tknd, dtcs  ) =>
(
prints("D1Cdatasort(",tknd,";",dtcs,")"))
//
|
D1Cvaldclst
(  tknd, d1vs  ) =>
(
prints("D1Cvaldclst(",tknd,";",d1vs,")"))
|
D1Cvardclst
(  tknd, d1vs  ) =>
(
prints("D1Cvardclst(",tknd,";",d1vs,")"))
//
|
D1Cfundclst
(tknd,tqas,d1fs) =>
prints
("D1Cfundclst(",tknd,";",tqas,";",d1fs,")")
//
|
D1Cimplmnt0
(tknd
,s0qs,t0qs
,dqid,t0is
,farg,sres,d0e2) =>
(
print("D1Cimplmnt0(");
prints(tknd,";",s0qs,";",t0qs,";");
prints
(dqid,";",t0is,";",farg,";",sres,";",d0e2,")"))
//
|
D1Cexcptcon
(tknd,dtcs) =>
prints("D1Cexcptcon(",tknd,";",dtcs,")")
|
D1Cdatatype
(tknd,d1ts,wdcs) =>
prints("D1Cdatatype(",tknd,";",d1ts,";",wdcs,")")
//
|
D1Cdynconst
(tknd,tqas,d1cs) =>
prints("D1Cdynconst(",tknd,";",tqas,";",d1cs,")")
//
|D1Cnone0() => prints("D1Cnone0(", ")")
|D1Cnone1(d0cl) => prints("D1Cnone1(", d0cl ,")")
//
(* ****** ****** *)
//
(*
HX-2025-04-19:
These are temporary constructs
generated during trans01_dparsed!
*)
|D1Cendif(tend) => prints("D1Cendif(", tend, ")")
|D1Cthen0(dcls) => prints("D1Cthen0(", dcls, ")")
|D1Celse1(dcls) => prints("D1Celse1(", dcls, ")")
|D1Cifexp
(gexp,dthn,dels,dend) =>
prints("D1Cifexp(",gexp,";",dthn,";",dels,";",dend,")")
|D1Celsif
(gexp,dthn,dels,dend) =>
prints("D1Celsif(",gexp,";",dthn,";",dels,";",dend,")")
//
(* ****** ****** *)
//
|
D1Cerrck // HX: generated by [tread01]
( lvl1
(*err-level*),d1cl) => prints("D1Cerrck(",lvl1,";",d1cl,")")
//
end(*let*)//end-of-[implfun(d1ecl_fprint(dcl,out))]
//
(* ****** ****** *)
//
#implfun
q1arg_fprint
( q1a, out ) =
let
#impltmp
g_print$out<>() = out
in//in-of-let
case+
q1a.node() of
|
Q1ARGsome(sid,opt) =>
(
prints("Q1ARGsome(", sid, ";", opt, ")"))
end (*let*) // end of [q1arg_fprint(q1a,out)]
//
(* ****** ****** *)
//
#implfun
s1qag_fprint
( sqa, out ) =
let
#impltmp
g_print$out<>() = out
in//in-of-let
case+
sqa.node() of
|
S1QAGsome
(  sqs  ) => prints("S1QAGsome(",sqs,")")
end (*let*) // end of [s1qag_fprint(sqa,out)]
//
(* ****** ****** *)
//
#implfun
t1qag_fprint
( tqa, out ) =
let
#impltmp
g_print$out<>() = out
in//in-of-let
case+
tqa.node() of
|
T1QAGsome
(  tqs  ) => prints("T1QAGsome(",tqs,")")
end (*let*) // end of [t1qag_fprint(tqa,out)]
//
(* ****** ****** *)
//
#implfun
t1iag_fprint
( tia, out ) =
let
#impltmp
g_print$out<>() = out
in//in-of-let
case+
tia.node() of
|
T1IAGsome
(  ses  ) => prints("T1IAGsome(",ses,")")
end (*let*) // end of [t1iag_fprint(tia,out)]
//
(* ****** ****** *)
//
#implfun
a1typ_fprint
( a1t, out ) =
let
#impltmp
g_print$out<>() = out
in//in-of-let
//
case+
a1t.node() of
|
A1TYPsome(s0e1,topt) =>
prints("A1TYPsome(",s0e1,";",topt,")")
end (*let*) // end of [a1typ_fprint(a1t,out)]
//
(* ****** ****** *)
//
#implfun
d1arg_fprint
( d1a, out ) =
let
#impltmp
g_print$out<>() = out
in//let
//
case+
d1a.node() of
|
D1ARGsta0(sqas) =>
prints("D1ARGsta0(",sqas,")")
|
D1ARGdyn1
(  dpid  ) =>
prints("D1ARGdyn1(",dpid,")")
|
D1ARGdyn2(a1ts,atsq) =>
prints("D1ARGdyn2(",";",a1ts,";",atsq,")")
//
end (*let*) // end of [d1arg_fprint(d1a,out)]
//
(* ****** ****** *)
//
#implfun
a1tdf_fprint
( tdf, out ) =
let
#impltmp
g_print$out<>() = out
in//let
//
case+ tdf of
|
A1TDFsome() =>
(
  prints("A1TDFsome(", ")"))
|
A1TDFlteq(s1e1) =>
(
  prints("A1TDFlteq(",s1e1,")"))
|
A1TDFeqeq(s1e1) =>
(
  prints("A1TDFeqeq(",s1e1,")"))
//
end (*let*) // end of [a1tdf_fprint(tdf,out)]
//
(* ****** ****** *)
//
#implfun
s1eff_fprint
( seff, out0 ) =
let
#implfun
g_print$out<>() = out0
in//let
case+ seff of
|
S1EFFnone() =>
prints("S1EFFnone(", ")")
|
S1EFFsome(s1fs) =>
prints("S1EFFsome(",s1fs,")")
end (*let*) // end of [s1eff_fprint(seff,out0)]
//
#implfun
s1res_fprint
( sres, out0 ) =
let
#implfun
g_print$out<>() = out0
in//let
case+ sres of
|
S1RESnone() =>
prints("S1RESnone(",")")
|
S1RESsome(seff, s1e1) =>
prints
("S1RESsome(",seff,";",s1e1,")")
end (*let*) // end of [s1res_fprint(sres,out0)]
//
(* ****** ****** *)
//
#implfun
t1qua_fprint
( tqua, out0 ) =
let
#impltmp
g_print$out<>() = out0
in//let
case+ tqua of
|
T1QUAsome
(loc0, s1qs) =>
prints("T1QUAsome(",s1qs,")")
end (*let*) // end of [t1qua_fprint(tqua,out0)]
//
#implfun
t1inv_fprint
( tinv, out0 ) =
let
#impltmp
g_print$out<>() = out0
in//let
case+ tinv of
|
T1INVsome
(loc0, tqas,d1ps) =>
prints("T1INVsome(",tqas,";",d1ps,")")
end (*let*) // end of [t1inv_fprint(tinv,out0)]
//
(* ****** ****** *)
//
#implfun
f1unarrw_fprint
 ( arrw, out0 ) =
let
#impltmp
g_print$out<>() = out0
in//let
//
case+ arrw of
|
F1UNARRWdflt
(   loc0   ) =>
(
  prints("F1UNARRWdflt(",")"))
|
F1UNARRWlist
(loc0, s1es) =>
(
  prints("F1UNARRWlist(",s1es,")"))
//
end(*let*)//end-of-[f1unarrw_fprint(arrw,out0)]
//
(* ****** ****** *)
//
#implfun
wd1eclseq_fprint
 ( wdcs, out0 ) =
let
#impltmp
g_print$out<>() = out0
in//let
//
case+ wdcs of
|
WD1CSnone() => prints("WD1CSnone(",")")
|
WD1CSsome(dcls) => prints("WD1CSsome(",dcls,")")
//
end(*let*)//end-of-[wd1eclseq_fprint(wdcs,out0)]
//
(* ****** ****** *)

#implfun
d1valdcl_fprint
 (dval, out0) = let
//
val dpat =
d1valdcl_get_dpat(dval)
val tdxp =
d1valdcl_get_tdxp(dval)
val wsxp =
d1valdcl_get_wsxp(dval)
//
#impltmp g_print$out<>() = out0
//
in//let
(
prints
("D1VALDCL(",dpat,";",tdxp,";",wsxp,")"))
end(*let*)//end-of-[d1valdcl_fprint(dval,out0)]

(* ****** ****** *)

#implfun
d1vardcl_fprint
  (dvar, out0) = let
//
val dpid =
d1vardcl_get_dpid(dvar)
val vpid =
d1vardcl_get_vpid(dvar)
val sres =
d1vardcl_get_sres(dvar)
val dini =
d1vardcl_get_dini(dvar)
//
#impltmp g_print$out<>() = out0
//
in//let
(
print("D1VARDCL(");
prints
(dpid,";",vpid,";",sres,";",dini,")"))
end(*let*)//end-of-[d1vardcl_fprint(dvar,out0)]

(* ****** ****** *)

#implfun
d1fundcl_fprint
  (dfun, out0) = let
//
val dpid =
d1fundcl_get_dpid(dfun)
val farg =
d1fundcl_get_farg(dfun)
val sres =
d1fundcl_get_sres(dfun)
val tdxp =
d1fundcl_get_tdxp(dfun)
val wsxp =
d1fundcl_get_wsxp(dfun)
//
#impltmp g_print$out<>() = out0
//
in//let
(
prints("D1FUNDCL(",dpid,";");
prints(farg,";",sres,";",tdxp,";",wsxp,")"))
end(*let*)//end-of-[d1fundcl_fprint(dfun,out0)]

(* ****** ****** *)

#implfun
d1cstdcl_fprint
  (dcst, out0) =
let
//
(*
val lctn = dcst.lctn()
*)
val dpid =
d1cstdcl_get_dpid(dcst)
val darg =
d1cstdcl_get_darg(dcst)
val sres =
d1cstdcl_get_sres(dcst)
val dres =
d1cstdcl_get_dres(dcst)
//
#impltmp g_print$out<>() = out0
//
in//let
prints
("D1CSTDCL("
,dpid,";",darg,";",sres,";",dres,")")
end(*let*)//end-of-[d1cstdcl_fprint(dcst,out0)]

(* ****** ****** *)
//
#implfun
d1parsed_fprint
  (dpar, out0) = let
//
val
stadyn =
d1parsed_get_stadyn(dpar)
val
nerror =
d1parsed_get_nerror(dpar)
val
source =
d1parsed_get_source(dpar)
val
parsed =
d1parsed_get_parsed(dpar)
//
#impltmp g_print$out<>() = out0
//
in//let
(
print("D1PARSED(");
prints
(stadyn,";",nerror,";",source,";",parsed,")"))
end (*let*) // end-of-[d1parsed_fprint(dpar,out0)]
//
(* ****** ****** *)
(* ****** ****** *)
//
(***********************************************************************)
(* end of [ATS3/XATSOPT_srcgen2_DATS_dynexp1_print0.dats] *)
(***********************************************************************)

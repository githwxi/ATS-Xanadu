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
#include
"./../HATS/xatsopt_sats.hats"
#include
"./../HATS/xatsopt_dats.hats"
(* ****** ****** *)
#define
ATS_PACKNAME
"ATS3.XANADU.xatsopt-20220500"
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
#symload node with d1pat_get_node
#symload lctn with d1pat_get_lctn
(* ****** ****** *)
#symload node with d1exp_get_node
#symload lctn with d1exp_get_lctn
(* ****** ****** *)
#symload node with d1ecl_get_node
#symload lctn with d1ecl_get_lctn
(* ****** ****** *)

#implfun
d1pat_fprint
( out, d1p ) =
let
#impltmp
g_print$out<>() = out
in//let
//
case+
d1p.node() of
|
D1Pid0(id0) =>
print("D1Pid0(",id0,")")
//
|
D1Pint(int) =>
print("D1Pint(",int,")")
|
D1Pchr(chr) =>
print("D1Pchr(",chr,")")
|
D1Pflt(flt) =>
print("D1Pflt(",flt,")")
|
D1Pstr(str) =>
print("D1Pstr(",str,")")
//
|
D1Pb0sh(   ) =>
print( "D1Pb0sh(" , ")" )
|
D1Pb1sh(d1p) =>
print("D1Pb1sh(",d1p,")")
//
|
D1Pa0pp(   ) =>
(
  print(  "D1Pa0pp(",")"  )
)
|
D1Pa1pp
(d1f0, d1p1) =>
print
("D1Pa1pp(",d1f0,";",d1p1,")")
|
D1Pa2pp
(d1f0, d1p1, d1p2) =>
print
("D1Pa2pp(",d1f0,";",d1p1,";",d1p2,")")
|
D1Pl1st(d1ps) =>
print( "D1Pl1st(", d1ps ,")" )
|
D1Pl2st(dps1, dps2) =>
print("D1Pl2st(", dps1, ";", dps2 ,")")
//
|
D1Panno(d1p1,s1e2) =>
print("D1Pqual(",d1p1,";",s1e2,")")
//
end (*let*) // end of [d1pat_fprint(out,d1p)]

(* ****** ****** *)

#implfun
d1exp_fprint
( out, d1e ) =
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
print("D1Eid0(",id0,")")
//
|
D1Eint(int) =>
print("D1Eint(",int,")")
|
D1Echr(chr) =>
print("D1Echr(",chr,")")
|
D1Eflt(flt) =>
print("D1Eflt(",flt,")")
|
D1Estr(str) =>
print("D1Estr(",str,")")
//
|
D1Eb0sh(   ) =>
print( "D1Eb0sh(" , ")" )
|
D1Eb1sh(d1e) =>
print("D1Eb1sh(",d1e,")")
//
| D1Enone0() => print("D1Enone0(", ")")
| D1Enone1(dexp) => print("D1Enone1(", dexp ,")")
//
end (*let*) // end of [d1exp_fprint(out,d1e)]

(* ****** ****** *)

#implfun
d1gua_fprint
(out, dgua) =
let
#impltmp
g_print$out<>() = out
in//let
//
case+
dgua.node() of
|
D1GUAexp(d1e1) =>
print("D1GUAexp(",d1e1,")")
|
D1GUAmat(d1e1,d1p2) =>
print("D1GUAmat(",d1e1,";",d1p2,")")
//
end (*let*) // end of [d1gua_fprint(out,dgua)]

(* ****** ****** *)
//
#implfun
d1cls_fprint
(out, dcls) =
let
#impltmp
g_print$out<>() = out
in//let
case+
dcls.node() of
|
D1CLSgpt(dgpt) =>
print("D1CLSgpt(",dgpt,")")
|
D1CLScls(d1g1,d1e2) =>
print("D1CLScls(",d1g1,";",d1e2,")")
end (*let*) // end of [d1cls_fprint(out,dcls)]
//
#implfun
d1gpt_fprint
(out, dgpt) =
let
#impltmp
g_print$out<>() = out
in//let
case+
dgpt.node() of
|
D1GPTpat(d1p1) =>
print("D1GPTpat(",d1p1,")")
|
D1GPTgua(d1p1,d1gs) =>
print("D1GPTgua(",d1p1,";",d1gs,")")
end (*let*) // end of [d1gpt_fprint(out,dgpt)]
//
(* ****** ****** *)

#implfun
d1ecl_fprint
( out, dcl ) =
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
print("D1Cd0ecl(",d0cl,")")
//
|
D1Cextern
(tknd,dcl1) =>
print
("D1Cextern(",tknd,";",dcl1,")")
|
D1Cstatic
(tknd,dcl1) =>
print
("D1Cstatic(",tknd,";",dcl1,")")
//
|
D1Clocal
(head,body) =>
print("D1Clocal(",head,";",body,")")
//
|
D1Cabssort
(tknd,tid0) =>
print("D1Cabssort(",tknd,";",tid0,")")
//
|
D1Cstacst0
(tknd,sid0,tmas,s1t1) =>
(
print("D1Cstacst0(");
print(tknd,";",sid0,";",tmas,";",s1t1,")"))
//
|
D1Csortdef
(tknd,tid0,stdf) =>
print
("D1Csortdef(",tknd,";",tid0,";",stdf,")")
//
|
D1Csexpdef
(tknd,seid
,smas,tres,s1e1) =>
(
print("D1Csexpdef(",tknd,";");
print(seid,";",smas,";",tres,";",s1e1,")"))
//
|
D1Cabstype
(tknd,seid
,tmas,tres,atdf) =>
(
print("D1Cabstype(",tknd,";");
print
(seid,";",tmas,";",tres,";",atdf,")"))
|
D1Cabsopen
(  tknd, sqid  ) =>
print("D1Cabsopen(",tknd,";",sqid,")")
|
D1Cabsimpl
(tknd,sid1
,smas,tres,sdef) =>
(
print("D1Cabsimpl(",tknd,";");
print(sid1,";",smas,";",tres,";",sdef,")"))
//
|
D1Cdatasort
(  tknd, dtcs  ) =>
print("D1Cdatasort(",tknd,";",dtcs,")")
//
|
D1Cvaldclst
(  tknd, d1vs  ) =>
print("D1Cvaldclst(",tknd,";",d1vs,")")
|
D1Cvardclst
(  tknd, d1vs  ) =>
print("D1Cvardclst(",tknd,";",d1vs,")")
|
D1Cfundclst
(tknd,tqas,d1fs) =>
print("D1Cfundclst(",tknd,";",tqas,";",d1fs,")")
//
|
D1Cdatatype
(tknd,d1ts,wdcs) =>
print("D1Cdatatyp1(",tknd,";",d1ts,";",wdcs,")")
//
| D1Cnone0() => print("D1Cnone0(", ")")
| D1Cnone1(d0cl) => print("D1Cnone1(", d0cl ,")")
//
end (*let*) // end of [d1ecl_fprint(out,dcl)]

(* ****** ****** *)
//
#implfun
a1typ_fprint
(out, a1t) =
let
#impltmp
g_print$out<>() = out
in//in-of-let
//
case+
a1t.node() of
|
A1TYPsome(s0e1,topt) =>
print("A1TYPsome(",s0e1,";",topt,")")
end (*let*) // end of [a1typ_fprint(out,a1t)]
//
(* ****** ****** *)
//
#implfun
d1arg_fprint
(out, d1a) =
let
#impltmp
g_print$out<>() = out
in//let
//
case+
d1a.node() of
|
D1ARGsta0(sqas) =>
print("D1ARGsta0(",sqas,")")
|
D1ARGdyn1
(  dpid  ) =>
print("D1ARGdyn1(",dpid,")")
|
D1ARGdyn2(a1ts,atsq) =>
print("D1ARGdyn2(",";",a1ts,";",atsq,")")
//
end (*let*) // end of [d1arg_fprint(out,d1a)]
//
(* ****** ****** *)
//
#implfun
a1tdf_fprint
(out, tdf) =
let
#impltmp
g_print$out<>() = out
in//let
//
case+ tdf of
|
A1TDFsome() =>
print("A1TDFsome(", ")")
|
A1TDFlteq(s1e1) =>
print("A1TDFlteq(",s1e1,")")
|
A1TDFeqeq(s1e1) =>
print("A1TDFeqeq(",s1e1,")")
//
end (*let*) // end of [a1tdf_fprint]
//
(* ****** ****** *)
//
#implfun
s1eff_fprint
(out, seff) =
let
#implfun
g_print$out<>() = out
in//let
case+ seff of
|
S1EFFsome(s1fs) =>
print("S1EFFsome(",s1fs,")")
end (*let*) // end of [s1eff_fprint]
//
#implfun
s1res_fprint
(out, sres) =
let
#implfun
g_print$out<>() = out
in//let
case+ sres of
|
S1RESnone() =>
print("S1RESnone(",")")
|
S1RESsome(seff, s1e1) =>
print("S1RESsome(",seff,";",s1e1,")")
end (*let*) // end of [s1res_fprint]
//
(* ****** ****** *)
//
#implfun
wd1eclseq_fprint
  (out, wdcs) =
let
#impltmp
g_print$out<>() = out
in//let
//
case+ wdcs of
|
WD1CSnone() => print("WD1CSnone(",")")
|
WD1CSsome(dcls) => print("WD1CSsome(",dcls,")")
//
end (*let*) // end of [wd1eclseq_fprint]
//
(* ****** ****** *)

#implfun
d1valdcl_fprint
  (out, dval) = let
//
val dpat =
d1valdcl_get_dpat(dval)
val tdxp =
d1valdcl_get_tdxp(dval)
val wsxp =
d1valdcl_get_wsxp(dval)
//
#impltmp g_print$out<>() = out
//
in//let
print("D1VALDCL(",dpat,";",tdxp,",",wsxp,")")
end(*let*)//end-of-[d1valdcl_fprint(out,d1cl)]

(* ****** ****** *)

#implfun
d1vardcl_fprint
  (out, dvar) = let
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
#impltmp g_print$out<>() = out
//
in//let
(
print("D1VARDCL(");
print(dpid,";",vpid,";",sres,",",dini,")"))
end(*let*)//end-of-[d1vardcl_fprint(out,d1cl)]

(* ****** ****** *)

#implfun
d1fundcl_fprint
  (out, dfun) = let
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
#impltmp g_print$out<>() = out
//
in//let
(
print("D1FUNDCL(",dpid,";");
print(farg,";",sres,";",tdxp,",",wsxp,")"))
end(*let*)//end-of-[d1fundcl_fprint(out,d1cl)]

(* ****** ****** *)

#implfun
d1cstdcl_fprint
  (out, dcst) =
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
#impltmp g_print$out<>() = out
//
in//let
print
("D1CSTDCL("
,dpid,";",darg,";",sres,";",dres,")")
end (*let*) // end of [d1cstdcl_fprint]

(* ****** ****** *)

#implfun
d1parsed_fprint
  (out, dpar) = let
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
#impltmp g_print$out<>() = out
//
in//let
(
print("D1PARSED(");
print(stadyn,";",nerror,";",source,";",parsed,")"))
end(*let*)//end-of-[d1parsed_fprint(out,dpar)]

(* ****** ****** *)

(* end of [ATS3/XATSOPT_dynexp1_print0.dats] *)

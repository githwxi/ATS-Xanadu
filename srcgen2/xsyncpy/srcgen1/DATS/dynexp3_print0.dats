(***********************************************************************)
(*                                                                     *)
(*                         Applied Type System                         *)
(*                                                                     *)
(***********************************************************************)

(*
** ATS/Xanadu - Unleashing the Potential of Types!
** Copyright (C) 2025 Hongwei Xi, ATS Trustful Software, Inc.
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
Sat May 17 10:54:57 PM EDT 2025
*)
Authoremail: gmhwxiATgmailDOTcom
*)
//
(* ****** ****** *)
(* ****** ****** *)
#staload
"./../SATS/dynexp3.sats"
(* ****** ****** *)
#include
"./../HATS/mytmplib00.hats"
(* ****** ****** *)
(* ****** ****** *)
//
#staload
"prelude/SATS/gsyn000.sats"
//
(* ****** ****** *)
(* ****** ****** *)
//
#implfun
d3pat1_fprint
( d3p0, out0 ) =
let
//
#impltmp
g_print$out<>() = out0
//
in//let
//
case+
d3p0.node() of
//
(* ****** ****** *)
//
|D3P1any() =>
(
prints("D3P1any(", ")"))
//
|D3P1var
(   d2v1   ) =>
(
prints("D3P1var(", d2v1, ")"))
//
(* ****** ****** *)
//
|D3P1int
(   tint   ) =>
(
prints("D3P1int(", tint, ")"))
|D3P1btf
(   sbtf   ) =>
(
prints("D3P1btf(", sbtf, ")"))
|D3P1chr
(   tchr   ) =>
(
prints("D3P1chr(", tchr, ")"))
|D3P1flt
(   tflt   ) =>
(
prints("D3P1flt(", tflt, ")"))
|D3P1str
(   tstr   ) =>
(
prints("D3P1str(", tstr, ")"))
//
(* ****** ****** *)
//
|D3P1dapp
(d3f0
,npf1, d3ps) =>
(
prints
("D3P1dapp("
, d3f0, ";", npf1, ";", d3ps, ")"))
//
(* ****** ****** *)
//
|D3P1rfpt
(d3p1
,tkas, d3p2) =>
(
prints
("D3P1rfpt("
, d3p1, ";", tkas, ";", d3p2, ")"))
//
(* ****** ****** *)
//
|D3P1tup0
(npf1, d3ps) =>
(
prints(
"D3P1tup0(", npf1, ";", d3ps, ")"))
|D3P1tup1
(tknd
,npf1, d3ps) =>
(
prints
("D3P1tup1("
, tknd, ";", npf1, ";", d3ps, ")"))
|D3P1rcd2
(tknd
,npf1, ldps) =>
(
print("D3P1rcd2(");
prints(tknd,";",npf1,";",ldps,")"))
//
|D3P1annot
(d3p1
,s1e2, s2e2) =>
(print("D3P1annot(")
;prints(d3p1,";",s1e2,";",s2e2,")"))
//
(* ****** ****** *)
//
|D3P1d3pat
(   dpat   ) =>
(
  prints( "D3P1d3pat(", dpat, ")" ) )
//
|D3P1errck
(lvl0, d3p1) =>
(
prints("D3P1errck(", lvl0, ";", d3p1, ")"))
//
(* ****** ****** *)
//
end(*let*)//end-of-[d3pat1_fprint(d3p0,out0)]
//
(* ****** ****** *)
(* ****** ****** *)
//
#implfun
d3exp1_fprint
( d3e0, out0 ) =
let
//
#impltmp
g_print$out<>() = out0
//
in//let
//
case+
d3e0.node() of
//
(* ****** ****** *)
//
|D3E1int
(   tint   ) =>
(
prints("D3E1int(", tint, ")"))
|D3E1btf
(   sbtf   ) =>
(
prints("D3E1btf(", sbtf, ")"))
|D3E1chr
(   tchr   ) =>
(
prints("D3E1chr(", tchr, ")"))
|D3E1flt
(   tflt   ) =>
(
prints("D3E1flt(", tflt, ")"))
|D3E1str
(   tstr   ) =>
(
prints("D3E1str(", tstr, ")"))
//
(* ****** ****** *)
//
|D3E1var
(   d2v1   ) =>
(
prints("D3E1var(", d2v1, ")"))
//
(* ****** ****** *)
//
|D3E1con
(   d2c1   ) =>
(
prints("D3E1con(", d2c1, ")"))
|D3E1cst
(   d2c1   ) =>
(
prints("D3E1cst(", d2c1, ")"))
//
(* ****** ****** *)
//
|D3E1sapp
(d3e1, s2es) =>
prints
("D3E1sapp(",d3e1,";",s2es,")")
|D3E1sapq
(d3e1, t2ps) =>
prints
("D3E1sapq(",d3e1,";",t2ps,")")
//
(* ****** ****** *)
//
|D3E1tapp
(d3e1, s2es) =>
prints
("D3E1tapp(",d3e1,";",s2es,")")
|D3E1tapq
(d3e1, tjas) =>
prints
("D3E1tapq(",d3e1,";",tjas,")")
//
(* ****** ****** *)
//
|D3E1dap0
(   d3f0   ) =>
(
 prints("D3E1dap0(", d3f0, ")"))
|D3E1dapp
(d3f0
,npf1, d3es) =>
(
print("D3E1dapp(");
prints(d3f0,";",npf1,";",d3es,")"))
//
(* ****** ****** *)
//
|D3E1let0
(dcls, d3e1) =>
prints
("D3E1let0(", dcls, ";", d3e1, ")")
//
(* ****** ****** *)
//
|D3E1ift0
(d3e1
,dthn, dels) =>
(
print("D3E1ift0(");
prints(d3e1,";",dthn,";",dels,")"))
//
(* ****** ****** *)
//
|D3E1cas0
(tknd
,d3e1, d3cs) =>
(
print("D3E1cas0(");
prints(tknd,";",d3e1,";",d3cs,")"))
//
(* ****** ****** *)
//
|D3E1seqn
(d3es, d3e1) =>
prints
("D3E1seqn(", d3es, ";", d3e1, ")")
//
(* ****** ****** *)
//
|D3E1tup0
(npf1, d3es) =>
prints
("D3E1tup0(", npf1, ";", d3es, ")")
|D3E1tup1
(tknd,npf1,d3es) =>
(print("D3E1tup1(")
;prints(tknd,";",npf1,";",d3es,")"))
|D3E1rcd2
(tknd
,npf1, ldes) =>
(print("D3E1rcd2(")
;prints(tknd,";",npf1,";",ldes,")"))
//
(* ****** ****** *)
|D3E1lam0
(tknd
,f3as, sres
,arrw, body) =>
(
prints
("D3E1lam0(",tknd,";");
prints(
f3as,";",sres,";",arrw,";",body,")")
)
//
|D3E1fix0
(tknd, fid0
,f3as, sres
,arrw, body) =>
(
prints
("D3E1fix0(",tknd,";",fid0,";");
prints(
f3as,";",sres,";",arrw,";",body,")")
)
//
(* ****** ****** *)
//
|D3E1try0
(tknd
,d3e1, dcls) =>
(print("D3E1try0(")
;prints(tknd,";",d3e1,";",dcls,")"))
//
(* ****** ****** *)
//
|D3E1where
(d3e1, dcls) =>
prints
("D3E1where(", d3e1, ";", dcls, ")")
//
(* ****** ****** *)
//
|D3E1addr
(   d3e1   ) =>
(
  prints("D3E1addr(", d3e1, ")") )
|D3E1view
(   d3e1   ) =>
(
  prints("D3E1view(", d3e1, ")") )
|D3E1flat
(   d3e1   ) =>
(
  prints("D3E1flat(", d3e1, ")") )
//
(* ****** ****** *)
//
|D3E1eval
(   d3e1   ) =>
(
  prints("D3E1eval(", d3e1, ")") )
|D3E1fold
(   d3e1   ) =>
(
  prints("D3E1fold(", d3e1, ")") )
|D3E1free
(   d3e1   ) =>
(
  prints("D3E1free(", d3e1, ")") )
//
(* ****** ****** *)
//
|D3E1dp2tr
(   d3e1   ) =>
(
  prints("D3E1dp2tr(", d3e1, ")") )
|D3E1dl0az
(   d3e1   ) =>
(
  prints("D3E1dl0az(", d3e1, ")") )
|D3E1dl1az
(   d3e1   ) =>
(
  prints("D3E1dl1az(", d3e1, ")") )
//
(* ****** ****** *)
//
|D3E1assgn
(d3el, d3er) =>
prints
("D3E1assgn(", d3el, ";", d3er, ")")
//
(* ****** ****** *)
//
|D3E1raise
(tknd, d3e1) =>
prints
("D3E1raise(", tknd, ";", d3e1, ")")
//
(* ****** ****** *)
//
|D3E1l0azy
(dsym, d3e1) =>
(
prints
("D3E1l0azy(", dsym, ";", d3e1, ")"))
|D3E1l1azy
(dsym
,d3e1 , d3es) =>
(print("D3E1l1azy(")
;prints(dsym,";",d3e1, ";",d3es,")"))
//
(* ****** ****** *)
(* ****** ****** *)
//
|D3E1labck
(d3e1, lab2) =>
let
val
t2p1 = d3e1.styp() in
(print("D3E1labck(")
;prints(d3e1,"(",t2p1,");",lab2,")"))
endlet//end-of-[D3E1labck(d3e1, lab2)]
//
|D3E1t2pck
(d3e1, t2p2) =>
let
val
t2p1 = d3e1.styp() in
(print("D3E1t2pck(")
;prints(d3e1,"(",t2p1,");",t2p2,")"))
endlet//end-of-[D3E1t2pck(d3e1, t2p2)]
//
(* ****** ****** *)
(* ****** ****** *)
//
|D3E1annot
(d3e1
,s1e2, s2e2) =>
( print("D3E1annot(");
  prints(d3e1,";",s1e2,";",s2e2,")"))
//
(* ****** ****** *)
(* ****** ****** *)
//
|D3E1d3exp
(   dexp   ) =>
(
  prints( "D3E1d3exp(", dexp, ")" ) )
//
|D3E1errck
(lvl0, d3e1) =>
(
prints("D3E1errck(", lvl0, ";", d3e1, ")"))
//
end(*let*)//end-of-[d3exp1_fprint(d3e0,out0)]
//
(* ****** ****** *)
(* ****** ****** *)
//
#implfun
f3arg1_fprint
( farg, out0 ) =
let
//
#impltmp
g_print$out<>() = out0
//
in//let
//
case+
farg.node() of
|F3ARG1dapp
(npf1, d3ps) =>
prints
("F3ARG1dapp(",npf1,";",d3ps,")")
|F3ARG1sapp
(s2vs, s2ps) =>
prints
("F3ARG1sapp(",s2vs,";",s2ps,")")
|F3ARG1mets
(   s2es   ) =>
(
  prints("F3ARG1mets(", s2es, ")"))
//
end(*let*)//end-of-[f3arg1_fprint(farg,out0)]
//
(* ****** ****** *)
//
#implfun
d3gua1_fprint
(dgua, out0) =
let
#impltmp
g_print$out<>() = out0
in//let
//
case+
dgua.node() of
|
D3GUA1exp(d3e1) =>
(
prints("D3GUA1exp(",d3e1,")"))
|
D3GUA1mat(d3e1,d3p2) =>
(
prints("D3GUA1mat(",d3e1,";",d3p2,")"))
//
end(*let*)//end-of-[d3gua1_fprint(dgua,out0)]
//
(* ****** ****** *)
//
#implfun
d3gpt1_fprint
(dgpt, out0) =
let
#impltmp
g_print$out<>() = out0
in//let
case+
dgpt.node() of
|D3GPT1pat(d3p1) =>
(
prints("D3GPT1pat(",d3p1,")"))
|D3GPT1gua(d3p1,d3gs) =>
(
prints("D3GPT1gua(",d3p1,";",d3gs,")"))
end(*let*)//end-of-[d3gpt1_fprint(dgpt,out0)]
//
#implfun
d3cls1_fprint
(dcls, out0) =
let
#impltmp
g_print$out<>() = out0
in//let
case+
dcls.node() of
|D3CLS1gpt(dgpt) =>
(
prints("D3CLS1gpt(",dgpt,")"))
|D3CLS1cls(d3g1,d3e2) =>
(
prints("D3CLS1cls(",d3g1,";",d3e2,")"))
end(*let*)//end of [d3cls1_fprint(dcls,out0)]
//
(* ****** ****** *)
(* ****** ****** *)
//
#implfun
d3ecl1_fprint
( d3cl, out0 ) =
let
//
#impltmp
g_print$out<>() = out0
//
in//let
//
case+
d3cl.node() of
//
(* ****** ****** *)
//
|D3C1d3ecl
(   dcl1   ) =>
(
prints( "D3C1d3ecl(", dcl1, ")" ))
//
(* ****** ****** *)
//
|D3C1static
(tknd, dcl1) =>
(
prints
("D3C1static(", tknd, ";", dcl1, ")"))
|D3C1extern
(tknd, dcl1) =>
(
prints
("D3C1extern(", tknd, ";", dcl1, ")"))
//
(* ****** ****** *)
//
|D3C1dclst0
(   dcls   ) =>
(
  prints("D3C1dclst0(", dcls, ")"))
//
|D3C1local0
(head, body) =>
(
prints
("D3C1local0(", head, ";", body, ")"))
//
(* ****** ****** *)
//
|D3C1include
( sd01
, tknd, gexp
, fopt, dopt) =>
(
prints(
"D3C1include(",
sd01, ";", tknd, ";",
gexp(*src*), ";", fopt, ";", dopt, ")"))
//
(* ****** ****** *)
//
|D3C1staload
( sd01
, tknd, gexp
, fopt, dopt) =>
(
prints(
"D3C1staload(",
sd01, ";", tknd, ";",
gexp(*src*), ";", fopt, ";", "...", ")"))
//
(* ****** ****** *)
//
|D3C1valdclst
(  tknd, d3vs  ) =>
(
prints("D3C1valdclst(",tknd,";",d3vs,")"))
|D3C1vardclst
(  tknd, d3vs  ) =>
(
prints("D3C1vardclst(",tknd,";",d3vs,")"))
//
|D3C1fundclst
(tknd
,tqas,d2cs,d3fs) =>
(
print("D3C1fundclst(");
prints(tknd,";",tqas,";",d2cs,";",d3fs,")"))
//
(* ****** ****** *)
//
|D3C1errck
(lvl0, dcl1) =>
(
 prints("D3C1errck(", lvl0, ";", dcl1, ")"))
//
(* ****** ****** *)
//
end(*let*)//end-of-[d3ecl1_fprint(d3cl,out0)]
//
(* ****** ****** *)
(* ****** ****** *)
//
#implfun
d3valdcl1_fprint
 ( dval, out0 ) = let
//
val dpat =
d3valdcl1_dpat$get(dval)
val tdxp =
d3valdcl1_tdxp$get(dval)
val wsxp =
d3valdcl1_wsxp$get(dval)
//
#impltmp g_print$out<>() = out0
//
in//let
(
prints
("D3VALDCL1(",dpat,";",tdxp,";",wsxp,")"))
end(*let*)//end-of-[d3valdcl1_fprint(dval,out0)]
//
(* ****** ****** *)
//
#implfun
d3vardcl1_fprint
 ( dvar, out0 ) = let
//
val dpid =
d3vardcl1_dpid$get(dvar)
val vpid =
d3vardcl1_vpid$get(dvar)
val sres =
d3vardcl1_sres$get(dvar)
val dini =
d3vardcl1_dini$get(dvar)
//
#impltmp g_print$out<>() = out0
//
in//let
(
print("D3VARDCL1(");
prints(dpid,";",vpid,";",sres,";",dini,")"))
end(*let*)//end-of-[d3vardcl1_fprint(dvar,out0)]
//
(* ****** ****** *)
(* ****** ****** *)
//
#implfun
d3fundcl1_fprint
 ( dfun, out0 ) =
let
//
val dpid =
d3fundcl1_dpid$get(dfun)
val farg =
d3fundcl1_farg$get(dfun)
val sres =
d3fundcl1_sres$get(dfun)
val tdxp =
d3fundcl1_tdxp$get(dfun)
val wsxp =
d3fundcl1_wsxp$get(dfun)
//
in//let
(
prints("D3FUNDCL1(",dpid,";");
prints(farg,";",sres,";",tdxp,";",wsxp,")"))
end(*let*)//end-of-[d3fundcl1_fprint(dfun,out0)]
//
(* ****** ****** *)
(* ****** ****** *)
//
(***********************************************************************)
(* end of [ATS3/XATSOPT_srcgen2_xsyncpy_srcgen1_DATS_dynexp3_print0.dats] *)
(***********************************************************************)

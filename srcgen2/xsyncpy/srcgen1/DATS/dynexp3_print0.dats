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
#staload
"./../../../SATS/dynexp2.sats"
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
|D3P1any() =>
(
prints("D3P1any(", ")"))
//
|D3P1var
(   d2v1   ) =>
(
prints("D3P1var(", d2v1, ")"))
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
|D3P1dapp
(d3f0
,npf1, d3ps) =>
(
prints
("D3P1dapp("
, d3f0, ";", npf1, ";", d3ps, ")"))
//
|D3P1rfpt
(d3p1
,tkas, d3p2) =>
(
prints
("D3P1rfpt("
, d3p1, ";", tkas, ";", d3p2, ")"))
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
//
|D3P1d3pat
(   dpat   ) =>
(
  prints( "D3P1d3pat(", dpat, ")" ))
//
|D3P1errck
(lvl0, d3p1) =>
(
prints("D3P1errck(", lvl0, ";", d3p1, ")"))
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
|D3E1ift0
(d3e1,dthn,dels) =>
(
print("D3E1ift0(");
prints(d3e1,";",dthn,";",dels,")"))
//
(* ****** ****** *)
//
|D3E1d3exp
(   dexp   ) =>
(
  prints( "D3E1d3exp(", dexp, ")" ))
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
prints
("D3C1include("
, sd01, ";", tknd, ";"
, gexp(*src*), ";", fopt, ";", dopt, ")"))
//
(* ****** ****** *)
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
end(*let*)//end-of-[ g_print<d3fundcl1>( dfun ) ]
//
(* ****** ****** *)
(* ****** ****** *)
//
(***********************************************************************)
(* end of [ATS3/XATSOPT_srcgen2_xsyncpy_srcgen1_DATS_dynexp3_print0.dats] *)
(***********************************************************************)

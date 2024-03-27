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
#symload lctn with i0dcl_get_lctn
#symload node with i0dcl_get_node
(* ****** ****** *)
(* ****** ****** *)
//
#implfun
i0pat_fprint
(out, i0p0) =
let
#impltmp
g_print$out<>() = out
in//let
//
case+
i0p0.node() of
//
|I0Pvar(d2v) =>
print("I0Pvar(",d2v,")")
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
|I0Pnone0() => print( "I0Pnone0(",")" )
|I0Pnone1(d3p1) => print("I0Pnone1(", d3p1, ")")
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
|I0Evar(d2v) =>
(
 print("I0Evar(", d2v, ")"))
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
|I0Etapp
( i0f0, s2es) =>
print("I0Etapp(", i0f0, ";", s2es, ")")
|I0Etapq
( i0f0, t2ps) =>
print("I0Etapq(", i0f0, ";", t2ps, ")")
//
(* ****** ****** *)
//
|I0Edapp
( i0f0, i0es) =>
print("I0Edapp(", i0f0, ";", i0es, ")")
//
(* ****** ****** *)
//
|I0Elet0
( dcls, i0e1) =>
print("I0Elet0(", dcls, ";", i0e1, ")")
//
(* ****** ****** *)
//
|I0Eift0
( test
, ithn, iels) =>
(
print
("I0Eift0(", test, ";", ithn, ";", iels, ")"))
//
|I0Ecas0
( tknd
, i0e1, dcls) =>
(
print
("I0Ecas0(", tknd, ";", i0e1, ";", dcls, ")"))
//
(* ****** ****** *)
//
|I0Eseqn
( i0es, i0e1) =>
print("I0Eseqn(", i0es, ";", i0e1, ")")
//
(* ****** ****** *)
//
|I0Etup0
( i0es ) =>
print("I0Etup0(", i0es, ")")
|I0Etup1
( tknd, i0es) =>
print("I0Etup1(", tknd, ";", i0es, ")")
|I0Ercd2
( tknd, lies) =>
print("I0Ercd2(", tknd, ";", lies, ")")
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
|I0Eflat
( i0e1 ) =>
(
  print("I0Eflat(", i0e1, ")") )//I0Eflat
//
(* ****** ****** *)
|I0Efold
( i0e1 ) =>
(
  print("I0Efold(", i0e1, ")") )//I0Efold
(* ****** ****** *)
//
|I0Ewhere
(i0e1, dcls) =>
(
 print("I0Ewhere(",i0e1,";",dcls,")"))
//
(* ****** ****** *)
//
|I0Eassgn
(i0el, i0er) =>
(
 print("I0Eassgn(",i0el,";",i0er,")"))
//
(* ****** ****** *)
//
|I0Enone0() => print( "I0Enone0(",")" )
|I0Enone1(d3e1) => print("I0Enone1(", d3e1, ")")
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
|FIARGdyn(i0ps) =>
(
  print("FIARGdyn(", i0ps, ")"))
//
end (*let*) // end of [fiarg_fprint(out,farg)]
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
|I0Dlocal0
(head, body) =>
print
("I0Dlocal0(", head, ";", body, ")")
//
|
I0Dvaldclst
(  tknd, i0vs  ) =>
(
print("I0Dvaldclst(",tknd,";",i0vs,")"))
|
I0Dvardclst
(  tknd, i0vs  ) =>
(
print("I0Dvardclst(",tknd,";",i0vs,")"))
//
|
I0Dfundclst
(tknd
,tqas,d2cs,i0fs) =>
(
print("I0Dfundclst(");
print(tknd,";",tqas,";",d2cs,";",i0fs,")"))
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

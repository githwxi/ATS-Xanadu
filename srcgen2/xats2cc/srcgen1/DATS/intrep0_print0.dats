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
end(*let*)//end-of-[i0pat_fprint(ipat,out0)]
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
end(*let*)//end-of-[i0exp_fprint(iexp,out0)]
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
//
(* ****** ****** *)
//
|I0Dd3ecl(d3cl) =>
(
 prints("I0Dd3ecl(", d3cl, ")"))
//
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
end(*let*)//end-of-[i0dcl_fprint(idcl,out0)]
//
(* ****** ****** *)
(* ****** ****** *)
//
(***********************************************************************)
(* end of [ATS3/XANADU_srcgen2_xats2js_srcgen1_DATS_intrep0_print0.dats] *)
(***********************************************************************)

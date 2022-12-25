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
Fri 04 Nov 2022 06:53:23 PM EDT
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
(* ****** ****** *)
#staload "./../SATS/staexp1.sats"
(* ****** ****** *)
#staload "./../SATS/staexp2.sats"
#staload "./../SATS/statyp2.sats"
(* ****** ****** *)
#symload node with s2typ_get_node
#symload sort with s2typ_get_sort
(* ****** ****** *)

#implfun
s2typ_fprint
(out, t2p0) =
let
#impltmp
g_print$out<>() = out
in//let
//
case+
t2p0.node() of
//
|
T2Pbas(sym1) =>
print("T2Pbas(", sym1, ")")
//
|
T2Pcst(s2c1) =>
print("T2Pcst(", s2c1, ")")
|
T2Pvar(s2v1) =>
print("T2Pvar(", s2v1, ")")
//
|
T2Plft(t2p1) =>
print("T2Plft(", t2p1, ")")
//
|
T2Papps(tfun, t2ps) =>
print("T2Papps(", tfun, ";", t2ps, ")")
|
T2Plam0(s2vs, tres) =>
print("T2Plam0(", s2vs, ";", tres, ")")
//
|
T2Pfun1
( f2cl
, npf1, t2ps, tres) =>
(
print
("T2Pfun1(", f2cl, ";");
print(npf1, ";", t2ps, ";", tres, ")"))
//
|
T2Pexi0(s2vs, t2p1) =>
print("T2Pexi0(", s2vs, ";", t2p1, ")")
|
T2Puni0(s2vs, t2p1) =>
print("T2Puni0(", s2vs, ";", t2p1, ")")
//
|
T2Ptext(name, t2ps) =>
print("T2Ptext(", name, ";", t2ps, ")")
//
|
T2Ptrcd
(knd0, npf1, lses) =>
print
("T2Ptrcd(", knd0, ";", npf1, ";", lses)
//
|
T2Pnone() => print("T2Pnone(",")")
|
T2Psexp(s2e1) => print("T2Psexp(",s2e1,")")
//
end (*let*) // end of [s2typ_fprint(out,t2p0)]

(* ****** ****** *)

(* end of [ATS3/XATSOPT_srcgen2_statyp2_print0.dats] *)

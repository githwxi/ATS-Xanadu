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
Sun 04 Dec 2022 02:09:43 AM EST
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
#staload "./../SATS/gmacro1.sats"
(* ****** ****** *)
//
#implfun
g1mac_fprint
( out, g1m0 ) =
let
//
#impltmp
g_print$out<>() = out
//
in//let
case+ g1m0 of
//
|G1Mint(i0) =>
print("G1Mint(", i0, ")")
|G1Mbtf(b0) =>
print("G1Mbtf(", b0, ")")
|G1Mchr(c0) =>
print("G1Mchr(", c0, ")")
|G1Mflt(f0) =>
print("G1Mflt(", f0, ")")
|G1Mstr(s0) =>
print("G1Mstr(", s0, ")")
//
|G1Mid0(gid) =>
print("G1Mid0(", gid, ")")
//
|G1Msexp(g1m) =>
print("G1Msexp(", g1m, ")")
|G1Mdpat(g1m) =>
print("G1Mdpat(", g1m, ")")
|G1Mdexp(g1m) =>
print("G1Mdexp(", g1m, ")")
//
|
G1Mif0
(g1m1,g1m2,g1m3) =>
print
("G1Mif0("
, g1m1, ";", g1m2, ";", g1m3, ")")
//
|
G1Mlam0(gids,gmac) =>
print("G1Mlam0(", gids, ";", gmac, ")")
|
G1Mapps(g1f0,g1ms) =>
print("G1Mapps(", g1f0, ";", g1ms, ")")
//
|
G1Mlist(g1ms) =>
print("G1Mlist(", g1ms, ")")
//
|
G1Msubs(g1e1,genv) =>
print("G1Msubs(", g1e1, ";", genv, ")")
//
|
G1Mnone0() => print( "G1Mnone0(" , ")" )
|
G1Mnone1(g1e1) => print("G1Mnone1(", g1e1, ")")
//
end (*let*) // end of [ g1mac_fprint(out,g1m0) ]
//
(* ****** ****** *)

(* end of [ATS3/XATSOPT_srcgen2_gmacro1_print0.dats] *)

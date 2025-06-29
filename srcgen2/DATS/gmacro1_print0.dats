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
Sun 04 Dec 2022 02:09:43 AM EST
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
#staload "./../SATS/gmacro1.sats"
(* ****** ****** *)
(* ****** ****** *)
//
#implfun
g1mac_fprint
( g1m0, out ) =
let
//
#impltmp
g_print$out<>() = out
//
in//let
case+ g1m0 of
//
|G1Mint(i0) =>
(
 prints("G1Mint(", i0, ")"))
|G1Mbtf(b0) =>
(
 prints("G1Mbtf(", b0, ")"))
|G1Mchr(c0) =>
(
 prints("G1Mchr(", c0, ")"))
|G1Mflt(f0) =>
(
 prints("G1Mflt(", f0, ")"))
|G1Mstr(s0) =>
(
 prints("G1Mstr(", s0, ")"))
//
|G1Mid0(gid) =>
(
 prints("G1Mid0(", gid, ")"))
//
|G1Msexp(g1m) =>
(
 prints("G1Msexp(", g1m, ")"))
|G1Mdpat(g1m) =>
(
 prints("G1Mdpat(", g1m, ")"))
|G1Mdexp(g1m) =>
(
 prints("G1Mdexp(", g1m, ")"))
//
|
G1Mift0
(g1m1,g1m2,g1m3) =>
prints
("G1Mift0("
, g1m1, ";", g1m2, ";", g1m3, ")")
//
|
G1Mlam0(gids,gmac) =>
prints
("G1Mlam0(", gids, ";", gmac, ")")
|
G1Mapps(g1f0,g1ms) =>
prints
("G1Mapps(", g1f0, ";", g1ms, ")")
//
|
G1Mlist(g1ms) =>
(
  prints("G1Mlist(", g1ms, ")"))
//
|
G1Msubs
(g1e1,genv) =>
prints("G1Msubs(", g1e1, ";", genv, ")")
//
|
G1Mnone0() => prints( "G1Mnone0(" , ")" )
|
G1Mnone1(g1e1) => prints("G1Mnone1(", g1e1, ")")
//
end (*let*) // end of [ g1mac_fprint( g1m0,out ) ]
//
(* ****** ****** *)
(* ****** ****** *)
//
(***********************************************************************)
(* end of [ATS3/XATSOPT_srcgen2_DATS_gmacro1_print0.dats] *)
(***********************************************************************)

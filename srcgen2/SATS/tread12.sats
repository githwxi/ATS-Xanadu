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
Fri 09 Sep 2022 12:56:50 PM EDT
*)
Authoremail: gmhwxiATgmailDOTcom
*)
//
(* ****** ****** *)
#include
"./../HATS/xatsopt_sats.hats"
(* ****** ****** *)
#define
ATS_PACKNAME // namespace
"ATS3.XANADU.xatsopt-20220500"
(* ****** ****** *)
#staload
LEX = "./lexing0.sats"
(* ****** ****** *)
#staload
S2E = "./staexp2.sats"
#staload
D2E = "./dynexp2.sats"
(* ****** ****** *)
#typedef token = $LEX.token
(* ****** ****** *)
#typedef sort2 = $S2E.sort2
#typedef s2exp = $S2E.s2exp
#typedef l2s2e = $S2E.l2s2e
(* ****** ****** *)
#typedef sort2lst = $S2E.sort2lst
#typedef s2explst = $S2E.s2explst
(* ****** ****** *)
#typedef d2pat = $D2E.d2pat
#typedef d2exp = $D2E.d2exp
#typedef l2d2p = $D2E.l2d2p
#typedef l2d2e = $D2E.l2d2e
(* ****** ****** *)
#typedef f2arg = $D2E.f2arg
(* ****** ****** *)
//
#typedef s2res = $D2E.s2res
//
(* ****** ****** *)
#typedef d2ecl = $D2E.d2ecl
(* ****** ****** *)
#typedef d2patlst = $D2E.d2patlst
#typedef d2explst = $D2E.d2explst
#typedef d2eclist = $D2E.d2eclist
(* ****** ****** *)
//
#typedef d2parsed = $D2E.d2parsed
//
(* ****** ****** *)
#typedef d2eclistopt = $D2E.d2eclistopt
(* ****** ****** *)
//
fun
d2parsed_tread12
(dpar: d2parsed): (d2parsed)
//
(* ****** ****** *)
//
#typedef
ftread12
(syn: tx) =
(syn , &sint >> _) -> ( syn )
//
(* ****** ****** *)
//
fun
list_tread12_fnp
{syn:tx}
( lst: list(syn)
, err: &sint >> _
, fpr: ftread12(syn)): list(syn)
//
fun
optn_tread12_fnp
{syn:tx}
( opt: optn(syn)
, err: &sint >> _
, fpr: ftread12(syn)): optn(syn)
//
(* ****** ****** *)
fun tread12_sort2: ftread12(sort2)
fun tread12_s2exp: ftread12(s2exp)
fun tread12_l2s2e: ftread12(l2s2e)
(* ****** ****** *)
fun tread12_sort2lst: ftread12(sort2lst)
fun tread12_s2explst: ftread12(s2explst)
(* ****** ****** *)
fun tread12_d2pat: ftread12(d2pat)
fun tread12_d2exp: ftread12(d2exp)
fun tread12_l2d2p: ftread12(l2d2p)
fun tread12_l2d2e: ftread12(l2d2e)
(* ****** ****** *)
fun tread12_f2arg: ftread12(f2arg)
(* ****** ****** *)
fun tread12_d2ecl: ftread12(d2ecl)
(* ****** ****** *)
fun tread12_d2patlst: ftread12(d2patlst)
fun tread12_d2explst: ftread12(d2explst)
(* ****** ****** *)
fun tread12_d2eclist: ftread12(d2eclist)
(* ****** ****** *)
fun tread12_d2eclistopt: ftread12(d2eclistopt)
(* ****** ****** *)

(* end of [ATS3/XATSOPT_srcgen2_tread12.sats] *)

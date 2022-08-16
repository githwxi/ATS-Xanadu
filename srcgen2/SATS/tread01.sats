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
Sun Jul 24 18:17:29 EDT 2022
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
S1E = "./staexp1.sats"
#staload
D1E = "./dynexp1.sats"
(* ****** ****** *)
#typedef token = $LEX.token
(* ****** ****** *)
#typedef g1exp = $S1E.g1exp
(* ****** ****** *)
#typedef sort1 = $S1E.sort1
#typedef s1exp = $S1E.s1exp
(* ****** ****** *)
#typedef g1explst = $S1E.g1explst
#typedef g1expopt = $S1E.g1expopt
(* ****** ****** *)
#typedef sort1lst = $S1E.sort1lst
#typedef sort1opt = $S1E.sort1opt
(* ****** ****** *)
#typedef s1expopt = $S1E.s1expopt
#typedef s1explst = $S1E.s1explst
(* ****** ****** *)
#typedef d1pat = $D1E.d1pat
#typedef d1exp = $D1E.d1exp
#typedef d1ecl = $D1E.d1ecl
(* ****** ****** *)
#typedef d1patlst = $D1E.d1patlst
(* ****** ****** *)
#typedef d1explst = $D1E.d1explst
#typedef d1expopt = $D1E.d1expopt
(* ****** ****** *)
#typedef d1eclist = $D1E.d1eclist
(* ****** ****** *)
#typedef d1parsed = $D1E.d1parsed
(* ****** ****** *)
#typedef d1eclistopt = $D1E.d1eclistopt
(* ****** ****** *)
//
fun
d1parsed_tread01
(dpar: d1parsed): (d1parsed)
//
(* ****** ****** *)
//
#typedef
ftread01
(syn: tx) =
(syn , &sint >> _) -> ( syn )
//
(* ****** ****** *)
fun tread01_g1exp: ftread01(g1exp)
(* ****** ****** *)
fun tread01_sort1: ftread01(sort1)
fun tread01_s1exp: ftread01(s1exp)
(* ****** ****** *)
fun tread01_d1pat: ftread01(d1pat)
fun tread01_d1exp: ftread01(d1exp)
(* ****** ****** *)
fun tread01_d1ecl: ftread01(d1ecl)
(* ****** ****** *)
//
fun
list_tread01_fnp
{syn:tx}
( lst: list(syn)
, err: &sint >> _
, fpr: ftread01(syn)): list(syn)
//
fun
optn_tread01_fnp
{syn:tx}
( opt: optn(syn)
, err: &sint >> _
, fpr: ftread01(syn)): optn(syn)
//
(* ****** ****** *)
fun
tread01_g1explst: ftread01(g1explst)
fun
tread01_g1expopt: ftread01(g1expopt)
(* ****** ****** *)
fun
tread01_sort1lst: ftread01(sort1lst)
fun
tread01_sort1opt: ftread01(sort1opt)
(* ****** ****** *)
fun
tread01_s1explst: ftread01(s1explst)
fun
tread01_s1expopt: ftread01(s1expopt)
(* ****** ****** *)
fun
tread01_d1patlst: ftread01(d1patlst)
(* ****** ****** *)
fun
tread01_d1explst: ftread01(d1explst)
fun
tread01_d1expopt: ftread01(d1expopt)
(* ****** ****** *)
fun
tread01_d1eclist: ftread01(d1eclist)
(* ****** ****** *)
fun
tread01_d1eclistopt: ftread01(d1eclistopt)
(* ****** ****** *)

(* end of [ATS3/XATSOPT_tread01.sats] *)

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
S1E = "./staexp0.sats"
#staload
D1E = "./dynexp0.sats"
(* ****** ****** *)
#typedef token = $LEX.token
(* ****** ****** *)
#typedef g1exp = $S1E.g1exp
(* ****** ****** *)
#typedef sort1 = $S1E.sort1
#typedef s1exp = $S1E.s1exp
(* ****** ****** *)
#typedef g1explst = $S1E.g1explst
(* ****** ****** *)
#typedef sort1lst = $S1E.sort1lst
#typedef s1explst = $S1E.s1explst
(* ****** ****** *)
#typedef d1pat = $D1E.d1pat
#typedef d1exp = $D1E.d1exp
#typedef d1ecl = $D1E.d1ecl
(* ****** ****** *)
#typedef d1patlst = $D1E.d1patlst
#typedef d1explst = $D1E.d1explst
#typedef d1eclist = $D1E.d1eclist
(* ****** ****** *)
//
fun
d1parsed_tread01
(dpar: d1parsed): (d1parsed)
//
(* ****** ****** *)
//
#typedef
ftrans01
(syn: tx) =
(syn , &sint >> _) -> ( syn )
//
(* ****** ****** *)
fun trans01_g1exp: ftrans01(g1exp)
(* ****** ****** *)
fun trans01_sort1: ftrans01(sort1)
fun trans01_s1exp: ftrans01(s1exp)
(* ****** ****** *)
fun trans01_d1pat: ftrans01(d1pat)
fun trans01_d1exp: ftrans01(d1exp)
(* ****** ****** *)
fun trans01_d1ecl: ftrans01(d1ecl)
(* ****** ****** *)
//
fun
trans01_synentlst_fun
{syn:tx}
( lst: list(syn)
, err: &sint >> _
, fpr: ftrans01(syn)): list(syn)
//
fun
trans01_synentopt_fun
{syn:tx}
( opt: optn(syn)
, err: &sint >> _
, fpr: ftrans01(syn)): optn(syn)
//
(* ****** ****** *)
fun
trans01_g1explst: ftrans01(g1explst)
fun
trans01_g1expopt: ftrans01(g1expopt)
(* ****** ****** *)
fun
trans01_sort1lst: ftrans01(sort1lst)
fun
trans01_sort1opt: ftrans01(sort1opt)
(* ****** ****** *)
fun
trans01_s1explst: ftrans01(s1explst)
fun
trans01_s1expopt: ftrans01(s1expopt)
(* ****** ****** *)
fun
trans01_d1patlst: ftrans01(d1patlst)
(* ****** ****** *)
fun
trans01_d1explst: ftrans01(d1explst)
fun
trans01_d1expopt: ftrans01(d1expopt)
(* ****** ****** *)
fun
trans01_d1eclist: ftrans01(d1eclist)
(* ****** ****** *)
fun
trans01_d1eclistopt: ftrans01(d1eclistopt)
(* ****** ****** *)

(* end of [ATS3/XATSOPT_tread01.sats] *)

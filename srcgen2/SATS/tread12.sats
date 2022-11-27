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
#typedef s2tex = $S2E.s2tex
(* ****** ****** *)
#typedef sort2lst = $S2E.sort2lst
#typedef sort2opt = $S2E.sort2opt
(* ****** ****** *)
#typedef s2explst = $S2E.s2explst
#typedef s2expopt = $S2E.s2expopt
(* ****** ****** *)
#typedef l2s2elst = $S2E.l2s2elst
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
#typedef d2gua = $D2E.d2gua
#typedef d2gpt = $D2E.d2gpt
#typedef d2cls = $D2E.d2cls
(* ****** ****** *)
#typedef d2ecl = $D2E.d2ecl
(* ****** ****** *)
#typedef d2patlst = $D2E.d2patlst
#typedef d2patopt = $D2E.d2patopt
(* ****** ****** *)
#typedef d2explst = $D2E.d2explst
#typedef d2expopt = $D2E.d2expopt
(* ****** ****** *)
#typedef l2d2plst = $D2E.l2d2plst
#typedef l2d2elst = $D2E.l2d2elst
(* ****** ****** *)
#typedef f2arglst = $D2E.f2arglst
(* ****** ****** *)
#typedef d2clslst = $D2E.d2clslst
(* ****** ****** *)
#typedef d2eclist = $D2E.d2eclist
(* ****** ****** *)
#typedef wths2exp = $D2E.wths2exp
#typedef teqd2exp = $D2E.teqd2exp
(* ****** ****** *)
#typedef d2valdcl = $D2E.d2valdcl
#typedef d2vardcl = $D2E.d2vardcl
#typedef d2fundcl = $D2E.d2fundcl
#typedef d2cstdcl = $D2E.d2cstdcl
(* ****** ****** *)
//
#typedef d2parsed = $D2E.d2parsed
//
(* ****** ****** *)
#typedef d2valdclist = $D2E.d2valdclist
#typedef d2vardclist = $D2E.d2vardclist
#typedef d2fundclist = $D2E.d2fundclist
#typedef d2cstdclist = $D2E.d2cstdclist
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
fun tread12_s2tex: ftread12(s2tex)
(* ****** ****** *)
fun tread12_sort2lst: ftread12(sort2lst)
fun tread12_sort2opt: ftread12(sort2opt)
(* ****** ****** *)
fun tread12_s2explst: ftread12(s2explst)
fun tread12_s2expopt: ftread12(s2expopt)
(* ****** ****** *)
fun tread12_l2s2elst: ftread12(l2s2elst)
(* ****** ****** *)
fun tread12_d2pat: ftread12(d2pat)
fun tread12_d2exp: ftread12(d2exp)
fun tread12_l2d2p: ftread12(l2d2p)
fun tread12_l2d2e: ftread12(l2d2e)
(* ****** ****** *)
fun tread12_f2arg: ftread12(f2arg)
(* ****** ****** *)
//
fun tread12_s2res: ftread12(s2res)
//
(*
fun tread12_d2res: ftread12(d2res)
*)
//
(* ****** ****** *)
fun tread12_d2gua: ftread12(d2gua)
fun tread12_d2gpt: ftread12(d2gpt)
fun tread12_d2cls: ftread12(d2cls)
(* ****** ****** *)
fun tread12_d2ecl: ftread12(d2ecl)
(* ****** ****** *)
fun tread12_d2patlst: ftread12(d2patlst)
(* ****** ****** *)
fun tread12_d2explst: ftread12(d2explst)
fun tread12_d2expopt: ftread12(d2expopt)
(* ****** ****** *)
fun tread12_l2d2plst: ftread12(l2d2plst)
fun tread12_l2d2elst: ftread12(l2d2elst)
(* ****** ****** *)
fun tread12_f2arglst: ftread12(f2arglst)
(* ****** ****** *)
fun tread12_d2clslst: ftread12(d2clslst)
(* ****** ****** *)
fun tread12_d2eclist: ftread12(d2eclist)
(* ****** ****** *)
fun tread12_teqd2exp: ftread12(teqd2exp)
fun tread12_wths2exp: ftread12(wths2exp)
(* ****** ****** *)
fun tread12_d2valdcl: ftread12(d2valdcl)
fun tread12_d2vardcl: ftread12(d2vardcl)
fun tread12_d2fundcl: ftread12(d2fundcl)
fun tread12_d2cstdcl: ftread12(d2cstdcl)
(* ****** ****** *)
fun tread12_d2valdclist: ftread12(d2valdclist)
fun tread12_d2vardclist: ftread12(d2vardclist)
fun tread12_d2fundclist: ftread12(d2fundclist)
fun tread12_d2cstdclist: ftread12(d2cstdclist)
(* ****** ****** *)
fun tread12_d2eclistopt: ftread12(d2eclistopt)
(* ****** ****** *)

(* end of [ATS3/XATSOPT_srcgen2_tread12.sats] *)

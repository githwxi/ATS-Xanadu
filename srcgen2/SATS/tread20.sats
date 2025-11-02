(***********************************************************************)
(*                                                                     *)
(*                         Applied Type System                         *)
(*                                                                     *)
(***********************************************************************)

(*
** ATS/Xanadu - Unleashing the Potential of Types!
** Copyright (C) 2023 Hongwei Xi, ATS Trustful Software, Inc.
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
Sat 28 Jan 2023 03:53:21 PM EST
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
(* ****** ****** *)
#typedef s2cst = $S2E.s2cst
#typedef s2var = $S2E.s2var
(* ****** ****** *)
#typedef s2exp = $S2E.s2exp
#typedef l2s2e = $S2E.l2s2e
(* ****** ****** *)
#typedef s2tex = $S2E.s2tex
(* ****** ****** *)
#typedef sort2lst = $S2E.sort2lst
#typedef sort2opt = $S2E.sort2opt
(* ****** ****** *)
#typedef s2cstlst = $S2E.s2cstlst
#typedef s2varlst = $S2E.s2varlst
(* ****** ****** *)
#typedef s2explst = $S2E.s2explst
#typedef s2expopt = $S2E.s2expopt
(* ****** ****** *)
#typedef l2s2elst = $S2E.l2s2elst
(* ****** ****** *)
#typedef d2con = $D2E.d2con
#typedef d2cst = $D2E.d2cst
#typedef d2var = $D2E.d2var
(* ****** ****** *)
#typedef d2pat = $D2E.d2pat
#typedef d2exp = $D2E.d2exp
#typedef l2d2p = $D2E.l2d2p
#typedef l2d2e = $D2E.l2d2e
(* ****** ****** *)
#typedef f2arg = $D2E.f2arg
(* ****** ****** *)
#typedef d2gua = $D2E.d2gua
#typedef d2gpt = $D2E.d2gpt
#typedef d2cls = $D2E.d2cls
(* ****** ****** *)
//
#typedef s2res = $D2E.s2res
//
(* ****** ****** *)
#typedef d2gua = $D2E.d2gua
#typedef d2gpt = $D2E.d2gpt
#typedef d2cls = $D2E.d2cls
(* ****** ****** *)
#typedef d2arg = $D2E.d2arg
(* ****** ****** *)
#typedef d2ecl = $D2E.d2ecl
(* ****** ****** *)
#typedef s2qag = $D2E.s2qag
#typedef t2qag = $D2E.t2qag
#typedef t2iag = $D2E.t2iag
(* ****** ****** *)
#typedef a2tdf = $D2E.a2tdf
(* ****** ****** *)
#typedef simpl = $D2E.simpl
#typedef dimpl = $D2E.dimpl
(* ****** ****** *)
#typedef d2conlst = $D2E.d2conlst
#typedef d2cstlst = $D2E.d2cstlst
(* ****** ****** *)
#typedef d2varlst = $D2E.d2varlst
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
#typedef d2gualst = $D2E.d2gualst
#typedef d2clslst = $D2E.d2clslst
(* ****** ****** *)
#typedef d2arglst = $D2E.d2arglst
(* ****** ****** *)
#typedef d2eclist = $D2E.d2eclist
(* ****** ****** *)
#typedef s2qaglst = $D2E.s2qaglst
#typedef t2qaglst = $D2E.t2qaglst
#typedef t2iaglst = $D2E.t2iaglst
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
#typedef d2explstopt = $D2E.d2explstopt
#typedef d2eclistopt = $D2E.d2eclistopt
(* ****** ****** *)
//
fun
d2parsed_of_tread20
(dpar: d2parsed): (d2parsed)
//
(* ****** ****** *)
//
#typedef
ftread20
(syn : tbox) =
(syn , &sint >> _) -> ( syn )
//
(* ****** ****** *)
//
fun
list_tread20_fnp
{syn:tx}
( lst: list(syn)
, err: &sint >> _
, fpr: ftread20(syn)): list(syn)
//
fun
optn_tread20_fnp
{syn:tx}
( opt: optn(syn)
, err: &sint >> _
, fpr: ftread20(syn)): optn(syn)
//
(* ****** ****** *)
fun tread20_d2pat: ftread20(d2pat)
fun tread20_d2exp: ftread20(d2exp)
fun tread20_l2d2p: ftread20(l2d2p)
fun tread20_l2d2e: ftread20(l2d2e)
(* ****** ****** *)
fun tread20_f2arg: ftread20(f2arg)
(* ****** ****** *)
fun tread20_d2gua: ftread20(d2gua)
fun tread20_d2gpt: ftread20(d2gpt)
fun tread20_d2cls: ftread20(d2cls)
(* ****** ****** *)
fun tread20_d2ecl: ftread20(d2ecl)
(* ****** ****** *)
fun tread20_d2patlst: ftread20(d2patlst)
fun tread20_l2d2plst: ftread20(l2d2plst)
(* ****** ****** *)
fun tread20_d2explst: ftread20(d2explst)
fun tread20_d2expopt: ftread20(d2expopt)
fun tread20_l2d2elst: ftread20(l2d2elst)
(* ****** ****** *)
fun tread20_f2arglst: ftread20(f2arglst)
(* ****** ****** *)
fun tread20_d2gualst: ftread20(d2gualst)
fun tread20_d2clslst: ftread20(d2clslst)
(* ****** ****** *)
fun tread20_d2eclist: ftread20(d2eclist)
(* ****** ****** *)
fun tread20_teqd2exp: ftread20(teqd2exp)
(* ****** ****** *)
fun tread20_d2valdcl: ftread20(d2valdcl)
fun tread20_d2vardcl: ftread20(d2vardcl)
fun tread20_d2fundcl: ftread20(d2fundcl)
fun tread20_d2cstdcl: ftread20(d2cstdcl)
(* ****** ****** *)
fun tread20_d2valdclist: ftread20(d2valdclist)
fun tread20_d2vardclist: ftread20(d2vardclist)
fun tread20_d2fundclist: ftread20(d2fundclist)
fun tread20_d2cstdclist: ftread20(d2cstdclist)
(* ****** ****** *)
fun tread20_d2explstopt: ftread20(d2explstopt)
fun tread20_d2eclistopt: ftread20(d2eclistopt)
(* ****** ****** *)
(* ****** ****** *)
//
(***********************************************************************)
(* end of [ATS3/XATSOPT_srcgen2_SATS_tread20.sats] *)
(***********************************************************************)

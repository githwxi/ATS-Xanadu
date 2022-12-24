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
#typedef d2eclistopt = $D2E.d2eclistopt
(* ****** ****** *)
//
fun
d2parsed_of_tread12
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
(* ****** ****** *)
fun tread12_s2cst: ftread12(s2cst)
fun tread12_s2var: ftread12(s2var)
(* ****** ****** *)
fun tread12_s2exp: ftread12(s2exp)
fun tread12_l2s2e: ftread12(l2s2e)
(* ****** ****** *)
fun tread12_s2tex: ftread12(s2tex)
(* ****** ****** *)
fun tread12_sort2lst: ftread12(sort2lst)
fun tread12_sort2opt: ftread12(sort2opt)
(* ****** ****** *)
fun tread12_s2cstlst: ftread12(s2cstlst)
fun tread12_s2varlst: ftread12(s2varlst)
(* ****** ****** *)
fun tread12_s2explst: ftread12(s2explst)
fun tread12_s2expopt: ftread12(s2expopt)
(* ****** ****** *)
fun tread12_l2s2elst: ftread12(l2s2elst)
(* ****** ****** *)
fun tread12_d2con: ftread12(d2con)
fun tread12_d2cst: ftread12(d2cst)
fun tread12_d2var: ftread12(d2var)
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
fun tread12_d2arg: ftread12(d2arg)
(* ****** ****** *)
fun tread12_d2ecl: ftread12(d2ecl)
(* ****** ****** *)
fun tread12_s2qag: ftread12(s2qag)
fun tread12_t2qag: ftread12(t2qag)
fun tread12_t2iag: ftread12(t2iag)
(* ****** ****** *)
fun tread12_a2tdf: ftread12(a2tdf)
(* ****** ****** *)
fun tread12_simpl: ftread12(simpl)
fun tread12_dimpl: ftread12(dimpl)
(* ****** ****** *)
fun tread12_d2conlst: ftread12(d2conlst)
fun tread12_d2cstlst: ftread12(d2cstlst)
(* ****** ****** *)
fun tread12_d2varlst: ftread12(d2varlst)
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
fun tread12_d2gualst: ftread12(d2gualst)
fun tread12_d2clslst: ftread12(d2clslst)
(* ****** ****** *)
fun tread12_d2arglst: ftread12(d2arglst)
(* ****** ****** *)
fun tread12_d2eclist: ftread12(d2eclist)
(* ****** ****** *)
fun tread12_s2qaglst: ftread12(s2qaglst)
fun tread12_t2qaglst: ftread12(t2qaglst)
fun tread12_t2iaglst: ftread12(t2iaglst)
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
(*
//
//HX-2022-12-16: printing errmsgs
//
*)
(* ****** ****** *)
fun sort2_fpemsg(FILR, sort2): void
fun s2exp_fpemsg(FILR, s2exp): void
fun l2s2e_fpemsg(FILR, l2s2e): void
(* ****** ****** *)
fun s2tex_fpemsg(FILR, s2tex): void
(* ****** ****** *)
fun d2pat_fpemsg(FILR, d2pat): void
fun d2exp_fpemsg(FILR, d2exp): void
fun l2d2p_fpemsg(FILR, l2d2p): void
fun l2d2e_fpemsg(FILR, l2d2e): void
(* ****** ****** *)
fun f2arg_fpemsg:(FILR,f2arg)->void
(* ****** ****** *)
fun s2res_fpemsg:(FILR,s2res)->void
(* ****** ****** *)
fun d2gua_fpemsg:(FILR,d2gua)->void
fun d2gpt_fpemsg:(FILR,d2gpt)->void
fun d2cls_fpemsg:(FILR,d2cls)->void
(* ****** ****** *)
fun d2arg_fpemsg(FILR, d2arg): void
(* ****** ****** *)
fun d2ecl_fpemsg(FILR, d2ecl): void
(* ****** ****** *)
fun s2qag_fpemsg:(FILR,s2qag)->void
fun t2qag_fpemsg:(FILR,t2qag)->void
fun t2iag_fpemsg:(FILR,t2iag)->void
(* ****** ****** *)
fun simpl_fpemsg(FILR, simpl): void
fun dimpl_fpemsg(FILR, dimpl): void
(* ****** ****** *)
fun a2tdf_fpemsg(FILR, a2tdf): void
(* ****** ****** *)
fun sort2lst_fpemsg(FILR, sort2lst): void
fun sort2opt_fpemsg(FILR, sort2opt): void
(* ****** ****** *)
fun s2explst_fpemsg(FILR, s2explst): void
fun s2expopt_fpemsg(FILR, s2expopt): void
(* ****** ****** *)
fun l2s2elst_fpemsg(FILR, l2s2elst): void
(* ****** ****** *)
fun d2patlst_fpemsg(FILR, d2patlst): void
(* ****** ****** *)
fun d2explst_fpemsg(FILR, d2explst): void
fun d2expopt_fpemsg(FILR, d2expopt): void
(* ****** ****** *)
fun l2d2plst_fpemsg(FILR, l2d2plst): void
fun l2d2elst_fpemsg(FILR, l2d2elst): void
(* ****** ****** *)
fun f2arglst_fpemsg(FILR, f2arglst): void
(* ****** ****** *)
fun d2gualst_fpemsg:(FILR,d2gualst)->void
fun d2clslst_fpemsg:(FILR,d2clslst)->void
(* ****** ****** *)
fun s2qaglst_fpemsg(FILR, s2qaglst): void
fun t2qaglst_fpemsg(FILR, t2qaglst): void
fun t2iaglst_fpemsg(FILR, t2iaglst): void
(* ****** ****** *)
fun d2arglst_fpemsg(FILR, d2arglst): void
(* ****** ****** *)
fun d2eclist_fpemsg(FILR, d2eclist): void
(* ****** ****** *)
fun teqd2exp_fpemsg(FILR, teqd2exp): void
fun wths2exp_fpemsg(FILR, wths2exp): void
(* ****** ****** *)
fun d2valdcl_fpemsg(FILR, d2valdcl): void
fun d2vardcl_fpemsg(FILR, d2vardcl): void
fun d2fundcl_fpemsg(FILR, d2fundcl): void
fun d2cstdcl_fpemsg(FILR, d2cstdcl): void
(* ****** ****** *)
fun
d2valdclist_fpemsg(FILR, d2valdclist): void
(* ****** ****** *)
fun
d2vardclist_fpemsg(FILR, d2vardclist): void
(* ****** ****** *)
fun
d2fundclist_fpemsg(FILR, d2fundclist): void
(* ****** ****** *)
fun
d2cstdclist_fpemsg(FILR, d2cstdclist): void
(* ****** ****** *)
//
fun
d2parsed_fpemsg
( out: FILR, dpar: d2parsed ): void
//
fun
d2eclistopt_fpemsg(FILR, d2eclistopt): void
//
(* ****** ****** *)

(* end of [ATS3/XATSOPT_srcgen2_tread12.sats] *)

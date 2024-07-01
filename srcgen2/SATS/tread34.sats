(***********************************************************************)
(*                                                                     *)
(*                         Applied Type System                         *)
(*                                                                     *)
(***********************************************************************)

(*
** ATS/Xanadu - Unleashing the Potential of Types!
** Copyright (C) 2024 Hongwei Xi, ATS Trustful Software, Inc.
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
Tue Jan 23 00:07:32 EST 2024
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
#staload LEX = "./lexing0.sats"
(* ****** ****** *)
#staload D2E = "./dynexp2.sats"
#staload D3E = "./dynexp3.sats"
#staload D4E = "./dynexp4.sats"
(* ****** ****** *)
#typedef token = $LEX.token
(* ****** ****** *)
#typedef d2con = $D2E.d2con
#typedef d2cst = $D2E.d2cst
#typedef d2var = $D2E.d2var
(* ****** ****** *)
#typedef d4pat = $D4E.d4pat
#typedef d4exp = $D4E.d4exp
#typedef l4d4p = $D4E.l4d4p
#typedef l4d4e = $D4E.l4d4e
(* ****** ****** *)
#typedef f4arg = $D4E.f4arg
(* ****** ****** *)
#typedef d4gua = $D4E.d4gua
#typedef d4gpt = $D4E.d4gpt
#typedef d4cls = $D4E.d4cls
(* ****** ****** *)
#typedef d4ecl = $D4E.d4ecl
(* ****** ****** *)
#typedef d2conlst = $D2E.d2conlst
#typedef d2cstlst = $D2E.d2cstlst
(* ****** ****** *)
#typedef d2varlst = $D2E.d2varlst
(* ****** ****** *)
#typedef d4patlst = $D4E.d4patlst
#typedef d4patopt = $D4E.d4patopt
(* ****** ****** *)
#typedef d4explst = $D4E.d4explst
#typedef d4expopt = $D4E.d4expopt
(* ****** ****** *)
#typedef l4d4plst = $D4E.l4d4plst
#typedef l4d4elst = $D4E.l4d4elst
(* ****** ****** *)
#typedef f4arglst = $D4E.f4arglst
(* ****** ****** *)
#typedef d4gualst = $D4E.d4gualst
#typedef d4clslst = $D4E.d4clslst
(* ****** ****** *)
#typedef d4eclist = $D4E.d4eclist
(* ****** ****** *)
#typedef teqd4exp = $D4E.teqd4exp
(* ****** ****** *)
#typedef d4valdcl = $D4E.d4valdcl
#typedef d4vardcl = $D4E.d4vardcl
#typedef d4fundcl = $D4E.d4fundcl
(* ****** ****** *)
//
#typedef d4parsed = $D4E.d4parsed
//
(* ****** ****** *)
#typedef d4valdclist = $D4E.d4valdclist
#typedef d4vardclist = $D4E.d4vardclist
#typedef d4fundclist = $D4E.d4fundclist
(* ****** ****** *)
#typedef d4explstopt = $D4E.d4explstopt
#typedef d4eclistopt = $D4E.d4eclistopt
(* ****** ****** *)
//
fun
d4parsed_of_tread34
(dpar: d4parsed): (d4parsed)
//
(* ****** ****** *)
//
#typedef
ftread34
(syn: tx) =
(syn , &sint >> _) -> ( syn )
//
(* ****** ****** *)
//
fun
list_tread34_fnp
{syn:tx}
( lst: list(syn)
, err: &sint >> _
, fpr: ftread34(syn)): list(syn)
//
fun
optn_tread34_fnp
{syn:tx}
( opt: optn(syn)
, err: &sint >> _
, fpr: ftread34(syn)): optn(syn)
//
(* ****** ****** *)
fun tread34_d4pat: ftread34(d4pat)
fun tread34_l4d4p: ftread34(l4d4p)
(* ****** ****** *)
fun tread34_d4exp: ftread34(d4exp)
fun tread34_l4d4e: ftread34(l4d4e)
(* ****** ****** *)
fun tread34_f4arg: ftread34(f4arg)
(* ****** ****** *)
fun tread34_d4gua: ftread34(d4gua)
fun tread34_d4gpt: ftread34(d4gpt)
fun tread34_d4cls: ftread34(d4cls)
(* ****** ****** *)
fun tread34_d4ecl: ftread34(d4ecl)
(* ****** ****** *)
fun tread34_d4patlst: ftread34(d4patlst)
fun tread34_d4patopt: ftread34(d4patopt)
fun tread34_l4d4plst: ftread34(l4d4plst)
(* ****** ****** *)
fun tread34_d4explst: ftread34(d4explst)
fun tread34_d4expopt: ftread34(d4expopt)
fun tread34_l4d4elst: ftread34(l4d4elst)
(* ****** ****** *)
fun tread34_f4arglst: ftread34(f4arglst)
(* ****** ****** *)
fun tread34_d4gualst: ftread34(d4gualst)
fun tread34_d4clslst: ftread34(d4clslst)
(* ****** ****** *)
fun tread34_d4eclist: ftread34(d4eclist)
(* ****** ****** *)
fun tread34_teqd4exp: ftread34(teqd4exp)
(* ****** ****** *)
fun tread34_d4valdcl: ftread34(d4valdcl)
fun tread34_d4vardcl: ftread34(d4vardcl)
fun tread34_d4fundcl: ftread34(d4fundcl)
(* ****** ****** *)
fun
tread34_d4valdclist: ftread34(d4valdclist)
fun
tread34_d4vardclist: ftread34(d4vardclist)
fun
tread34_d4fundclist: ftread34(d4fundclist)
(* ****** ****** *)
fun
tread34_d4explstopt: ftread34(d4explstopt)
fun
tread34_d4eclistopt: ftread34(d4eclistopt)
(* ****** ****** *)
(*
//
//HX-2034-02-26: printing errmsgs
//
*)
(* ****** ****** *)
fun d4pat_fpemsg(FILR, d4pat): void
fun d4exp_fpemsg(FILR, d4exp): void
fun l4d4p_fpemsg(FILR, l4d4p): void
fun l4d4e_fpemsg(FILR, l4d4e): void
(* ****** ****** *)
fun f4arg_fpemsg:(FILR,f4arg)->void
(* ****** ****** *)
fun d4gua_fpemsg:(FILR,d4gua)->void
fun d4gpt_fpemsg:(FILR,d4gpt)->void
fun d4cls_fpemsg:(FILR,d4cls)->void
(* ****** ****** *)
fun d4ecl_fpemsg(FILR, d4ecl): void
(* ****** ****** *)
fun d4patlst_fpemsg(FILR, d4patlst): void
(* ****** ****** *)
fun d4explst_fpemsg(FILR, d4explst): void
fun d4expopt_fpemsg(FILR, d4expopt): void
(* ****** ****** *)
fun l4d4plst_fpemsg(FILR, l4d4plst): void
fun l4d4elst_fpemsg(FILR, l4d4elst): void
(* ****** ****** *)
fun f4arglst_fpemsg(FILR, f4arglst): void
(* ****** ****** *)
fun d4gualst_fpemsg(FILR, d4gualst): void
fun d4clslst_fpemsg(FILR, d4clslst): void
(* ****** ****** *)
fun d4eclist_fpemsg(FILR, d4eclist): void
(* ****** ****** *)
fun teqd4exp_fpemsg(FILR, teqd4exp): void
(* ****** ****** *)
fun d4valdcl_fpemsg(FILR, d4valdcl): void
fun d4vardcl_fpemsg(FILR, d4vardcl): void
fun d4fundcl_fpemsg(FILR, d4fundcl): void
(* ****** ****** *)
fun
d4valdclist_fpemsg(FILR, d4valdclist): void
(* ****** ****** *)
fun
d4vardclist_fpemsg(FILR, d4vardclist): void
(* ****** ****** *)
fun
d4fundclist_fpemsg(FILR, d4fundclist): void
(* ****** ****** *)
//
fun
d4parsed_fpemsg
( out: FILR, dpar: d4parsed ): void
//
(* ****** ****** *)
//
fun
d4explstopt_fpemsg(FILR, d4explstopt): void
fun
d4eclistopt_fpemsg(FILR, d4eclistopt): void
//
(* ****** ****** *)

(* end of [ATS3/XATSOPT_srcgen2_SATS_tread34.sats] *)

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
Sun 26 Feb 2023 10:12:46 AM EST
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
(* ****** ****** *)
#typedef token = $LEX.token
(* ****** ****** *)
#typedef d2con = $D2E.d2con
#typedef d2cst = $D2E.d2cst
#typedef d2var = $D2E.d2var
(* ****** ****** *)
#typedef d3pat = $D3E.d3pat
#typedef d3exp = $D3E.d3exp
#typedef l3d3p = $D3E.l3d3p
#typedef l3d3e = $D3E.l3d3e
(* ****** ****** *)
#typedef f3arg = $D3E.f3arg
(* ****** ****** *)
#typedef d3ecl = $D3E.d3ecl
(* ****** ****** *)
#typedef d2conlst = $D2E.d2conlst
#typedef d2cstlst = $D2E.d2cstlst
(* ****** ****** *)
#typedef d2varlst = $D2E.d2varlst
(* ****** ****** *)
#typedef d3patlst = $D3E.d3patlst
#typedef d3patopt = $D3E.d3patopt
(* ****** ****** *)
#typedef d3explst = $D3E.d3explst
#typedef d3expopt = $D3E.d3expopt
(* ****** ****** *)
#typedef l3d3plst = $D3E.l3d3plst
#typedef l3d3elst = $D3E.l3d3elst
(* ****** ****** *)
#typedef f3arglst = $D3E.f3arglst
(* ****** ****** *)
#typedef d3eclist = $D3E.d3eclist
(* ****** ****** *)
#typedef teqd3exp = $D3E.teqd3exp
(* ****** ****** *)
#typedef d3valdcl = $D3E.d3valdcl
#typedef d3vardcl = $D3E.d3vardcl
#typedef d3fundcl = $D3E.d3fundcl
(* ****** ****** *)
//
#typedef d3parsed = $D3E.d3parsed
//
(* ****** ****** *)
#typedef d3valdclist = $D3E.d3valdclist
#typedef d3vardclist = $D3E.d3vardclist
#typedef d3fundclist = $D3E.d3fundclist
(* ****** ****** *)
#typedef d3explstopt = $D3E.d3explstopt
#typedef d3eclistopt = $D3E.d3eclistopt
(* ****** ****** *)
//
fun
d3parsed_of_tread23
(dpar: d3parsed): (d3parsed)
//
(* ****** ****** *)
//
#typedef
ftread23
(syn: tx) =
(syn , &sint >> _) -> ( syn )
//
(* ****** ****** *)
//
fun
list_tread23_fnp
{syn:tx}
( lst: list(syn)
, err: &sint >> _
, fpr: ftread23(syn)): list(syn)
//
fun
optn_tread23_fnp
{syn:tx}
( opt: optn(syn)
, err: &sint >> _
, fpr: ftread23(syn)): optn(syn)
//
(* ****** ****** *)
fun tread23_d3pat: ftread23(d3pat)
fun tread23_l3d3p: ftread23(l3d3p)
(* ****** ****** *)
fun tread23_d3exp: ftread23(d3exp)
fun tread23_l3d3e: ftread23(l3d3e)
(* ****** ****** *)
fun tread23_f3arg: ftread23(f3arg)
(* ****** ****** *)
fun tread23_d3ecl: ftread23(d3ecl)
(* ****** ****** *)
fun tread23_d3patlst: ftread23(d3patlst)
fun tread23_d3patopt: ftread23(d3patopt)
fun tread23_l3d3plst: ftread23(l3d3plst)
(* ****** ****** *)
fun tread23_d3explst: ftread23(d3explst)
fun tread23_d3expopt: ftread23(d3expopt)
fun tread23_l3d3elst: ftread23(l3d3elst)
(* ****** ****** *)
fun tread23_f3arglst: ftread23(f3arglst)
(* ****** ****** *)
fun tread23_d3eclist: ftread23(d3eclist)
(* ****** ****** *)
fun tread23_teqd3exp: ftread23(teqd3exp)
(* ****** ****** *)
fun tread23_d3valdcl: ftread23(d3valdcl)
fun tread23_d3vardcl: ftread23(d3vardcl)
fun tread23_d3fundcl: ftread23(d3fundcl)
(* ****** ****** *)
fun tread23_d3valdclist: ftread23(d3valdclist)
fun tread23_d3vardclist: ftread23(d3vardclist)
fun tread23_d3fundclist: ftread23(d3fundclist)
(* ****** ****** *)
fun tread23_d3explstopt: ftread23(d3explstopt)
fun tread23_d3eclistopt: ftread23(d3eclistopt)
(* ****** ****** *)
(*
//
//HX-2023-02-26: printing errmsgs
//
*)
(* ****** ****** *)
fun d3pat_fpemsg(FILR, d3pat): void
fun d3exp_fpemsg(FILR, d3exp): void
fun l3d3p_fpemsg(FILR, l3d3p): void
fun l3d3e_fpemsg(FILR, l3d3e): void
(* ****** ****** *)
fun f3arg_fpemsg:(FILR,f3arg)->void
(* ****** ****** *)
fun d3ecl_fpemsg(FILR, d3ecl): void
(* ****** ****** *)
fun d3patlst_fpemsg(FILR, d3patlst): void
(* ****** ****** *)
fun d3explst_fpemsg(FILR, d3explst): void
fun d3expopt_fpemsg(FILR, d3expopt): void
(* ****** ****** *)
fun l3d3plst_fpemsg(FILR, l3d3plst): void
fun l3d3elst_fpemsg(FILR, l3d3elst): void
(* ****** ****** *)
fun f3arglst_fpemsg(FILR, f3arglst): void
(* ****** ****** *)
fun d3eclist_fpemsg(FILR, d3eclist): void
(* ****** ****** *)
fun teqd3exp_fpemsg(FILR, teqd3exp): void
(* ****** ****** *)
fun d3valdcl_fpemsg(FILR, d3valdcl): void
fun d3vardcl_fpemsg(FILR, d3vardcl): void
fun d3fundcl_fpemsg(FILR, d3fundcl): void
(* ****** ****** *)
fun
d3valdclist_fpemsg(FILR, d3valdclist): void
(* ****** ****** *)
fun
d3vardclist_fpemsg(FILR, d3vardclist): void
(* ****** ****** *)
fun
d3fundclist_fpemsg(FILR, d3fundclist): void
(* ****** ****** *)
//
fun
d3parsed_fpemsg
( out: FILR, dpar: d3parsed ): void
//
(* ****** ****** *)
//
fun
d3explstopt_fpemsg(FILR, d3explstopt): void
fun
d3eclistopt_fpemsg(FILR, d3eclistopt): void
//
(* ****** ****** *)

(* end of [ATS3/XATSOPT_srcgen2_tread23.sats] *)

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
Wed 26 Jul 2023 11:31:24 AM EDT
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
T2P = "./statyp2.sats"
#staload
D2E = "./dynexp2.sats"
(* ****** ****** *)
#staload
D3E = "./dynexp3.sats"
(* ****** ****** *)
#typedef token = $LEX.token
(* ****** ****** *)
#typedef s2typ = $S2E.s2typ
#typedef l2t2p = $S2E.l2t2p
(* ****** ****** *)
#typedef t2jag = $D2E.t2jag
(* ****** ****** *)
#typedef d3pat = $D3E.d3pat
#typedef d3exp = $D3E.d3exp
(* ****** ****** *)
#typedef l3d3p = $D3E.l3d3p
#typedef l3d3e = $D3E.l3d3e
(* ****** ****** *)
#typedef f3arg = $D3E.f3arg
(* ****** ****** *)
#typedef d3gua = $D3E.d3gua
#typedef d3gpt = $D3E.d3gpt
#typedef d3cls = $D3E.d3cls
(* ****** ****** *)
#typedef d3ecl = $D3E.d3ecl
(* ****** ****** *)
#typedef s2typlst = $S2E.s2typlst
#typedef l2t2plst = $S2E.l2t2plst
(* ****** ****** *)
#typedef t2jaglst = $D2E.t2jaglst
(* ****** ****** *)
#typedef d3patlst = $D3E.d3patlst
#typedef d3explst = $D3E.d3explst
#typedef d3expopt = $D3E.d3expopt
(* ****** ****** *)
#typedef l3d3plst = $D3E.l3d3plst
#typedef l3d3elst = $D3E.l3d3elst
(* ****** ****** *)
#typedef f3arglst = $D3E.f3arglst
(* ****** ****** *)
#typedef d3gualst = $D3E.d3gualst
(*
#typedef d3gptlst = $D3E.d3gptlst
*)
#typedef d3clslst = $D3E.d3clslst
(* ****** ****** *)
#typedef d3eclist = $D3E.d3eclist
(* ****** ****** *)
#typedef teqd3exp = $D3E.teqd3exp
(* ****** ****** *)
#typedef d3valdcl = $D3E.d3valdcl
#typedef d3vardcl = $D3E.d3vardcl
#typedef d3fundcl = $D3E.d3fundcl
(* ****** ****** *)
#typedef d3parsed = $D3E.d3parsed
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
d3parsed_of_tread30
(dpar: d3parsed): (d3parsed)
//
(* ****** ****** *)
//
#typedef
ftread30
(syn: tx) =
(syn , &sint >> _) -> ( syn )
//
(* ****** ****** *)
//
fun
list_tread30_fnp
{syn:tx}
( lst: list(syn)
, err: &sint >> _
, fpr: ftread30(syn)): list(syn)
//
fun
optn_tread30_fnp
{syn:tx}
( opt: optn(syn)
, err: &sint >> _
, fpr: ftread30(syn)): optn(syn)
//
(* ****** ****** *)
fun tread30_s2typ: ftread30(s2typ)
fun tread30_l2t2p: ftread30(l2t2p)
(* ****** ****** *)
fun tread30_t2jag: ftread30(t2jag)
(* ****** ****** *)
fun tread30_d3pat: ftread30(d3pat)
fun tread30_d3exp: ftread30(d3exp)
(* ****** ****** *)
fun tread30_l3d3p: ftread30(l3d3p)
fun tread30_l3d3e: ftread30(l3d3e)
(* ****** ****** *)
fun tread30_f3arg: ftread30(f3arg)
(* ****** ****** *)
fun tread30_d3gua: ftread30(d3gua)
fun tread30_d3gpt: ftread30(d3gpt)
fun tread30_d3cls: ftread30(d3cls)
(* ****** ****** *)
fun tread30_d3ecl: ftread30(d3ecl)
(* ****** ****** *)
fun tread30_s2typlst: ftread30(s2typlst)
fun tread30_l2t2plst: ftread30(l2t2plst)
(* ****** ****** *)
fun tread30_t2jaglst: ftread30(t2jaglst)
(* ****** ****** *)
fun tread30_d3patlst: ftread30(d3patlst)
fun tread30_d3explst: ftread30(d3explst)
fun tread30_d3expopt: ftread30(d3expopt)
(* ****** ****** *)
fun tread30_l3d3plst: ftread30(l3d3plst)
fun tread30_l3d3elst: ftread30(l3d3elst)
(* ****** ****** *)
fun tread30_f3arglst: ftread30(f3arglst)
(* ****** ****** *)
fun tread30_d3gualst: ftread30(d3gualst)
fun tread30_d3clslst: ftread30(d3clslst)
(* ****** ****** *)
fun tread30_d3eclist: ftread30(d3eclist)
(* ****** ****** *)
fun tread30_teqd3exp: ftread30(teqd3exp)
(* ****** ****** *)
fun tread30_d3valdcl: ftread30(d3valdcl)
fun tread30_d3vardcl: ftread30(d3vardcl)
fun tread30_d3fundcl: ftread30(d3fundcl)
(* ****** ****** *)
fun tread30_d3valdclist: ftread30(d3valdclist)
fun tread30_d3vardclist: ftread30(d3vardclist)
fun tread30_d3fundclist: ftread30(d3fundclist)
(* ****** ****** *)
fun tread30_d3explstopt: ftread30(d3explstopt)
fun tread30_d3eclistopt: ftread30(d3eclistopt)
(* ****** ****** *)

(* end of [ATS3/XATSOPT_srcgen2_SATS_tread30.sats] *)

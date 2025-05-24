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
d3parsed_of_tread3a
(dpar: d3parsed): (d3parsed)
//
(* ****** ****** *)
//
#typedef
ftread3a
(syn: tx) =
(syn , &sint >> _) -> ( syn )
//
(* ****** ****** *)
//
fun
list_tread3a_fnp
{syn:tx}
( lst: list(syn)
, err: &sint >> _
, fpr: ftread3a(syn)): list(syn)
//
fun
optn_tread3a_fnp
{syn:tx}
( opt: optn(syn)
, err: &sint >> _
, fpr: ftread3a(syn)): optn(syn)
//
(* ****** ****** *)
fun tread3a_s2typ: ftread3a(s2typ)
fun tread3a_l2t2p: ftread3a(l2t2p)
(* ****** ****** *)
fun tread3a_t2jag: ftread3a(t2jag)
(* ****** ****** *)
fun tread3a_d3pat: ftread3a(d3pat)
fun tread3a_d3exp: ftread3a(d3exp)
(* ****** ****** *)
fun tread3a_l3d3p: ftread3a(l3d3p)
fun tread3a_l3d3e: ftread3a(l3d3e)
(* ****** ****** *)
fun tread3a_f3arg: ftread3a(f3arg)
(* ****** ****** *)
fun tread3a_d3gua: ftread3a(d3gua)
fun tread3a_d3gpt: ftread3a(d3gpt)
fun tread3a_d3cls: ftread3a(d3cls)
(* ****** ****** *)
fun tread3a_d3ecl: ftread3a(d3ecl)
(* ****** ****** *)
fun tread3a_s2typlst: ftread3a(s2typlst)
fun tread3a_l2t2plst: ftread3a(l2t2plst)
(* ****** ****** *)
fun tread3a_t2jaglst: ftread3a(t2jaglst)
(* ****** ****** *)
fun tread3a_d3patlst: ftread3a(d3patlst)
fun tread3a_d3explst: ftread3a(d3explst)
fun tread3a_d3expopt: ftread3a(d3expopt)
(* ****** ****** *)
fun tread3a_l3d3plst: ftread3a(l3d3plst)
fun tread3a_l3d3elst: ftread3a(l3d3elst)
(* ****** ****** *)
fun tread3a_f3arglst: ftread3a(f3arglst)
(* ****** ****** *)
fun tread3a_d3gualst: ftread3a(d3gualst)
fun tread3a_d3clslst: ftread3a(d3clslst)
(* ****** ****** *)
fun tread3a_d3eclist: ftread3a(d3eclist)
(* ****** ****** *)
fun tread3a_teqd3exp: ftread3a(teqd3exp)
(* ****** ****** *)
fun tread3a_d3valdcl: ftread3a(d3valdcl)
fun tread3a_d3vardcl: ftread3a(d3vardcl)
fun tread3a_d3fundcl: ftread3a(d3fundcl)
(* ****** ****** *)
fun tread3a_d3valdclist: ftread3a(d3valdclist)
fun tread3a_d3vardclist: ftread3a(d3vardclist)
fun tread3a_d3fundclist: ftread3a(d3fundclist)
(* ****** ****** *)
fun tread3a_d3explstopt: ftread3a(d3explstopt)
fun tread3a_d3eclistopt: ftread3a(d3eclistopt)
(* ****** ****** *)
(* ****** ****** *)
//
(***********************************************************************)
(* end of [ATS3/XATSOPT_srcgen2_SATS_tread3a.sats] *)
(***********************************************************************)

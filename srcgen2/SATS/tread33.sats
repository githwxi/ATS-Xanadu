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
(* ****** ****** *)
#typedef t2jag = $D2E.t2jag
(* ****** ****** *)
#typedef d3pat = $D3E.d3pat
#typedef d3exp = $D3E.d3exp
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
(* ****** ****** *)
#typedef t2jaglst = $D2E.t2jaglst
(* ****** ****** *)
#typedef d3patlst = $D3E.d3patlst
#typedef d3explst = $D3E.d3explst
(* ****** ****** *)
#typedef f3arglst = $D3E.f3arglst
(* ****** ****** *)
#typedef d3gualst = $D3E.d3gualst
#typedef d3gptlst = $D3E.d3gptlst
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
d3parsed_of_tread33
(dpar: d3parsed): (d3parsed)
//
(* ****** ****** *)
//
#typedef
ftread33
(syn: tx) =
(syn , &sint >> _) -> ( syn )
//
(* ****** ****** *)
//
fun
list_tread33_fnp
{syn:tx}
( lst: list(syn)
, err: &sint >> _
, fpr: ftread33(syn)): list(syn)
//
fun
optn_tread33_fnp
{syn:tx}
( opt: optn(syn)
, err: &sint >> _
, fpr: ftread33(syn)): optn(syn)
//
(* ****** ****** *)
fun tread33_s2typ: ftread33(s2typ)
(* ****** ****** *)
fun tread33_t2jag: ftread33(t2jag)
(* ****** ****** *)
fun tread33_d3pat: ftread33(d3pat)
fun tread33_d3exp: ftread33(d3exp)
(* ****** ****** *)
fun tread33_f3arg: ftread33(f3arg)
(* ****** ****** *)
fun tread33_d3gua: ftread33(d3gua)
fun tread33_d3gpt: ftread33(d3gpt)
fun tread33_d3cls: ftread33(d3cls)
(* ****** ****** *)
fun tread33_d3ecl: ftread33(d3ecl)
(* ****** ****** *)
fun tread33_s2typlst: ftread33(s2typlst)
(* ****** ****** *)
fun tread33_t2jaglst: ftread33(t2jaglst)
(* ****** ****** *)
fun tread33_d3patlst: ftread33(d3patlst)
fun tread33_d3explst: ftread33(d3explst)
(* ****** ****** *)
fun tread33_f3arglst: ftread33(f3arglst)
(* ****** ****** *)
fun tread33_d3gualst: ftread33(d3gualst)
fun tread33_d3clslst: ftread33(d3clslst)
(* ****** ****** *)
fun tread33_d3eclist: ftread33(d3eclist)
(* ****** ****** *)
fun tread33_teqd3exp: ftread33(teqd3exp)
(* ****** ****** *)
fun tread33_d3valdcl: ftread33(d3valdcl)
fun tread33_d3vardcl: ftread33(d3vardcl)
fun tread33_d3fundcl: ftread33(d3fundcl)
(* ****** ****** *)
fun tread33_d3valdclist: ftread33(d3valdclist)
fun tread33_d3vardclist: ftread33(d3vardclist)
fun tread33_d3fundclist: ftread33(d3fundclist)
(* ****** ****** *)
fun tread33_d3explstopt: ftread33(d3explstopt)
fun tread33_d3eclistopt: ftread33(d3eclistopt)
(* ****** ****** *)

(* end of [ATS3/XATSOPT_srcgen2_tread33.sats] *)

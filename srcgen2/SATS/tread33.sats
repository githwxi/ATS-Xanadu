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
D2E = "./dynexp2.sats"
#staload
D3E = "./dynexp3.sats"
(* ****** ****** *)
#typedef token = $LEX.token
(* ****** ****** *)
#typedef d3pat = $D3E.d3pat
#typedef d3exp = $D3E.d3exp
(* ****** ****** *)
#typedef d3ecl = $D3E.d3ecl
(* ****** ****** *)
#typedef d3patlst = $D3E.d3patlst
#typedef d3explst = $D3E.d3explst
(* ****** ****** *)
#typedef d3eclist = $D3E.d3eclist
(* ****** ****** *)
#typedef d3parsed = $D3E.d3parsed
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
fun tread33_d3pat: ftread33(d3pat)
fun tread33_d3exp: ftread33(d3exp)
(* ****** ****** *)
fun tread33_d3ecl: ftread33(d3ecl)
(* ****** ****** *)
fun tread33_d3patlst: ftread33(d3patlst)
fun tread33_d3explst: ftread33(d3explst)
(* ****** ****** *)
fun tread33_d3eclist: ftread33(d3eclist)
(* ****** ****** *)
fun tread33_d3explstopt: ftread33(d3explstopt)
fun tread33_d3eclistopt: ftread33(d3eclistopt)
(* ****** ****** *)

(* end of [ATS3/XATSOPT_srcgen2_tread33.sats] *)

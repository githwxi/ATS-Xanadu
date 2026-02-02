(***********************************************************************)
(*                                                                     *)
(*                         Applied Type System                         *)
(*                                                                     *)
(***********************************************************************)

(*
** ATS/Xanadu - Unleashing the Potential of Types!
** Copyright (C) 2026 Hongwei Xi, ATS Trustful Software, Inc.
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
Fri Jan 30 11:23:14 AM EST 2026
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
#staload S2E = "./staexp2.sats"
#staload T2P = "./statyp2.sats"
#staload D2E = "./dynexp2.sats"
#staload D3E = "./dynexp3.sats"
(* ****** ****** *)
(* ****** ****** *)
#absvtbx
tr30evn_vtbx
#vwtpdef
tr30evn = tr30evn_vtbx
(* ****** ****** *)
(* ****** ****** *)
#typedef d3pat = $D3E.d3pat
#typedef l3d3p = $D3E.l3d3p
(* ****** ****** *)
#typedef d3exp = $D3E.d3exp
#typedef l3d3e = $D3E.l3d3e
(* ****** ****** *)
#typedef f3arg = $D3E.f3arg
(* ****** ****** *)
#typedef d3gua = $D3E.d3gua
#typedef d3gpt = $D3E.d3gpt
#typedef d3cls = $D3E.d3cls
(* ****** ****** *)
//
#typedef timpl = $D3E.timpl
#typedef d3ecl = $D3E.d3ecl
//
(* ****** ****** *)
(* ****** ****** *)
//
#typedef d3patlst = $D3E.d3patlst
#typedef l3d3plst = $D3E.l3d3plst
//
(* ****** ****** *)
//
#typedef d3explst = $D3E.d3explst
#typedef d3expopt = $D3E.d3expopt
#typedef l3d3elst = $D3E.l3d3elst
//
(* ****** ****** *)
#typedef f3arglst = $D3E.f3arglst
(* ****** ****** *)
//
#typedef d3gualst = $D3E.d3gualst
#typedef d3clslst = $D3E.d3clslst
//
(* ****** ****** *)
//
#typedef timplist = $D3E.timplist
#typedef d3eclist = $D3E.d3eclist
//
(* ****** ****** *)
(* ****** ****** *)
//
#typedef d3parsed = $D3E.d3parsed
//
(* ****** ****** *)
#typedef teqd3exp = $D3E.teqd3exp
(* ****** ****** *)
#typedef d3valdcl = $D3E.d3valdcl
#typedef d3vardcl = $D3E.d3vardcl
#typedef d3fundcl = $D3E.d3fundcl
(* ****** ****** *)
#typedef d3valdclist = $D3E.d3valdclist
#typedef d3vardclist = $D3E.d3vardclist
#typedef d3fundclist = $D3E.d3fundclist
(* ****** ****** *)
#typedef d3explstopt = $D3E.d3explstopt
#typedef d3eclistopt = $D3E.d3eclistopt
(* ****** ****** *)
(* ****** ****** *)
//
fun
d3parsed_of_t3read0
(dpar: d3parsed): (d3parsed)
//
(* ****** ****** *)
(* ****** ****** *)
//
fun
tr30evn_make_nil
  ((*void*)): tr30evn
//
fun
tr30evn_free_nil
  ( evn0: tr30evn ): ( void )
//
(* ****** ****** *)
//
fun
tr30evn_tmps$get
(evn0: !tr30evn): timplist
//
fun
tr30evn_timp$pop
(evn0: !tr30evn): ( void )
fun
tr30evn_timp$psh
( evn0:
! tr30evn, timp: timpl): void
//
(* ****** ****** *)
(* ****** ****** *)
//
#typedef
ft3read0
(syn : tbox) =
(
! tr30evn
, syn , &sint >> _) -> ( syn )
//
(* ****** ****** *)
(* ****** ****** *)
//
fun
optn_t3read0_fnp
{x0:tx}
( evn:
! tr30evn
, opt: optn(x0)
, err:
& sint >> _, frd: ft3read0(x0)): optn(x0)
//
fun
list_t3read0_fnp
{x0:tx}
( evn:
! tr30evn
, lst: list(x0)
, err:
& sint >> _, frd: ft3read0(x0)): list(x0)
//
(* ****** ****** *)
(* ****** ****** *)
//
fun
t3read0_d3pat
( evn0:
! tr30evn
, d3p0: d3pat, nerr: &sint >> _): d3pat
//
(* ****** ****** *)
(* ****** ****** *)
//
fun
t3read0_d3exp
( evn0:
! tr30evn
, d3e0: d3exp, nerr: &sint >> _): d3exp
//
(* ****** ****** *)
//
fun
t3read0_d3cls
( evn0:
! tr30evn
, dcls: d3cls, nerr: &sint >> _): d3cls
//
(* ****** ****** *)
(* ****** ****** *)
//
fun
t3read0_timpl
( evn0:
! tr30evn
, timp: timpl, nerr: &sint >> _): timpl
//
(* ****** ****** *)
//
fun
t3read0_d3ecl
( evn0:
! tr30evn
, d3cl: d3ecl, nerr: &sint >> _): d3ecl
//
(* ****** ****** *)
(* ****** ****** *)
//
fun t3read0_d3patlst: ft3read0(d3patlst)
fun t3read0_l3d3plst: ft3read0(l3d3plst)
//
(* ****** ****** *)
//
fun t3read0_d3explst: ft3read0(d3explst)
fun t3read0_d3expopt: ft3read0(d3expopt)
fun t3read0_l3d3elst: ft3read0(l3d3elst)
//
fun t3read0_d3clslst: ft3read0(d3clslst)
//
(* ****** ****** *)
//
fun t3read0_d3eclist: ft3read0(d3eclist)
//
(* ****** ****** *)
(* ****** ****** *)
//
fun t3read0_teqd3exp: ft3read0(teqd3exp)
//
(* ****** ****** *)
//
fun t3read0_d3valdcl: ft3read0(d3valdcl)
fun t3read0_d3vardcl: ft3read0(d3vardcl)
fun t3read0_d3fundcl: ft3read0(d3fundcl)
//
(* ****** ****** *)
//
fun t3read0_d3valdclist: ft3read0(d3valdclist)
fun t3read0_d3vardclist: ft3read0(d3vardclist)
fun t3read0_d3fundclist: ft3read0(d3fundclist)
//
(* ****** ****** *)
(* ****** ****** *)
//
fun t3read0_d3explstopt: ft3read0(d3explstopt)
fun t3read0_d3eclistopt: ft3read0(d3eclistopt)
//
(* ****** ****** *)
(* ****** ****** *)
//
(***********************************************************************)
(* end of [ATS3/XATSOPT_srcgen2_SATS_t3read0.sats] *)
(***********************************************************************)

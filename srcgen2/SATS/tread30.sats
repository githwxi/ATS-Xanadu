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
envrx30_vtbx
#vwtpdef
envrx30 = envrx30_vtbx
(* ****** ****** *)
(* ****** ****** *)
//
#typedef d3pat = $D3E.d3pat
#typedef d3exp = $D3E.d3exp
#typedef d3ecl = $D3E.d3ecl
//
(* ****** ****** *)
//
#typedef d3patlst = $D3E.d3patlst
#typedef d3explst = $D3E.d3explst
#typedef d3eclist = $D3E.d3eclist
//
(* ****** ****** *)
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
(* ****** ****** *)
//
fun
d3parsed_of_tread30
(dpar: d3parsed): (d3parsed)
//
(* ****** ****** *)
(* ****** ****** *)
//
fun
envrx30_make_nil
  ((*void*)): envrx30
//
fun
envrx30_free_nil
  ( env0: envrx30 ): ( void )
//
(* ****** ****** *)
(* ****** ****** *)
//
#typedef
ftread30
(syn : tbox) =
(
! envrx30
, syn , &sint >> _) -> ( syn )
//
(* ****** ****** *)
(* ****** ****** *)
//
fun
optn_tread30_fnp
{x0:tx}
( env:
! envrx30
, opt: optn(x0)
, err:
& sint >> _, frd: ftread30(x0)): optn(x0)
//
fun
list_tread30_fnp
{x0:tx}
( env:
! envrx30
, lst: list(x0)
, err:
& sint >> _, frd: ftread30(x0)): list(x0)
//
(* ****** ****** *)
(* ****** ****** *)
//
fun
tread30_d3pat
( env0:
! envrx30
, d3p0: d3pat, nerr: &sint >> _): d3pat
//
(* ****** ****** *)
(* ****** ****** *)
//
fun
tread30_d3exp
( env0:
! envrx30
, d3e0: d3exp, nerr: &sint >> _): d3exp
//
(* ****** ****** *)
(* ****** ****** *)
//
fun
tread30_d3ecl
( env0:
! envrx30
, d3cl: d3ecl, nerr: &sint >> _): d3ecl
//
(* ****** ****** *)
(* ****** ****** *)
//
fun tread30_d3patlst: ftread30(d3patlst)
fun tread30_d3explst: ftread30(d3explst)
fun tread30_d3eclist: ftread30(d3eclist)
//
(* ****** ****** *)
(* ****** ****** *)
//
fun tread30_d3explstopt: ftread30(d3explstopt)
fun tread30_d3eclistopt: ftread30(d3eclistopt)
//
(* ****** ****** *)
(* ****** ****** *)
//
(***********************************************************************)
(* end of [ATS3/XATSOPT_srcgen2_SATS_tread30.sats] *)
(***********************************************************************)

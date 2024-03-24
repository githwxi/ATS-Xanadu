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
(* ****** ****** *)
//
(*
Author: Hongwei Xi
//
Sat 02 Mar 2024 05:55:19 PM EST
//
Authoremail: gmhwxiATgmailDOTcom
*)
//
(* ****** ****** *)
(* ****** ****** *)
(*
HX-2024-03-14:
Types are erased!!!
*)
(* ****** ****** *)
(* ****** ****** *)
(*
#define
XATSOPT "./../../.."
*)
(* ****** ****** *)
#include
"./../../..\
/HATS/xatsopt_sats.hats"
(* ****** ****** *)
(* ****** ****** *)
//
#staload "./intrep0.sats"
//
(* ****** ****** *)
(* ****** ****** *)
#absvtbx trdienv_vtbx // p0tr
#vwtpdef trdienv = trdienv_vtbx
(* ****** ****** *)
(* ****** ****** *)
fun
trdienv_make_nil(): trdienv
fun
trdienv_free_top(trdienv): void
(* ****** ****** *)
(* ****** ****** *)
//
fun
<x0:t0>
<y0:t0>
list_trxd3i0_fnp
( e1:
! trdienv
, xs: list(x0)
, (!trdienv, x0) -> y0): list(y0)
fun
<x0:t0>
<y0:t0>
optn_trxd3i0_fnp
( e1:
! trdienv
, xs: optn(x0)
, (!trdienv, x0) -> y0): optn(y0)
//
(* ****** ****** *)
(* ****** ****** *)
fun
trxd3i0_d3pat
(env0: !trdienv, d3p0: d3pat): i0pat
fun
trxd3i0_d3exp
(env0: !trdienv, d3e0: d3exp): i0exp
(* ****** ****** *)
fun
trxd3i0_l3d3p
(env0: !trdienv, ld3p: l3d3p): l0i0p
fun
trxd3i0_l3d3e
(env0: !trdienv, ld3e: l3d3e): l0i0e
(* ****** ****** *)
fun
trxd3i0_d3gua
(env0: !trdienv, dgua: d3gua): i0gua
fun
trxd3i0_d3gpt
(env0: !trdienv, dgpt: d3gpt): i0gpt
fun
trxd3i0_d3cls
(env0: !trdienv, dcls: d3cls): i0cls
(* ****** ****** *)
fun
trxd3i0_d3ecl
(env0: !trdienv, d3cl: d3ecl): i0dcl
(* ****** ****** *)
(* ****** ****** *)
fun
trxd3i0_d3patlst
(env0: !trdienv, d3ps: d3patlst): i0patlst
(* ****** ****** *)
//
fun
trxd3i0_d3explst
(env0: !trdienv, d3es: d3explst): i0explst
fun
trxd3i0_d3expopt
(env0: !trdienv, dopt: d3expopt): i0expopt
//
(* ****** ****** *)
fun
trxd3i0_l3d3plst
(env0: !trdienv, ldps: l3d3plst): l0i0plst
fun
trxd3i0_l3d3elst
(env0: !trdienv, ldes: l3d3elst): l0i0elst
(* ****** ****** *)
(* ****** ****** *)
fun
trxd3i0_f3arglst
(env0: !trdienv, f3as: f3arglst): fiarglst
(* ****** ****** *)
(* ****** ****** *)
//
fun
trxd3i0_d3gualst
(env0: !trdienv, d3gs: d3gualst): i0gualst
fun
trxd3i0_d3clslst
(env0: !trdienv, dcls: d3clslst): i0clslst
//
(* ****** ****** *)
(* ****** ****** *)
//
fun
trxd3i0_d3eclist
(env0: !trdienv, dcls: d3eclist): i0dclist
//
(* ****** ****** *)
//
fun
trxd3i0_teqd3exp
(env0: !trdienv, tdxp: teqd3exp): teqi0exp
//
(* ****** ****** *)
//
fun
trxd3i0_d3valdcl
(env0: !trdienv, dval: d3valdcl): i0valdcl
fun
trxd3i0_d3vardcl
(env0: !trdienv, dvar: d3vardcl): i0vardcl
//
fun
trxd3i0_d3fundcl
(env0: !trdienv, dfun: d3fundcl): i0fundcl
//
(* ****** ****** *)
(* ****** ****** *)
//
fun
trxd3i0_d3valdclist
(env0: !trdienv, d3vs: d3valdclist): i0valdclist
fun
trxd3i0_d3vardclist
(env0: !trdienv, d3vs: d3vardclist): i0vardclist
//
fun
trxd3i0_d3fundclist
(env0: !trdienv, d3fs: d3fundclist): i0fundclist
//
(* ****** ****** *)
fun
trxd3i0_d3eclistopt
(env0: !trdienv, dcls: d3eclistopt): i0dclistopt
(* ****** ****** *)
(* ****** ****** *)
//
(***********************************************************************)
(* end of [ATS3/XANADU_srcgen2_xats2js_srcgen1_SATS_trxd3i0.sats] *)
(***********************************************************************)

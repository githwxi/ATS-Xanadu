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
#absvtbx envd3i0_vtbx // p0tr
#vwtpdef envd3i0 = envd3i0_vtbx
(* ****** ****** *)
(* ****** ****** *)
//
fun
i0parsed_of_trxd3i0
( dpar : d3parsed ): (i0parsed)
//
(* ****** ****** *)
(* ****** ****** *)
//
fun
envd3i0_make_nil(): envd3i0
fun
envd3i0_free_top(envd3i0): void
//
(* ****** ****** *)
(* ****** ****** *)
//
fun
<x0:t0>
<y0:t0>
list_trxd3i0_fnp
( e1:
! envd3i0
, xs: list(x0)
, (!envd3i0, x0) -> y0): list(y0)
fun
<x0:t0>
<y0:t0>
optn_trxd3i0_fnp
( e1:
! envd3i0
, xs: optn(x0)
, (!envd3i0, x0) -> y0): optn(y0)
//
(* ****** ****** *)
(* ****** ****** *)
fun
trxd3i0_d3pat
(env0: !envd3i0, d3p0: d3pat): i0pat
fun
trxd3i0_d3exp
(env0: !envd3i0, d3e0: d3exp): i0exp
(* ****** ****** *)
fun
trxd3i0_l3d3p
(env0: !envd3i0, ld3p: l3d3p): l0i0p
fun
trxd3i0_l3d3e
(env0: !envd3i0, ld3e: l3d3e): l0i0e
(* ****** ****** *)
fun
trxd3i0_d3gua
(env0: !envd3i0, dgua: d3gua): i0gua
fun
trxd3i0_d3gpt
(env0: !envd3i0, dgpt: d3gpt): i0gpt
fun
trxd3i0_d3cls
(env0: !envd3i0, dcls: d3cls): i0cls
(* ****** ****** *)
fun
trxd3i0_timpl
(env0: !envd3i0, timp: timpl): t0imp
(* ****** ****** *)
fun
trxd3i0_d3ecl
(env0: !envd3i0, d3cl: d3ecl): i0dcl
(* ****** ****** *)
(* ****** ****** *)
fun
trxd3i0_d3patlst
(env0: !envd3i0, d3ps: d3patlst): i0patlst
(* ****** ****** *)
//
fun
trxd3i0_d3explst
(env0: !envd3i0, d3es: d3explst): i0explst
fun
trxd3i0_d3expopt
(env0: !envd3i0, dopt: d3expopt): i0expopt
//
(* ****** ****** *)
fun
trxd3i0_l3d3plst
(env0: !envd3i0, ldps: l3d3plst): l0i0plst
fun
trxd3i0_l3d3elst
(env0: !envd3i0, ldes: l3d3elst): l0i0elst
(* ****** ****** *)
(* ****** ****** *)
fun
trxd3i0_f3arglst
(env0: !envd3i0, f3as: f3arglst): fiarglst
(* ****** ****** *)
(* ****** ****** *)
//
fun
trxd3i0_d3gualst
(env0: !envd3i0, d3gs: d3gualst): i0gualst
fun
trxd3i0_d3clslst
(env0: !envd3i0, dcls: d3clslst): i0clslst
//
(* ****** ****** *)
(* ****** ****** *)
//
fun
trxd3i0_d3eclist
(env0: !envd3i0, dcls: d3eclist): i0dclist
//
(* ****** ****** *)
//
fun
trxd3i0_teqd3exp
(env0: !envd3i0, tdxp: teqd3exp): teqi0exp
//
(* ****** ****** *)
//
fun
trxd3i0_d3valdcl
(env0: !envd3i0, dval: d3valdcl): i0valdcl
fun
trxd3i0_d3vardcl
(env0: !envd3i0, dvar: d3vardcl): i0vardcl
//
fun
trxd3i0_d3fundcl
(env0: !envd3i0, dfun: d3fundcl): i0fundcl
//
(* ****** ****** *)
(* ****** ****** *)
//
fun
trxd3i0_d3valdclist
(env0: !envd3i0, d3vs: d3valdclist): i0valdclist
fun
trxd3i0_d3vardclist
(env0: !envd3i0, d3vs: d3vardclist): i0vardclist
//
fun
trxd3i0_d3fundclist
(env0: !envd3i0, d3fs: d3fundclist): i0fundclist
//
(* ****** ****** *)
fun
trxd3i0_d3eclistopt
(env0: !envd3i0, dcls: d3eclistopt): i0dclistopt
(* ****** ****** *)
(* ****** ****** *)
//
(***********************************************************************)
(* end of [ATS3/XANADU_srcgen2_xats2js_srcgen1_SATS_trxd3i0.sats] *)
(***********************************************************************)

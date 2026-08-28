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
Sun Aug 16 10:22:08 AM EDT 2026
*)
Authoremail: gmhwxiATgmailDOTcom
*)
//
(* ****** ****** *)
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
//
#absvwtp envxcc0_vtbx // p0tr
#vwtpdef envxcc0 = envxcc0_vtbx
//
(* ****** ****** *)
(* ****** ****** *)
//
fun
<x0:t0>
list_cc0emit_fnp
(
xs: list(x0),
e1: !envxcc0,
fopr: (x0, !envxcc0)->void): void
fun
<x0:t0>
optn_cc0emit_fnp
(
xs: optn(x0),
e1: !envxcc0,
fopr: (x0, !envxcc0)->void): void
//
(* ****** ****** *)
(* ****** ****** *)
//
fun
i0parsed_cc0emit
(ipar: i0parsed, filr: FILR): void
//
(* ****** ****** *)
(* ****** ****** *)
//
fun
i0exp_cc0emit(
  iexp: i0exp, env0: !envxcc0): void
//
(* ****** ****** *)
//
fun
i0dcl_cc0emit(
  idcl: i0dcl, env0: !envxcc0): void
//
(* ****** ****** *)
(* ****** ****** *)
//
fun
i0explst_cc0emit(
  i0es: i0explst, env0: !envxcc0): void
//
fun
i0dclist_cc0emit(
  dcls: i0dclist, env0: !envxcc0): void
//
(* ****** ****** *)
(* ****** ****** *)
//
fun
i0valdcl_cc0emit(
  ival: i0valdcl, env0: !envxcc0): void
fun
i0vardcl_cc0emit(
  ivar: i0vardcl, env0: !envxcc0): void
//
(* ****** ****** *)
//
fun
i0fundcl_cc0emit(
  ifun: i0valdcl, env0: !envxcc0): void
//
(* ****** ****** *)
(* ****** ****** *)
//
fun
i0valdclist_cc0emit(
  i0vs: i0valdclist, env0: !envxcc0): void
//
fun
i0vardclist_cc0emit(
  i0vs: i0vardclist, env0: !envxcc0): void
//
fun
i0fundclist_cc0emit(
  i0fs: i0fundclist, env0: !envxcc0): void
//
(* ****** ****** *)
(* ****** ****** *)
//
fun
i0dclistopt_cc0emit(
  dopt: i0dclistopt, env0: !envxcc0): void
//
(* ****** ****** *)
(* ****** ****** *)
//
(***********************************************************************)
(* end of [ATS3/XANADU_srcgen1_xats2cc_srcgen1_SATS_cc0emit.sats] *)
(***********************************************************************)

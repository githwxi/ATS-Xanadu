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
Wed Jun 24 11:23:49 AM EDT 2026
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
#include
"./../HATS/libxats2js.hats"
//
(* ****** ****** *)
(* ****** ****** *)
//
#vwtpdef envx2cm = envx2js
//
(* ****** ****** *)
(* ****** ****** *)
//
fun
d2concm1(
filr: FILR, dcon: d2con): void
fun
d2cstcm1(
filr: FILR, dcst: d2cst): void
//
fun
d2varcm1(
filr: FILR, dvar: d2var): void
//
(* ****** ****** *)
(* ****** ****** *)
//
fun
<x0:t0>
list_cm1emit_fnp
(
xs: list(x0),
e1: !envx2cm,
fopr: (x0, !envx2cm)->void): void
//
fun
<x0:t0>
optn_cm1emit_fnp
(
xs: optn(x0),
e1: !envx2cm,
fopr: (x0, !envx2cm)->void): void
//
(* ****** ****** *)
(* ****** ****** *)
//
fun
i1parsed_cm1emit
(ipar: i1parsed, filr: FILR): void
//
(* ****** ****** *)
(* ****** ****** *)
//
fun
i1dcl_cm1emit
(idcl: i1dcl, env0: !envx2cm): void
//
(* ****** ****** *)
(* ****** ****** *)
//
fun
fjarglst_cm1emit
(fjas: fjarglst, env0: !envx2cm): void
//
(* ****** ****** *)
(* ****** ****** *)
//
fun
i1dclist_cm1emit
(dcls: i1dclist, env0: !envx2cm): void
//
(* ****** ****** *)
(* ****** ****** *)
//
fun
i1valdcl_cm1emit
(ival: i1valdcl, env0: !envx2cm): void
fun
i1vardcl_cm1emit
(ivar: i1vardcl, env0: !envx2cm): void
//
fun
i1fundcl_cm1emit
(ifun: i1fundcl, env0: !envx2cm): void
//
(* ****** ****** *)
(* ****** ****** *)
//
fun
i1valdclist_cm1emit
(i1vs: i1valdclist, env0: !envx2cm): void
fun
i1vardclist_cm1emit
(i1vs: i1vardclist, env0: !envx2cm): void
//
fun
i1fundclist_cm1emit
(i1fs: i1fundclist, env0: !envx2cm): void
//
(* ****** ****** *)
(* ****** ****** *)
//
fun
i1dclistopt_cm1emit
(dopt: i1dclistopt, env0: !envx2cm): void
//
(* ****** ****** *)
(* ****** ****** *)
//
(***********************************************************************)
(* end of [ATS3/XANADU_srcgen1_xats2cm_srcgen1_SATS_cm1emit.sats] *)
(***********************************************************************)

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
Sun Aug 16 10:23:50 AM EDT 2026
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
#staload "./intrep1.sats"
#staload "./xats2cc.sats"
//
(* ****** ****** *)
(* ****** ****** *)
//
#vwtpdef
envxcc1 = envx2cc_vtbx
//
(* ****** ****** *)
(* ****** ****** *)
//
fun
envxcc1_filr$get
(env0: !envxcc1): FILEref
fun
envxcc1_nind$get
(env0: !envxcc1): ( sint )
//
#symload
filr with envxcc1_filr$get
#symload
nind with envxcc1_nind$get
//
(* ****** ****** *)
//
fun
envxcc1_make_out
(  out: FILR   ): envxcc1
fun
envxcc1_free_nil
( env0: ~envxcc1 ): void//fun
//
(* ****** ****** *)
(* ****** ****** *)
//
fun
envxcc1_incnind
( env0:
! envxcc1, ninc: sint): void
fun
envxcc1_decnind
( env0:
! envxcc1, ndec: sint): void
//
(* ****** ****** *)
(* ****** ****** *)
//
fun
<x0:t0>
list_cc1emit_fnp
(
xs: list(x0),
e1: !envxcc1,
fopr: (x0, !envxcc1)->void): void
fun
<x0:t0>
optn_cc1emit_fnp
(
xs: optn(x0),
e1: !envxcc1,
fopr: (x0, !envxcc1)->void): void
//
(* ****** ****** *)
(* ****** ****** *)
//
(* ****** ****** *)
(* ****** ****** *)
//
fun
i1dcl_cc1emit
(dcl0: i1dcl, env0: !envxcc1): void
//
(* ****** ****** *)
(* ****** ****** *)
//
fun
i1letlst_cc1emit(
  i1vs: i1letlst, env0: !envxcc1): void
//
fun
js1emit_i1cmplst(
  i1fs: i1cmplst, env0: !envxcc1): void
//
(* ****** ****** *)
(* ****** ****** *)
//
fun
i1dclist_cc1emit(
  dcls: i1dclist, env0: !envxcc1): void
//
(* ****** ****** *)
(* ****** ****** *)
//
fun
i1valdcl_cc1emit(
  ival: i1valdcl, env0: !envxcc1): void
fun
i1vardcl_cc1emit(
  ivar: i1vardcl, env0: !envxcc1): void
//
fun
i1fundcl_cc1emit(
  ifun: i1fundcl, env0: !envxcc1): void
//
(* ****** ****** *)
(* ****** ****** *)
//
fun
i1parsed_cc1emit
(ipar: i1parsed, filr: FILR): void
//
(* ****** ****** *)
(* ****** ****** *)
//
fun
i1dclistopt_cc1emit(
  dopt: i1dclistopt, env0: !envxcc1): void
//
(* ****** ****** *)
(* ****** ****** *)
//
(***********************************************************************)
(***********************************************************************)
(* end of [ATS3/XANADU_srcgen1_xats2cc_srcgen1_SATS_cc1emit.sats] *)
(***********************************************************************)
(***********************************************************************)

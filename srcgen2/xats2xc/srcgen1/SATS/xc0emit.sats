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
#staload "./xats2xc.sats"
//
(* ****** ****** *)
(* ****** ****** *)
//
fun
s2cstcc0
( filr: FILR
, scst: s2cst): void
fun
s2varcc0
( filr: FILR
, svar: s2var): void
//
(* ****** ****** *)
(* ****** ****** *)
//
fun
sargscc0
( filr: FILR
, npos: nint
, s2vs: s2varlst): nint
//
(* ****** ****** *)
(* ****** ****** *)
//
fun
i0typcc0
( filr
: FILR, ityp: i0typ): void
//
fun
l0i0tcc0
( filr
: FILR, li0t: l0i0t): void
//
(* ****** ****** *)
(* ****** ****** *)
//
#vwtpdef
envxcc0 = envx2cc_vtbx
//
(* ****** ****** *)
//
fun
envxcc0_filr$get
(env0: !envxcc0): FILEref
//
fun
envxcc0_nind$get
(env0: !envxcc0): ( sint )
//
(* ****** ****** *)
//
fun
envxcc0_make_out
(   out0: FILR   ): envxcc0
fun
envxcc0_free_nil
( env0: ~envxcc0 ): void//fun
//
(* ****** ****** *)
(* ****** ****** *)
//
fun
envxcc0_incnind
( env0:
! envxcc0, ninc: sint): void
fun
envxcc0_decnind
( env0:
! envxcc0, ndec: sint): void
//
(* ****** ****** *)
(* ****** ****** *)
//
fun
<x0:t0>
list_xc0emit_fnp
(
xs: list(x0),
e1: !envxcc0,
fopr: (x0, !envxcc0)->void): void
fun
<x0:t0>
optn_xc0emit_fnp
(
xs: optn(x0),
e1: !envxcc0,
fopr: (x0, !envxcc0)->void): void
//
(* ****** ****** *)
(* ****** ****** *)
//
fun
i0parsed_xc0emit
(ipar: i0parsed, filr: FILR): void
//
(* ****** ****** *)
(* ****** ****** *)
//
fun
i0pat_xc0emit(
  ipat: i0pat, env0: !envxcc0): void
//
(* ****** ****** *)
//
fun
i0exp_xc0emit(
  iexp: i0exp, env0: !envxcc0): void
//
(* ****** ****** *)
(* ****** ****** *)
//
fun
fiarg_xc0emit(
  farg: fiarg, env0: !envxcc0): void
//
(* ****** ****** *)
(* ****** ****** *)
//
fun
i0dcl_xc0emit(
  idcl: i0dcl, env0: !envxcc0): void
//
(* ****** ****** *)
(* ****** ****** *)
//
fun
i0patlst_xc0emit(
  i0ps: i0patlst, env0: !envxcc0): void
//
(* ****** ****** *)
//
fun
i0explst_xc0emit(
  i0es: i0explst, env0: !envxcc0): void
fun
i0expopt_xc0emit(
  iopt: i0expopt, env0: !envxcc0): void
//
(* ****** ****** *)
(* ****** ****** *)
//
fun
fiarglst_xc0emit(
  fias: fiarglst, env0: !envxcc0): void
//
(* ****** ****** *)
(* ****** ****** *)
//
fun
i0dclist_xc0emit(
  dcls: i0dclist, env0: !envxcc0): void
//
(* ****** ****** *)
(* ****** ****** *)
//
fun
teqi0exp_xc0emit(
  tdxp: teqi0exp, env0: !envxcc0): void
//
(* ****** ****** *)
(* ****** ****** *)
//
fun
i0valdcl_xc0emit(
  ival: i0valdcl, env0: !envxcc0): void
fun
i0vardcl_xc0emit(
  ivar: i0vardcl, env0: !envxcc0): void
//
(* ****** ****** *)
//
fun
i0fundcl_xc0emit(
  ifun: i0fundcl, env0: !envxcc0): void
//
(* ****** ****** *)
(* ****** ****** *)
//
fun
i0valdclist_xc0emit(
  i0vs: i0valdclist, env0: !envxcc0): void
//
fun
i0vardclist_xc0emit(
  i0vs: i0vardclist, env0: !envxcc0): void
//
fun
i0fundclist_xc0emit(
  i0fs: i0fundclist, env0: !envxcc0): void
//
(* ****** ****** *)
(* ****** ****** *)
//
fun
i0dclistopt_xc0emit(
  dopt: i0dclistopt, env0: !envxcc0): void
//
(* ****** ****** *)
(* ****** ****** *)
//
(***********************************************************************)
(* end of [ATS3/XANADU_srcgen1_xats2xc_srcgen1_SATS_xc0emit.sats] *)
(***********************************************************************)

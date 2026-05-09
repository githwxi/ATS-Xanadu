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
(* ****** ****** *)
//
(*
Author: Hongwei Xi
//
Sat May  9 10:55:32 AM EDT 2026
//
Authoremail: gmhwxiATgmailDOTcom
*)
//
(* ****** ****** *)
(* ****** ****** *)
(*
#define
XATSOPT "./../../.."
#define
XATS2CC "\
XATSOPT/xats2cc/srcgen1"
*)
(* ****** ****** *)
(* ****** ****** *)
//
#include
"./../../..\
/HATS/xatsopt_sats.hats"
//
(* ****** ****** *)
//
#staload "./intrep1.sats"
//
#staload
".\
/../../../xats2cc\
/srcgen1/SATS/intrep0.sats"
//
(* ****** ****** *)
(* ****** ****** *)
//
#absvwtp envx2js_vtbx // p0tr
#vwtpdef envx2js = envx2js_vtbx
//
(* ****** ****** *)
(* ****** ****** *)
//
fun
envx2js_filr$get
(env0: !envx2js): FILEref
//
fun
envx2js_lvl0$get
(env0: !envx2js): ( sint )
//
fun
envx2js_nind$get
(env0: !envx2js): ( sint )
//
(* ****** ****** *)
//
fun
envx2js_make_out
(  out0: FILR  ): envx2js
fun
envx2js_free_nil
(  env0: ~envx2js  ): void
//
(* ****** ****** *)
//
fun
envx2js_incnind
( env0:
! envx2js, ninc: sint): void
fun
envx2js_decnind
( env0:
! envx2js, ndec: sint): void
//
(* ****** ****** *)
//
fun
envx2js_pshlam0
(env0: !envx2js): void//end-fun
fun
envx2js_poplam0
(env0: !envx2js): void//end-fun
//
fun
envx2js_pshlet0
(env0: !envx2js): void//end-fun
fun
envx2js_poplet0
(env0: !envx2js): void//end-fun
//
(* ****** ****** *)
(* ****** ****** *)
//
fun
<x0:t0>
list_xats2js_fnp
(
xs: list(x0),
e1: !envx2js,
fopr: (x0, !envx2js)->void): void
//
fun
<x0:t0>
optn_xats2js_fnp
( 
xs: optn(x0),
e1: !envx2js,
fopr: (x0, !envx2js)->void): void
//
(* ****** ****** *)
(* ****** ****** *)
//
fun
xats2js_i1parsed
(ipar: i1parsed, filr: FILR): void
//
(* ****** ****** *)
(* ****** ****** *)
//
fun
xats2js_i1dcl
(dcl0: i1dcl, env0: !envx2js): void
//
(* ****** ****** *)
(* ****** ****** *)
//
fun
xats2js_i1dclist
(dcls: i1dclist, env0: !envx2js): void
//
(* ****** ****** *)
(* ****** ****** *)
//
fun
xats2js_i1dclistopt
(dopt: i1dclistopt, env0: !envx2js): void
//
(* ****** ****** *)
(* ****** ****** *)
//
(***********************************************************************)
(* end of [ATS3/XANADU_srcgen2_xats2js_srcgen2_SATS_xats2js.sats] *)
(***********************************************************************)

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
#include
"./../HATS/libxats2js.hats"
(* ****** ****** *)
(* ****** ****** *)
//
#vwtpdef envx2cm = envx2js
//
(* ****** ****** *)
(* ****** ****** *)
//
fun
<x0:t0>
list_xats2cm_fnp
( e1:
! envx2cm
, xs: list(x0)
, (!envx2cm, x0) -> void): void
fun
<x0:t0>
optn_xats2cm_fnp
( e1:
! envx2cm
, xs: optn(x0)
, (!envx2cm, x0) -> void): void
//
(* ****** ****** *)
(* ****** ****** *)
//
fun
xats2cm_i1let
(env0: !envx2cm, ilet: i1let): void
fun
xats2cm_i1ins
(env0: !envx2cm, iins: i1ins): void
//
fun
xats2cm_i1bnd
(env0: !envx2cm, ibnd: i1bnd): void
//
fun
xats2cm_i1cmp
(env0: !envx2cm, icmp: i1cmp): void
//
(* ****** ****** *)
(* ****** ****** *)
//
fun
xats2cm_i1dcl
(env0: !envx2cm, dcl0: i1dcl): void
//
fun
xats2cm_i1dclist
(env0: !envx2cm, dcls: i1dclist): void
//
(* ****** ****** *)
//
fun
xats2cm_i1valdcl
(env0: !envx2cm, ival: i1valdcl): void
fun
xats2cm_i1vardcl
(env0: !envx2cm, ivar: i1vardcl): void
fun
xats2cm_i1fundcl
(env0: !envx2cm, ifun: i1fundcl): void
//
fun
xats2cm_i1valdclist
(env0: !envx2cm, i1vs: i1valdclist): void
fun
xats2cm_i1vardclist
(env0: !envx2cm, i1vs: i1vardclist): void
fun
xats2cm_i1fundclist
(env0: !envx2cm, i1fs: i1fundclist): void
//
(* ****** ****** *)
(* ****** ****** *)
//
#define envx2cm_poplam0 = envx2js_poplam0
#define envx2cm_pshlam0 = envx2js_pshlam0
//
#define envx2cm_filr$get = envx2js_filr$get
#define envx2cm_nind$get = envx2js_nind$get
//
(* ****** ****** *)
(* ****** ****** *)
//
(***********************************************************************)
(* end of [ATS3/XANADU_srcgen1_xats2cm_srcgen1_SATS_xats2cm.sats] *)
(***********************************************************************)

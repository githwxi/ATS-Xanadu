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
Sat Sep  5 05:55:31 PM EDT 2026
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
#vwtpdef envx2rb = envx2js
//
(* ****** ****** *)
(* ****** ****** *)
//
fun
<x0:t0>
list_xats2rb_fnp
( e1:
! envx2rb
, xs: list(x0)
, (!envx2rb, x0) -> void): void
fun
<x0:t0>
optn_xats2rb_fnp
( e1:
! envx2rb
, xs: optn(x0)
, (!envx2rb, x0) -> void): void
//
(* ****** ****** *)
(* ****** ****** *)
//
fun
xats2rb_i1let
(env0: !envx2rb, ilet: i1let): void
fun
xats2rb_i1ins
(env0: !envx2rb, iins: i1ins): void
//
fun
xats2rb_i1bnd
(env0: !envx2rb, ibnd: i1bnd): void
//
fun
xats2rb_i1cmp
(env0: !envx2rb, icmp: i1cmp): void
//
(* ****** ****** *)
(* ****** ****** *)
//
fun
xats2rb_i1dcl
(env0: !envx2rb, dcl0: i1dcl): void
//
fun
xats2rb_i1dclist
(env0: !envx2rb, dcls: i1dclist): void
//
(* ****** ****** *)
//
fun
xats2rb_i1valdcl
(env0: !envx2rb, ival: i1valdcl): void
fun
xats2rb_i1vardcl
(env0: !envx2rb, ivar: i1vardcl): void
fun
xats2rb_i1fundcl
(env0: !envx2rb, ifun: i1fundcl): void
fun
xats2rb_i1tfndcl
(env0: !envx2rb, ifun: i1fundcl): void
//
fun
xats2rb_i1valdclist
(env0: !envx2rb, i1vs: i1valdclist): void
fun
xats2rb_i1vardclist
(env0: !envx2rb, i1vs: i1vardclist): void
fun
xats2rb_i1fundclist
(env0: !envx2rb, i1fs: i1fundclist): void
fun
xats2rb_i1tfndclist
(env0: !envx2rb, i1fs: i1fundclist): void
//
(* ****** ****** *)
(* ****** ****** *)
//
#define envx2rb_poplam0 = envx2js_poplam0
#define envx2rb_pshlam0 = envx2js_pshlam0
//
#define envx2rb_filr$get = envx2js_filr$get
#define envx2rb_nind$get = envx2js_nind$get
//
(* ****** ****** *)
(* ****** ****** *)
//
(***********************************************************************)
(* end of [ATS3/XANADU_srcgen1_xats2rb_srcgen1_SATS_xats2rb.sats] *)
(***********************************************************************)

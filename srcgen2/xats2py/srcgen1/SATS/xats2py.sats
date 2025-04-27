(***********************************************************************)
(*                                                                     *)
(*                         Applied Type System                         *)
(*                                                                     *)
(***********************************************************************)

(*
** ATS/Xanadu - Unleashing the Potential of Types!
** Copyright (C) 2025 Hongwei Xi, ATS Trustful Software, Inc.
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
Sun Apr 27 02:14:39 PM EDT 2025
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
#vwtpdef envx2py = envx2js
//
(* ****** ****** *)
(* ****** ****** *)
//
fun
<x0:t0>
list_xats2py_fnp
( e1:
! envx2py
, xs: list(x0)
, (!envx2py, x0) -> void): void
fun
<x0:t0>
optn_xats2py_fnp
( e1:
! envx2py
, xs: optn(x0)
, (!envx2py, x0) -> void): void
//
(* ****** ****** *)
(* ****** ****** *)
//
fun
xats2py_i1let
(env0: !envx2py, ilet: i1let): void
fun
xats2py_i1ins
(env0: !envx2py, iins: i1ins): void
//
fun
xats2py_i1bnd
(env0: !envx2py, ibnd: i1bnd): void
//
fun
xats2py_i1cmp
(env0: !envx2py, icmp: i1cmp): void
//
(* ****** ****** *)
(* ****** ****** *)
//
fun
xats2py_i1dcl
(env0: !envx2py, dcl0: i1dcl): void
//
fun
xats2py_i1dclist
(env0: !envx2py, dcls: i1dclist): void
//
(* ****** ****** *)
//
fun
xats2py_i1valdcl
(env0: !envx2py, ival: i1valdcl): void
fun
xats2py_i1fundcl
(env0: !envx2py, ifun: i1fundcl): void
//
fun
xats2py_i1valdclist
(env0: !envx2py, i1vs: i1valdclist): void
fun
xats2py_i1fundclist
(env0: !envx2py, i1fs: i1fundclist): void
//
(* ****** ****** *)
(* ****** ****** *)
//
#define envx2py_get_filr = envx2js_get_filr
#define envx2py_get_nind = envx2js_get_nind
//
(* ****** ****** *)(* ****** ****** *)(* ****** ****** *)
(* ****** ****** *)(* ****** ****** *)(* ****** ****** *)
//
(***********************************************************************)
(* end of [ATS3/XANADU_srcgen1_xats2py_srcgen1_SATS_xats2py.sats] *)
(***********************************************************************)

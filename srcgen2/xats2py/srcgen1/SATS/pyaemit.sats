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
//
(*
Author: Hongwei Xi
(*
Fri Nov 29 04:00:58 PM EST 2024
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
list_pyaemit_fnp
( e1:
! envx2py
, xs: list(x0)
, (!envx2py, x0) -> void): void
fun
<x0:t0>
optn_pyaemit_fnp
( e1:
! envx2py
, xs: optn(x0)
, (!envx2py, x0) -> void): void
//
(* ****** ****** *)
(* ****** ****** *)
//
fun
pyaemit_i1let
(env0: !envx2py, ilet: i1let): void
fun
pyaemit_i1ins
(env0: !envx2py, iins: i1ins): void
//
fun
pyaemit_i1bnd
(env0: !envx2py, ibnd: i1bnd): void
//
fun
pyaemit_i1cmp
(env0: !envx2py, icmp: i1cmp): void
//
(* ****** ****** *)
(* ****** ****** *)
//
fun
pyaemit_i1dcl
(env0: !envx2py, dcl0: i1dcl): void
//
fun
pyaemit_i1dclist
(env0: !envx2py, dcls: i1dclist): void
//
(* ****** ****** *)
//
fun
pyaemit_i1valdcl
(env0: !envx2py, ival: i1valdcl): void
fun
pyaemit_i1vardcl
(env0: !envx2py, ivar: i1vardcl): void
fun
pyaemit_i1fundcl
(env0: !envx2py, ifun: i1fundcl): void
fun
pyaemit_i1tfndcl
(env0: !envx2py, ifun: i1fundcl): void
//
fun
pyaemit_i1valdclist
(env0: !envx2py, i1vs: i1valdclist): void
fun
pyaemit_i1vardclist
(env0: !envx2py, i1vs: i1vardclist): void
fun
pyaemit_i1fundclist
(env0: !envx2py, i1fs: i1fundclist): void
fun
pyaemit_i1tfndclist
(env0: !envx2py, i1fs: i1fundclist): void
//
(* ****** ****** *)
(* ****** ****** *)
//
#define envx2py_poplam0 = envx2js_poplam0
#define envx2py_pshlam0 = envx2js_pshlam0
//
#define envx2py_filr$get = envx2js_filr$get
#define envx2py_nind$get = envx2js_nind$get
//
(* ****** ****** *)
(* ****** ****** *)
//
(***********************************************************************)
(* end of [ATS3-XANADU/srcgen1/xats2py/srcgen1/SATS/pyaemit.sats] *)
(***********************************************************************)

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
Sun 26 May 2024 01:46:35 AM EDT
//
Authoremail: gmhwxiATgmailDOTcom
*)
//
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
#staload "./../SATS/intrep0.sats"
#staload "./../SATS/intrep1.sats"
#staload "./../SATS/xats2js.sats"
//
(* ****** ****** *)
(* ****** ****** *)
//
fun
<x0:t0>
<y0:t0>
list_js1emit_fnp
( e1:
! envx2js
, xs: list(x0)
, (!envx2js, x0) -> void): void
fun
<x0:t0>
<y0:t0>
optn_js1emit_fnp
( e1:
! envx2js
, xs: optn(x0)
, (!envx2js, x0) -> void): void
//
(* ****** ****** *)
(* ****** ****** *)
//
fun
js1emit_i1parsed
(filr: FILR, ipar: i1parsed): void
//
(* ****** ****** *)
(* ****** ****** *)
//
fun
js1emit_i1let
(env0: !envx2js, ilet: i1let): void
//
fun
js1emit_i1bnd
(env0: !envx2js, ibnd: i1bnd): void
//
fun
js1emit_i1cmp
(env0: !envx2js, icmp: i1cmp): void
//
fun
js1emit_i1ins
(env0: !envx2js, iins: i1ins): void
//
(* ****** ****** *)
(* ****** ****** *)
fun
js1emit_fjarg
(env0: !envx2js, farg: fjarg): void
(* ****** ****** *)
(* ****** ****** *)
//
fun
js1emit_i1dcl
(env0: !envx2js, dcl0: i1dcl): void
//
fun
js1emit_dimpl
(env0: !envx2js, dimp: dimpl): void
fun
js1emit_t1imp
(env0: !envx2js, timp: t1imp): void
//
(* ****** ****** *)
(* ****** ****** *)
//
(*
fun
js1emit_i1valist
(env0: !envx2js, i1vs: i1valist): void
*)
//
fun
js1emit_i1letlst
(env0: !envx2js, i1vs: i1letlst): void
//
fun
js1emit_i1cmplst
(env0: !envx2js, i1fs: i1cmplst): void
//
(* ****** ****** *)
(* ****** ****** *)
//
fun
js1emit_fjarglst
(env0: !envx2js, fjas: fjarglst): void
//
(* ****** ****** *)
(* ****** ****** *)
//
fun
js1emit_i1clslst
(env0: !envx2js, icls: i1clslst): void
//
(* ****** ****** *)
(* ****** ****** *)
//
fun
js1emit_i1dclist
(env0: !envx2js, dcls: i1dclist): void
//
(* ****** ****** *)
(* ****** ****** *)
//
fun
js1emit_i1valdcl
(env0: !envx2js, ival: i1valdcl): void
fun
js1emit_i1vardcl
(env0: !envx2js, ivar: i1vardcl): void
//
fun
js1emit_i1fundcl
(env0: !envx2js, ifun: i1fundcl): void
//
(* ****** ****** *)
(* ****** ****** *)
//
fun
js1emit_i1valdclist
(env0: !envx2js, i1vs: i1valdclist): void
fun
js1emit_i1vardclist
(env0: !envx2js, i1vs: i1vardclist): void
//
fun
js1emit_i1fundclist
(env0: !envx2js, i1fs: i1fundclist): void
//
(* ****** ****** *)
(* ****** ****** *)
//
fun
js1emit_i1dclistopt
(env0: !envx2js, dopt: i1dclistopt): void
//
(* ****** ****** *)
(* ****** ****** *)

(***********************************************************************)
(* end of [ATS3/XANADU_srcgen2_xats2js_srcgen1_DATS_js1emit.sats] *)
(***********************************************************************)

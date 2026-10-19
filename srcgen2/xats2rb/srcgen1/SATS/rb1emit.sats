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
Sat Sep  5 05:55:31 PM EDT 2026
//
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
(*
fun
d2conrb1
(filr
:FILR, dcon: d2con): void
*)
//
fun
d2cstrb1
(filr
:FILR, dcst: d2cst): void
//
fun
d2varrb1
(filr
:FILR, dvar: d2var): void
//
(* ****** ****** *)
(* ****** ****** *)
//
fun
i0i00rb1(
filr:FILR,int0:sint): void
fun
i0b00rb1(
filr:FILR,btf0:bool): void
fun
i0c00rb1(
filr:FILR,chr0:char): void
fun
i0f00rb1(
filr:FILR,flt0:dflt): void
fun
i0s00rb1(
filr:FILR,str0:strn): void
//
(* ****** ****** *)
//
fun
i0intrb1(
filr:FILR,tint:token): void
fun
i0btfrb1(
filr:FILR,btf0:sym_t): void
fun
i0chrrb1(
filr:FILR,tchr:token): void
fun
i0fltrb1(
filr:FILR,tflt:token): void
fun
i0strrb1(
filr:FILR,tstr:token): void
//
(* ****** ****** *)
(* ****** ****** *)
//
fun
i1tnmrb1(
filr:FILR,itnm:i1tnm): void
//
(* ****** ****** *)
(* ****** ****** *)
//
fun
i0pckrb1(
filr:FILR,
ival:i1val,ipat:i0pat): void
//
(* ****** ****** *)
(* ****** ****** *)
//
fun
fjas1rb1
( filr
: FILR, fjas:fjarglst): void
//
(* ****** ****** *)
//
fun
i1valrb1
(filr:FILR,ival:i1val): void
fun
l1i1vrb1
(filr:FILR,liv0:l1i1v): void
//
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
list_rb1emit_fnp
( e1:
! envx2rb
, xs: list(x0)
, (!envx2rb, x0) -> void): void
fun
<x0:t0>
optn_rb1emit_fnp
( e1:
! envx2rb
, xs: optn(x0)
, (!envx2rb, x0) -> void): void
//
(* ****** ****** *)
(* ****** ****** *)
//
fun
rb1emit_i1parsed
(filr: FILR, ipar: i1parsed): void
//
(* ****** ****** *)
(* ****** ****** *)
//
fun
rb1emit_i1let
(env0: !envx2rb, ilet: i1let): void
//
(* ****** ****** *)
//
fun
rb1emit_i1bnd
(env0: !envx2rb, ibnd: i1bnd): void
//
fun
rb1emit_i1cmp
(env0: !envx2rb, icmp: i1cmp): void
//
(* ****** ****** *)
(* ****** ****** *)
//
(*
fun
rb1emit_i1gpt
(env0: !envx2rb, igpt: i1gpt): void
*)
//
(* ****** ****** *)
(* ****** ****** *)
//
fun
rb1emit_i1dcl
(env0: !envx2rb, dcl0: i1dcl): void
//
fun
rb1emit_dimpl
(env0: !envx2rb, dimp: dimpl): void
fun
rb1emit_t1imp
(env0: !envx2rb, timp: t1imp): void
//
(* ****** ****** *)
(* ****** ****** *)
//
(*
fun
rb1emit_i1valist
(env0: !envx2rb, i1vs: i1valist): void
*)
//
fun
rb1emit_i1letlst
(env0: !envx2rb, ilts: i1letlst): void
//
fun
rb1emit_i1cmplst
(env0: !envx2rb, cmps: i1cmplst): void
//
(* ****** ****** *)
(* ****** ****** *)
//
fun
rb1emit_fjarglst
(env0: !envx2rb, fjas: fjarglst): void
//
(* ****** ****** *)
(* ****** ****** *)
//
(*
fun
rb1emit_i1clslst
(env0: !envx2rb, icls: i1clslst): void
*)
//
(* ****** ****** *)
(* ****** ****** *)
//
fun
rb1emit_i1dclist
(env0: !envx2rb, dcls: i1dclist): void
//
(* ****** ****** *)
(* ****** ****** *)
//
fun
rb1emit_i1valdcl
(env0: !envx2rb, ival: i1valdcl): void
fun
rb1emit_i1vardcl
(env0: !envx2rb, ivar: i1vardcl): void
//
fun
rb1emit_i1fundcl
(env0: !envx2rb, ifun: i1fundcl): void
//
(* ****** ****** *)
(* ****** ****** *)
//
fun
rb1emit_i1valdclist
(env0: !envx2rb, i1vs: i1valdclist): void
fun
rb1emit_i1vardclist
(env0: !envx2rb, i1vs: i1vardclist): void
//
fun
rb1emit_i1fundclist
(env0: !envx2rb, i1fs: i1fundclist): void
//
(* ****** ****** *)
(* ****** ****** *)
//
fun
rb1emit_i1dclistopt
(env0: !envx2rb, dopt: i1dclistopt): void
//
(* ****** ****** *)
(* ****** ****** *)
//
(***********************************************************************)
(* end of [ATS3/XANADU_srcgen2_xats2js_srcgen1_DATS_rb1emit.sats] *)
(***********************************************************************)

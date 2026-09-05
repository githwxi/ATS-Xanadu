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
fun
d2conpl1
(filr
:FILR, dcon: d2con): void
fun
d2cstpl1
(filr
:FILR, dcst: d2cst): void
//
fun
d2varpl1
(filr
:FILR, dvar: d2var): void
//
(* ****** ****** *)
(* ****** ****** *)
//
fun
i0i00pl1(
filr:FILR,int0:sint): void
fun
i0b00pl1(
filr:FILR,btf0:bool): void
fun
i0c00pl1(
filr:FILR,chr0:char): void
fun
i0f00pl1(
filr:FILR,flt0:dflt): void
fun
i0s00pl1(
filr:FILR,str0:strn): void
//
(* ****** ****** *)
//
fun
i0intpl1(
filr:FILR,tint:token): void
fun
i0btfpl1(
filr:FILR,btf0:sym_t): void
fun
i0chrpl1(
filr:FILR,tchr:token): void
fun
i0fltpl1(
filr:FILR,tflt:token): void
fun
i0strpl1(
filr:FILR,tstr:token): void
//
(* ****** ****** *)
(* ****** ****** *)
//
fun
i1tnmpl1(
filr:FILR,itnm:i1tnm): void
//
(* ****** ****** *)
(* ****** ****** *)
//
fun
i0pckpl1(
filr:FILR,
ival:i1val,ipat:i0pat): void
//
(* ****** ****** *)
(* ****** ****** *)
//
fun
fjas1pl1
( filr
: FILR, fjas:fjarglst): void
//
(* ****** ****** *)
//
fun
i1valpl1
(filr:FILR,ival:i1val): void
fun
l1i1vpl1
(filr:FILR,liv0:l1i1v): void
//
(* ****** ****** *)
(* ****** ****** *)
//
#vwtpdef envx2pl = envx2js
//
(* ****** ****** *)
(* ****** ****** *)
//
fun
<x0:t0>
list_pl1emit_fnp
( e1:
! envx2pl
, xs: list(x0)
, (!envx2pl, x0) -> void): void
fun
<x0:t0>
optn_pl1emit_fnp
( e1:
! envx2pl
, xs: optn(x0)
, (!envx2pl, x0) -> void): void
//
(* ****** ****** *)
(* ****** ****** *)
//
fun
pl1emit_i1parsed
(filr: FILR, ipar: i1parsed): void
//
(* ****** ****** *)
(* ****** ****** *)
//
fun
pl1emit_i1let
(env0: !envx2pl, ilet: i1let): void
//
(* ****** ****** *)
//
fun
pl1emit_i1bnd
(env0: !envx2pl, ibnd: i1bnd): void
//
fun
pl1emit_i1cmp
(env0: !envx2pl, icmp: i1cmp): void
//
(* ****** ****** *)
(* ****** ****** *)
//
(*
fun
pl1emit_i1gpt
(env0: !envx2pl, igpt: i1gpt): void
*)
//
(* ****** ****** *)
(* ****** ****** *)
//
fun
pl1emit_i1dcl
(env0: !envx2pl, dcl0: i1dcl): void
//
fun
pl1emit_dimpl
(env0: !envx2pl, dimp: dimpl): void
fun
pl1emit_t1imp
(env0: !envx2pl, timp: t1imp): void
//
(* ****** ****** *)
(* ****** ****** *)
//
(*
fun
pl1emit_i1valist
(env0: !envx2pl, i1vs: i1valist): void
*)
//
fun
pl1emit_i1letlst
(env0: !envx2pl, ilts: i1letlst): void
//
fun
pl1emit_i1cmplst
(env0: !envx2pl, cmps: i1cmplst): void
//
(* ****** ****** *)
(* ****** ****** *)
//
fun
pl1emit_fjarglst
(env0: !envx2pl, fjas: fjarglst): void
//
(* ****** ****** *)
(* ****** ****** *)
//
(*
fun
pl1emit_i1clslst
(env0: !envx2pl, icls: i1clslst): void
*)
//
(* ****** ****** *)
(* ****** ****** *)
//
fun
pl1emit_i1dclist
(env0: !envx2pl, dcls: i1dclist): void
//
(* ****** ****** *)
(* ****** ****** *)
//
fun
pl1emit_i1valdcl
(env0: !envx2pl, ival: i1valdcl): void
fun
pl1emit_i1vardcl
(env0: !envx2pl, ivar: i1vardcl): void
//
fun
pl1emit_i1fundcl
(env0: !envx2pl, ifun: i1fundcl): void
//
(* ****** ****** *)
(* ****** ****** *)
//
fun
pl1emit_i1valdclist
(env0: !envx2pl, i1vs: i1valdclist): void
fun
pl1emit_i1vardclist
(env0: !envx2pl, i1vs: i1vardclist): void
//
fun
pl1emit_i1fundclist
(env0: !envx2pl, i1fs: i1fundclist): void
//
(* ****** ****** *)
(* ****** ****** *)
//
fun
pl1emit_i1dclistopt
(env0: !envx2pl, dopt: i1dclistopt): void
//
(* ****** ****** *)
(* ****** ****** *)
//
(***********************************************************************)
(* end of [ATS3/XANADU_srcgen2_xats2js_srcgen1_DATS_pl1emit.sats] *)
(***********************************************************************)

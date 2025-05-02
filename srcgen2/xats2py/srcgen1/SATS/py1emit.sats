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
Fri Nov 29 03:59:59 PM EST 2024
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
d2conpy1
(filr
:FILR, dcon: d2con): void
fun
d2cstpy1
(filr
:FILR, dcst: d2cst): void
//
fun
d2varpy1
(filr
:FILR, dvar: d2var): void
//
(* ****** ****** *)
(* ****** ****** *)
//
fun
i0i00py1
(filr:FILR,int0:sint): void
fun
i0b00py1
(filr:FILR,btf0:bool): void
fun
i0c00py1
(filr:FILR,chr0:char): void
fun
i0f00py1
(filr:FILR,flt0:dflt): void
fun
i0s00py1
(filr:FILR,str0:strn): void
//
(* ****** ****** *)
//
fun
i0intpy1
(filr:FILR,tint:token): void
fun
i0btfpy1
(filr:FILR,btf0:sym_t): void
fun
i0chrpy1
(filr:FILR,tchr:token): void
fun
i0fltpy1
(filr:FILR,tflt:token): void
fun
i0strpy1
(filr:FILR,tstr:token): void
//
(* ****** ****** *)
(* ****** ****** *)
//
fun
i1tnmpy1
(filr:FILR,itnm:i1tnm): void
//
(* ****** ****** *)
(* ****** ****** *)
//
fun
i0pckpy1
(filr:FILR
,ival:i1val,ipat:i0pat): void
//
(* ****** ****** *)
(* ****** ****** *)
//
fun
fjas1py1
( filr
: FILR, fjas:fjarglst): void
//
(* ****** ****** *)
//
fun
i1valpy1
(filr:FILR,ival:i1val): void
fun
l1i1vpy1
(filr:FILR,liv0:l1i1v): void
//
(* ****** ****** *)
(* ****** ****** *)
//
fun
<x0:t0>
list_py1emit_fnp
( e1:
! envx2js
, xs: list(x0)
, (!envx2js, x0) -> void): void
fun
<x0:t0>
optn_py1emit_fnp
( e1:
! envx2js
, xs: optn(x0)
, (!envx2js, x0) -> void): void
//
(* ****** ****** *)
(* ****** ****** *)
//
fun
py1emit_i1parsed
(filr: FILR, ipar: i1parsed): void
//
(* ****** ****** *)
(* ****** ****** *)
//
fun
py1emit_i1let
(env0: !envx2js, ilet: i1let): void
//
(* ****** ****** *)
//
fun
py1emit_i1bnd
(env0: !envx2js, ibnd: i1bnd): void
//
fun
py1emit_i1cmp
(env0: !envx2js, icmp: i1cmp): void
//
(* ****** ****** *)
(* ****** ****** *)
//
(*
fun
py1emit_i1gpt
(env0: !envx2js, igpt: i1gpt): void
*)
//
(* ****** ****** *)
(* ****** ****** *)
//
fun
py1emit_i1dcl
(env0: !envx2js, dcl0: i1dcl): void
//
fun
py1emit_dimpl
(env0: !envx2js, dimp: dimpl): void
fun
py1emit_t1imp
(env0: !envx2js, timp: t1imp): void
//
(* ****** ****** *)
(* ****** ****** *)
//
(*
fun
py1emit_i1valist
(env0: !envx2js, i1vs: i1valist): void
*)
//
fun
py1emit_i1letlst
(env0: !envx2js, i1vs: i1letlst): void
//
fun
py1emit_i1cmplst
(env0: !envx2js, i1fs: i1cmplst): void
//
(* ****** ****** *)
(* ****** ****** *)
//
fun
py1emit_fjarglst
(env0: !envx2js, fjas: fjarglst): void
(* ****** ****** *)
(* ****** ****** *)
//
(*
fun
py1emit_i1clslst
(env0: !envx2js, icls: i1clslst): void
*)
//
(* ****** ****** *)
(* ****** ****** *)
//
fun
py1emit_i1dclist
(env0: !envx2js, dcls: i1dclist): void
//
(* ****** ****** *)
(* ****** ****** *)
//
fun
py1emit_i1valdcl
(env0: !envx2js, ival: i1valdcl): void
fun
py1emit_i1vardcl
(env0: !envx2js, ivar: i1vardcl): void
//
fun
py1emit_i1fundcl
(env0: !envx2js, ifun: i1fundcl): void
//
(* ****** ****** *)
(* ****** ****** *)
//
fun
py1emit_i1valdclist
(env0: !envx2js, i1vs: i1valdclist): void
fun
py1emit_i1vardclist
(env0: !envx2js, i1vs: i1vardclist): void
//
fun
py1emit_i1fundclist
(env0: !envx2js, i1fs: i1fundclist): void
//
(* ****** ****** *)
(* ****** ****** *)
//
fun
py1emit_i1dclistopt
(env0: !envx2js, dopt: i1dclistopt): void
//
(* ****** ****** *)
(* ****** ****** *)

(***********************************************************************)
(* end of [ATS3/XANADU_srcgen2_xats2js_srcgen1_DATS_py1emit.sats] *)
(***********************************************************************)

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
Fri 29 Mar 2024 04:04:08 PM EDT
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
#staload "./intrep1.sats"
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
envx2js_get_filr
(env0: !envx2js): FILEref
//
fun
envx2js_get_nind
(env0: !envx2js): ( sint )
//
(* ****** ****** *)
//
fun
envx2js_make_out
(  out: FILR   ): envx2js
fun
envx2js_free_top
( env0: ~envx2js ): void//fun
//
(* ****** ****** *)
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
envx2js_pshlet0
(env0: !envx2js): void//end-fun
//
fun
envx2js_poplam0
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
<y0:t0>
list_xats2js_fnp
( e1:
! envx2js
, xs: list(x0)
, (!envx2js, x0) -> void): void
fun
<x0:t0>
<y0:t0>
optn_xats2js_fnp
( e1:
! envx2js
, xs: optn(x0)
, (!envx2js, x0) -> void): void
//
(* ****** ****** *)
(* ****** ****** *)
//
fun
nindfpr
(filr: FILR, nind: sint): void
fun
strnfpr
(filr: FILR, strn: strn): void
fun
nindstrnfpr
(filr: FILR
,nind: sint, strn: strn): void
//
(* ****** ****** *)
(* ****** ****** *)
//
fun
d2cstfpr
(filr: FILR, dcst: d2cst): void
fun
d2varfpr
(filr: FILR, dvar: d2var): void
//
fun
i1tnmfpr
(filr: FILR, itnm: i1tnm): void
//
(* ****** ****** *)
(* ****** ****** *)
//
fun
xats2js_i1parsed
(filr: FILR, ipar: i1parsed): void
//
(* ****** ****** *)
(* ****** ****** *)
//
(*
fun
xats2js_d2cst
(env0: !envx2js, dcst: d2cst): void
*)
//
(*
fun
xats2js_d2var
(env0: !envx2js, dvar: d2var): void
*)
//
(* ****** ****** *)
//
(*
fun
xats2js_i1val
(env0: !envx2js, ival: i1val): void
*)
//
(* ****** ****** *)
(* ****** ****** *)
//
fun
xats2js_i1let
(env0: !envx2js, ilet: i1let): void
//
fun
xats2js_i1bnd
(env0: !envx2js, ibnd: i1bnd): void
//
fun
xats2js_i1cmp
(env0: !envx2js, icmp: i1cmp): void
//
fun
xats2js_i1ins
(env0: !envx2js, iins: i1ins): void
//
(* ****** ****** *)
(* ****** ****** *)
fun
xats2js_fjarg
(env0: !envx2js, farg: fjarg): void
(* ****** ****** *)
(* ****** ****** *)
fun
xats2js_i1gpt
(env0: !envx2js, igpt: i1gpt): void
fun
xats2js_i1cls
(env0: !envx2js, icls: i1cls): void
(* ****** ****** *)
(* ****** ****** *)
//
fun
xats2js_i1dcl
(env0: !envx2js, dcl0: i1dcl): void
//
fun
xats2js_dimpl
(env0: !envx2js, dimp: dimpl): void
fun
xats2js_t1imp
(env0: !envx2js, timp: t1imp): void
//
(* ****** ****** *)
(* ****** ****** *)
//
(*
fun
xats2js_i1valist
(env0: !envx2js, i1vs: i1valist): void
*)
//
fun
xats2js_i1letlst
(env0: !envx2js, i1vs: i1letlst): void
//
fun
xats2js_i1cmplst
(env0: !envx2js, i1fs: i1cmplst): void
//
(* ****** ****** *)
(* ****** ****** *)
//
fun
xats2js_fjarglst
(env0: !envx2js, fjas: fjarglst): void
//
(* ****** ****** *)
(* ****** ****** *)
//
fun
xats2js_i1clslst
(env0: !envx2js, icls: i1clslst): void
//
(* ****** ****** *)
(* ****** ****** *)
//
fun
xats2js_i1dclist
(env0: !envx2js, dcls: i1dclist): void
//
(* ****** ****** *)
(* ****** ****** *)
//
fun
xats2js_i1valdcl
(env0: !envx2js, ival: i1valdcl): void
fun
xats2js_i1vardcl
(env0: !envx2js, ivar: i1vardcl): void
//
fun
xats2js_i1fundcl
(env0: !envx2js, ifun: i1fundcl): void
//
(* ****** ****** *)
(* ****** ****** *)
//
fun
xats2js_i1valdclist
(env0: !envx2js, i1vs: i1valdclist): void
fun
xats2js_i1vardclist
(env0: !envx2js, i1vs: i1vardclist): void
//
fun
xats2js_i1fundclist
(env0: !envx2js, i1fs: i1fundclist): void
//
(* ****** ****** *)
(* ****** ****** *)
//
fun
xats2js_i1dclistopt
(env0: !envx2js, dopt: i1dclistopt): void
//
(* ****** ****** *)
(* ****** ****** *)

(***********************************************************************)
(* end of [ATS3/XANADU_srcgen1_xats2js_srcgen1_SATS_xats2js.sats] *)
(***********************************************************************)

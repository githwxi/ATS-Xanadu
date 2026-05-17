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
Sun May 17 11:44:00 AM EDT 2026
//
Authoremail: gmhwxiATgmailDOTcom
*)
//
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
#staload "./xats2js.sats"
//
#staload
".\
/../../../xats2cc\
/srcgen1/SATS/intrep0.sats"
//
(* ****** ****** *)
(* ****** ****** *)
//
fun
d2conjs1
(filr
:FILR, dcon: d2con): void
fun
d2cstjs1
(filr
:FILR, dcst: d2cst): void
//
fun
d2varjs1
(filr
:FILR, dvar: d2var): void
//
(* ****** ****** *)
(* ****** ****** *)
//
fun
i0i00js1
(filr:FILR,int0:sint): void
fun
i0b00js1
(filr:FILR,btf0:bool): void
fun
i0c00js1
(filr:FILR,chr0:char): void
fun
i0f00js1
(filr:FILR,flt0:dflt): void
fun
i0s00js1
(filr:FILR,str0:strn): void
//
(* ****** ****** *)
//
fun
i0intjs1
(filr:FILR,tint:token): void
fun
i0btfjs1
(filr:FILR,btf0:sym_t): void
fun
i0chrjs1
(filr:FILR,tchr:token): void
fun
i0fltjs1
(filr:FILR,tflt:token): void
fun
i0strjs1
(filr:FILR,tstr:token): void
//
(* ****** ****** *)
(* ****** ****** *)
//
fun
i1tnmjs1
(filr:FILR,itnm:i1tnm): void
//
(* ****** ****** *)
(* ****** ****** *)
//
fun
i0pckjs1
(filr:FILR
,ival:i1val,ipat:i0pat): void
//
(* ****** ****** *)
(* ****** ****** *)
//
fun
fjas1js1
( filr
: FILR, fjas:fjarglst): void
//
(* ****** ****** *)
//
fun
i1valjs1
(filr:FILR,ival:i1val): void
fun
l1i1vjs1
(filr:FILR,liv0:l1i1v): void
//
(* ****** ****** *)
(* ****** ****** *)
//
fun
<x0:t0>
list_js1emit_fnp
(
xs: list(x0),
e1: !envx2js,
fopr: (x0, !envx2js)->void): void
//
fun
<x0:t0>
optn_js1emit_fnp
(
xs: optn(x0),
e1: !envx2js,
fopr: (x0, !envx2js)->void): void
//
(* ****** ****** *)
(* ****** ****** *)
//
fun
i1parsed_js1emit
(ipar: i1parsed, filr: FILR): void
//
(* ****** ****** *)
(* ****** ****** *)
//
fun
i1let_js1emit
(ilet: i1let, env0: !envx2js): void
//
(* ****** ****** *)
//
fun
i1bnd_js1emit
(ibnd: i1bnd, env0: !envx2js): void
//
fun
i1cmp_js1emit
(icmp: i1cmp, env0: !envx2js): void
//
(* ****** ****** *)
//
(*
HX-2024-05-27:
This function is
merged into [i1let_js1emit]!
fun
i1ins_js1emit
(iins: i1ins, env0: !envx2js): void
*)
//
(* ****** ****** *)
(* ****** ****** *)
//
(*
fun
i1gpt_js1emit
(igpt: i1gpt, env0: !envx2js): void
*)
//
(* ****** ****** *)
(* ****** ****** *)
//
fun
i1dcl_js1emit
(dcl0: i1dcl, env0: !envx2js): void
//
fun
dimpl_js1emit
(dimp: dimpl, env0: !envx2js): void
fun
t1imp_js1emit
(timp: t1imp, env0: !envx2js): void
//
(* ****** ****** *)
(* ****** ****** *)
//
(*
fun
i1valist_js1emit
(i1vs: i1valist, env0: !envx2js): void
*)
//
fun
i1letlst_js1emit
(i1vs: i1letlst, env0: !envx2js): void
//
fun
i1cmplst_js1emit
(i1fs: i1cmplst, env0: !envx2js): void
//
(* ****** ****** *)
(* ****** ****** *)
//
fun
fjarglst_js1emit
(fjas: fjarglst, env0: !envx2js): void
(* ****** ****** *)
(* ****** ****** *)
//
(*
fun
i1clslst_js1emit
(icls: i1clslst, env0: !envx2js): void
*)
//
(* ****** ****** *)
(* ****** ****** *)
//
fun
i1dclist_js1emit
(dcls: i1dclist, env0: !envx2js): void
//
(* ****** ****** *)
(* ****** ****** *)
//
fun
i1valdcl_js1emit
(ival: i1valdcl, env0: !envx2js): void
fun
i1vardcl_js1emit
(ivar: i1vardcl, env0: !envx2js): void
//
fun
i1fundcl_js1emit
(ifun: i1fundcl, env0: !envx2js): void
//
(* ****** ****** *)
(* ****** ****** *)
//
fun
i1valdclist_js1emit
(i1vs: i1valdclist, env0: !envx2js): void
fun
i1vardclist_js1emit
(i1vs: i1vardclist, env0: !envx2js): void
//
fun
i1fundclist_js1emit
(i1fs: i1fundclist, env0: !envx2js): void
//
(* ****** ****** *)
(* ****** ****** *)
//
fun
i1dclistopt_js1emit
(dopt: i1dclistopt, env0: !envx2js): void
//
(* ****** ****** *)
(* ****** ****** *)
//
(***********************************************************************)
(* end of [ATS3/XANADU_srcgen2_xats2js_srcgen2_SATS_js1emit.sats] *)
(***********************************************************************)

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
//
#include
"./../HATS/libxats2js.hats"
//
(* ****** ****** *)
(* ****** ****** *)
//
#vwtpdef envx2cm = envx2js
//
(* ****** ****** *)
(* ****** ****** *)
//
fun
i1anycm1(filr:FILR): void
//
(* ****** ****** *)
//
fun
i0i00cm1(
filr:FILR,int0:sint): void
fun
i0b00cm1(
filr:FILR,btf0:bool): void
fun
i0c00cm1(
filr:FILR,chr0:char): void
fun
i0f00cm1(
filr:FILR,flt0:dflt): void
fun
i0s00cm1(
filr:FILR,str0:strn): void
//
(* ****** ****** *)
//
fun
i0intcm1(
filr:FILR,tint:token): void
fun
i0btfcm1(
filr:FILR,btf0:sym_t): void
fun
i0chrcm1(
filr:FILR,tchr:token): void
fun
i0fltcm1(
filr:FILR,tflt:token): void
fun
i0strcm1(
filr:FILR,tstr:token): void
//
(* ****** ****** *)
(* ****** ****** *)
//
fun
d2concm1(
filr:FILR,dcon:d2con): void
fun
d2cstcm1(
filr:FILR,dcst:d2cst): void
//
fun
d2varcm1(
filr:FILR,dvar:d2var): void
//
(* ****** ****** *)
(* ****** ****** *)
//
fun
i1tnmcm1(
filr:FILR,itnm:i1tnm): void
//
(* ****** ****** *)
//
fun
i0pckcm1(
filr:FILR,
ival:i1val,ipat:i0pat): void
//
(* ****** ****** *)
//
fun
fjas1cm1
( filr
: FILR, fjas:fjarglst): void
//
(* ****** ****** *)
//
fun
i1valcm1
(filr:FILR,ival:i1val): void
fun
l1i1vcm1
(filr:FILR,liv0:l1i1v): void
//
fun
i1vlsif1(
filr:FILR,i1vs:i1valist): void
fun
i1vlscm1(
filr:FILR,i1vs:i1valist): void
//
(* ****** ****** *)
(* ****** ****** *)
//
fun
<x0:t0>
list_cm1emit_fnp
(
xs: list(x0),
e1: !envx2cm,
fopr: (x0, !envx2cm)->void): void
//
fun
<x0:t0>
optn_cm1emit_fnp
(
xs: optn(x0),
e1: !envx2cm,
fopr: (x0, !envx2cm)->void): void
//
(* ****** ****** *)
(* ****** ****** *)
//
fun
i1parsed_cm1emit
(ipar: i1parsed, filr: FILR): void
//
(* ****** ****** *)
(* ****** ****** *)
//
fun
i1let_cm1emit
(ilet: i1let, env0: !envx2cm): void
//
fun
i1bnd_cm1emit
(ibnd: i1bnd, env0: !envx2cm): void
//
fun
i1cmp_cm1emit
(icmp: i1cmp, env0: !envx2cm): void
//
(* ****** ****** *)
(* ****** ****** *)
//
fun
t1imp_cm1emit
(timp: t1imp, env0: !envx2cm): void
//
(* ****** ****** *)
(* ****** ****** *)
//
fun
i1dcl_cm1emit
(idcl: i1dcl, env0: !envx2cm): void
//
(* ****** ****** *)
(* ****** ****** *)
//
fun
i1letlst_cm1emit
(ilts: i1letlst, env0: !envx2cm): void
//
fun
i1cmplst_cm1emit
(cmps: i1cmplst, env0: !envx2cm): void
//
(* ****** ****** *)
//
fun
fjarglst_cm1emit
(fjas: fjarglst, env0: !envx2cm): void
//
(* ****** ****** *)
(* ****** ****** *)
//
fun
i1dclist_cm1emit
(dcls: i1dclist, env0: !envx2cm): void
//
(* ****** ****** *)
(* ****** ****** *)
//
fun
i1valdcl_cm1emit
(ival: i1valdcl, env0: !envx2cm): void
fun
i1vardcl_cm1emit
(ivar: i1vardcl, env0: !envx2cm): void
//
(* ****** ****** *)
//
fun
i1fundcl_cm1emit
(ifun: i1fundcl, env0: !envx2cm): void
//
(* ****** ****** *)
(* ****** ****** *)
//
fun
i1valdclist_cm1emit
(i1vs: i1valdclist, env0: !envx2cm): void
fun
i1vardclist_cm1emit
(i1vs: i1vardclist, env0: !envx2cm): void
//
(* ****** ****** *)
//
fun
i1fundclist_cm1emit
(i1fs: i1fundclist, env0: !envx2cm): void
//
(* ****** ****** *)
(* ****** ****** *)
//
fun
i1dclistopt_cm1emit
(dopt: i1dclistopt, env0: !envx2cm): void
//
(* ****** ****** *)
(* ****** ****** *)
//
fun
i1cmp_ind$cm1emit
(icmp: i1cmp, dlta: sint, env0: !envx2cm): void
fun
i1letlst_ind$cm1emit
(ilts: i1letlst, dlta: sint, env0: !envx2cm): void
//
(* ****** ****** *)
//
fun
i1valcls_cm1emit(
ival: i1val, icls: i1cls, env0: !envx2cm): void
fun
i1valclslst_cm1emit(
ival: i1val, iclz: i1clslst, env0: !envx2cm): void
//
(* ****** ****** *)
(* ****** ****** *)
//
(***********************************************************************)
(* end of [ATS3/XANADU_srcgen1_xats2cm_srcgen1_SATS_cm1emit.sats] *)
(***********************************************************************)

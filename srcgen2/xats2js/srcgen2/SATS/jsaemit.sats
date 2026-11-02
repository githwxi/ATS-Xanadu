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
//
#staload
".\
/../../../xats2cc\
/srcgen1/SATS/intrep0.sats"
//
(* ****** ****** *)
(* ****** ****** *)
//
// HX-2024-06-06:
fun // it matches all!
i0pat_allq(i0pat): bool
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
envx2js_filr$get
(env0: !envx2js): FILEref
//
fun
envx2js_lvl0$get
(env0: !envx2js): ( sint )
//
fun
envx2js_nind$get
(env0: !envx2js): ( sint )
//
(* ****** ****** *)
//
fun
envx2js_make_out
(  out0: FILR  ): envx2js
fun
envx2js_free_nil
(  env0: ~envx2js  ): void
//
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
envx2js_poplam0
(env0: !envx2js): void//end-fun
//
fun
envx2js_pshlet0
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
list_jsaemit_fnp
(
xs: list(x0),
e1: !envx2js,
fopr: (x0, !envx2js)->void): void
//
fun
<x0:t0>
optn_jsaemit_fnp
( 
xs: optn(x0),
e1: !envx2js,
fopr: (x0, !envx2js)->void): void
//
(* ****** ****** *)
(* ****** ****** *)
//
fun
nindfpr
(filr: FILR, nind: sint): void
//
fun
strnfpr
(filr: FILR, strn: strn): void
//
fun
nindstrnfpr
(filr: FILR
,nind: sint, strn: strn): void
//
(* ****** ****** *)
//
fun
tokenfpr
(filr: FILR, tok0: token): void
//
(* ****** ****** *)
//
fun
d2confpr
(filr: FILR, dcon: d2con): void
fun
d2cstfpr
(filr: FILR, dcst: d2cst): void
fun
d2varfpr
(filr: FILR, dvar: d2var): void
//
(* ****** ****** *)
//
fun
i0chrfpr
(filr: FILR, tchr: token): void
//
fun
i0strfpr
(filr: FILR, tstr: token): void
//
(* ****** ****** *)
(* ****** ****** *)
//
fun
i1parsed_jsaemit
(ipar: i1parsed, filr: FILR): void
//
(* ****** ****** *)
(* ****** ****** *)
//
fun
i1let_jsaemit
(ilet: i1let, env0: !envx2js): void
//
fun
i1bnd_jsaemit
(ibnd: i1bnd, env0: !envx2js): void
//
fun
i1cmp_jsaemit
(icmp: i1cmp, env0: !envx2js): void
//
fun
i1ins_jsaemit
(iins: i1ins, env0: !envx2js): void
//
(* ****** ****** *)
(* ****** ****** *)
//
fun
fjarg_jsaemit
(farg: fjarg, env0: !envx2js): void
//
(* ****** ****** *)
(* ****** ****** *)
//
fun
i1gpt_jsaemit
(igpt: i1gpt, env0: !envx2js): void
fun
i1cls_jsaemit
(icls: i1cls, env0: !envx2js): void
//
(* ****** ****** *)
(* ****** ****** *)
//
fun
i1dcl_jsaemit
(dcl0: i1dcl, env0: !envx2js): void
//
(* ****** ****** *)
(* ****** ****** *)
//
fun
i1letlst_jsaemit
(ilts: i1letlst, env0: !envx2js): void
//
fun
i1cmplst_jsaemit
(cmps: i1cmplst, env0: !envx2js): void
//
(* ****** ****** *)
//
fun
fjarglst_jsaemit
(fjas: fjarglst, env0: !envx2js): void
//
(* ****** ****** *)
//
fun
i1clslst_jsaemit
(icls: i1clslst, env0: !envx2js): void
//
(* ****** ****** *)
(* ****** ****** *)
//
fun
i1dclist_jsaemit
(dcls: i1dclist, env0: !envx2js): void
//
(* ****** ****** *)
(* ****** ****** *)
//
fun
i1valdcl_jsaemit
(ival: i1valdcl, env0: !envx2js): void
fun
i1vardcl_jsaemit
(ivar: i1vardcl, env0: !envx2js): void
//
fun
i1fundcl_jsaemit
(ifun: i1fundcl, env0: !envx2js): void
fun
i1tfndcl_jsaemit
(ifun: i1fundcl, env0: !envx2js): void
//
(* ****** ****** *)
(* ****** ****** *)
//
fun
i1prvdclist_jsaemit
(
i1vs: i1valdclist, env0: !envx2js): void
fun
i1valdclist_jsaemit
(
i1vs: i1valdclist, env0: !envx2js): void
//
fun
i1vardclist_jsaemit
(
i1vs: i1vardclist, env0: !envx2js): void
//
fun
i1prfdclist_jsaemit
(
i1fs: i1fundclist, env0: !envx2js): void
fun
i1fundclist_jsaemit
(
i1fs: i1fundclist, env0: !envx2js): void
fun
i1tfndclist_jsaemit
(
i1fs: i1fundclist, env0: !envx2js): void
//
(* ****** ****** *)
(* ****** ****** *)
//
fun
i1dclistopt_jsaemit
(dopt: i1dclistopt, env0: !envx2js): void
//
(* ****** ****** *)
(* ****** ****** *)
//
(***********************************************************************)
(* end of [ATS3-XANADU/srcgen2/xats2js/srcgen2/SATS/jsaemit.sats] *)
(***********************************************************************)

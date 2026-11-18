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
Fri Sep 25 11:00:30 PM EDT 2026
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
#absvwtp envx2cc_vtbx // p0tr
#vwtpdef envx2cc = envx2cc_vtbx
//
(* ****** ****** *)
(* ****** ****** *)
//
fun
endlfpr(filr: FILR): void
//
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
(* ****** ****** *)
//
fun
s2cstfpr
(filr: FILR, scst: s2cst): void
//
fun
s2varfpr
(filr: FILR, svar: s2var): void
//
(* ****** ****** *)
(* ****** ****** *)
//
fun
i0typfpr
(filr: FILR, ityp: i0typ): void
//
(* ****** ****** *)
(* ****** ****** *)
//
fun
d2confpr
(filr: FILR, dcon: d2con): void
fun
d2cstfpr
(filr: FILR, dcst: d2cst): void
//
fun
d2varfpr
(filr: FILR, dvar: d2var): void
//
(* ****** ****** *)
(* ****** ****** *)
//
fun
envx2cc_filr$get
(env0: !envx2cc): FILEref
//
fun
envx2cc_nind$get
(env0: !envx2cc): ( sint )
//
(* ****** ****** *)
//
fun
envx2cc_make_out
(   out0: FILR   ): envx2cc
fun
envx2cc_free_nil
( env0: ~envx2cc ): void//fun
//
(* ****** ****** *)
(* ****** ****** *)
//
fun
envx2cc_incnind
( env0:
! envx2cc, ninc: sint): void
fun
envx2cc_decnind
( env0:
! envx2cc, ndec: sint): void
//
(* ****** ****** *)
//
fun
envx2cc_pshlam0
(env0: !envx2cc): void//end-fun
fun
envx2cc_pshlet0
(env0: !envx2cc): void//end-fun
//
fun
envx2cc_poplam0
(env0: !envx2cc): void//end-fun
fun
envx2cc_poplet0
(env0: !envx2cc): void//end-fun
//
(* ****** ****** *)
(* ****** ****** *)
//
fun
fprint_lctn1_as_stamp
(filr: FILR, lctn: loctn): void
fun
fprint_lctn2_as_stamp
(filr: FILR, lctn: loctn): void
//
(* ****** ****** *)
(* ****** ****** *)
//
fun
i1parsed_ccaemit
(ipar: i1parsed, filr: FILR): void
//
(* ****** ****** *)
(* ****** ****** *)
//
fun
i1let_ccaemit
(ilet: i1let, env0: !envx2cc): void
//
fun
i1bnd_ccaemit
(ibnd: i1bnd, env0: !envx2cc): void
//
fun
i1cmp_ccaemit
(icmp: i1cmp, env0: !envx2cc): void
//
fun
i1ins_ccaemit
(iins: i1ins, env0: !envx2cc): void
//
(* ****** ****** *)
(* ****** ****** *)
//
fun
fjarg_ccaemit
(farg: fjarg, env0: !envx2cc): void
//
(* ****** ****** *)
(* ****** ****** *)
//
fun
i1gpt_ccaemit
(igpt: i1gpt, env0: !envx2cc): void
fun
i1cls_ccaemit
(icls: i1cls, env0: !envx2cc): void
//
(* ****** ****** *)
(* ****** ****** *)
//
fun
i1dcl_ccaemit
(dcl0: i1dcl, env0: !envx2cc): void
//
(* ****** ****** *)
(* ****** ****** *)
//
fun
i1letlst_ccaemit
(ilts: i1letlst, env0: !envx2cc): void
//
fun
i1cmplst_ccaemit
(cmps: i1cmplst, env0: !envx2cc): void
//
(* ****** ****** *)
//
fun
fjarglst_ccaemit
(fjas: fjarglst, env0: !envx2cc): void
//
(* ****** ****** *)
//
fun
i1clslst_ccaemit
(icls: i1clslst, env0: !envx2cc): void
//
(* ****** ****** *)
(* ****** ****** *)
//
fun
i1dclist_ccaemit
(dcls: i1dclist, env0: !envx2cc): void
//
(* ****** ****** *)
(* ****** ****** *)
//
fun
i1valdcl_ccaemit
(ival: i1valdcl, env0: !envx2cc): void
fun
i1vardcl_ccaemit
(ivar: i1vardcl, env0: !envx2cc): void
//
fun
i1fundcl_ccaemit
(ifun: i1fundcl, env0: !envx2cc): void
fun
i1tfndcl_ccaemit
(ifun: i1fundcl, env0: !envx2cc): void
//
(* ****** ****** *)
(* ****** ****** *)
//
fun
i1prvdclist_ccaemit
(
i1vs: i1valdclist, env0: !envx2cc): void
fun
i1valdclist_ccaemit
(
i1vs: i1valdclist, env0: !envx2cc): void
//
fun
i1vardclist_ccaemit
(
i1vs: i1vardclist, env0: !envx2cc): void
//
fun
i1prfdclist_ccaemit
(
i1fs: i1fundclist, env0: !envx2cc): void
fun
i1fundclist_ccaemit
(
i1fs: i1fundclist, env0: !envx2cc): void
fun
i1tfndclist_ccaemit
(
i1fs: i1fundclist, env0: !envx2cc): void
//
(* ****** ****** *)
(* ****** ****** *)
//
fun
i1dclistopt_ccaemit
(dopt: i1dclistopt, env0: !envx2cc): void
//
(* ****** ****** *)
(* ****** ****** *)
//
(***********************************************************************)
(***********************************************************************)
(* end of [ATS3/XANADU_srcgen1_xats2xc_srcgen1_SATS_xats2xc.sats] *)
(***********************************************************************)
(***********************************************************************)

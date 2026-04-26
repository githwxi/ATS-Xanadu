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
Sat Apr 18 02:04:27 PM EDT 2026
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
#absvtbx iltstk_vtbx // ptr
#vwtpdef iltstk = iltstk_vtbx
//
(* ****** ****** *)
(* ****** ****** *)
//
fun
iltstk_fprint1
(stk0:
!iltstk, out0: FILR): void
//
(* ****** ****** *)
//
fun
iltstk_pshblk0
(stk0: &iltstk >> _): void
fun
iltstk_popblk0
(stk0: &iltstk >> _): i1letlst
//
(* ****** ****** *)
//
fun
iltstk_pshlam0
(stk0: &iltstk >> _): void
fun
iltstk_pshlet0
(stk0: &iltstk >> _): void
//
fun
iltstk_poplam0
(stk0: &iltstk >> _): i1letlst
fun
iltstk_poplet0
(stk0: &iltstk >> _): i1letlst
//
(* ****** ****** *)
//
fun
iltstk_ilet$insert
(stk0:
&iltstk >> _, ilt: i1let): void
//
(* ****** ****** *)
(* ****** ****** *)
#absvtbx envi0i1_vtbx
#vwtpdef envi0i1 = envi0i1_vtbx
(* ****** ****** *)
(* ****** ****** *)
//
fun
i1parsed_of_trxi0i1
( ipar : i0parsed ): (i1parsed)
//
(* ****** ****** *)
(* ****** ****** *)
//
fun
envi0i1_make_nil
 ((*void*)): envi0i1//end-fun
fun
envi0i1_free$top
 (env0: envi0i1): void//end-fun
//
(* ****** ****** *)
//
fun
envi0i1_pshblk0
(env0: !envi0i1): void//end-fun
fun
envi0i1_popblk0
(env0: !envi0i1): i1letlst//fun
//
(* ****** ****** *)
//
fun
envi0i1_pshlam0
(env0: !envi0i1): void//end-fun
fun
envi0i1_pshlet0
(env0: !envi0i1): void//end-fun
//
fun
envi0i1_poplam0
(env0: !envi0i1): i1letlst//fun
fun
envi0i1_poplet0
(env0: !envi0i1): i1letlst//fun
//
(* ****** ****** *)
//
fun
envi0i1_pshloc1
(env0: !envi0i1): void//end-fun
fun
envi0i1_pshloc2
(env0: !envi0i1): void//end-fun
//
fun // HX: pop1 and psh2
envi0i1_locjoin
(env0: !envi0i1): void//end-fun
//
(* ****** ****** *)
//
fun
envi0i1_exnm$search
( env0:
! envi0i1, loc0: loc_t): i1val
fun
envi0i1_exnm$insert
( env0: 
! envi0i1, ival: i1val): (void)
//
fun
envi0i1_dvar$search
( env0: 
! envi0i1, d2v0: d2var): i1val
fun
envi0i1_dvar$insert
( env0: 
! envi0i1, d2var,i1val): (void)
//
fun
envi0i1_ilet$insert
( env0:
! envi0i1, ilet: i1let): (void)
//
(* ****** ****** *)
(* ****** ****** *)
//
fun
i0pat_trxi0i1
(ipat: i0pat, env0: !envi0i1): i1bnd
//
fun
i0bnd_trxi0i1
(ipat: i0pat
,ival: i1val, env0: !envi0i1): d2sublst
//
(* ****** ****** *)
//
fun
i0exp_trxi0i1
(i0e0: i0exp, env0: !envi0i1): i1val
//
(* ****** ****** *)
//
fun
fiarg_trxi0i1
(farg: fiarg, env0: !envi0i1): fjarg
//
(* ****** ****** *)
(* ****** ****** *)
//
fun
i0patlst_trxi0i1
(i0ps: i0patlst, env0: !envi0i1): i1bndlst
//
fun
i0explst_trxi0i1
(i0es: i0explst, env0: !envi0i1): i1valist
//
fun
l0i0elst_trxi0i1
(lies: l0i0elst, env0: !envi0i1): l1i1vlst
//
(* ****** ****** *)
//
fun
fiarglst_trxi0i1
(fias: fiarglst, env0: !envi0i1): fjarglst
//
(* ****** ****** *)
//
fun
i0dclist_trxi0i1
(dcls: i0dclist, env0: !envi0i1): i1dclist
//
(* ****** ****** *)
//
fun
teqi0exp_trxi0i1
(tdxp: teqi0exp, env0: !envi0i1): teqi1cmp
//
(* ****** ****** *)
(* ****** ****** *)
//
fun
i0dclistopt_trxi0i1
(dopt: i0dclistopt, env0: !envi0i1): i1dclistopt
//
(* ****** ****** *)
(* ****** ****** *)
//
(***********************************************************************)
(* end of [ATS3/XANADU_srcgen2_xats2js_srcgen2_SATS_trxi0i1.sats] *)
(***********************************************************************)

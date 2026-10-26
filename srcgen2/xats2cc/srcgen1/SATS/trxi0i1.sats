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
Mon Oct 26 12:59:08 PM EDT 2026
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
#staload "./intrep0.sats"
#staload "./intrep1.sats"
//
(* ****** ****** *)
(* ****** ****** *)
//
#absvtbx iltstk_vtbx // ptr
#vwtpdef iltstk = iltstk_vtbx
//
(* ****** ****** *)
//
fun
iltstk_fprint1
(stk:
!iltstk, out: FILR): void
//
(* ****** ****** *)
//
fun
iltstk_pshblk0
(stk: &iltstk >> _): void
fun
iltstk_popblk0
(stk: &iltstk >> _): i1letlst
//
(* ****** ****** *)
//
fun
iltstk_pshlam0
(stk: &iltstk >> _): void
fun
iltstk_pshlet0
(stk: &iltstk >> _): void
//
fun
iltstk_poplam0
(stk: &iltstk >> _): i1letlst
fun
iltstk_poplet0
(stk: &iltstk >> _): i1letlst
//
(* ****** ****** *)
//
fun
iltstk_ilet$insert
(stk:
&iltstk >> _, ilt: i1let):void
//
(* ****** ****** *)
(* ****** ****** *)
#absvtbx envi0i1_vtbx
#vwtpdef envi0i1 = envi0i1_vtbx
(* ****** ****** *)
(* ****** ****** *)
//
fun
i0parsed_of_trxi0i1
( dpar : i0parsed ): (i1parsed)
//
(* ****** ****** *)
(* ****** ****** *)
//
fun
envi0i1_make_nil
  ((*nil*)):(envi0i1)//end-fun
fun
envi0i1_free_nil
  (envi0i1):(  void  )//end-fun
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
envi0i1_locjoin(!envi0i1): void
//
(* ****** ****** *)
(* ****** ****** *)
//
fun
<x0:t0>
<y0:t0>
list_trxi0i1_fnp
(
xs: list(x0),
e1: !envi0i1,
fopr: (x0, !envi0i1)->y0): list(y0)
fun
<x0:t0>
<y0:t0>
optn_trxi0i1_fnp
(
xs: optn(x0),
e1: !envi0i1,
fopr: (x0, !envi0i1)->y0): optn(y0)
//
(* ****** ****** *)
(* ****** ****** *)
//
fun // HX: Note [i0pat_trxi0i1]
i0pat_trxi0i1 // inserts into [env0]
(
ipat: i0pat, env0: !envi0i1): i1bnd
//
fun // HX: Note [i0bnd_trxi0i1]
i0bnd_trxi0i1 // inserts into [env0]
(
ipat: i0pat,
ival: i1val, env0: !envi0i1): d2sublst
//
(* ****** ****** *)
(* ****** ****** *)
//
//
fun // HX: [trxi0i1_i0exp]
trxi0i1_i0exp // insert into [env0]
(i0e0: i0exp, env0: !envi0i1): i1val
//
fun // HX: [trxi0i1_i0lft]
trxi0i1_i0lft // insert into [env0]
(i0e0: i0exp, env0: !envi0i1): i1val
//
fun // HX: [trxi0i1_i0blk]: not
trxi0i1_i0blk // insert into [env0]
(i0e0: i0exp, env0: !envi0i1): i1cmp
//
(* ****** ****** *)
(* ****** ****** *)
//
fun
fiarg_trxi0i1
(env0: !envi0i1, farg: fiarg): fjarg
//
(* ****** ****** *)
(* ****** ****** *)
//
(***********************************************************************)
(***********************************************************************)
(* end of [ATS3/XANADU_srcgen2_xats2cc_srcgen1_SATS_trxi0i1.sats] *)
(***********************************************************************)
(***********************************************************************)

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
Sat 16 Mar 2024 07:00:59 PM EDT
//
Authoremail: gmhwxiATgmailDOTcom
*)
//
(* ****** ****** *)
(* ****** ****** *)
(*
#define
XATSOPT "./../../.."
*)
(* ****** ****** *)
#include
"./../../..\
/HATS/xatsopt_sats.hats"
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
( out
: FILR, stk: !iltstk): void
//
(* ****** ****** *)
//
fun
iltstk_pshlam0
( stk: &iltstk >> _ ): void
fun
iltstk_pshlet0
( stk: &iltstk >> _ ): void
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
iltstk_pshift0
( stk: &iltstk >> _ ): void
fun
iltstk_pshcas0
( stk: &iltstk >> _ ): void
//
fun
iltstk_popift0
(stk: &iltstk >> _): i1letlst
fun
iltstk_popcas0
(stk: &iltstk >> _): i1letlst
//
(* ****** ****** *)
//
fun
iltstk_insert_any
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
i1parsed_of_trxi0i1
( ipar : i0parsed ): (i1parsed)
//
(* ****** ****** *)
(* ****** ****** *)
//
fun
envi0i1_make_nil
  ((*nil*)):(envi0i1)//end-fun
fun
envi0i1_free_top
  (envi0i1):(  void  )//end-fun
//
(* ****** ****** *)
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
envi0i1_pshift0
(env0: !envi0i1): void//end-fun
fun
envi0i1_pshcas0
(env0: !envi0i1): void//end-fun
//
fun
envi0i1_popift0
(env0: !envi0i1): i1letlst//fun
fun
envi0i1_popcas0
(env0: !envi0i1): i1letlst//fun
//
(* ****** ****** *)
//
fun
envi0i1_insert_dvar
( env0: 
! envi0i1,d2var,i1val): (void)
fun
envi0i1_insert_ilet
( env0:
! envi0i1, ilet: i1let): (void)
//
(* ****** ****** *)
(* ****** ****** *)
//
fun
<x0:t0>
<y0:t0>
list_trxi0i1_fnp
( e1:
! envi0i1
, xs: list(x0)
, (!envi0i1, x0) -> y0): list(y0)
fun
<x0:t0>
<y0:t0>
optn_trxi0i1_fnp
( e1:
! envi0i1
, xs: optn(x0)
, (!envi0i1, x0) -> y0): optn(y0)
//
(* ****** ****** *)
(* ****** ****** *)
//
fun // HX: Note that [trxi0i1]
trxi0i1_i0exp // inserts into [env0]
(env0: !envi0i1, i0e0: i0exp): i1val
//
(* ****** ****** *)
//
fun
trxi0i1_i0dcl
(env0: !envi0i1, idcl: i0dcl): i1dcl
//
(* ****** ****** *)
//
fun
trxi0i1_i0explst
(env0: !envi0i1, i0es: i0explst): i1valist
//
(* ****** ****** *)
//
fun
trxi0i1_i0dclist
(env0: !envi0i1, dcls: i0dclist): i1dclist
//
(* ****** ****** *)
//
fun
trxi0i1_i0valdcl
(env0: !envi0i1, i0v0: i0valdcl): i1valdcl
fun
trxi0i1_i0vardcl
(env0: !envi0i1, i0v0: i0vardcl): i1vardcl
//
fun
trxi0i1_i0fundcl
(env0: !envi0i1, i0f0: i0fundcl): i1fundcl
//
(* ****** ****** *)
(* ****** ****** *)
//
fun
trxi0i1_i0valdclist
(env0: !envi0i1, i0vs: i0valdclist): i1valdclist
fun
trxi0i1_i0vardclist
(env0: !envi0i1, i0vs: i0vardclist): i1vardclist
//
fun
trxi0i1_i0fundclist
(env0: !envi0i1, i0fs: i0fundclist): i1fundclist
//
(* ****** ****** *)
(* ****** ****** *)
fun
trxi0i1_i0dclistopt
(env0: !envi0i1, dcls: i0dclistopt): i1dclistopt
(* ****** ****** *)
(* ****** ****** *)

(***********************************************************************)
(* end of [ATS3/XANADU_srcgen2_xats2js_srcgen1_SATS_trxi0i1.sats] *)
(***********************************************************************)

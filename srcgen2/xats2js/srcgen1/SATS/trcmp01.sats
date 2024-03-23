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
#staload I0R="./intrep0.sats"
#staload I1R="./intrep1.sats"
//
(* ****** ****** *)
#typedef i0pat = $I0R.i0pat
#typedef i0exp = $I0R.i0exp
#typedef i0dcl = $I0R.i0dcl
(* ****** ****** *)
#typedef i1val = $I1R.i1val
#typedef i1bfi = $I1R.i1bfi
#typedef i1let = $I1R.i1let
#typedef i1cmp = $I1R.i1cmp
(* ****** ****** *)
#typedef i1dcl = $I1R.i1dcl
(* ****** ****** *)
(* ****** ****** *)
#typedef i0patlst = list(i0pat)
#typedef i0explst = list(i0exp)
(* ****** ****** *)
#typedef i0dclist = list(i0dcl)
(* ****** ****** *)
#typedef i1valist = list(i1val)
#typedef i1letlst = list(i1let)
#typedef i1cmplst = list(i1cmp)
(* ****** ****** *)
#typedef i1dclist = list(i1dcl)
(* ****** ****** *)
(* ****** ****** *)
#absvtbx tr01env_vtbx
#vwtpdef tr01env = tr01env_vtbx
(* ****** ****** *)
(* ****** ****** *)
//
fun
tr01env_make_nil
  ((*nil*)):(tr01env)//end-fun
fun
tr01env_free_top
  (tr01env):(  void  )//end-fun
//
(* ****** ****** *)
(* ****** ****** *)
//
fun
tr01env_pshlam0
(env0: !tr01env): void//end-fun
fun
tr01env_pshlet0
(env0: !tr01env): void//end-fun
//
fun
tr01env_poplam0
(env0: !tr01env): i1letlst//fun
fun
tr01env_poplet0
(env0: !tr01env): i1letlst//fun
//
(* ****** ****** *)
//
fun
tr01env_pshift0
(env0: !tr01env): void//end-fun
fun
tr01env_pshcas0
(env0: !tr01env): void//end-fun
//
fun
tr01env_popift0
(env0: !tr01env): i1letlst//fun
fun
tr01env_popcas0
(env0: !tr01env): i1letlst//fun
//
(* ****** ****** *)
//
fun
tr01env_insert_ilet
(env0: !tr01env, ilet: i1let): void
//
(* ****** ****** *)
(* ****** ****** *)
//
fun
trcmp01_i0exp
(env0: !tr01env, i0e0: i0exp): i1val
//
(* ****** ****** *)
(* ****** ****** *)
//
fun
trcmp01_i0explst
(env0: !tr01env, i0es: i0explst): i1valist
//
(* ****** ****** *)
//
fun
trcmp01_i0dclist
(env0: !tr01env, dcls: i0dclist): i1dclist
//
(* ****** ****** *)
(* ****** ****** *)

(***********************************************************************)
(* end of [ATS3/XANADU_srcgen2_xats2js_srcgen1_SATS_trcmp01.sats] *)
(***********************************************************************)

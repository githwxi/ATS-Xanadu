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
Sun 11 Aug 2024 01:10:04 PM EDT
Authoremail: gmhwxiATgmailDOTcom
*)
//
(* ****** ****** *)
(* ****** ****** *)
//
fun
<a:vt>
a0rf_vt_free(A: ~a0rf_vt(a)): void
//
(* ****** ****** *)
(* ****** ****** *)
//
fun
<a:vt>
a0rf_vt_make_1val(x: a): a0rf_vt(a)
//
#symload
ref_vt with a0rf_vt_make_1val of 1000
#symload
a0rf_vt with a0rf_vt_make_1val of 1000
//
(* ****** ****** *)
(* ****** ****** *)
//
fun
<a:t0>
a0rf_vt_get(A: !a0rf_vt(a)): (a)
fun
<a:t0>
a0rf_vt_set(A: !a0rf_vt(a), x:a): void
//
#symload [] with a0rf_vt_set of 1000
#symload [] with a0rf_vt_get of 1000
#symload get with a0rf_vt_get of 1000
#symload set with a0rf_vt_set of 1000
//
(* ****** ****** *)
//
fun
<a:vt>
a0rf_vt_cget(A: !a0rf_vt(a)): (a)
fun
<a:vt>
a0rf_vt_setf(A: !a0rf_vt(a), x:a): void
//
#symload cget with a0rf_vt_cget of 1000
#symload setf with a0rf_vt_setf of 1000
//
(* ****** ****** *)
//
fun
<a:vt>
a0rf_vt_lget
( A:
! a0rf_vt( a) >> a0rf_vt(?a)): (a)
fun
<a:vt>
a0rf_vt_lset
( A:
! a0rf_vt(?a) >> a0rf_vt( a), x:a): void
//
#symload lget with a0rf_vt_lget of 1000
#symload lset with a0rf_vt_lset of 1000
//
(* ****** ****** *)
(* ****** ****** *)
//
(***********************************************************************)
(* end of [ATS3/XANADU_prelude_SATS_VT_axrf000_vt.sats] *)
(***********************************************************************)

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
Sat 07 Sep 2024 08:18:49 AM EDT
*)
Authoremail: gmhwxiATgmailDOTcom
*)
//
(* ****** ****** *)
(* ****** ****** *)
//
fun
<x0:t0>
optn_forall(xs: optn(x0)): bool
fun
<x0:t0>
optn_rforall(xs: optn(x0)): bool
fun
<x0:t0>
optn_iforall(xs: optn(x0)): bool
fun
<x0:t0>
optn_irforall(xs: optn(x0)): bool
//
#symload forall with optn_forall of 1000
#symload rforall with optn_rforall of 1000
#symload iforall with optn_iforall of 1000
#symload irforall with optn_irforall of 1000
//
(* ****** ****** *)
(* ****** ****** *)
//
fun
<x0:t0>
optn_foritm(xs: optn(x0)): void
fun
<x0:t0>
optn_rforitm(xs: optn(x0)): void
fun
<x0:t0>
optn_iforitm(xs: optn(x0)): void
fun
<x0:t0>
optn_irforitm(xs: optn(x0)): void
//
#symload foritm with optn_foritm of 1000
#symload rforitm with optn_rforitm of 1000
#symload iforitm with optn_iforitm of 1000
#symload irforitm with optn_irforitm of 1000
//
(* ****** ****** *)
(* ****** ****** *)
//
(* ****** ****** *)(* ****** ****** *)
(* ****** ****** *)(* ****** ****** *)

(* end of [ATS3/XANADU_prelude_SATS_optn001.sats] *)

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
Sun 21 Jul 2024 02:16:49 PM EDT
*)
Authoremail: gmhwxiATgmailDOTcom
*)
//
(* ****** ****** *)
(* ****** ****** *)
#typedef ni = nint
(* ****** ****** *)
(* ****** ****** *)
//
fun
<xs:t0>
<x0:vt>
gasz_length(xs: xs): nint
//
(* ****** ****** *)
//
fun
<xs:t0>
<x0:t0>
gasz_get$at
(xs: xs,i0: ni): (x0)
fun
<xs:t0>
<x0:t0>
gasz_set$at
(xs: xs, i0: ni, x0: x0): void
//
(* ****** ****** *)
(* ****** ****** *)
//
fun
<xs:t0>
<x0:vt>
gasz_lget$at
(xs: xs
,i0: ni): (owed(x0) | x0)
fun
<xs:t0>
<x0:vt>
gasz_lset$at
(pf: owed(x0)
|xs: xs, i0: ni, x0: x0): void
//
(* ****** ****** *)
(* ****** ****** *)
//
fun
<xs:t0>
<x0:vt>
gasz_cget$at
(xs: xs, i0: ni): (x0)
fun
<xs:t0>
<x0:vt>
gasz_setf$at
(xs: xs, i0: ni, x0: x0): void
//
(* ****** ****** *)
//
(*
HX-2024-09-20:
nil() is returned
if [i0] is out of bounds
*)
fun
<xs:t0>
<x0:vt>
gasz_cget$at$opt
(xs: xs, i0: ni): optn_vt(x0)
(*
HX-2024-09-20:
cons(x0) is returned
if [i0] is out of bounds
*)
fun
<xs:t0>
<x0:vt>
gasz_setf$at$opt
(xs: xs, i0: ni, x0: x0): optn_vt(x0)
//
(* ****** ****** *)
(* ****** ****** *)
//
(* ****** ****** *)(* ****** ****** *)
(* ****** ****** *)(* ****** ****** *)

(* end of [ATS3/XANADU_prelude_SATS_gasz000.sats] *)

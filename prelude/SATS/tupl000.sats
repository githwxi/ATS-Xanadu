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
(*
** for flat tuples
** for boxd tuples
*)
(* ****** ****** *)
(* ****** ****** *)
(*
HX-2023-08-06:
@(...): flat tuple
#(...): boxd tuple
$tup(...): boxd tuple
(Change: $(...) -> #(...))
Sun Aug  6 19:45:40 EDT 2023
*)
(* ****** ****** *)
(* ****** ****** *)
//
(*
Author: Hongwei Xi
(Around some time in 2022)
Authoremail: gmhwxiATgmailDOTcom
*)
//
(* ****** ****** *)
(* ****** ****** *)
//
(*
HX-2024-08-04:
Copying over from [srcgen1]
Sun 04 Aug 2024 05:41:59 PM EDT
*)
//
(* ****** ****** *)
(* ****** ****** *)
//
(*
#vwtpdef
t0up1(a0:vt) = @(a0)
*)
#typedef
t1up1_t0
(a0: t0) = $tup_t0(a0)
#vwtpdef
t1up1_vt
(a0: vt) = $tup_vt(a0)
//
#vwtpdef t1up = t1up1_vt
#vwtpdef t1up = t1up1_t0
//
(* ****** ****** *)
//
#typedef
t0up2_t0
(a0:t0,a1:t0) = @(a0,a1)
#vwtpdef
t0up2_vt
(a0:vt,a1:vt) = @(a0,a1)

#sexpdef t0up = t0up2_vt
#sexpdef t0up = t0up2_t0
//
#vwtpdef
t1up2_vt
(a0:vt
,a1:vt) = $tup_vt(a0,a1)
//
#sexpdef t1up = t1up2_vt
//
(* ****** ****** *)
(* ****** ****** *)
//
#abstype
z2tup_type
(a0:t0,a1:t0) <= (a0,a1)
#abstype
x2tup_type
(a0:t0,a1:t0) <= (a0,a1)
#sexpdef z2tup = z2tup_type
#sexpdef x2tup = x2tup_type
//
(* ****** ****** *)
(* ****** ****** *)
//
fun
<a0:t0>
<a1:t0>
z2tup_make
(x1: a0, x2: a1): z2tup(a0, a1)
fun
<a0:t0>
<a1:t0>
z2tup_unmk
(ztup: z2tup(a0, a1)): @(a0, a1)
//
(* ****** ****** *)
//
fun
<a0:t0>
<a1:t0>
x2tup_make
(x1: a0, x2: a1): x2tup(a0, a1)
fun
<a0:t0>
<a1:t0>
x2tup_unmk
(xtup: x2tup(a0, a1)): @(a0, a1)
//
(* ****** ****** *)
(* ****** ****** *)
//
(* ****** ****** *)(* ****** ****** *)
(* ****** ****** *)(* ****** ****** *)

(* end of [ATS3/XANADU_prelude_SATS_tupl000.sats] *)

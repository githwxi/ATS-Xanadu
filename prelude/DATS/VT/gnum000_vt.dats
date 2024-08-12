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
(*
Fri 12 Jul 2024 07:31:22 PM EDT
*)
Authoremail: gmhwxiATgmailDOTcom
*)
//
(* ****** ****** *)
(* ****** ****** *)
//
#impltmp
{ x0:t0 }
g_neg0<x0> = g_neg<x0>
#impltmp
{ x0:t0 }
g_abs0<x0> = g_abs<x0>
//
(* ****** ****** *)
//
#impltmp
{ x0:t0 }
g_suc0<x0> = g_suc<x0>
#impltmp
{ x0:t0 }
g_pre0<x0> = g_pre<x0>
//
(* ****** ****** *)
(* ****** ****** *)
//
#impltmp
{ x0:t0 }
g_max00<x0> = g_max<x0>
#impltmp
{ x0:t0 }
g_min00<x0> = g_min<x0>
//
(* ****** ****** *)
//
#impltmp
{ x0:t0 }
g_add00<x0> = g_add<x0>
#impltmp
{ x0:t0 }
g_sub00<x0> = g_sub<x0>
#impltmp
{ x0:t0 }
g_mul00<x0> = g_mul<x0>
#impltmp
{ x0:t0 }
g_div00<x0> = g_div<x0>
#impltmp
{ x0:t0 }
g_mod00<x0> = g_mod<x0>
//
(* ****** ****** *)
(* ****** ****** *)
//
#impltmp
< xs:t0 >
< x0:t0 >
gseq_add0(xs) =
let
val r0 = g_0<x0>()
in//let
(
gseq_folditm0<xs><x0>(xs, r0)
) where
{
#impltmp
folditm$fopr0
<x0><x0>(r0, x0) = g_add00<x0>(r0, x0)
}
end//let//end-of-[gseq_add0(xs)]
//
(* ****** ****** *)
//
#impltmp
< xs:t0 >
< x0:t0 >
gseq_mul0(xs) =
let
val r0 = g_1<x0>()
in//let
(
gseq_folditm0<xs><x0>(xs, r0)
) where
{
#impltmp
folditm$fopr0
<x0><x0>(r0, x0) = g_mul00<x0>(r0, x0)
}
end//let//end-of-[gseq_mul0(xs)]
//
(* ****** ****** *)
(* ****** ****** *)
//
(* ****** ****** *)(* ****** ****** *)(* ****** ****** *)
(* ****** ****** *)(* ****** ****** *)(* ****** ****** *)

(* end of [ATS3/XANADU_prelude_DATS_VT_gnum000_vt.dats] *)

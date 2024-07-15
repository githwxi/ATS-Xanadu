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
Mon 08 Jul 2024 12:53:10 PM EDT
*)
Authoremail: gmhwxiATgmailDOTcom
*)
//
(* ****** ****** *)
(* ****** ****** *)
#staload
UN = "prelude/SATS/unsafex.sats"
(* ****** ****** *)
(* ****** ****** *)
//
#impltmp
< xs:vt >
< x0:vt >
gseq_sum0(xs) =
let
val r0 = g_0<x0>()
in//let
gseq_folditm0<xs><x0><x0>(xs, r0)
end where // end-of-[let]
{
#impltmp
folditm0$fopr
<x0><x0>(r0, x0) = g_add00<x0>(r0, x0)
}
//
(* ****** ****** *)
//
#impltmp
< xs:vt >
< x0:vt >
gseq_prod0(xs) =
let
val r0 = g_1<x0>()
in//let
gseq_folditm0<xs><x0><x0>(xs, r0)
end where // end-of-[let]
{
#impltmp
folditm0$fopr
<x0><x0>(r0, x0) = g_mul00<x0>(r0, x0)
}
//
(* ****** ****** *)
(* ****** ****** *)
//
(* ****** ****** *)(* ****** ****** *)(* ****** ****** *)
(* ****** ****** *)(* ****** ****** *)(* ****** ****** *)

(* end of [ATS3/XANADU_prelude_DATS_VT_gseq000_vt.dats] *)

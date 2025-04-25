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
Fri 12 Jul 2024 11:29:01 AM EDT
*)
Authoremail: gmhwxiATgmailDOTcom
*)
//
(* ****** ****** *)
(* ****** ****** *)
#staload UN =
"prelude/SATS/unsfx00.sats"
(* ****** ****** *)
(* ****** ****** *)
#typedef b0 = bool
(* ****** ****** *)
(* ****** ****** *)
//
#impltmp
g_0<b0>() = false
#impltmp
g_1<b0>() = (true)
//
(* ****** ****** *)
(* ****** ****** *)
//
#impltmp
bool_print<>(b0) =
(
if (b0)
then pstrn("true")
else pstrn("false"))
//end-of-(bool_print<>(b0))
//
#impltmp
g_print<bool> = bool_print<>
//
(* ****** ****** *)
(* ****** ****** *)
//
#impltmp
<(*tmp*)>
bool_neg(b0) =
(
if b0 then false else (true))
//
(* ****** ****** *)
(* ****** ****** *)
//
#impltmp
< a: t0 >
bool_ifval
(b0, x1, y2) = if b0 then x1 else y2
//
(* ****** ****** *)
(* ****** ****** *)
//
(* ****** ****** *)(* ****** ****** *)
(* ****** ****** *)(* ****** ****** *)

(* end of [ATS3/XANADU_prelude_DATS_bool000.dats] *)

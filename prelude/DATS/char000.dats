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
#typedef c0 = char
(* ****** ****** *)
(* ****** ****** *)
//
#impltmp
g_0<c0>() = ('\0')
#impltmp
g_1<c0>() = ('\1')
//
(* ****** ****** *)
(* ****** ****** *)
//
#impltmp
char_lt<> = g_lt<char>
#impltmp
char_gt<> = g_gt<char>
#impltmp
char_eq<> = g_eq<char>
//
#impltmp
char_lte<> = g_lte<char>
#impltmp
char_gte<> = g_gte<char>
#impltmp
char_neq<> = g_neq<char>
//
(* ****** ****** *)
//
#impltmp
g_cmp<char> = char_cmp<>
//
(* ****** ****** *)
(* ****** ****** *)
//
(*
HX:
This is in [gdbg000.dats]:
#impltmp
g_ptype
< char >
( (*void*) ) = pstrn("char")
*)
//
(* ****** ****** *)
(* ****** ****** *)
//
#impltmp
<(*tmp*)>
char_cmp(c1, c2) =
(
if c1 > c2
then 1 else
if c1 < c2 then -1 else 0)
//
(* ****** ****** *)
(* ****** ****** *)
//
#impltmp
g_print<char> = char_print<>
//
(* ****** ****** *)
(* ****** ****** *)
//
(*
HX-2025-04-06:
*)
#impltmp
char_eqz<> = g_eqz<char>
#impltmp
char_neqz<>(c0) = not(char_eqz(c0))
(*
Sat Apr 26 12:51:25 PM EDT 2025
*)
//
(* ****** ****** *)
(* ****** ****** *)
//
(* ****** ****** *)(* ****** ****** *)
(* ****** ****** *)(* ****** ****** *)

(* end of [ATS3/XANADU_prelude_DATS_char000.dats] *)

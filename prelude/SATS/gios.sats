(***********************************************************************)
(*                                                                     *)
(*                         Applied Type System                         *)
(*                                                                     *)
(***********************************************************************)

(*
** ATS/Xanadu - Unleashing the Potential of Types!
** Copyright (C) 2020 Hongwei Xi, ATS Trustful Software, Inc.
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
// For generic ordering
//
(* ****** ****** *)
//
// Author: Hongwei Xi
// Start Time: April, 2020
// Authoremail: gmhwxiATgmailDOTcom
//
(* ****** ****** *)

fun<>
g_stdin(): FILEref
fun<>
g_stdout(): FILEref
fun<>
g_stderr(): FILEref

(* ****** ****** *)

fun<>
g_inp_char(): sint
fun<>
g_inp_cstream(): stream_vt(sint)

(* ****** ****** *)
fun<>
g_inp_line(): string
fun<>
g_inp_lline(): string_vt
(* ****** ****** *)
fun<>
g_inp_line_list(): list(char)
fun<>
g_inp_lline_list(): list_vt(char)
(* ****** ****** *)

(* end of [gios.sats] *)

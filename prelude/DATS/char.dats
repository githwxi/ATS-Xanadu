(***********************************************************************)
(*                                                                     *)
(*                         Applied Type System                         *)
(*                                                                     *)
(***********************************************************************)

(*
** ATS/Xanadu - Unleashing the Potential of Types!
** Copyright (C) 2018 Hongwei Xi, ATS Trustful Software, Inc.
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
// Author: Hongwei Xi
// Start Time: March, 2020
// Authoremail: gmhwxiATgmailDOTcom
//
(* ****** ****** *)
//
impltmp
char_noteq<>
  (c1, c2) =
(
  not(char_equal<>(c1, c2))
)
//
(* ****** ****** *)
//
// HX:
// For implementing
// some gseq_operations
//
(* ****** ****** *)

impltmp
g_cmp<char> = char_cmp<>

(* ****** ****** *)

impltmp
g_equal<char> = char_equal<>
impltmp
g_noteq<char> = char_noteq<>

(* ****** ****** *)

impltmp
g_print<char> = char_print<>

(* ****** ****** *)

(* end of [char.dats] *)

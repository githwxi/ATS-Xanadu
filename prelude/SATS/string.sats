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
// For C-strings, that is,
// char sequence ending with 0
//
(* ****** ****** *)
//
// Author: Hongwei Xi
// Start Time: March, 2020
// Authoremail: gmhwxiATgmailDOTcom
//
(* ****** ****** *)
//
typedef cgtz =
[c:char|c > 0]char(c)
//
(* ****** ****** *)
//
castfn
string_ptrof
  (string): p2tr(char)
//
#symload ptrof with string
//
(* ****** ****** *)
//
fun//<>
string_print(string): void
//
(* ****** ****** *)
//
fun<>
string_nil
((*void*)): string(0)
fun<>
string_cons
  {n:int}
( c0: cgtz
, cs: string(n)): string(n+1)
//
(* ****** ****** *)
//
fun<>
string_nilq
  {n:int}
  (cs: string(n)): bool(n=0)
fun<>
string_consq
  {n:int}
  (cs: string(n)): bool(n>0)
//
(* ****** ****** *)
//
fun<>
string_forall(cs: string): bool
fun<>
string_rforall(cs: string): bool
//
(* ****** ****** *)

(* end of [string.sats] *)

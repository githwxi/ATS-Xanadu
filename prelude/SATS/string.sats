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

prfun
string_lemma
{n:int}
(string(n)): [n>=0] void

(* ****** ****** *)
//
(*
//
// HX-2020-03-07:
// This is only good
// for targeting C-likes
//
fcast
string_ptrof
(cs: string): p2tr(char)
#symload
ptrof
with string_ptrof of 100
*)
//
(* ****** ****** *)
//
fun//<>
string_print(string): void
//
(* ****** ****** *)
//
fun//<>
string_nil
  ((*void*)): string(0)
fun//<>
string_cons
  {n:int}
( c0: cgtz
, cs: string(n)): string(n+1)
//
(* ****** ****** *)
//
fun//<>
string_nilq
  {n:int}
  (cs: string(n)): bool(n=0)
fun//<>
string_consq
  {n:int}
  (cs: string(n)): bool(n>0)
//
(* ****** ****** *)
//
fun//<>
string_head(string): char
fun//<>
string_head_raw(string): cgtz
fun//<>
string_tail_raw(string): string
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

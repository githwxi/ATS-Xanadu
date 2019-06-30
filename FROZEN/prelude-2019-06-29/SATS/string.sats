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
// Start Time: February, 2019
// Authoremail: gmhwxiATgmailDOTcom
//
(* ****** ****** *)

fun<>
string_length
{n:int}(string(n)): nat(n)
fun<>
string_length_vt1
{n:int}(!string_vt(n)): nat(n)

#symload
length with string_length
#symload
length with string_length_vt1

(* ****** ****** *)

fun<>
string_isnil
{n:int}(string(n)): bool(n=0)
fun<>
string_iscons
{n:int}(string(n)): bool(n>0)

fun<>
string_isnil_vt1
{n:int}(!string(n)): bool(n=0)
fun<>
string_iscons_vt1
{n:int}(!string(n)): bool(n>0)

#symload
iseqz with string_isnil of 11
#symload
isneqz with string_iscons of 11

#symload
iseqz with string_vt_isnil of 11
#symload
isneqz with string_vt_iscons of 11

(* ****** ****** *)

fun<>
string_append
{m,n:int}
(string(m), string(n)): string_vt(m+n)
fun<>
string_append_vt0_vt0
{m,n:int}
(string_vt(m), string_vt(n)): string_vt(m+n)

(* ****** ****** *)

(* end of [string.sats] *)

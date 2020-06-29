(***********************************************************************)
(*                                                                     *)
(*                         Applied Type System                         *)
(*                                                                     *)
(***********************************************************************)

(*
** ATS/Xanadu - Unleashing the Potential of Types!
** Copyright (C) 2019 Hongwei Xi, ATS Trustful Software, Inc.
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
// For random values
//
(* ****** ****** *)
//
// Author: Hongwei Xi
// Start Time: June, 2020
// Authoremail: gmhwxiATgmailDOTcom
//
(* ****** ****** *)

fun
<a0:vt>
rand((*void*)): a0

(* ****** ****** *)
//
fun<>
rand_seed
((*void*)): uint
fun<>
rand_set_nil
((*void*)): void
fun<>
rand_set_seed
( seed : uint ) : void
//
(* ****** ****** *)
//
fun<>
rand_nint(): nint
fun<>
rand_nint$limit(): sintgt(0)
fun<>
rand_nint_limit
{n:pos}(l0: int(n)): nintlt(n)
//
(* ****** ****** *)
//
fun
<a:vt>
rand_list(): list_vt(a)
fun<>
rand_list$length(): nint
//
fun
<a:vt>
rand_list_length
{n:nat}(ln: int(n)): list_vt(a,n)
//
(* ****** ****** *)
//
fun<>
rand_string(): string_vt
fun<>
rand_string$length(): nint
//
fun<>
rand_string_length
{n:nat}(ln: int(n)): string_vt(n)
//
(* ****** ****** *)

(* end of [rand.sats] *)

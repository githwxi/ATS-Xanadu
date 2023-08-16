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
(*
Author: Hongwei Xi
Start Time: April, 2020
Authoremail: gmhwxiATgmailDOTcom
*)
//
(* ****** ****** *)
//
(*
HX: R-available
*)
//
fun<>
fpath_rexists
(path: strn): bool
//
(* ****** ****** *)
//
fun<>
fpath_strmize_char
(path: strn): strm_vt(char)
//
fun<>
fpath_strmize_cgtz
(path: strn): strm_vt(cgtz)
fun<>
fpath_strmize_line
(path: strn): strm_vt(strn)
fun<>
fpath_strmize_line_vt
(path: strn): strm_vt(strn_vt)
//
(* ****** ****** *)
//
(*
fun
<a0:vt>
g_rand((*void*)): a0
*)
//
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
nint_rand(): nint
fun<>
nint_rand$limit(): sintgt(0)
//
fun<>
nint_rand_limit
{n:pos}(l0: sint(n)): nintlt(n)
//
(* ****** ****** *)
//
fun
<a:vt>
list_rand(): list_vt(a)
fun<>
list_rand$length(): nint
//
fun
<a:vt>
list_rand_length
{n:nat}(ln: sint(n)): list_vt(a,n)
//
(* ****** ****** *)
//
fun<>
strn_rand(): strn_vt
fun<>
strn_rand$length(): nint
//
fun<>
strn_rand_length
{n:nat}(ln: sint(n)): strn_vt( n )
//
(* ****** ****** *)

(* end of [xatslib_githwxi_githwxi.sats] *)

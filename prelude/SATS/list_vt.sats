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
// For linear lists
//
(* ****** ****** *)
//
// Author: Hongwei Xi
// Start Time: September, 2019
// Authoremail: gmhwxiATgmailDOTcom
//
(* ****** ****** *)
//
fun<>
list_vt_nil?
{a:vtype}{n:int}
(xs: !list_vt(a, n)): bool(n = 0)
fun<>
list_vt_cons?
{a:vtype}{n:int}
(xs: !list_vt(a, n)): bool(n > 0)
//
#symload
iseqz with list_vt_nil?
#symload
isneqz with list_vt_cons?
//
(* ****** ****** *)
//
fun
<a:vtype>
list_vt_length
{n:int}
(xs: !list_vt(a, n)): int(n)
//
#symload
length with list_vt_length
//
(* ****** ****** *)
//
fun
<a:vtype>
list_vt_reverse
{n:int}
(xs: list_vt(a, n)): list_vt(a, n)
//
#symload
reverse with list_vt_reverse
//
(* ****** ****** *)
//
fun
<a:vtype>
list_vt_copy
{n:int}
(xs: !list_vt(a, n)): list_vt(a, n)
fun
<a:vtype>
list_vt_rcopy
{n:int}
(xs: !list_vt(a, n)): list_vt(a, n)
//
#symload copy with list_vt_copy
#symload rcopy with list_vt_rcopy
//
(* ****** ****** *)
//
fun
<a:vt>
<n:i0>
list_vt_tabulate(int(n)): list_vt(a, n)
fun
<a:vtype>
list_vt_tabulate_cref
{n:nat}
( n0: int(n)
, f0: nintlt(n) -<cref> a): list_vt(a, n)
//
(* ****** ****** *)

(* end of [list_vt.sats] *)

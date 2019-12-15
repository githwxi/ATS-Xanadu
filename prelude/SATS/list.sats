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
// For functional lists
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
list_nil?
{a:type}{n:int}
(xs: list(a, n)): bool(n = 0)
fun<>
list_cons?
{a:type}{n:int}
(xs: list(a, n)): bool(n > 0)
//
#symload iseqz with list_nil?
#symload isneqz with list_cons?
//
(* ****** ****** *)
//
fun
<a:type>
list_length
{n:int}(xs: list(a, n)): int(n)
//
#symload length with list_length
//
(* ****** ****** *)
//
fun
<a:type>
list_append
{m,n:int}
( xs: list(a, m)
, ys: list(a, n)): list(a, m+n)
//
#symload append with list_append
//
(* ****** ****** *)
//
fun
<a:type>
list_revapp
{m,n:int}
( xs: list(a, m)
, ys: list(a, n)): list(a, m+n)
//
#symload revapp with list_revapp
//
(* ****** ****** *)
//
fun
<a:type>
list_reverse
{n:int}(list(a, n)): list(a, n)
//
#symload reverse with list_reverse
//
(* ****** ****** *)
//
fun
<a:type>
list_copy_vt
{n:int}(list(a, n)): list_vt(a, n)
fun
<a:type>
list_rcopy_vt
{n:int}(list(a, n)): list_vt(a, n)
//
#symload copy_vt with list_copy_vt
#symload rcopy_vt with list_rcopy_vt
//
(* ****** ****** *)

fun
<x0:type>
list_forall
{n:int}(xs: list(x0, n)): bool
fun
<x0:type>
list_foreach
{n:int}(xs: list(x0, n)): void

(* ****** ****** *)
//
(*
list_map: map$for
list_map_vt: map$for
*)
//
fun
<x0:type>
<y0:type>
list_map
{n:int}(xs: list(x0, n)): list(y0, n)
fun
<x0:type>
<y0:vtype>
list_map_vt
{n:int}(xs: list(x0, n)): list_vt(y0, n)
//
(* ****** ****** *)
//
(*
list_maprev: map$for
list_maprev_vt: map$for
*)
//
fun
<x0:type>
<y0:type>
list_maprev
{n:int}(xs: list(x0, n)): list(y0, n)
fun
<x0:type>
<y0:vtype>
list_maprev_vt
{n:int}(xs: list(x0, n)): list_vt(y0, n)
//
(* ****** ****** *)
//
fun
<a:t0>
<n:i0>
list_tabulate(int(n)): list(a, n)
fun
<a:type>
list_tabulate_cref
{n:nat}
( n0: int(n)
, f0: nintlt(n) -<cref> a): list(a, n)
//
(* ****** ****** *)

(* end of [list.sats] *)

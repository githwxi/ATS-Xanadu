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

fcast
list_vt2t
{a:t0}{n:i0}
(xs: list_vt(a, n)): list(a, n)

(* ****** ****** *)
//
fun<>
list_vt_nilq
{a:vt}{n:int}
(xs: !list_vt(a, n)): bool(n = 0)
fun<>
list_vt_consq
{a:vt}{n:int}
(xs: !list_vt(a, n)): bool(n > 0)
//
(* ****** ****** *)
//
fun
<a:vt>
list_vt_free(xs: ~list_vt(a)): void
//
(* ****** ****** *)
//
fun
<a:vt>
list_vt_copy
{n:int}
(xs: !list_vt(a, n)): list_vt(a, n)
fun
<a:vt>
list_vt_rcopy
{n:int}
(xs: !list_vt(a, n)): list_vt(a, n)
//
(* ****** ****** *)
//
fun
<a:vt>
list_vt_length
{n:int}
(xs: !list_vt(a, n)): sint(n)
//
(* ****** ****** *)
//
fun
<a:vt>
list_vt_reverse
{n:int}
(xs: list_vt(a, n)): list_vt(a, n)
fun
<a:vt>
list_vt_rappend
{m,n:int}
( xs: list_vt(a, m)
, ys: list_vt(a, n)): list_vt(a, m+n)
fun
<a:vt>
list_vt_rappend10
{m,n:int}
( xs: !list_vt(a, m)
, ys: ~list_vt(a, n)): list_vt(a, m+n)
fun
<a:vt>
list_vt_rappend11
{m,n:int}
( xs: !list_vt(a, m)
, ys: !list_vt(a, n)): list_vt(a, m+n)
//
(* ****** ****** *)
//
fun
<a:vt>
<n:i0>
list_vt_tabulate(int(n)): list_vt(a, n)
fun
<a:vt>
list_vt_tabulate_cref
{n:nat}
( n0: int(n)
, f0: nintlt(n) -<cref> a): list_vt(a, n)
//
(* ****** ****** *)
//
fun
<x0:vt>
list_vt_forall0(xs: list_vt(x0)): bool
fun
<x0:vt>
list_vt_foreach0(xs: list_vt(x0)): void
//
(* ****** ****** *)
//
fun
<x0:vt>
<y0:vt>
list_vt_map0
{n:int}(xs: list_vt(x0, n)): list_vt(y0, n)
fun
<x0:vt>
<y0:vt>
list_vt_maprev0
{n:int}(xs: list_vt(x0, n)): list_vt(y0, n)

(* ****** ****** *)

(* end of [list_vt.sats] *)

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
fun
<a:t0>
list_sing(x: a): list(a, 1)
//
(* ****** ****** *)

fun
<a:t0>
list_make_nval
{n:nat}
(n: int(n), x: a): list(a, n)
fun
<a:t0>
list_make_nval_vt
{n:nat}
(n: int(n), x: a): list_vt(a, n)

(* ****** ****** *)
//
fun<>
list_nilq
{a:type}{n:int}
(xs: list(a, n)): bool(n = 0)
fun<>
list_consq
{a:type}{n:int}
(xs: list(a, n)): bool(n > 0)
//
(* ****** ****** *)
//
fun
<a:t0>
list_head
{n:pos}(list(a, n)): a
fun
<a:t0>
list_head_raw(xs: list(a)): a
fun
<a:t0>
list_head_exn(xs: list(a)): a
fun
<a:t0>
list_head_opt(xs: list(a)): optn_vt(a)
//
fun
<a:t0>
list_tail
{n:pos}(list(a, n)): list(a, n-1)
fun
<a:t0>
list_tail_raw(xs: list(a)): list(a)
fun
<a:t0>
list_tail_exn(xs: list(a)): list(a)
fun
<a:t0>
list_tail_opt(xs: list(a)): optn_vt(list(a))
//
(* ****** ****** *)
//
fun
<a:t0>
list_length
{n:int}(list(a, n)): int(n)
//
(* ****** ****** *)
//
fun
<a:t0>
list_get_at
{n:int}
(list(a, n), nintlt(n)): (a)
//
(* ****** ****** *)
//
fun
<a:t0>
list_extend
{m:int}
(list(a, m), a): list(a, m+1)
fun
<a:t0>
list_append
{m,n:int}
( xs: list(a, m)
, ys: list(a, n)): list(a, m+n)
//
(* ****** ****** *)
//
fun
<a:t0>
list_concat
(xss: list(list(a))): list(a)
fun
<a:t0>
list_concat_vt
(xss: list(list(a))): list_vt(a)
//
(* ****** ****** *)
//
fun
<a:t0>
list_rappend
{m,n:int}
( xs: list(a, m)
, ys: list(a, n)): list(a, m+n)
//
(* ****** ****** *)
//
fun
<a:t0>
list_rappend_vt
{m,n:int}
( xs: list(a, m)
, ys: list_vt(a, n)): list_vt(a, m+n)
//
(* ****** ****** *)
//
fun
<a:t0>
list_reverse
{n:int}(list(a, n)): list(a, n)
//
(* ****** ****** *)

fun
<x0:t0>
list_forall
{n:int}(xs: list(x0, n)): bool
fun
<x0:t0>
list_foreach
{n:int}(xs: list(x0, n)): void

(* ****** ****** *)
//
fun
<x0:t0>
list_listize
{n:int}
(xs: list(x0, n)): list_vt(x0, n)
fun
<x0:t0>
list_rlistize
{n:int}
(xs: list(x0, n)): list_vt(x0, n)
fun
<x0:t0>
list_streamize(list(x0)): stream_vt(x0)
//
(* ****** ****** *)
//
(*
list_map: map$for
list_map_vt: map$for
*)
//
fun
<x0:t0>
<y0:t0>
list_map
{n:int}(list(x0, n)): list(y0, n)
fun
<x0:t0>
<y0:vt>
list_map_vt
{n:int}(list(x0, n)): list_vt(y0, n)
//
(* ****** ****** *)
//
(*
list_maprev: map$for
list_maprev_vt: map$for
*)
//
fun
<x0:t0>
<y0:t0>
list_maprev
{n:int}(list(x0, n)): list(y0, n)
fun
<x0:t0>
<y0:vt>
list_maprev_vt
{n:int}(list(x0, n)): list_vt(y0, n)
//
(* ****** ****** *)
//
fun
<a:t0>
list_copy_vt
{n:int}(xs: list(a, n)): list_vt(a, n)
fun
<a:t0>
list_rcopy_vt
{n:int}(xs: list(a, n)): list_vt(a, n)
//
(* ****** ****** *)
//
fun
<a:t0>
<n:i0>
list_tabulate(n0: int(n)): list(a, n)
fun
<a:t0>
list_tabulate_cfr
{n:nat}
( n0: int(n)
, f0: nintlt(n) -<cfr> a): list(a, n)
//
(* ****** ****** *)
//
fun
<a:t0>
list_mergesort
  {n:int}(xs: list(a, n)): list(a, n)
fun
<a:t0>
list_mergesort_vt
  {n:int}(xs: list(a, n)): list_vt(a, n)
//
(* ****** ****** *)
//
fun
<a:t0>
list_subsetize_vt
{n:int}
(xs: list(a, n)): stream_vt(listlte_vt(a, n))
//
(* ****** ****** *)
//
// HX-2020-05-30:
// symbol overloading for list
//
(* ****** ****** *)
//
#symload
nil with list_nil of 000
#symload
cons with list_cons of 000
//
(* ****** ****** *)
//
#symload nilq with list_nilq of 1000
#symload eqzq with list_nilq of 1000
#symload consq with list_consq of 1000
#symload neqzq with list_consq of 1000
//
(* ****** ****** *)
//
#symload [] with list_head of 1000
#symload head with list_head of 1000
//
#symload tail with list_tail of 1000
//
(* ****** ****** *)

#symload [] with list_get_at of 1000
#symload get_at with list_get_at of 1000

(* ****** ****** *)
//
#symload length with list_length of 1000
//
(* ****** ****** *)
//
#symload append with list_append of 1000
//
#symload concat with list_concat of 1000
//
(* ****** ****** *)
//
#symload reverse with list_reverse of 1000
#symload rappend with list_rappend of 1000
//
(* ****** ****** *)
//
#symload copy_vt with list_copy_vt of 1000
#symload rcopy_vt with list_rcopy_vt of 1000
//
(* ****** ****** *)

#symload forall with list_forall of 1000
#symload foreach with list_foreach of 1000

(* ****** ****** *)

#symload listize with list_listize of 1000
#symload rlistize with list_rlistize of 1000
#symload streamize with list_streamize of 1000

(* ****** ****** *)

#symload map with list_map of 1000
#symload map_vt with list_map_vt of 1000
#symload maprev with list_maprev of 1000
#symload maprev_vt with list_maprev_vt of 1000

(* ****** ****** *)

#symload mergesort with list_mergesort of 1000
#symload mergesort_vt with list_mergesort_vt of 1000

(* ****** ****** *)

(* end of [list.sats] *)

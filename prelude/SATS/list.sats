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
// Start Time: October, 2018
// Authoremail: gmhwxiATgmailDOTcom
//
(* ****** ****** *)
(*
//
#define :: list_cons
//
#define nil list_nil
#define cons list_cons
//
*)
(*
//
#define :: list_vt_cons
//
#define nil_vt list_vt_nil
#define cons_vt list_vt_cons
//
*)
(* ****** ****** *)
//
prfun
lemma_list_param
  {x:type}{n:int}
  (xs: list(x, n)): [n >= 0] void
// end of [lemma_list_param]
prfun
lemma_list_vt_param
  {x:type}{n:int}
  (xs: !list_vt(x, n)): [n >= 0] void
// end of [lemma_list_vt_param]
//
(* ****** ****** *)
//
fun<a:type>
list_tuple_0():<> list_vt(a, 0)
//
fun<a:type>
list_tuple_1(x0: a):<> list_vt(a, 1)
fun<a:type>
list_tuple_2(x0: a, x1: a):<> list_vt(a, 2)
fun<a:type>
list_tuple_3(x0: a, x1: a, x2: a):<> list_vt(a, 3)
//
fun<a:type>
list_tuple_4
  (x0: a, x1: a, x2: a, x3: a):<> list_vt(a, 4)
fun<a:type>
list_tuple_5
  (x0: a, x1: a, x2: a, x3: a, x4: a):<> list_vt(a, 5)
fun<a:type>
list_tuple_6
  (x0: a, x1: a, x2: a, x3: a, x4: a, x5: a):<> list_vt(a, 6)
//
(* ****** ****** *)
//
#symload
list_tuple with list_tuple_0
#symload
list_tuple with list_tuple_1
#symload
list_tuple with list_tuple_2
#symload
list_tuple with list_tuple_3
#symload
list_tuple with list_tuple_4
#symload
list_tuple with list_tuple_5
#symload
list_tuple with list_tuple_6
//
(* ****** ****** *)
//
fun
<x:type>
list_make_sing(x):<wrt> list_vt(x, 1)
fun
<x:type>
list_make_pair(x, x):<wrt> list_vt(x, 2)
//
(* ****** ****** *)
//
fun
<x:type>
list_make_elt
  {n:nat}
  (n: int(n), x: x):<wrt> list_vt(x, n)
// end of [list_make_elt]
//
(* ****** ****** *)
//
fun
<x:type>
list_length{n:int}
  (xs: list(x, n)):<> int(n)
//
(* ****** ****** *)
//
fun<>
list_is_nil
{x:type}
{n:int}(xs: list(x, n)):<> bool(n=0)
fun<>
list_is_cons
{x:type}
{n:int}(xs: list(x, n)):<> bool(n>0)
//
fun
<x:type>
list_is_sing
{n:int}(xs: list(x, n)):<> bool(n=1)
fun
<x:type>
list_is_pair
{n:int}(xs: list(x, n)):<> bool(n=2)
//
(* ****** ****** *)
//
fun
<x:type>
list_head
  {n:pos}(xs: list(x, n)):<> (x)
fun
<x:type>
list_head_exn
  {n:int}(xs: list(x, n)):<exn> (x)
//
(* ****** ****** *)
//
fun
<x:type>
list_tail{n:pos}
  (xs: SHARED(list(x, n))):<> list(x, n-1)
fun
<x:type>
list_tail_exn{n:int}
  (xs: SHARED(list(x, n))):<exn> list(x, n-1)
//
(* ****** ****** *)
//
fun
<x:type>
list_copy
{n:int}(list(x, n)): list_vt(x, n)
fun
<x:vtype>
list_copy_vt1
{n:int}(!list_vt(x, n)): list_vt(x, n)
//
(* ****** ****** *)
//
fun
<x:type>
list_append_dt0_dt1
{m,n:int}
(list(x, m), list(x, n)):<> list(x, m+n)
fun
<x:type>
list_append_dt0_vt0
{m,n:int}
(list(x, m), list_vt(x, n)):<> list_vt(x, m+n)
fun
<x:vtype>
list_append_vt0_vt0
{m,n:int}
(list_vt(x, m), list_vt(x, n)):<> list_vt(x, m+n)
//
(* ****** ****** *)
//
fun
<x:type>
list_reverse
{n:int}(xs: list(x, n)): list_vt(x, n)
fun
<x:vtype>
list_reverse_vt0
{n:int}(xs: list_vt(x, n)): list_vt(x, n)
fun
<x:vtype>
list_reverse_vt1
{n:int}(xs: !list_vt(x, n)): list_vt(x, n)
//
fun
<x:type>
list_rappend_dt0_dt1
{m,n:int}
(list(x, m), list(x, n)): list(x, m+n)
fun
<x:type>
list_rappend_dt0_vt0
{m,n:int}
(list(x, m), list_vt(x, n)): list_vt(x, m+n)
fun
<x:vtype>
list_rappend_vt0_vt0
{m,n:int}
(list_vt(x, m), list_vt(x, n)): list_vt(x, m+n)
//
(* ****** ****** *)
//
fun
<x:type>
list_get_at
{ n,i:int
| 0 <= i; i < n}
(xs: list(x, n), i: int(i)):<> (x)
fun
<x:type>
list_get_at_vt1
{ n,i:int
| 0 <= i; i < n}
(xs: !list_vt(x, n), i: int(i)):<> (x)
//
(* ****** ****** *)
//
fun
<x:type>
<y:vtype>
list_map{n:int}
  (xs: list(x, n)): list_vt(y, n)
fun
<x:vtype>
<y:vtype>
list_map_vt0{n:int}
  (xs: list_vt(x, n)): list_vt(y, n)
fun
<x:vtype>
<y:vtype>
list_map_vt1{n:int}
  (xs: !list_vt(x, n)): list_vt(y, n)
//
fun
<x:type>
<y:vtype>
list_imap{n:int}
  (xs: list(x, n)): list_vt(y, n)
fun
<x:vtype>
<y:vtype>
list_imap_vt0{n:int}
  (xs: list_vt(x, n)): list_vt(y, n)
fun
<x:vtype>
<y:vtype>
list_imap_vt1{n:int}
  (xs: !list_vt(x, n)): list_vt(y, n)
//
(* ****** ****** *)
//
fun
<x:type>
list_forall(xs: list(x)): bool
fun
<x:vtype>
list_forall_vt0(xs: list_vt(x)): bool
fun
<x:vtype>
list_forall_vt1(xs: !list_vt(x)): bool
//
fun
<x:type>
list_foreach(xs: list(x)): void
fun
<x:vtype>
list_foreach_vt0(xs: list_vt(x)): void
fun
<x:vtype>
list_foreach_vt1(xs: !list_vt(x)): void
//
(* ****** ****** *)
//
fun
<x:type>
list_iforall(xs: list(x)): bool
fun
<x:vtype>
list_iforall_vt0(xs: list_vt(x)): bool
fun
<x:vtype>
list_iforall_vt1(xs: !list_vt(x)): bool
//
fun
<x:type>
list_iforeach(xs: list(x)): void
fun
<x:vtype>
list_iforeach_vt0(xs: list_vt(x)): void
fun
<x:vtype>
list_iforeach_vt1(xs: !list_vt(x)): void
//
(* ****** ****** *)
//
fun
<x:type>
<y:type>
list_zip
  {m,n:int}
( xs: list(x, m)
, ys: list(y, n)
) :<> list_vt((x, y), min(m, n))
fun
<x:type>
<y:type>
list_zipeq
  {n:int}
( xs: list(x, n)
, ys: list(y, n)):<> list_vt((x, y), n)
//
(* ****** ****** *)
//
fun
<x:type>
<y:type>
list_cross
  {m,n:int}
( xs: list(x, m)
, ys: list(y, n)):<> list_vt((x, y), m*n)
//
(* ****** ****** *)
//
fun
<x
:vtype>
<n:int>
list_tabulate
{n >= 0}
(n0: sint(n)): list_vt(x, n)
//
fun
<x:vtype><n:int>
list_tabulate$fopr(i: sintlt(n)): (x)
//
(* ****** ****** *)
//
fun
<x:type>
list_sort
// based on mergesort
  {n:int}(xs: list(x, n)):<> list_vt(x, n)
fun
<x:type>
list_quicksort
  {n:int}(xs: list(x, n)):<> list_vt(x, n)
fun
<x:type>
list_mergesort
  {n:int}(xs: list(x, n)):<> list_vt(x, n)
//
fun
<x:vtype>
list_sort_vt0
// based on mergesort
  {n:int}(xs: list_vt(x, n)):<> list_vt(x, n)
fun
<x:vtype>
list_quicksort_vt0
  {n:int}(xs: list_vt(x, n)):<> list_vt(x, n)
fun
<x:vtype>
list_mergesort_vt0
  {n:int}(xs: list_vt(x, n)):<> list_vt(x, n)
//
(* ****** ****** *)

(* end of [list.sats] *)

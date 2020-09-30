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

(*
//
// HX:
// declared in basics.sats
//
fcast
list_vt2t
{a:t0}{n:i0}
(xs: list_vt(a,n)): list(a,n)
*)

(* ****** ****** *)
//
fun
<a:vt>
list_vt_sing(x: a): list_vt(a,1)
fun
<a:vt>
list_vt_pair(a, a): list_vt(a,2)
//
(* ****** ****** *)
//
fun
<a:vt>
list_vt_make_nval
{n:nat}
(n0: int(n), x0: a): list_vt(a,n)
//
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
fun
<a:vt>
list_vt_length0
{n:int}
(xs: ~list_vt(a, n)): sint(n)
//
(* ****** ****** *)
//
fun
<a:vt>
list_vt_extend
{n:int}
(list_vt(a,n), a): list_vt(a,n+1)
fun
<a:vt>
list_vt_append
{m,n:int}
( list_vt(a, m)
, list_vt(a, n)): list_vt(a, m+n)
//
(* ****** ****** *)
//
fun
<a:vt>
list_vt_concat
( xss
: list_vt(list_vt(a))): list_vt(a)
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
list_vt_tabulate_cfr
{n:nat}
( n0: int(n)
, f0: nintlt(n) -<cfr> a): list_vt(a, n)
//
(* ****** ****** *)
//
fun
<x0:vt>
list_vt_forall0(xs: ~list_vt(x0)): bool
fun
<x0:vt>
list_vt_forall1(xs: !list_vt(x0)): bool
//
(* ****** ****** *)
//
fun
<x0:vt>
list_vt_foreach0(xs: ~list_vt(x0)): void
fun
<x0:vt>
list_vt_foreach1(xs: !list_vt(x0)): void
//
(* ****** ****** *)
//
fun
<x0:vt>
list_vt_listize0
{n:int}
(~list_vt(x0, n)): list_vt(x0, n)
fun
<x0:vt>
list_vt_rlistize0
{n:int}
(~list_vt(x0, n)): list_vt(x0, n)
//
fun
<x0:vt>
list_vt_streamize
( xs: ~list_vt(x0) ): stream_vt(x0)
//
(* ****** ****** *)
//
fun
<x0:vt>
<y0:vt>
list_vt_map0
{n:int}
(xs: list_vt(x0, n)): list_vt(y0, n)
fun
<x0:vt>
<y0:vt>
list_vt_maprev0
{n:int}
(xs: list_vt(x0, n)): list_vt(y0, n)

(* ****** ****** *)
//
fun
<a:vt>
list_vt_mergesort
{n:int}(~list_vt(a, n)): list_vt(a, n)
//
(* ****** ****** *)
//
fun
<a:vt>
list_vt_permutize
{n:int}
(~list_vt(a,n)): stream_vt(list_vt(a,n))
//
(* ****** ****** *)
//
// HX-2020-05-30:
// symbol overloading for list
//
(* ****** ****** *)

#symload
nil_vt with list_vt_nil
#symload
cons_vt with list_vt_cons

(* ****** ****** *)
//
#symload
nilq with list_vt_nilq of 1000
(*
#symload
nilq1 with list_vt_nilq of 1000
*)
//
#symload
consq with list_vt_consq of 1000
(*
#symload
consq1 with list_vt_consq of 1000
*)
//
(* ****** ****** *)
//
#symload
length with list_vt_length of 1000
(*
#symload
length1 with list_vt_length of 1000
*)
#symload
length0 with list_vt_length0 of 1000
//
(* ****** ****** *)
//
#symload extend with list_vt_extend of 1000
#symload append with list_vt_append of 1000
//
(* ****** ****** *)
//
#symload concat with list_vt_concat of 1000
(*
#symload concat0 with list_vt_concat of 1000
*)
//
(* ****** ****** *)

#symload reverse with list_vt_reverse of 1000
#symload rappend with list_vt_rappend of 1000

(* ****** ****** *)

#symload forall0 with list_vt_forall0 of 1000
#symload forall1 with list_vt_forall1 of 1000

(* ****** ****** *)

#symload foreach0 with list_vt_foreach0 of 1000
#symload foreach1 with list_vt_foreach1 of 1000

(* ****** ****** *)
//
#symload listize with list_vt_listize0 of 1000
#symload rlistize with list_vt_rlistize0 of 1000
(*
#symload listize0 with list_vt_listize0 of 1000
#symload rlistize0 with list_vt_rlistize0 of 1000
*)
//
#symload streamize with list_vt_streamize of 1000
//
(* ****** ****** *)
//
#symload mergesort with list_vt_mergesort of 1000
(*
#symload mergesort0 with list_vt_mergesort of 1000
*)
//
(* ****** ****** *)

(* end of [list_vt.sats] *)

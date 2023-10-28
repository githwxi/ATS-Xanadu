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
list_nil_
{a:t0}(): list(a, 0)
fun
<a:t0>
list_cons_
{n:i0}
( x0: a
, xs
: list(a, n)): list(a, n+1)
//
(* ****** ****** *)
//
fun
<a:t0>
list_sing(x0: a): list(a,1)
fun
<a:t0>
list_pair
( x1: a, x2: a ): list(a,2)
//
(* ****** ****** *)
//
fun
<a:t0>
list_btw
(s1:sint, f2:sint): list(a)
fun
<a:t0>
list_btwe
(s1:sint, f2:sint): list(a)
//
fun
<a:t0>
list_btw_vt
(s1:sint, f2:sint): list_vt(a)
fun
<a:t0>
list_btwe_vt
(s1:sint, f2:sint): list_vt(a)
//
(* ****** ****** *)
//
fun
<a:t0>
list_make_nval
{n:nat}
(n:sint(n),x:a): list(a,n)
fun
<a:t0>
list_make_nval_vt
{n:nat}
(n:sint(n),x:a): list_vt(a,n)
//
(* ****** ****** *)
//
fun
<a:t0>
list_make_strm(strm(a)): list(a)
fun
<a:t0>
list_make_strm_vt(strm(a)): list_vt(a)
//
(* ****** ****** *)
//
fun
<a:t0>
list_make0_lstrm(strm_vt(a)): list(a)
fun
<a:t0>
list_make0_lstrm_vt(strm_vt(a)): list_vt(a)
//
(* ****** ****** *)
//
fun<>
list_nilq
{a:t0}{n:i0}
(xs: list(a, n)): bool( n=0 )
fun<>
list_consq
{a:type}{n:int}
(xs: list(a, n)): bool( n>0 )
//
(* ****** ****** *)
fun
<a:t0>
list_singq
{ n:int }
(xs: list(a, n)): bool( n=1 )
fun
<a:t0>
list_pairq
{ n:int }
(xs: list(a, n)): bool( n=2 )
(* ****** ****** *)
//
fun
<a:t0>
list_head
{n:pos}(list(a, n)): (a)
fun
<a:t0>
list_head_raw(xs: list(a)): (a)
fun
<a:t0>
list_head_exn(xs: list(a)): (a)
fun
<a:t0>
list_head_opt(xs: list(a)): optn_vt(a)
//
(* ****** ****** *)
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
list_last
{n:pos}(list(a, n)): (a)
fun
<a:t0>
list_last_ini
{n:int}
(x0: a, xs: list(a, n)):(a)
//
(* ****** ****** *)
//
fun
<a:t0>
list_cmp
(xs: list(a), ys: list(a)): sint
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
fun
<a:t0>
list_fset_at
{n:int}
( xs: list(a,n)
, i0: nintlt(n), x0: a): list(a,n)
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
fun
<a:t0>
list_rappend0x
{m,n:int}
( xs
: list_vt(a, m)
, ys: list(a, n)): list(a, m+n)
//
(* ****** ****** *)
//
fun
<a:t0>
list_rappend_vt
{m,n:int}
( xs: list(a, m)
, ys: list(a, n)): list_vt(a, m+n)
fun
<a:t0>
list_rappendx0_vt
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
fun
<a:t0>
list_reverse_vt
{n:int}(list(a, n)): list_vt(a, n)
//
(* ****** ****** *)
//
fun
<x0:t0>
<r0:vt>
list_foldl(list(x0), r0): (r0)
fun
<x0:t0>
<r0:vt>
list_foldr(list(x0), r0): (r0)
//
(* ****** ****** *)
//
fun
<x0:t0>
list_exists(xs: list(x0)): bool
fun
<x0:t0>
list_forall(xs: list(x0)): bool
fun
<x0:t0>
list_foreach(xs: list(x0)): void
//
(* ****** ****** *)
//
fun
<a:t0>
list_sortedq
  {n:i0}(xs: list(a, n)): (bool)
//
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
//
fun
<x0:t0>
list_strmize(list(x0)): strm_vt(x0)
fun
<x0:t0>
list_rstrmize(list(x0)): strm_vt(x0)
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
{n:int}(list(x0,n)): list(y0,n)
fun
<x0:t0>
<y0:vt>
list_map_vt
{n:int}(list(x0,n)): list_vt(y0,n)
//
(* ****** ****** *)
//
(*
//
HX-2022-06-02:
[maprev] stack-collects:
//
list_maprev: map$fopr
list_maprev_vt: map$fopr
*)
//
fun
<x0:t0>
<y0:t0>
list_maprev
{n:int}(list(x0,n)): list(y0,n)
fun
<x0:t0>
<y0:vt>
list_maprev_vt
{n:int}(list(x0,n)): list_vt(y0,n)
//
(* ****** ****** *)
//
fun
<x0:t0>
list_copy_vt
{n:int}(list(x0,n)): list_vt(x0,n)
fun
<x0:t0>
list_rcopy_vt
{n:int}(list(x0,n)): list_vt(x0,n)
//
(* ****** ****** *)
fun
<x0:t0>
list_filter
{n:int}(list(x0,n)): listlte(x0,n)
fun
<x0:t0>
list_filter_vt
{n:int}(list(x0,n)): listlte_vt(x0,n)
(* ****** ****** *)
//
fun
<x0:t0>
<n0:i0>
list_tabulate
(n0: nint(n0)): list(x0,n0)//end-fun
fun
<x0:t0>
list_tabulate_cfr
{n:int}
(n0: nint(n)
,f0: nintlt(n) -<cfr> x0): list(x0,n)
//
(* ****** ****** *)
//
(*
HX-2023-08-03:
For list-i-operations
*)
//
(* ****** ****** *)
//
fun
<x0:t0>
list_iforall
{n:int}(xs: list(x0, n)): bool//fun
//
fun
<x0:t0>
list_iforeach
{n:int}(xs: list(x0, n)): void//fun
//
(* ****** ****** *)
//
fun
<x0:t0>
<y0:t0>
list_imap
{n:int}(xs: list(x0, n)): list(y0, n)
fun
<x0:t0>
<y0:t0>
list_imap_vt
{n:int}(xs: list(x0, n)): list_vt(y0, n)
//
fun
<x0:t0>
<y0:t0>
list_imaprev
{n:int}(xs: list(x0, n)): list(y0, n)
fun
<x0:t0>
<y0:t0>
list_imaprev_vt
{n:int}(xs: list(x0, n)): list_vt(y0, n)
//
(* ****** ****** *)
(*
HX-2023-08-03:
Various special list-processing funs
*)
(* ****** ****** *)
//
fun
<x0:t0>
list_mergesort
{n:int}(xs: list(x0,n)): list(x0,n)
fun
<x0:t0>
list_mergesort_vt
{n:int}(xs: list(x0,n)): list_vt(x0,n)
//
(* ****** ****** *)
//
fun
<x0:t0>
list_nchoose_vt
{m:int}
{n:int}
(xs: list(x0,m)): strm_vt(list_vt(x0,n))
//
fun
<x0:t0>
list_permute_vt
{n:int}
(xs: list(x0,n)): strm_vt(list_vt(x0,n))
//
fun
<x0:t0>
list_subsetize_vt
{n:int}
(xs: list(x0,n)): strm_vt(listlte_vt(x0,n))
//
(* ****** ****** *)
//
// HX-2020-05-30:
// symbol overloading for list
//
(* ****** ****** *)
//
#symload nil with list_nil of 000
#symload cons with list_cons of 000
//
(* ****** ****** *)
//
#symload nilq with list_nilq of 1000
#symload eqzq with list_nilq of 1000
#symload consq with list_consq of 1000
#symload neqzq with list_consq of 1000
//
#symload singq with list_singq of 1000
#symload pairq with list_pairq of 1000
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

#symload fset_at with list_fset_at of 1000

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
//
#symload exists with list_exists of 1000
#symload forall with list_forall of 1000
#symload foreach with list_foreach of 1000
//
#symload iforall with list_iforall of 1000
#symload iforeach with list_iforeach of 1000
//
(* ****** ****** *)
#symload listize with list_listize of 1000
#symload strmize with list_strmize of 1000
(* ****** ****** *)
#symload rlistize with list_rlistize of 1000
#symload rstrmize with list_rstrmize of 1000
(* ****** ****** *)
//
#symload map with list_map of 1000
#symload map_vt with list_map_vt of 1000
#symload maprev with list_maprev of 1000
#symload maprev_vt with list_maprev_vt of 1000
//
#symload imap with list_imap of 1000
#symload imap_vt with list_imap_vt of 1000
#symload imaprev with list_imaprev of 1000
#symload imaprev_vt with list_imaprev_vt of 1000
//
(* ****** ****** *)
#symload mergesort with list_mergesort of 1000
#symload mergesort_vt with list_mergesort_vt of 1000
(* ****** ****** *)
//
// HX-2022-07-23:
// higher-order gseq-functions
// Sun Jul 24 01:02:26 EDT 2022
//
(* ****** ****** *)
//
fun
<x0:t0>
<y0:t0>
list_map_c1fr
{n:int}
(xs:list(x0,n), f0:(x0)-<cfr>y0): list(y0,n)
fun
<x0:t0>
<y0:t0>
list_map_f1np
{n:int}
(xs:list(x0,n), f0:(x0)-<fnp>y0): list(y0,n)
//
(* ****** ****** *)
//
fun
<x0:t0>
<y0:vt>
list_map_c1fr_vt
{n:int}
(xs:list(x0,n), f0:(x0)-<cfr>y0): list_vt(y0,n)
fun
<x0:t0>
<y0:vt>
list_map_f1np_vt
{n:int}
(xs:list(x0,n), f0:(x0)-<fnp>y0): list_vt(y0,n)
//
(* ****** ****** *)
#symload map_c1fr with list_map_c1fr of 1000
#symload map_f1np with list_map_f1np of 1000
#symload map_c1fr_vt with list_map_c1fr_vt of 1000
#symload map_f1np_vt with list_map_f1np_vt of 1000
(* ****** ****** *)
//
(*
HX-2023-10-28:
These functions for list creation are
intuitively simple to use, but they seem
quite difficult for formal verification.
*)
//
fun
<x0:t0>
list_make_fwork
(fwork: ((x0)-<cfr>void) -<cfr> void): list(x0)
fun
<x0:t0>
list_rmake_fwork
(fwork: ((x0)-<cfr>void) -<cfr> void): list(x0)
//
fun
<x0:t0>
list_make_fwork_vt
(fwork: ((x0)-<cfr>void) -<cfr> void): list_vt(x0)
fun
<x0:t0>
list_rmake_fwork_vt
(fwork: ((x0)-<cfr>void) -<cfr> void): list_vt(x0)
//
(* ****** ****** *)

(* end of [ATS3/XANADU_prelude_list000.sats] *)

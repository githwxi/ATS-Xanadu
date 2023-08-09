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
(*
HX-2022-06-02:
Note that verbs of both
0-tense and 1-tense are
supported on linear lists.
*)
(* ****** ****** *)
//
(*
Author: Hongwei Xi
Start Time: September, 2019
Authoremail: gmhwxiATgmailDOTcom
*)
//
(* ****** ****** *)
(*
//
(*
HX:
This one is already
declared in [basics0.sats]
*)
//
fcast
list_vt2t
{a:t0}{n:i0}
(xs: list_vt(a,n)): list(a,n)
*)

(* ****** ****** *)
//
(*
HX:
these are functions
instead of constructors
*)
//
fun<>
list_vt_nil_
{a:vt}(): list_vt(a, 0)
fun
<a:vt>
list_vt_cons_
{n:i0}
( x0: a
, xs
: list_vt(a, n)): list_vt(a, n+1)
//
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
fun<>
list_vt_nilq1
{a:vt}{n:int}
(xs: !list_vt(a, n)): bool(n = 0)
fun<>
list_vt_consq1
{a:vt}{n:int}
(xs: !list_vt(a, n)): bool(n > 0)
//
(* ****** ****** *)
//
fun
<a:vt>
list_vt_length0
{n:int}( ~list_vt(a, n)): sint(n)
fun
<a:vt>
list_vt_length1
{n:int}( !list_vt(a, n)): sint(n)
//
(* ****** ****** *)
//
fun
<a:vt>
list_vt_make_nval
{n:nat}
(n0: sint(n), x0: a): list_vt(a,n)
//
(* ****** ****** *)
//
fun
<a:t0>
list_vt_make_strm
(  xs : strm(a)  ) : list_vt(a)
fun
<a:vt>
list_vt_make_lstrm
(  xs : strm_vt(a)  ) : list_vt(a)
//
(* ****** ****** *)
//
fun
<a:vt>
list_vt_extend0
{n:int}
(~list_vt(a,n), a): list_vt(a,n+1)
//
(* ****** ****** *)
//
fun
<a:vt>
list_vt_append0
{m,n:int}
( ~list_vt(a, m)
, ~list_vt(a, n)): list_vt(a, m+n)
fun
<a:vt>
list_vt_append1
{m,n:int}
( !list_vt(a, m)
, !list_vt(a, n)): list_vt(a, m+n)
//
(* ****** ****** *)
//
fun
<a:vt>
list_vt_concat0
( xss
: ~list_vt(list_vt(a))): list_vt(a)
//
(* ****** ****** *)
//
fun
<a:vt>
list_vt_reverse0
{n:int}
(xs: list_vt(a, n)): list_vt(a, n)
//
(* ****** ****** *)
fun
<a:vt>
list_vt_rappend0
{m,n:int}
( xs: ~list_vt(a, m)
, ys: ~list_vt(a, n)): list_vt(a, m+n)
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
list_vt_prefixq0
( xs1: ~list_vt(a) // xs1: a prefix
, xs2: ~list_vt(a) ) : bool // of [xs2]
fun
<a:vt>
list_vt_suffixq0
( xs1: ~list_vt(a) // [xs1]: a suffix
, xs2: ~list_vt(a) ) : bool // of [xs2]
//
(* ****** ****** *)
//
fun
<a:vt>
<n:i0>
list_vt_tabulate
(n0: sint(n)): list_vt(a, n)
fun
<a:vt>
list_vt_tabulate_cfr
{n:nat}
( n0: sint(n)
, f0
: nintlt(n) -<cfr> a): list_vt(a, n)
//
(* ****** ****** *)
//
fun
<x0:vt>
list_vt_forall0(~list_vt(x0)): bool
fun
<x0:vt>
list_vt_forall1(!list_vt(x0)): bool
//
(* ****** ****** *)
//
fun
<x0:vt>
list_vt_foreach0(~list_vt(x0)): void
fun
<x0:vt>
list_vt_foreach1(!list_vt(x0)): void
//
(* ****** ****** *)
//
fun
<x0:vt>
list_vt_listize0
{n:int}
(xs: ~list_vt(x0, n)): list_vt(x0, n)
fun
<x0:vt>
list_vt_rlistize0
{n:int}
(xs: ~list_vt(x0, n)): list_vt(x0, n)
//
(* ****** ****** *)
//
fun
<x0:vt>
list_vt_strmize0
( xs: ~list_vt( x0 ) ): strm_vt( x0 )
fun
<x0:vt>
list_vt_rstrmize0
( xs: ~list_vt( x0 ) ): strm_vt( x0 )
//
(* ****** ****** *)
//
fun
<x0:vt>
<y0:vt>
list_vt_map0
{n:int}
(xs: ~list_vt(x0, n)): list_vt(y0, n)
fun
<x0:vt>
<y0:vt>
list_vt_maprev0
{n:int}
(xs: ~list_vt(x0, n)): list_vt(y0, n)
//
(* ****** ****** *)
//
//
fun
<x0:vt>
<y0:vt>
list_vt_map1
{n:int}
(xs: !list_vt(x0, n)): list_vt(y0, n)
fun
<x0:vt>
<y0:vt>
list_vt_maprev1
{n:int}
(xs: !list_vt(x0, n)): list_vt(y0, n)
//
(* ****** ****** *)
//
fun
<x0:vt>
list_vt_mergesort0
{n:int}
(xs: ~list_vt(x0, n)): list_vt(x0, n)
//
(* ****** ****** *)
//
fun
<a:vt>
list_vt_permutize0
{n:int}
(~list_vt(a,n)): strm_vt(list_vt(a,n))
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
(*
#symload
nilq with list_vt_nilq1 of 1000
#symload
consq with list_vt_consq1 of 1000
*)
//
#symload
nilq1 with list_vt_nilq1 of 1000
#symload
consq1 with list_vt_consq1 of 1000
//
(* ****** ****** *)
//
(*
#symload
length with list_vt_length1 of 1000
*)
#symload
length0 with list_vt_length0 of 1000
#symload
length1 with list_vt_length1 of 1000
//
(* ****** ****** *)
//
(*
#symload
append with list_vt_append0 of 1000
#symload
extend with list_vt_extend0 of 1000
#symload
concat with list_vt_concat0 of 1000
*)
//
#symload
append0 with list_vt_append0 of 1000
#symload
extend0 with list_vt_extend0 of 1000
#symload
concat0 with list_vt_concat0 of 1000
//
(* ****** ****** *)
//
(*
#symload
reverse with list_vt_reverse0 of 1000
#symload
rappend with list_vt_rappend0 of 1000
*)
//
#symload
reverse0 with list_vt_reverse0 of 1000
#symload
rappend0 with list_vt_rappend0 of 1000
//
#symload
rappend10 with list_vt_rappend10 of 1000
#symload
rappend11 with list_vt_rappend11 of 1000
//
(* ****** ****** *)
//
(*
#symload
prefixq with list_vt_prefixq0 of 1000
#symload
suffixq with list_vt_suffixq0 of 1000
*)
#symload
prefixq0 with list_vt_prefixq0 of 1000
#symload
suffixq0 with list_vt_suffixq0 of 1000
//
(* ****** ****** *)
//
#symload
listize0 with list_vt_listize0 of 1000
#symload
rlistize0 with list_vt_rlistize0 of 1000
//
(* ****** ****** *)
//
#symload
strmize0 with list_vt_strmize0 of 1000
#symload
rstrmize0 with list_vt_rstrmize0 of 1000
//
(* ****** ****** *)
//
(*
#symload map with list_vt_map0 of 1000
*)
#symload map0 with list_vt_map0 of 1000
#symload map1 with list_vt_map1 of 1000
//
(* ****** ****** *)

(*
#symload maprev with list_vt_maprev0 of 1000
*)
#symload maprev0 with list_vt_maprev0 of 1000
#symload maprev1 with list_vt_maprev1 of 1000

(* ****** ****** *)

(*
#symload forall with list_vt_forall0 of 1000
*)
#symload forall0 with list_vt_forall0 of 1000
#symload forall1 with list_vt_forall1 of 1000

(* ****** ****** *)

(*
#symload foreach with list_vt_foreach0 of 1000
*)
#symload foreach0 with list_vt_foreach0 of 1000
#symload foreach1 with list_vt_foreach1 of 1000

(* ****** ****** *)
//
(*
#symload mergesort with list_vt_mergesort0 of 1000
*)
#symload mergesort0 with list_vt_mergesort0 of 1000
//
(* ****** ****** *)
//
(*
#symload permutize with list_vt_permutize0 of 1000
*)
#symload permutize0 with list_vt_permutize0 of 1000
//
(* ****** ****** *)

(* end of [ATS3/XANADU_prelude_list000_vt.sats] *)

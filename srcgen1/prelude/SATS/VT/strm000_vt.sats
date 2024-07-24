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
(*
For functional lin-streams.
*)
(* ****** ****** *)
//
(*
HX-2022-06-02:
Note that only 0-tense verbs
are supported on lin-streams.
*)
//
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
#sexpdef strm_vt = stream_vt
#sexpdef strx_vt = streax_vt
#sexpdef strq_vt = streaq_vt
*)
(* ****** ****** *)
//
fun
<a:t0>
strm_vt2t
(xs: strm_vt(a)): strm(a)
fun
<a:t0>
strx_vt2t
(xs: strx_vt(a)): strx(a)
//
(* ****** ****** *)
//
fun
<a:vt>
strm_vt_nil
((*void*)): strm_vt(a)
//
fun
<a:vt>
strm_vt_cons
( x0: (a)
, xs: strm_vt(a)): strm_vt(a)
//
(* ****** ****** *)
//
fun
<a:vt>
strm_vt_sing( a ): strm_vt(a)
//
(* ****** ****** *)
//
fun
<a:vt>
strm_vt_pair
  (fst: a, snd: a): strm_vt(a)
//
(* ****** ****** *)
//
fun
<a:vt>
strm_vt_eval
(strm_vt(a)): strmcon_vt(a)
fun
<a:vt>
strx_vt_eval
(strx_vt(a)): strxcon_vt(a)
fun
<a:vt>
strq_vt_eval
{n:i0}
(strq_vt(a,n)):strqcon_vt(a,n)
//
(* ****** ****** *)
//
fun
<a:vt>
strm_vt_free(strm_vt(a)): void
fun
<a:vt>
strx_vt_free(strx_vt(a)): void
fun
<a:vt>
strq_vt_free(strq_vt(a)): void
//
(* ****** ****** *)
//
fun
<a:vt>
strm_vt_tail0
  (xs: strm_vt(a)): strm_vt(a)
//
(* ****** ****** *)
//
(*
Sun Jul  3 13:07:07 EDT 2022
*)
fun
<a:vt>
strm_vt_from(x0: a): strm_vt(a)
fun
<a:vt>
strm_vt_from$next(x0: !a): ( a )
(*
HX-2022-07-03:
The default for [$next]:
strm_vt_from$next(x0) = g_succ(x0)
*)
//
fun
<a:vt>
strx_vt_from(x0:a): strx_vt(a)
fun
<a:vt>
strx_vt_from$next(x0: !a): (a)
(*
HX-2022-07-03:
The default for [$next]:
strx_vt_from$next(x0) = g_succ(x0)
*)
//
(* ****** ****** *)
//
fun
<a:vt>
strm_vt_length0
(xs: strm_vt(a)): ( nint )
//
(* ****** ****** *)
//
fun
<a:vt>
strm_vt_strmize0
(xs: strm_vt(a)): strm_vt(a)
//
fun
<a:vt>
strm_vt_listize0
(xs: strm_vt(a)): list_vt(a)
fun
<a:vt>
strm_vt_rlistize0
(xs: strm_vt(a)): list_vt(a)
//
(* ****** ****** *)
//
fun
<a:t0>
strm_vt_range_lt
(  s1: a, f2: a ): strm_vt(a)
fun
<a:t0>
strm_vt_range_lte
(  s1: a, f2: a ): strm_vt(a)
//
(* ****** ****** *)
//
fun
<a:vt>
strm_vt_extend0
(xs: strm_vt(a), x0: a): strm_vt(a)
fun
<a:vt>
strm_vt_append0
(strm_vt(a), strm_vt(a)): strm_vt(a)
(* ****** ****** *)
//
fun
<a:vt>
strm_vt_concat0
(xss: strm_vt(strm_vt(a))): strm_vt(a)
//
(* ****** ****** *)
//
// HX: test if
// [xs1] is a prefix of [xs2]
//
fun
<a:vt>
strm_vt_prefixq0
( xs1: strm_vt(a)
, xs2: strm_vt(a)): bool//endfun
//
(* ****** ****** *)
fun
<x0:vt>
strm_vt_fset0_at
( xs: strm_vt(x0)
, i0: nint, x0: x0): strm_vt(x0)
(* ****** ****** *)
//
fun
<xs:vt>
<x0:vt>
strm_vt_gappend0
(xs1: ~xs, xs2: ~xs): strm_vt(x0)
//
fun
<xs:vt>
<x0:vt>
strm_vt_gconcat0
  (xss: strm_vt(xs)): strm_vt(x0)
//
(* ****** ****** *)
//
fun
<x0:vt>
strm_vt_sortedq0
  (xs: strm_vt(x0)): bool//end-fun
//
(* ****** ****** *)
//
fun
<a:vt>
<n:i0>
strm_vt_tabulate
(n0: sint(n)): strm_vt( a )
fun
<a:vt>
strm_vt_tabulate_cfr
{n:nat}
( n0: sint(n)
, f0
: nintlt(n) -<cfr> a): strm_vt( a )
//
(* ****** ****** *)
(*
HX-2022-06-02:
For verbs declared in [gbas.sats]
*)
(* ****** ****** *)
//
fun
<x0:vt>
<r0:vt>
strm_vt_foldl0
(xs: strm_vt(x0), r0: r0): r0
//
fun
<x0:vt>
strm_vt_exists0(strm_vt(x0)): bool
fun
<x0:vt>
strm_vt_forall0(strm_vt(x0)): bool
fun
<x0:vt>
strm_vt_foreach0(strm_vt(x0)): void
//
(* ****** ****** *)
//
(*
strm_vt_map0: map0$fopr
strq_vt_map0: map0$fopr
*)
//
fun
<x0:vt>
<y0:vt>
strm_vt_map0
  (xs: strm_vt(x0)): strm_vt(y0)
fun
<x0:vt>
<y0:vt>
strq_vt_map0
  (xs: strq_vt(x0)): strq_vt(y0)
//
(* ****** ****** *)
//
(*
strm_vt_filter: filter0$test
*)
//
fun
<x0:vt>
strm_vt_filter0
  (xs: strm_vt(x0)): strm_vt(x0)
(*
fun
<x0:vt>
strq_vt_filter0
  (xs: strq_vt(x0)): strq_vt(x0)
*)
//
(* ****** ****** *)
//
fun
<x0:vt>
strm_vt_dropif0
  (xs: strm_vt(x0)): strm_vt(x0)
//
fun
<x0:vt>
strm_vt_takeif0
  (xs: strm_vt(x0)): strm_vt(x0)
//
fun
<x0:vt>
strm_vt_drop0//based on [idrop0]
( xs
: strm_vt(x0),n0:sint):strm_vt(x0)
fun
<x0:vt>
strm_vt_take0//based on [itake0]
( xs
: strm_vt(x0),n0:sint):strm_vt(x0)
//
(* ****** ****** *)
//
(*
strm_vt_mapopt: filter+map
*)
fun
<x0:vt>
<y0:vt>
strm_vt_mapopt0
  (xs: strm_vt(x0)): strm_vt(y0)
//
(* ****** ****** *)
//
fun
<x0:vt>
<y0:vt>
strm_vt_mapoptn0
  (xs: strm_vt(x0)): strm_vt(y0)
//
fun
<x0:vt>
<y0:vt>
strm_vt_maplist0
  (xs: strm_vt(x0)): strm_vt(y0)
//
fun
<x0:vt>
<y0:vt>
strm_vt_mapstrm0
  (xs: strm_vt(x0)): strm_vt(y0)
//
(* ****** ****** *)
//
fun
<x0:vt>
strm_vt_add0(strm_vt(x0)): (x0)
fun
<x0:vt>
strm_vt_mul0(strm_vt(x0)): (x0)
//
(* ****** ****** *)
//
fun
<x0:vt>
strm1_vt_max0(strm_vt(x0)): (x0)
fun
<x0:vt>
strm1_vt_min0(strm_vt(x0)): (x0)
//
(* ****** ****** *)
//
fun
<x0:vt>
strm_vt_merge0
( xs: strm_vt(x0)
, ys: strm_vt(x0) ): strm_vt(x0)
//
(* ****** ****** *)
//
fun
<x0:vt>
strm_vt_sieve0
  (xs: strm_vt(x0)): strm_vt(x0)
//
(* ****** ****** *)
//
fun
<x0:vt>
strm_vt_group0_llist
( xs
: strm_vt(x0)): strm_vt(list_vt(x0))
//
(* ****** ****** *)
//
// For glseq-i-operations
//
(* ****** ****** *)
//
fun
<x0:vt>
strm_vt_iforall0
  (xs: strm_vt(x0)): ( bool )
//
(* ****** ****** *)
//
fun
<x0:vt>
<y0:vt>
strm_vt_imap0
  (xs: strm_vt(x0)): strm_vt(y0)
fun
<x0:vt>
<y0:vt>
strq_vt_imap0
  (xs: strq_vt(x0)): strq_vt(y0)
//
(* ****** ****** *)
//
fun
<x0:vt>
strm_vt_ifilter0
  (xs: strm_vt(x0)): strm_vt(x0)
fun
<x0:vt>
strq_vt_ifilter0
  (xs: strq_vt(x0)): strq_vt(x0)
//
(* ****** ****** *)
fun
<a:vt>
strm_vt_idropif0
(xs: strm_vt(a)): strm_vt(a)
fun
<a:vt>
strm_vt_itakeif0
(xs: strm_vt(a)): strm_vt(a)
(* ****** ****** *)
//
fun
<x0:vt>
<y0:vt>
strm_vt_imapopt0
  (xs: strm_vt(x0)): strm_vt(y0)
//
(* ****** ****** *)
//
fun
<a:vt>
strm_vt_istrmize0
( xs
: strm_vt(a)): strm_vt(@(nint, a))
//
(* ****** ****** *)
//
// For z2-glseq-operations
//
(* ****** ****** *)
//
fun
<x0:vt
,y0:vt>
strm_vt_z2forall0
  ( xs: strm_vt(x0)
  , ys: strm_vt(y0)): bool
fun
<x0:vt
,y0:vt>
strm_vt_z2forcmp0
  ( xs: strm_vt(x0)
  , ys: strm_vt(y0)): sint
//
(* ****** ****** *)
//
fun
<x0:vt
,y0:vt>
strm_vt_z2foreach0
  ( xs: strm_vt(x0)
  , ys: strm_vt(y0)): void
//
(* ****** ****** *)
//
fun
<x0:vt
,y0:vt>
<z0:vt>
strm_vt_z2map0//seq
( xs: strm_vt(x0)
, ys: strm_vt(y0)): strm_vt( z0 )
//
(* ****** ****** *)
//
fun
<x0:vt
,y0:vt>
strm_vt_z2strmize0
( xs: strm_vt(x0)
, ys: strm_vt(y0)): strm_vt(@(x0,y0))
//
(* ****** ****** *)
//
fun
<x0:vt
,y0:vt>
<z0:vt>
strm_vt_z2imap0//seq
( xs: strm_vt(x0)
, ys: strm_vt(y0)): strm_vt(   z0   )
//
(* ****** ****** *)
//
fun
<x0:vt
,y0:vt>
strm_vt_z2iforall0
(xs: strm_vt(x0), ys: strm_vt(y0)): bool
fun
<x0:vt
,y0:vt>
strm_vt_z2iforcmp0
(xs: strm_vt(x0), ys: strm_vt(y0)): sint
//
(* ****** ****** *)
//
fun
<x0:vt
,y0:vt>
strm_vt_z2iforeach0
(xs: strm_vt(x0), ys: strm_vt(y0)): void
//
(* ****** ****** *)
//
// HX-2020-05-30:
// symbol overloading for strm_vt
//
(* ****** ****** *)
//
#symload
nil_vt with strmcon_vt_nil
#symload
cons_vt with strmcon_vt_cons
//
(* ****** ****** *)
#symload
tail0 with strm_vt_tail0 of 1000
(* ****** ****** *)
//
(*
#symload
print0 with strm_vt_print0 of 1000
*)
//
(* ****** ****** *)
//
#symload
length0 with strm_vt_length0 of 1000
(* ****** ****** *)
#symload
extend0 with strm_vt_extend0 of 1000
#symload
append0 with strm_vt_append0 of 1000
(* ****** ****** *)
#symload
concat0 with strm_vt_concat0 of 1000
(* ****** ****** *)
#symload
prefixq0 with strm_vt_prefixq0 of 1000
(* ****** ****** *)
#symload
gconcat0 with strm_vt_gconcat0 of 1000
(* ****** ****** *)
//
#symload
listize0 with strm_vt_listize0 of 1000
#symload
strmize0 with strm_vt_strmize0 of 1000
#symload
rlistize0 with strm_vt_rlistize0 of 1000
//
(* ****** ****** *)
#symload map0 with strm_vt_map0 of 1000
(* ****** ****** *)
#symload drop0 with strm_vt_drop0 of 1000
#symload take0 with strm_vt_take0 of 1000
(* ****** ****** *)
#symload dropif0 with strm_vt_dropif0 of 1000
#symload takeif0 with strm_vt_takeif0 of 1000
(* ****** ****** *)
#symload idropif0 with strm_vt_idropif0 of 1000
#symload itakeif0 with strm_vt_itakeif0 of 1000
(* ****** ****** *)
#symload foldl0 with strm_vt_foldl0 of 1000
(* ****** ****** *)
#symload filter0 with strm_vt_filter0 of 1000
(* ****** ****** *)
#symload exists0 with strm_vt_exists0 of 1000
#symload forall0 with strm_vt_forall0 of 1000
#symload foreach0 with strm_vt_foreach0 of 1000
(* ****** ****** *)
(* ****** ****** *)

(* end of [ATS3/XANADU_prelude_strm000_vt.sats] *)

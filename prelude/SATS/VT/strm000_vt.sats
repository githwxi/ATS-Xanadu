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
#sexpdef strq_vt = streaq_vt
#sexpdef strx_vt = streax_vt
*)
(* ****** ****** *)
//
fun
<a:t0>
strm_vt2t
(xs: strm_vt(a)): strm(a)
//
(* ****** ****** *)
//
fun<>
strmcon_vt_nil_
{a:vt}
((*void*)): strmcon_vt(a)
fun
<a:vt>
strmcon_vt_cons_
( x0: (a)
, xs
: strm_vt(a)): strmcon_vt(a)
//
(* ****** ****** *)
//
fun
<x0:vt>
<r0:vt>
strmcon_vt_uncons_cfr
( xs: strmcon_vt( x0 )
, f0: ((*void*)) -<cfr> r0
, f1: (x0, strm_vt(x0)) -<cfr> r0): r0
fun
<x0:vt>
<r0:vt>
strxcon_vt_uncons_cfr
( xs: strxcon_vt( x0 )
, f1: (x0, strx_vt(x0)) -<cfr> r0): r0
//
(* ****** ****** *)

fun
<a:vt>
strm_vt_nil
((*void*)): strm_vt( a )
fun
<a:vt>
strm_vt_cons
( x0: (a)
, xs
: strm_vt(a)): strm_vt( a )

(* ****** ****** *)

fun
<a:vt>
strm_vt_sing(a): strm_vt(a)
fun
<a:vt>
strmcon_vt_sing(a): strmcon_vt(a)

(* ****** ****** *)

fun
<a:vt>
strm_vt_pair
  (fst: a, snd: a): strm_vt(a)
fun
<a:vt>
strmcon_vt_pair
  (fst: a, snd: a): strmcon_vt(a)

(* ****** ****** *)

fun
<a:vt>
strm_vt_free(strm_vt(a)): void
fun
<a:vt>
strx_vt_free(strx_vt(a)): void

(* ****** ****** *)
//
fun
<a:vt>
strm_vt_length(xs: strm_vt(a)): nint
//
(* ****** ****** *)

fun
<a:vt>
strm_vt_drop
(xs: strm_vt(a), n0: sint): strm_vt(a)
fun
<a:vt>
strm_vt_take
(xs: strm_vt(a), n0: sint): strm_vt(a)

(* ****** ****** *)
//
fun
<a:vt>
strm_vt_listize
(xs: strm_vt(a)): list_vt(a)
fun
<a:vt>
strm_vt_strmize
(xs: strm_vt(a)): strm_vt(a)
//
fun
<a:vt>
strm_vt_rlistize
(xs: strm_vt(a)): list_vt(a)
//
(* ****** ****** *)
//
fun
<a:vt>
strx_vt_strmize
(xs: strx_vt(a)): strm_vt(a)
//
(* ****** ****** *)
//
fun
<a:vt>
strm_vt_extend
(xs: strm_vt(a), x0: a): strm_vt(a)
fun
<a:vt>
strm_vt_append
(strm_vt(a), strm_vt(a)): strm_vt(a)
(* ****** ****** *)
//
fun
<a:vt>
strm_vt_concat
(xss: strm_vt(strm_vt(a))): strm_vt(a)
//
(* ****** ****** *)
//
fun
<a:vt>
strm_vt_prefixq // xs1 prefix-ofs xs2
( xs1
: strm_vt(a), xs2: strm_vt(a) ): bool 
//
(* ****** ****** *)
fun
<x0:vt>
strm_vt_fset_at
( xs: strm_vt(x0)
, i0: nint, x0: x0): strm_vt(x0)
(* ****** ****** *)
//
fun
<xs:vt>
<x0:vt>
strm_vt_gappend
  (xs1: xs, xs2: xs): strm_vt(x0)
fun
<xs:vt>
<x0:vt>
strm_vt_gconcat
  (xss: strm_vt(xs)): strm_vt(x0)
//
(* ****** ****** *)
//
fun
<x0:vt>
strm_vt_sortedq(strm_vt(x0)): bool
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
strm_vt_forall0(strm_vt(x0)): bool
fun
<x0:vt>
strm_vt_foreach0(strm_vt(x0)): void
//
(* ****** ****** *)
//
(*
strm_vt_map0: map0$fopr
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
strx_vt_map0
  (xs: strx_vt(x0)): strx_vt(y0)
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
fun
<x0:vt>
strx_vt_filter0
  (xs: strx_vt(x0)): strx_vt(x0)
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
fun
<x0:vt>
<y0:vt>
strx_vt_mapopt0
  (xs: strx_vt(x0)): strx_vt(y0)
//
(* ****** ****** *)
//
fun
<x0:vt>
<y0:vt>
strm_vt_mapoptn0
  (xs: strm_vt(x0)): strm_vt(y0)
fun
<x0:vt>
<y0:vt>
strx_vt_mapoptn0
  (xs: strx_vt(x0)): strx_vt(y0)
//
fun
<x0:vt>
<y0:vt>
strm_vt_maplist0
  (xs: strm_vt(x0)): strm_vt(y0)
fun
<x0:vt>
<y0:vt>
strx_vt_maplist0
  (xs: strx_vt(x0)): strx_vt(y0)
//
fun
<x0:vt>
<y0:vt>
strm_vt_mapstrm0
  (xs: strm_vt(x0)): strm_vt(y0)
fun
<x0:vt>
<y0:vt>
strx_vt_mapstrm0
  (xs: strx_vt(x0)): strx_vt(y0)
//
(* ****** ****** *)
fun
<x0:vt>
strm_vt_group0_list
( xs
: strm_vt(x0))
: strm_vt(list_vt(x0))
(* ****** ****** *)
//
fun
<x0:vt>
strm_vt_merge0
( xs: strm_vt(x0)
, ys: strm_vt(x0)): strm_vt(x0)
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
// For glseq-i-operations
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
strx_vt_imap0
  (xs: strx_vt(x0)): strx_vt(y0)
//
(* ****** ****** *)
//
fun
<x0:vt>
strm_vt_ifilter0
  (xs: strm_vt(x0)): strm_vt(x0)
fun
<x0:vt>
strx_vt_ifilter0
  (xs: strx_vt(x0)): strx_vt(x0)
//
(* ****** ****** *)
//
fun
<x0:vt>
<y0:vt>
strm_vt_imapopt0
  (xs: strm_vt(x0)): strm_vt(y0)
fun
<x0:vt>
<y0:vt>
strx_vt_imapopt0
  (xs: strx_vt(x0)): strx_vt(y0)
//
(* ****** ****** *)
fun
<a:vt>
strm_vt_istrmize
( xs
: strm_vt(a)): strm_vt(@(nint, a))
fun
<a:vt>
strx_vt_istrmize
( xs
: strx_vt(a)): strm_vt(@(nint, a))
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
strm_vt_z2strmize
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
<z0:vt>
strm_vt_z2iforall0
(xs: strm_vt(x0), ys: strm_vt(y0)): bool
fun
<x0:vt
,y0:vt>
<z0:vt>
strm_vt_z2iforcmp0
(xs: strm_vt(x0), ys: strm_vt(y0)): sint
//
(* ****** ****** *)
//
fun
<x0:vt
,y0:vt>
<z0:vt>
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
#symload nil_vt with strmcon_vt_nil
#symload cons_vt with strmcon_vt_cons
//
(* ****** ****** *)
//
(*
#symload print with strm_vt_print of 1000
*)
//
(* ****** ****** *)
//
#symload length with strm_vt_length of 1000
//
(* ****** ****** *)
//
#symload extend with strm_vt_extend of 1000
#symload append with strm_vt_append of 1000
//
(* ****** ****** *)

#symload prefixq with strm_vt_prefixq of 1000

(* ****** ****** *)

#symload concat with strm_vt_concat of 1000
#symload gconcat with strm_vt_gconcat of 1000

(* ****** ****** *)
//
#symload listize with strm_vt_listize of 1000
//
(* ****** ****** *)
#symload strmize with strm_vt_strmize of 1000
#symload strmize with strx_vt_strmize of 1000
(* ****** ****** *)
//
#symload rlistize with strm_vt_rlistize of 1000
//
(* ****** ****** *)

(* end of [ATS3/XANADU_prelude_strm000_vt.sats] *)

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
// For functional lin-streams
//
(* ****** ****** *)
//
fun
<a:t0>
stream_vt2t
(xs: stream_vt(a)): stream(a)
//
(* ****** ****** *)

fun
<a:vt>
stream_vt_free(stream_vt(a)): void

(* ****** ****** *)

fun
<a:vt>
stream_vt_nil(): stream_vt(a)
fun
<a:vt>
stream_vt_cons
(x0: a, xs: stream_vt(a)): stream_vt(a)

(* ****** ****** *)

fun
<a:vt>
stream_vt_sing(x0: a): stream_vt(a)
fun
<a:vt>
strmcon_vt_sing(x0: a): strmcon_vt(a)

(* ****** ****** *)

fun
<a:vt>
stream_vt_pair
(x0: a, y0: a): stream_vt(a)
fun
<a:vt>
strmcon_vt_pair
(x0: a, y0: a): strmcon_vt(a)

(* ****** ****** *)

fun
<a:vt>
stream_vt_length(xs: stream_vt(a)): nint

(* ****** ****** *)

fun
<a:vt>
stream_vt_drop
(xs: stream_vt(a), n0: sint): stream_vt(a)
fun
<a:vt>
stream_vt_take
(xs: stream_vt(a), n0: sint): stream_vt(a)

(* ****** ****** *)
//
fun
<a:vt>
stream_vt_listize
(xs: stream_vt(a)): list_vt(a)
fun
<a:vt>
stream_vt_rlistize
(xs: stream_vt(a)): list_vt(a)
//
(* ****** ****** *)
//
fun
<a:vt>
stream_vt_extend
(xs: stream_vt(a), x0: a): stream_vt(a)
fun
<a:vt>
stream_vt_append
(stream_vt(a), stream_vt(a)): stream_vt(a)
//
(* ****** ****** *)
//
fun
<x0:vt>
<r0:vt>
stream_vt_foldl0
(xs: stream_vt(x0), r0: r0): r0
//
fun
<x0:vt>
stream_vt_forall0(stream_vt(x0)): bool
fun
<x0:vt>
stream_vt_foreach0(stream_vt(x0)): void
//
(* ****** ****** *)
//
(*
stream_vt_map0: map0$fopr
*)
//
fun
<x0:vt>
<y0:vt>
stream_vt_map0
  (xs: stream_vt(x0)): stream_vt(y0)
//
(* ****** ****** *)
//
(*
stream_vt_filter: filter0$test
*)
//
fun
<x0:vt>
stream_vt_filter0
  (xs: stream_vt(x0)): stream_vt(x0)
//
(* ****** ****** *)
//
(*
stream_vt_mapopt: map + filter
*)
fun
<x0:vt>
<y0:vt>
stream_vt_mapopt0
  (xs: stream_vt(x0)): stream_vt(y0)
//
(* ****** ****** *)
//
fun
<x0:vt
,y0:vt>
stream_vt_z2forall0
  (xs: stream_vt(x0), ys: stream_vt(y0)): bool
fun
<x0:vt
,y0:vt>
stream_vt_z2forcmp0
  (xs: stream_vt(x0), ys: stream_vt(y0)): sint
//
(* ****** ****** *)
//
// HX-2020-05-30:
// symbol overloading for stream_vt
//
(* ****** ****** *)
//
#symload
nil_vt with strmcon_vt_nil
#symload
cons_vt with strmcon_vt_cons
//
(* ****** ****** *)
//
#symload length with stream_vt_length of 1000
//
(* ****** ****** *)
//
#symload listize with stream_vt_listize of 1000
#symload rlistize with stream_vt_rlistize of 1000
//
(* ****** ****** *)

(* end of [stream_vt.sats] *)

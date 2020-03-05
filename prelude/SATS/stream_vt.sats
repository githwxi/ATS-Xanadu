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
stream_vt_pair(x0: a, y0: a): stream_vt(a)

(* ****** ****** *)
//
fun
<a:vt>
stream_vt_extend
(xs: stream_vt(a), x0: a): stream_vt(a)
fun
<a:vt>
stream_vt_append
(xs: stream_vt(a), ys: stream_vt(a)): stream_vt(a)
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
stream_vt_map0(stream_vt(x0)): stream_vt(y0)
//
(* ****** ****** *)
//
(*
stream_vt_filter: filter0$test
*)
//
fun
<x0:vt>
stream_vt_filter0(stream_vt(x0)): stream_vt(x0)
//
(* ****** ****** *)
//
(*
stream_vt_mapopt: map + filter
*)
fun
<x0:vt>
<y0:vt>
stream_vt_mapopt0(stream_vt(x0)): stream_vt(y0)
//
(* ****** ****** *)

(* end of [stream_vt.sats] *)

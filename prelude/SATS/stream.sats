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
// For functional streams
//
(* ****** ****** *)

fun
<a:type>
stream_nil(): stream(a)
fun
<a:type>
stream_cons
(x0: a, xs: stream(a)): stream(a)

(* ****** ****** *)

fun
<a:type>
stream_sing(x0: a): stream(a)
fun
<a:type>
stream_pair(x0: a, y0: a): stream(a)

(* ****** ****** *)
//
fun
<a:type>
stream_extend
(xs: stream(a), x0: a): stream(a)
fun
<a:type>
stream_append
(xs: stream(a), ys: stream(a)): stream(a)
//
(* ****** ****** *)
//
(*
stream_map: map$for
stream_map_vt: map$for
*)
//
fun
<x0:type>
<y0:type>
stream_map(stream(x0)): stream(y0)
fun
<x0:type>
<y0:vtype>
stream_map_vt(stream(x0)): stream_vt(y0)
//
(* ****** ****** *)

(* end of [stream.sats] *)

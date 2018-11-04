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
//
fun
<x0:type>
<xs:type>
opverb_nil(): xs
fun
<x0:type>
<xs:type>
opverb_cons(x0, xs): xs
//
(* ****** ****** *)
//
fun
<x0:type>
<xs:type>
opverb_is_nil(xs): bool
fun
<x0:type>
<xs:type>
opverb_is_cons(xs): bool
//
(* ****** ****** *)
(*
//
fun
<x0:type>
<xs:type>
opverb_unnil_exn(xs: xs): void
fun
<x0:type>
<xs:type>
opverb_unnil_unsafe(xs: xs): void
//
fun
<x0:type>
<xs:type>
opverb_uncons_exn(xs: &xs >> _): x0
fun
<x0:type>
<xs:type>
opverb_uncons_unsafe(xs: &xs >> _): x0
//
*)
(* ****** ****** *)
//
fun
<x0:type>
<xs:type>
opverb_append(xs1: xs, xs2: xs): xs
//
(* ****** ****** *)
//
fun
<x0:type>
<xs:type>
opverb_reverse(xs: xs): xs
fun
<x0:type>
<xs:type>
opverb_rappend(xs1: xs, xs2: xs): xs
//
(* ****** ****** *)
//
fun
<x0:type>
<xs:type>
opverb_streamize(xs: xs): stream_vt(x0)
fun
<x0:vtype>
<xs:vtype>
opverb_streamize_vt0(xs: xs): stream_vt(x0)
fun
<x0:vtype>
<xs:vtype>
opverb_streamize_vt1(xs: !xs): stream_vt(x0)
//
(* ****** ****** *)
//
fun
<x0:type>
<y0:type>
map$fopr(x0): y0
fun
<x0:vtype>
<y0:vtype>
map_vt0$fopr(x0): y0
fun
<x0:vtype>
<y0:vtype>
map_vt1$fopr(&x0 >> _): y0
//
(* ****** ****** *)
//
fun
<kx:prop;
 x0:type;xs:type>
<ky:prop;
 y0:type;ys:type>
opverb_map(xs: xs): ys
fun
<kx:prop;
 x0:type;xs:type>
<ky:prop;
 y0:type;ys:type>
opverb_maprev(xs: xs): ys
//
fun
<kx:prop;
 x0:vtype;xs:vtype>
<ky:prop;
 y0:vtype;ys:vtype>
opverb_map_vt0(xs: xs): ys
fun
<kx:prop;
 x0:vtype;xs:vtype>
<ky:prop;
 y0:vtype;ys:vtype>
opverb_maprev_vt0(xs: xs): ys
//
fun
<kx:prop;
 x0:vtype;xs:vtype>
<ky:prop;
 y0:vtype;ys:vtype>
opverb_map_vt1(xs: !xs >> _): ys
fun
<kx:prop;
 x0:vtype;xs:vtype>
<ky:prop;
 y0:vtype;ys:vtype>
opverb_maprev_vt1(xs: !xs >> _): ys
//
(* ****** ****** *)
//
fun
<x0:type>
forall$test(x0): bool
fun
<x0:vtype>
forall_vt0$test(x0): bool
fun
<x0:vtype>
forall_vt1$test(&x0 >> _): bool
//
fun
<x0:type>
<xs:type>
opverb_forall(xs: xs): bool
//
fun
<x0:vtype>
<xs:vtype>
opverb_forall_vt0(xs: xs): bool
fun
<x0:vtype>
<xs:vtype>
opverb_forall_vt1(xs: !xs >> _): bool
//
(* ****** ****** *)
//
fun
<x0:type>
foreach$work(x0): void
fun
<x0:vtype>
foreach_vt0$work(x0): void
fun
<x0:vtype>
foreach_vt1$work(&x0 >> _): void
//
fun
<x0:type>
<xs:type>
opverb_foreach(xs: xs): void
//
fun
<x0:vtype>
<xs:vtype>
opverb_foreach_vt0(xs: xs): void
fun
<x0:vtype>
<xs:vtype>
opverb_foreach_vt1(xs: !xs >> _): void
//
(* ****** ****** *)
//
fun
<r0:type>
<x0:type>
foldleft$fopr(r0, x0): r0
fun
<x0:type>
<r0:type>
foldright$fopr(x0, r0): r0
//
fun
<kx:prop>
<x0:type>
<xs:type>
<r0:type>
opverb_foldleft(init: r0, xs: xs): r0
fun
<kx:prop>
<x0:type>
<xs:type>
<r0:type>
opverb_foldright(xs: xs, sink: r0): r0
//
(* ****** ****** *)
//
fun
<x0:type>
<y0:type>
<z0:type>
map2$fopr(x0, y0): z0
//
fun
<x0:type>
<y0:type>
<r0:type>
foldleft2$fopr(r0, x0, y0): r0
fun
<r0:type>
<x0:type>
<y0:type>
foldright2$fopr(x0, y0, r0): r0
//
(* ****** ****** *)
//
fun
<r0:type>
<x0:type>
<xs:type>
<y0:type>
<ys:type>
opverb_zip_foldleft2(xs: xs, ys: ys): r0
fun
<r0:type>
<x0:type>
<xs:type>
<y0:type>
<ys:type>
opverb_cross_foldleft2(xs: xs, ys: ys): r0
//
(* ****** ****** *)
//
fun
<x0:type>
<xs:type>
<y0:type>
opverb_streamize_map(xs: xs): stream_vt(y0)
fun
<x0:type>
<xs:type>
<y0:type>
<ys:type>
<z0:type>
opverb_streamize_zip_map2(xs: xs, ys: ys): stream_vt(z0)
fun
<x0:type>
<xs:type>
<y0:type>
<ys:type>
<z0:type>
opverb_streamize_cross_map2(xs: xs, ys: ys): stream_vt(z0)
//
(* ****** ****** *)

(* end of [opverb.sats] *)

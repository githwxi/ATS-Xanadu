(***********************************************************************)
(*                                                                     *)
(*                         Applied Type System                         *)
(*                                                                     *)
(***********************************************************************)

(*
** ATS/Postiats - Unleashing the Potential of Types!
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

implement
<x0><xs>
opverb_append(xs) = let
//
implement
foldright$fopr<x0><xs>
  (x0, xs) =
  opverb_cons<x0><xs>(x0, xs)
//
in
//
opverb_foldright<x0><xs><xs>(xs1, xs2)
//
endlet // end-of-[opverb_append]

(* ****** ****** *)

implement
<x0><xs>
opverb_reverse
  (xs) = let
//
val nil = opverb_nil<x0><xs>()
//
in
  opverb_rappend<x0><xs>(xs, nil)
end // end of [opverb_reverse]

(* ****** ****** *)

implement
<x0><xs>
opverb_rappend
  (xs1, xs2) = let
//
implement
foldleft$fopr<xs><x0>
  (xs, x0) =
  opverb_cons<x0><xs>(x0, xs)
//
in
  opverb_foldleft<xs><x0><xs>(xs2, xs1)
endlet // end-of-[opverb_rappend]

(* ****** ****** *)
//
implement
<x0><xs>
<y0><ys>
opverb_map(xs) =
(
opverb_reverse<y0><ys>
(opverb_mapr<x0><xs><y0><ys>(xs))
)
//
implement
<x0><xs>
<y0><ys>
opverb_mapr(xs) = let
//
implement
foldleft$fopr<ys><x0>
  (ys, x0) = let
  val y0 =
    map$fopr<x0><y0>(x0)
  // end of [val]
in
  opverb_cons<y0><ys>(y0, ys)
endlet // end-of-implement
//
in
//
let
  val r0 = opverb_nil<y0><ys>()
in
  opverb_foldleft<ys><x0><xs>(r0, xs)
end
//
endlet // end-of-implement(opverb_mapr)
//
(* ****** ****** *)

implement
<r0><x0><xs>
opverb_foldleft =
opverb_foldleft'stream'<r0><x0><xs>

(* ****** ****** *)

implement
<r0><x0><xs>
opverb_foldleft'stream'
  (r0, xs) = let
//
fun
loop
(xs: stream_vt(x0), r0: r0): r0 =
(
case+ !xs of
| ~stream_vt_nil() => r0
| ~stream_vt_cons(x0, xs) =>
  loop(xs, foldleft$fopr<r0><x0>(r0, x0))
)
//
in
  loop(xs, r0) where
  {
    val xs = opverb_streamize<x0><xs>(xs)
  } (* end of [where] *)
end // end of implement(opverb_foldleft)

implement
{r0:type}
{x0,xs:vtype}
opverb_foldleft
<listlike><r0><x0><xs>
  (r0, xs) = let
//
fun
loop
(xs: &xs >> _, r0: r0): r0 =
(
if
opverb_is_cons(xs)
then
let
val x0 =
opverb_uncons_unsafe<x0><xs>(xs)
in
loop(xs, foldleft$fopr<r0><x0>(r0, x0))
endlet // end of then
else
let
val () =
  opverb_unnil_unsafe<x0><xs>(xs) in r0
endlet // end of else
)
//
in
  loop(xs, r0)
end // end of implement(opverb_foldleft)

(* ****** ****** *)

(*
implement
{r0,x0:type}
opverb_foldleft
<_><x0><list(x0)><r0> =
(r0, xs) =
loop(xs, r0) where
{
//
fun
loop
(xs: list(x0), r0: r0): r0 =
(
case+ xs of
| list_nil() => r0
| list_cons(x0, xs) =>
  loop(xs, foldleft$fopr<r0><x0>(r0, x0))
)
//
} (* end of implement(opverb_foldleft) *)
*)

implement
{r0,x0:type}
opverb_foldleft
<stream><x0><list(x0)><r0> =
opverb_foldleft<stream><x0><list(x0)><r0>
implement
{r0,x0:type}
opverb_foldleft
<listlike><x0><list(x0)><r0> =
opverb_foldleft<listlike><x0><list(x0)><r0>

(* ****** ****** *)
//
implement
<x0><xs><r0>
opverb_foldright(xs, r0) =
(
  opverb_foldleft<r0><x0><xs>
  (r0, opverb_reverse<x0><xs>(xs))
)
//
(* ****** ****** *)

implement
<x0><xs>
<y0><ys><z0>
opverb_streamize_cross_map2
  (xs, ys) = let
//
fun
auxmain
( xs: stream_vt(x0)
, ys: ys): stream_vt(z0) = $ldelay
(
case+ xs of
| ~stream_vt_nil() =>
  (
    stream_vt_nil(*void*)
  )
| ~stream_vt_cons(x0, xs) =>
  let
    local
    implement
    map$fopr<y0><z0>(y0) =
    map2$fopr<x0><y0><z0>(x0, y0)
    in
    val zs1 =
    opverb_streamize_map<y0><ys><z0>(ys)
    endlocal
  in
    stream_vt_append<z0>(zs1, auxmain(xs, ys))
  endlet
)
//
in
  auxmain(xs, ys) where
  {
    val xs = opverb_streamize<x0><xs>(xs)
  } (* end of [where] *)
endlet // end of [opverb_streamize_cross_map2]

(* ****** ****** *)

(* end of [opverb.dats] *)

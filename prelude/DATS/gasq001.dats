(***********************************************************************)
(*                                                                     *)
(*                         Applied Type System                         *)
(*                                                                     *)
(***********************************************************************)

(*
** ATS/Xanadu - Unleashing the Potential of Types!
** Copyright (C) 2024 Hongwei Xi, ATS Trustful Software, Inc.
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
(* ****** ****** *)
//
(*
Author: Hongwei Xi
(*
Sun 21 Jul 2024 02:34:24 PM EDT
*)
Authoremail: gmhwxiATgmailDOTcom
*)
//
(* ****** ****** *)
(* ****** ****** *)
#typedef ni = nint
(* ****** ****** *)
(* ****** ****** *)
#staload UN =
"prelude/SATS/unsfx00.sats"
(* ****** ****** *)
(* ****** ****** *)
//
#impltmp
< xs:t0 >
< x0:vt >
gasq_listize
  ( xs ) =
let
val n0 =
gasq_length
<xs><x0>(xs)
in//let
(
nint_map_llist<x0>(n0))
where
{
#impltmp
map$fopr<ni><x0>(i0) =
(
$UN.gasq_cget$at$raw
<   xs   ><   x0   >( xs, i0 ))
}
end//let//end-of-[gasq_listize(xs)]
//
(* ****** ****** *)
//
#impltmp
< xs:t0 >
< x0:vt >
gasq_rlistize
  ( xs ) =
let
val n0 =
gasq_length
<xs><x0>(xs)
in//let
(
nint_rmap_llist<x0>(n0))
where
{
#impltmp
rmap$fopr<ni><x0>(i0) =
(
$UN.gasq_cget$at$raw
<   xs   ><   x0   >( xs, i0 ))
}
end//let//end-of-[gasq_rlistize(xs)]
//
(* ****** ****** *)
(* ****** ****** *)
//
#impltmp
< xs:t0 >
< x0:vt >
gasq_strmize
  ( xs ) =
let
val n0 =
gasq_length
<xs><x0>(xs)
in//let
(
nint_map_lstrm<x0>(n0))
where
{
#impltmp
map$fopr<ni><x0>(i0) =
(
$UN.gasq_cget$at$raw
<   xs   ><   x0   >( xs, i0 ))
}
end//let//end-of-[gasq_strmize(xs)]
//
#impltmp
< xs:t0 >
< x0:vt >
gasq_rstrmize
  ( xs ) =
let
val n0 =
gasq_length
<xs><x0>(xs)
in//let
(
nint_rmap_lstrm<x0>(n0))
where
{
#impltmp
rmap$fopr<ni><x0>(i0) =
(
$UN.gasq_cget$at$raw
<   xs   ><   x0   >( xs, i0 ))
}
end//let//end-of-[gasq_rstrmize(xs)]
//
(* ****** ****** *)
(* ****** ****** *)
//
#impltmp
< xs:t0 >
< x0:vt >
gasq_forall(xs) =
let
val n0 =
gasq_length
<xs><x0>(xs)
in//let
(*
HX-2024-07-22:
This example shows
the need for non-rec templates!
*)
(
nint_forall<>(n0))
where
{
#impltmp
forall$test<ni>(i0) =
(
  g_free<x0>(x0); r0)
where
{
//
val
(
pf|x0) =
$UN.gasq_lget$at$raw
< xs >< x0 >(xs, i0)
//
val r0 =
  forall$test1<x0>(x0)
//
pvx () =
(
  owed_vt_return0(pf, x0)) }
}
end//let//end-of-[gasq_forall(xs)]
//
#impltmp
< xs:t0 >
< x0:vt >
gasq_forall$f1un
  (xs, test) =
(
gasq_forall
<xs><x0>(xs)) where {
#impltmp
forall$test1<x0>(x0) = test(x0)//impl
}(*where*)//end-of-[gasq_forall$f1un(xs)]
//
(* ****** ****** *)
//
#impltmp
< xs:t0 >
< x0:vt >
gasq_exists(xs) =
let
//
#impltmp
forall$test1<x0>(x0) =
(
  not(exists$test1<x0>(x0)))
//
in//let
  not(gasq_forall<xs><x0>(xs))
end//let//end-of-[gasq_exists(xs)]
//
#impltmp
< xs:t0 >
< x0:vt >
gasq_exists$f1un
  (xs, test) =
(
gasq_exists
<xs><x0>(xs)) where {
#impltmp
exists$test1<x0>(x0) = test(x0)//impl
}(*where*)//end-of-[gasq_exists$f1un(xs)]
//
(* ****** ****** *)
//
#impltmp
< xs:t0 >
< x0:vt >
gasq_rforall(xs) =
let
val n0 =
gasq_length
<xs><x0>(xs)
in//let
(*
HX-2024-07-22:
This example shows
the need for non-rec templates!
*)
(
nint_rforall<>(n0))
where
{
#impltmp
rforall$test<ni>(i0) =
(
  g_free<x0>(x0); r0)
where
{
val
(pf | x0) =
$UN.gasq_lget$at$raw
< xs >< x0 >(xs, i0)
val r0 =
  rforall$test1<x0>(x0)
val () =
$UN.gasq_lset$at$raw
<xs><x0>(pf | xs, i0, x0) }
}
end//let//end-of-[gasq_rforall(xs)]
//
(* ****** ****** *)
//
#impltmp
< xs:t0 >
< x0:vt >
gasq_rforall$f1un
  (xs, test) =
(
gasq_rforall
<xs><x0>(xs)) where
{
#impltmp
rforall$test1<x0>(x0) = test(x0)//impl
}(*where*)//end-of-[gasq_rforall$f1un(xs)]
//
(* ****** ****** *)
//
#impltmp
< xs:t0 >
< x0:vt >
gasq_rexists(xs) =
let
//
#impltmp
rforall$test1<x0>(x0) =
(
  not(rexists$test1<x0>(x0)))
//
in//let
  not(gasq_rforall<xs><x0>(xs))
end//let//end-of-[gasq_rexists(xs)]
//
#impltmp
< xs:t0 >
< x0:vt >
gasq_rexists$f1un
  (xs, test) =
(
gasq_rexists
<xs><x0>(xs)) where {
#impltmp
rexists$test1<x0>(x0) = test(x0)//impl
}(*where*)//end-of-[gasq_rexists$f1un(xs)]
//
(* ****** ****** *)
(* ****** ****** *)
//
#impltmp
< x0:vt >
mapref$fopr0(x0) =
let
var x0 = x0
in//let
(
mapref$fopr1x<x0>(x0);x0)
end//let//(mapref$fopr0(x0))
#impltmp
< x0:vt >
mapref$fopr1x(x0) =
(x0 := mapref$fopr0<x0>(x0))
//
(* ****** ****** *)
//
#impltmp
< xs:t0 >
< x0:vt >
gasq_mapref$c1bv
  (xs, fopr) =
(
gasq_mapref
<xs><x0>(xs)) where
{
#impltmp
mapref$fopr0<x0>(x0) = fopr(x0)
}(*where*)//end-of-[gasq_mapref$c1bv]
//
(* ****** ****** *)
(* ****** ****** *)
//
(*
HX-2026-01-05:
Mon Jan  5 06:44:09 PM EST 2026
*)
//
#impltmp
< xs:t0 >
< x0:t0 >
gasq_sortedq
  ( xs ) =
let
//
val ln =
gasq_length<xs><x0>(xs)
//
fun
auxloop
(i0: nint, x0: x0): bool =
(
if
(i0 >= ln)
then true else
(
if // if
sortedq$lteq<x0>(x0, x1)
then
auxloop(i0+1, x1) else false)
where
{
val x1 =
$UN.gasq_get$at$raw<xs><x0>(xs, i0)}
)
//
in//let
//
(
if // if
(ln <= 1)
then true else
auxloop(1, 
  $UN.gasq_get$at$raw<xs><x0>(xs, 0)))
//
end(*let*)//end-of-[gasq_sortedq<xs><x0>(xs)]
//
(* ****** ****** *)
//
#impltmp
< xs:t0 >
< x0:t0 >
gasq_sortedq$f2un
  (xs, lteq) =
(
gasq_sortedq<xs><x0>(xs))
where
{
#impltmp
sortedq$lteq<x0>(*x1,x2*) = lteq
}(*where*)//end-of-[gasq_sortedq$f2un(xs,lteq)]
//
(* ****** ****** *)
(* ****** ****** *)
//
(***********************************************************************)
(* end of [ATS3/XANADU_prelude_DATS_gasq001.dats] *)
(***********************************************************************)

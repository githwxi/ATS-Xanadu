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
gasz_listize
  ( xs ) =
let
val n0 =
gasz_length
<xs><x0>(xs)
in//let
(
nint_map_llist<x0>(n0))
where
{
#impltmp
map$fopr<ni><x0>(i0) =
(
$UN.gasz_cget$at$raw
<   xs   ><   x0   >( xs, i0 ))
}
end//let//end-of-[gasz_listize(xs)]
//
(* ****** ****** *)
//
#impltmp
< xs:t0 >
< x0:vt >
gasz_rlistize
  ( xs ) =
let
val n0 =
gasz_length
<xs><x0>(xs)
in//let
(
nint_rmap_llist<x0>(n0))
where
{
#impltmp
rmap$fopr<ni><x0>(i0) =
(
$UN.gasz_cget$at$raw
<   xs   ><   x0   >( xs, i0 ))
}
end//let//end-of-[gasz_rlistize(xs)]
//
(* ****** ****** *)
(* ****** ****** *)
//
#impltmp
< xs:t0 >
< x0:vt >
gasz_strmize
  ( xs ) =
let
val n0 =
gasz_length
<xs><x0>(xs)
in//let
(
nint_map_lstrm<x0>(n0))
where
{
#impltmp
map$fopr<ni><x0>(i0) =
(
$UN.gasz_cget$at$raw
<   xs   ><   x0   >( xs, i0 ))
}
end//let//end-of-[gasz_strmize(xs)]
//
#impltmp
< xs:t0 >
< x0:vt >
gasz_rstrmize
  ( xs ) =
let
val n0 =
gasz_length
<xs><x0>(xs)
in//let
(
nint_rmap_lstrm<x0>(n0))
where
{
#impltmp
rmap$fopr<ni><x0>(i0) =
(
$UN.gasz_cget$at$raw
<   xs   ><   x0   >( xs, i0 ))
}
end//let//end-of-[gasz_rstrmize(xs)]
//
(* ****** ****** *)
(* ****** ****** *)
//
#impltmp
< xs:t0 >
< x0:vt >
gasz_forall(xs) =
let
val n0 =
gasz_length
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
(pf | x0) =
$UN.gasz_lget$at$raw
< xs >< x0 >(xs, i0)
//
val r0 =
  forall$test1<x0>(x0)
//
prval () =
(
  owed_vt_return0(pf, x0)) }
}
end//let//end-of-[gasz_forall(xs)]
//
#impltmp
< xs:t0 >
< x0:vt >
gasz_forall$f1un
  (xs, test) =
(
gasz_forall
<xs><x0>(xs)) where {
#impltmp
forall$test1<x0>(x0) = test(x0)//impl
}(*where*)//end-of-[gasz_forall$f1un(xs)]
//
(* ****** ****** *)
//
#impltmp
< xs:t0 >
< x0:vt >
gasz_exists(xs) =
let
//
#impltmp
forall$test1<x0>(x0) =
(
  not(exists$test1<x0>(x0)))
//
in//let
  not(gasz_forall<xs><x0>(xs))
end//let//end-of-[gasz_exists(xs)]
//
#impltmp
< xs:t0 >
< x0:vt >
gasz_exists$f1un
  (xs, test) =
(
gasz_exists
<xs><x0>(xs)) where {
#impltmp
exists$test1<x0>(x0) = test(x0)//impl
}(*where*)//end-of-[gasz_exists$f1un(xs)]
//
(* ****** ****** *)
//
#impltmp
< xs:t0 >
< x0:vt >
gasz_rforall(xs) =
let
val n0 =
gasz_length
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
$UN.gasz_lget$at$raw
< xs >< x0 >(xs, i0)
val r0 =
  rforall$test1<x0>(x0)
val () =
$UN.gasz_lset$at$raw
<xs><x0>(pf | xs, i0, x0) }
}
end//let//end-of-[gasz_rforall(xs)]
//
(* ****** ****** *)
//
#impltmp
< xs:t0 >
< x0:vt >
gasz_rforall$f1un
  (xs, test) =
(
gasz_rforall
<xs><x0>(xs)) where
{
#impltmp
rforall$test1<x0>(x0) = test(x0)//impl
}(*where*)//end-of-[gasz_rforall$f1un(xs)]
//
(* ****** ****** *)
//
#impltmp
< xs:t0 >
< x0:vt >
gasz_rexists(xs) =
let
//
#impltmp
rforall$test1<x0>(x0) =
(
  not(rexists$test1<x0>(x0)))
//
in//let
  not(gasz_rforall<xs><x0>(xs))
end//let//end-of-[gasz_rexists(xs)]
//
#impltmp
< xs:t0 >
< x0:vt >
gasz_rexists$f1un
  (xs, test) =
(
gasz_rexists
<xs><x0>(xs)) where {
#impltmp
rexists$test1<x0>(x0) = test(x0)//impl
}(*where*)//end-of-[gasz_rexists$f1un(xs)]
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
mapref$fopr1r<x0>(x0);x0)
end//let//(mapref$fopr0(x0))
#impltmp
< x0:vt >
mapref$fopr1r(x0) =
(x0 := mapref$fopr0<x0>(x0))
//
(* ****** ****** *)
//
#impltmp
< xs:t0 >
< x0:vt >
gasz_mapref_c1bv
  (xs, fopr) =
(
gasz_mapref
<xs><x0>(xs)) where
{
#impltmp
mapref$fopr0<x0>(x0) = fopr(x0)
}(*where*)//end-of-[gasz_mapref_c1bv]
//
(* ****** ****** *)
(* ****** ****** *)
//
(* ****** ****** *)(* ****** ****** *)
(* ****** ****** *)(* ****** ****** *)

(* end of [ATS3/XANADU_prelude_DATS_gasz001.dats] *)

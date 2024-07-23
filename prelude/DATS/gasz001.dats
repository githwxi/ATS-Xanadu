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
map$fopr<ni>(i0) =
(gasz_get_at_raw<xs><x0>(xs, i0))
}
end//let//end-of-[gasz_strmize0(xs)]
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
val x0 =
gasz_get_at_raw
<xs><x0>(xs, i0)
val r0 = forall$test1<x0>(x0) }
}
end//let//end-of-[gasz_forall(xs)]
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
val x0 =
gasz_get_at_raw
<xs><x0>(xs, i0)
val r0 = rforall$test1<x0>(x0) }
}
end//let//end-of-[gasz_rforall(xs)]
//
(* ****** ****** *)
(* ****** ****** *)
//
(* ****** ****** *)(* ****** ****** *)
(* ****** ****** *)(* ****** ****** *)

(* end of [ATS3/XANADU_prelude_DATS_gasz001.dats] *)

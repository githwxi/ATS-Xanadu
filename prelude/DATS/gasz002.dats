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
Thu 08 Aug 2024 04:47:26 AM EDT
*)
Authoremail: gmhwxiATgmailDOTcom
*)
//
(* ****** ****** *)
(* ****** ****** *)
#staload UN =
"prelude/SATS/unsfx00.sats"
(* ****** ****** *)
(* ****** ****** *)
//
#define
GZ2ASZ(xs, ys) =
GASZ_z2make(GASZ(xs), GASZ(ys))
//
(*
#typedef
gz2asz
( xs: t0, x0: t0
, ys: t0, y0: t0) =
(
z2tup(GASZ(xs, x0), GASZ(ys, y0)))
*)
//
#impltmp
< xs:t0 >
< x0:vt >
< ys:t0 >
< y0:vt >
GASZ_z2make
(xseq, yseq) =
$UN.castxy//GASZ_make
(z2tup_make(xseq, yseq))
//
(* ****** ****** *)
(* ****** ****** *)
//
(*
HX-2024-08-05:
Thu 08 Aug 2024 04:50:03 AM EDT
*)
//
#impltmp
< xs:t0 >
< x0:vt >
< ys:t0 >
< y0:vt >
gasz_z2forall
  (xs, ys) =
let
val nx =
gasz_length<xs><x0>(xs)
val ny =
gasz_length<ys><y0>(ys)
in//let
(
nint_forall<>
(g_min<nint>(nx, ny))) where
{
#impltmp
forall$test<nint>(i0) =
let
prval () =
  owed_vt_return0(fx, x0)
prval () =
  owed_vt_return0(fy, y0) in btf
end where
{
//
val
(fx|x0) =
$UN.gasz_lget$at$raw<xs><x0>(xs, i0)
val
(fy|y0) =
$UN.gasz_lget$at$raw<ys><y0>(ys, i0)
//
val btf = z2forall$test1<x0><y0>(x0, y0)
//
}(*where*)
}(*where*)
end(*let*)//end-of-[gasz_z2forall(xs, ys)]
//
(* ****** ****** *)
#impltmp
< xs:t0 >
< x0:vt >
< ys:t0 >
< y0:vt >
gasz_rz2forall
  (xs, ys) =
let
val nx =
gasz_length<xs><x0>(xs)
val ny =
gasz_length<ys><y0>(ys)
in//let
(
nint_rforall<>
(g_min<nint>(nx, ny))) where
{
#impltmp
rforall$test<nint>(i0) =
let
prval () =
  owed_vt_return0(fx, x0)
prval () =
  owed_vt_return0(fy, y0) in btf
end where
{
//
val
(fx|x0) =
$UN.gasz_lget$at$raw<xs><x0>(xs, i0)
val
(fy|y0) =
$UN.gasz_lget$at$raw<ys><y0>(ys, i0)
//
val btf = rz2forall$test1<x0><y0>(x0, y0)
//
}(*where*)
}(*where*)
end(*let*)//end-of-[gasz_rz2forall(xs, ys)]
//
(* ****** ****** *)
(* ****** ****** *)
//
(* ****** ****** *)(* ****** ****** *)
(* ****** ****** *)(* ****** ****** *)

(* end of [ATS3/XANADU_prelude_DATS_gasz002.dats] *)

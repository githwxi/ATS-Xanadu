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
Mon 08 Jul 2024 12:53:10 PM EDT
*)
Authoremail: gmhwxiATgmailDOTcom
*)
//
(* ****** ****** *)
(* ****** ****** *)
#staload
UN = "prelude/SATS/unsafex.sats"
(* ****** ****** *)
(* ****** ****** *)
//
#impltmp
< xs:vt
, ys:vt >
< x0:vt
, y0:vt >
gseq_z2forall0
  (xs, ys) =
strm_vt_z2forall0<x0,y0>
(
gseq_strmize0<xs><x0>(xs),
gseq_strmize0<ys><y0>(ys))//end-impltmp
//
#impltmp
< xs:vt
, ys:vt >
< x0:vt
, y0:vt >
gseq_z2foritm0
  (xs, ys) =
(
let
val _ =
gseq_z2forall0
<xs,ys><x0,y0>(xs, ys) in () end
) where
{
#impltmp
z2forall0$test<x0,y0>(x0, y0) =
let
val () =
z2foritm0$work<x0,y0>(x0, y0) in true end
}
//
(* ****** ****** *)
//
#impltmp
< xs:vt
, ys:vt >
< x0:vt
, y0:vt >
gseq_iz2forall0
  (xs, ys) = b0
where {
//
var i0: ni = (0)
//
val p0 = $addr(i0)
//
val b0 =
(
gseq_z2forall0
<xs,ys><x0,y0>(xs, ys)) where
{
#impltmp
z2forall0$test
<x0,y0>(x0, y0) =
(
$UN.p2tr_set<ni>(p0, i0+1); b0)
where
{
val i0 = $UN.p2tr_get<ni>(p0)
val b0 =
  iz2forall0$test<x0,y0>(i0, x0, y0) } }
//
}(*where*)//end-of-[gseq_iz2forall0(xs,ys)]
//
#impltmp
< xs:vt
, ys:vt >
< x0:vt
, y0:vt >
gseq_iz2foritm0
  (xs, ys) =
(
let
val _ =
gseq_iz2forall0
<xs,ys><x0,y0>(xs, ys) in () end
) where
{
#impltmp
iz2forall0$test<x0,y0>(i0, x0, y0) =
let
val () =
iz2foritm0$work<x0,y0>(i0, x0, y0) in true end
}
//
(* ****** ****** *)(* ****** ****** *)(* ****** ****** *)
(* ****** ****** *)(* ****** ****** *)(* ****** ****** *)

(* end of [ATS3/XANADU_prelude_DATS_VT_gseq002_vt.dats] *)

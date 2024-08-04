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
#staload UN =
"prelude/SATS/unsfx00.sats"
(* ****** ****** *)
(* ****** ****** *)
//
#impltmp
< xs:vt >
< x0:vt >
< ys:vt >
< y0:vt >
gseq_z2forall0
  (xs, ys) =
strm_vt_z2forall0<x0><y0>
(
gseq_strmize0<xs><x0>(xs),
gseq_strmize0<ys><y0>(ys))//end-impltmp
//
#impltmp
< xs:vt >
< x0:vt >
< ys:vt >
< y0:vt >
gseq_z2forall1
  (xs, ys) =
strm_vt_z2forall0<x0><y0>
(
gseq_strmize1<xs><x0>(xs),
gseq_strmize1<ys><y0>(ys))//end-impltmp
//
(* ****** ****** *)
//
#impltmp
< xs:vt >
< x0:vt >
< ys:vt >
< y0:vt >
gseq_rz2forall0
  (xs, ys) =
strm_vt_z2forall0<x0><y0>
(
gseq_rstrmize0<xs><x0>(xs),
gseq_rstrmize0<ys><y0>(ys))//end-impltmp
//
#impltmp
< xs:vt >
< x0:vt >
< ys:vt >
< y0:vt >
gseq_rz2forall1
  (xs, ys) =
strm_vt_z2forall0<x0><y0>
(
gseq_rstrmize1<xs><x0>(xs),
gseq_rstrmize1<ys><y0>(ys))//end-impltmp
//
(* ****** ****** *)
//
#impltmp
< xs:vt >
< x0:vt >
< ys:vt >
< y0:vt >
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
<xs><x0><ys><y0>(xs, ys)) where
{
#impltmp
z2forall$test0
<x0><y0>(x0, y0) =
(
$UN.p2tr_set<ni>(p0, i0+1); b0)
where
{
val i0 = $UN.p2tr_get<ni>(p0)
val b0 =
  iz2forall$test0<x0><y0>(i0, x0, y0) } }
//
}(*where*)//end-of-[gseq_iz2forall0(xs,ys)]
//
#impltmp
< xs:vt >
< x0:vt >
< ys:vt >
< y0:vt >
gseq_iz2forall1
  (xs, ys) = b0
where {
//
var i0: ni = (0)
//
val p0 = $addr(i0)
//
val b0 =
(
gseq_z2forall1
<xs><x0><ys><y0>(xs, ys)) where
{
#impltmp
z2forall$test1
<x0><y0>(x0, y0) =
(
$UN.p2tr_set<ni>(p0, i0+1); b0)
where
{
val i0 = $UN.p2tr_get<ni>(p0)
val b0 =
  iz2forall$test1<x0><y0>(i0, x0, y0) } }
//
}(*where*)//end-of-[gseq_iz2forall1(xs,ys)]
//
(* ****** ****** *)
//
#impltmp
< xs:vt >
< x0:vt >
< ys:vt >
< y0:vt >
gseq_irz2forall0
  (xs, ys) = b0
where {
//
var i0: ni = (0)
//
val p0 = $addr(i0)
//
val b0 =
(
gseq_rz2forall0
<xs><x0><ys><y0>(xs, ys)) where
{
#impltmp
rz2forall$test0
<x0><y0>(x0, y0) =
(
$UN.p2tr_set<ni>(p0, i0+1); b0)
where
{
val i0 = $UN.p2tr_get<ni>(p0)
val b0 =
  irz2forall$test0<x0><y0>(i0, x0, y0) } }
//
}(*where*)//end-of-[gseq_irz2forall0(xs,ys)]
//
#impltmp
< xs:vt >
< x0:vt >
< ys:vt >
< y0:vt >
gseq_irz2forall1
  (xs, ys) = b0
where {
//
var i0: ni = (0)
//
val p0 = $addr(i0)
//
val b0 =
(
gseq_rz2forall1
<xs><x0><ys><y0>(xs, ys)) where
{
#impltmp
rz2forall$test1
<x0><y0>(x0, y0) =
(
$UN.p2tr_set<ni>(p0, i0+1); b0)
where
{
val i0 = $UN.p2tr_get<ni>(p0)
val b0 =
  irz2forall$test1<x0><y0>(i0, x0, y0) } }
//
}(*where*)//end-of-[gseq_irz2forall1(xs,ys)]
//
(* ****** ****** *)
(* ****** ****** *)
//
#impltmp
< xs:vt >
< x0:vt >
< ys:vt >
< y0:vt >
gseq_z2foritm0
  (xs, ys) =
(
let
val _ =
gseq_z2forall0
<xs><x0><ys><y0>(xs, ys) in () end
) where
{
#impltmp
z2forall$test0<x0><y0>(x0, y0) =
let
val () =
z2foritm$work0<x0><y0>(x0, y0) in true end
}(*where*)//end-of-[gseq_z2foritm0(xs,ys)]
//
#impltmp
< xs:vt >
< x0:vt >
< ys:vt >
< y0:vt >
gseq_z2foritm1
  (xs, ys) =
(
let
val _ =
gseq_z2forall1
<xs><x0><ys><y0>(xs, ys) in () end
) where
{
#impltmp
z2forall$test1<x0><y0>(x0, y0) =
let
val () =
z2foritm$work1<x0><y0>(x0, y0) in true end
}(*where*)//end-of-[gseq_z2foritm1(xs,ys)]
//
(* ****** ****** *)
//
#impltmp
< xs:vt >
< x0:vt >
< ys:vt >
< y0:vt >
gseq_rz2foritm0
  (xs, ys) =
(
let
val _ =
gseq_rz2forall0
<xs><x0><ys><y0>(xs, ys) in () end
) where
{
#impltmp
rz2forall$test0<x0><y0>(x0, y0) =
let
val () =
rz2foritm$work0<x0><y0>(x0, y0) in true end
}(*where*)//end-of-[gseq_rz2foritm0(xs,ys)]
//
#impltmp
< xs:vt >
< x0:vt >
< ys:vt >
< y0:vt >
gseq_rz2foritm1
  (xs, ys) =
(
let
val _ =
gseq_rz2forall1
<xs><x0><ys><y0>(xs, ys) in () end
) where
{
#impltmp
rz2forall$test1<x0><y0>(x0, y0) =
let
val () =
rz2foritm$work1<x0><y0>(x0, y0) in true end
}(*where*)//end-of-[gseq_rz2foritm1(xs,ys)]
//
(* ****** ****** *)
//
#impltmp
< xs:vt >
< x0:vt >
< ys:vt >
< y0:vt >
gseq_iz2foritm0
  (xs, ys) =
(
let
val _ =
gseq_iz2forall0
<xs><x0><ys><y0>(xs, ys) in () end
) where
{
#impltmp
iz2forall$test0<x0><y0>(i0, x0, y0) =
let
val () =
iz2foritm$work0<x0><y0>(i0, x0, y0) in true end
}(*where*)//end-of-[gseq_iz2foritm0(xs,ys)]
//
#impltmp
< xs:vt >
< x0:vt >
< ys:vt >
< y0:vt >
gseq_iz2foritm1
  (xs, ys) =
(
let
val _ =
gseq_iz2forall1
<xs><x0><ys><y0>(xs, ys) in () end
) where
{
#impltmp
iz2forall$test1<x0><y0>(i0, x0, y0) =
let
val () =
iz2foritm$work1<x0><y0>(i0, x0, y0) in true end
}(*where*)//end-of-[gseq_iz2foritm1(xs,ys)]
//
(* ****** ****** *)
//
#impltmp
< xs:vt >
< x0:vt >
< ys:vt >
< y0:vt >
gseq_irz2foritm0
  (xs, ys) =
(
let
val _ =
gseq_irz2forall0
<xs><x0><ys><y0>(xs, ys) in () end
) where
{
#impltmp
irz2forall$test0<x0><y0>(i0, x0, y0) =
let
val () =
irz2foritm$work0<x0><y0>(i0, x0, y0) in true end
}(*where*)//end-of-[gseq_irz2foritm0(xs,ys)]
//
#impltmp
< xs:vt >
< x0:vt >
< ys:vt >
< y0:vt >
gseq_irz2foritm1
  (xs, ys) =
(
let
val _ =
gseq_irz2forall1
<xs><x0><ys><y0>(xs, ys) in () end
) where
{
#impltmp
irz2forall$test1<x0><y0>(i0, x0, y0) =
let
val () =
irz2foritm$work1<x0><y0>(i0, x0, y0) in true end
}(*where*)//end-of-[gseq_irz2foritm1(xs,ys)]
//
(* ****** ****** *)
(* ****** ****** *)
//
(*
HX-2024-07-24:
Wed 24 Jul 2024 07:03:35 PM EDT
*)
//
#impltmp
< xs:vt >
< x0:vt >
< ys:vt >
< y0:vt >
< zs:vt >
< z0:vt >
gseq_z2map0_ares
  (xs, ys) =
g_make0_lstrm<z0><zs>
(
gseq_z2map0_lstrm<xs><x0><ys><y0><z0>(xs, ys))
//
#impltmp
< xs:vt >
< x0:vt >
< ys:vt >
< y0:vt >
gseq_z2map0_self
  (xs, ys) =
g_make0_lstrm<x0><xs>
(
gseq_z2map0_lstrm<xs><x0><ys><y0><x0>(xs, ys))
//
(* ****** ****** *)
(* ****** ****** *)
//
(* ****** ****** *)(* ****** ****** *)(* ****** ****** *)
(* ****** ****** *)(* ****** ****** *)(* ****** ****** *)

(* end of [ATS3/XANADU_prelude_DATS_VT_gseq002_vt.dats] *)

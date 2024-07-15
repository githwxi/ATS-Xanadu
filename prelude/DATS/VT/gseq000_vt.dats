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
< xs:vt >
< x0:vt >
gseq_sum0(xs) =
let
val r0 = g_0<x0>()
#impltmp
folditm0$fopr
<x0><x0>
(r0, x0) = g_add00<x0>(r0, x0)
in//let
gseq_folditm0<xs><x0><x0>(xs, r0)
end(*let*)//end-of-[gseq_sum0(xs)]
//
#impltmp
< xs:vt >
< x0:vt >
gseq_sum1(xs) =
let
val r0 = g_0<x0>()
#impltmp
folditm1$fopr
<x0><x0>
(r0, x0) = g_add01<x0>(r0, x0)
in//let
gseq_folditm1<xs><x0><x0>(xs, r0)
end(*let*)//end-of-[gseq_sum0(xs)]
//
(* ****** ****** *)
//
#impltmp
< xs:vt >
< x0:vt >
gseq_prod0(xs) =
let
val r0 = g_1<x0>()
#impltmp
folditm0$fopr
<x0><x0>
(r0, x0) = g_mul00<x0>(r0, x0)
in//let
gseq_folditm0<xs><x0><x0>(xs, r0)
end(*let*)//end-of-[gseq_prod0(xs)]
//
#impltmp
< xs:vt >
< x0:vt >
gseq_prod1(xs) =
let
val r0 = g_1<x0>()
#impltmp
folditm1$fopr
<x0><x0>
(r0, x0) = g_mul01<x0>(r0, x0)
in//let
gseq_folditm1<xs><x0><x0>(xs, r0)
end(*let*)//end-of-[gseq_prod1(xs)]
//
(* ****** ****** *)
(* ****** ****** *)
//
#impltmp
< xs:vt >
< x0:vt >
gseq_nilq0(xs) =
let
#impltmp
forall0$test<x0>(x0) =
(g_free<x0>(x0); false)
in//let
  gseq_forall0<xs><x0>(xs)
end(*let*)//end-of-[gseq_nilq0(xs)]
//
#impltmp
< xs:vt >
< x0:vt >
gseq_nilq1(xs) =
(
gseq_forall1<xs><x0>(xs)
) where
{
#impltmp
forall1$test<x0>(x0) = false
}(*where*)//end-of-[gseq_nilq1(xs)]
//
(* ****** ****** *)
(* ****** ****** *)
//
(*
#impltmp
< xs:vt >
< x0:vt >
gseq_length0(xs) =
strm_vt_length0<x0>
(
gseq_strmize0<xs><x0>(xs))
*)
#impltmp
< xs:vt >
< x0:vt >
gseq_length0(xs) =
let
#typedef r0 = nint
#impltmp
folditm0$fopr
<x0><r0>(r0, x0) =
(g_free<x0>(x0); r0 + 1)
in//let
  gseq_folditm0<xs><x0><r0>(xs, 0)
end(*let*)//end-of-[gseq_length0(xs)]
//
#impltmp
< xs:vt >
< x0:vt >
gseq_length1(xs) =
let
#typedef r0 = nint
#impltmp
folditm1$fopr
<x0><r0>(r0, x0) = r0 + 1
in//let
  gseq_folditm1<xs><x0><r0>(xs, 0)
end(*let*)//end-of-[gseq_length1(xs)]
//
(* ****** ****** *)
(* ****** ****** *)
//
(*
HX-2024-07-15:
Mon 15 Jul 2024 04:25:27 PM EDT
*)
//
fun
<xs:vt>
<x0:vt>
gseq_get0_at
  (xs, i0) =
let
//
var r0: x0 // x0?
val p0 = $addr(r0)
//
val b0 =
(
gseq_iforall0<xs><x0>(xs)
) where
{
#impltmp
iforall0$test
<x0>(j0, x0) =
if j0 < i0 then true else
(
$UN.p2tr_set<x0>(p0, x0); false)
}
in//let
  if not(b0)
  then $UN.p2tr_get<x0>(p0)
  else get0_at$exn<xs><x0>(xs, i0)
end//let//end-of-[gseq_get0_at(xs, i0)]
//
(* ****** ****** *)
(* ****** ****** *)
//
(* ****** ****** *)(* ****** ****** *)(* ****** ****** *)
(* ****** ****** *)(* ****** ****** *)(* ****** ****** *)

(* end of [ATS3/XANADU_prelude_DATS_VT_gseq000_vt.dats] *)

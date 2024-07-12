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
end//let//end-of-[gseq_length0(xs)]
//
(* ****** ****** *)
(* ****** ****** *)
//
#impltmp
< xs:vt >
< x0:vt >
gseq_rstrmize0
  ( xs ) =
list_vt_strmize0<x0>
(
  gseq_rlistize0<xs><x0>(xs))
#impltmp
< xs:vt >
< x0:vt >
gseq_rstrqize0
  ( xs ) =
list_vt_strqize0<x0>
(
  gseq_rlistize0<xs><x0>(xs))
//
(* ****** ****** *)
//
#impltmp
< xs:vt >
< x0:vt >
gseq_rlistize0
  ( xs ) =
(
gseq_folditm0<xs><x0><r0>(xs, r0)
) where
{
val r0 = list_vt_nil()
#vwtpdef r0 = list_vt(x0)
#impltmp
folditm0$fopr
<x0><r0>(r0, x0) = list_vt_cons(x0, r0)
}
//
#impltmp
{ x0:vt }
gseq_rlistize0
<list_vt(x0)><x0> = list_vt_reverse0<x0>
//
(* ****** ****** *)
(* ****** ****** *)
//
#impltmp
< xs:vt >
< x0:vt >
gseq_forall0
  ( xs ) =
strm_vt_forall0<x0>(gseq_strmize0<xs><x0>(xs))
//
(* ****** ****** *)
//
#impltmp
< xs:vt >
< x0:vt >
gseq_foritm0
  ( xs ) =
(
let
val _ =
gseq_forall0<xs><x0>(xs) in () end
) where
{
#impltmp
forall0$test<x0>(x0) =
let
val () = foritm0$work<x0>(x0) in true end
}
//
(* ****** ****** *)
(* ****** ****** *)
//
#impltmp
< xs:vt >
< x0:vt >
gseq_rforall0
  ( xs ) =
list_vt_forall0<x0>(gseq_rlistize0<xs><x0>(xs))
//
(* ****** ****** *)
//
#impltmp
< xs:vt >
< x0:vt >
gseq_rforitm0
  ( xs ) =
(
let
val _ =
gseq_rforall0<xs><x0>(xs) in () end
) where
{
#impltmp
rforall0$test<x0>(x0) =
let
val () = rforitm0$work<x0>(x0) in true end
}
//
(* ****** ****** *)
(* ****** ****** *)
//
#impltmp
< xs:vt >
< x0:vt >
gseq_iforall0
  ( xs ) =
strm_vt_iforall0<x0>(gseq_strmize0<xs><x0>(xs))
//
(* ****** ****** *)
//
#impltmp
< xs:vt >
< x0:vt >
gseq_iforitm0
  ( xs ) =
(
let
val _ =
gseq_iforall0<xs><x0>(xs) in () end
) where
{
#impltmp
iforall0$test<x0>(i0, x0) =
let
val () = iforitm0$work<x0>(i0, x0) in true end
}
//
(* ****** ****** *)
(* ****** ****** *)
//
#impltmp
< xs:vt >
< x0:vt >
< r0:vt >
gseq_folditm0
  (xs, r0) = r0
where {
//
var r0: r0 = r0
//
val p0 = $addr(r0)
//
val () =
(
gseq_foritm0<xs><x0>(xs)
) where
{
#impltmp
foritm0$work<x0>(x0) =
(
  $UN.p2tr_set<r0>(p0, r0))
where
{
val r0 = $UN.p2tr_get<r0>(p0)
val r0 = folditm0$fopr<x0><r0>(r0, x0)}}
//
}(*where*)//end-of-[gseq_folditm0(xs, r0)]
//
(* ****** ****** *)
//
#impltmp
< xs:vt >
< x0:vt >
< r0:vt >
gseq_foldall0
  (xs, r0) = r0
where {
//
var r0: r0 = r0
//
val p0 = $addr(r0)
//
val b0 =
(
gseq_forall0<xs><x0>(xs)
) where
{
#impltmp
forall0$test<x0>(x0) =
(
$UN.p2tr_set<r0>(p0, r0); b0)
where
{
val r0 = $UN.p2tr_get<r0>(p0)
val (b0, r0) =
(
  foldall0$fopr<x0><r0>(r0, x0)) } }
//
}(*where*)//end-of-[gseq_foldall0(xs, r0)]
//
(* ****** ****** *)
(* ****** ****** *)
//
(* ****** ****** *)(* ****** ****** *)(* ****** ****** *)
(* ****** ****** *)(* ****** ****** *)(* ****** ****** *)

(* end of [ATS3/XANADU_prelude_DATS_VT_gseq000_vt.dats] *)

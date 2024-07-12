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
//
#impltmp
< xs:t0 >
< x0:t0 >
gseq_free(xs) =
(
gseq_foritm0<xs><x0>(xs)
) where
{
#impltmp
foritm0$work<x0> = g_free<x0>
}
//
#impltmp
< xs:t0 >
< x0:t0 >
gseq_copy(xs) =
(
gseq_map1_self<xs><x0>(xs)
) where
{
#impltmp
map1$fopr<x0><x0> = g_copy<x0>
}
//
(* ****** ****** *)
(* ****** ****** *)
//
#impltmp
< xs:t0 >
< x0:t0 >
gseq_length =
gseq_length0<xs><x0>
//
(*
#impltmp
< xs:t0 >
< x0:t0 >
gseq_length(xs) =
strm_vt_length0<x0>
(
gseq_strmize<xs><x0>(xs))
*)
//
(* ****** ****** *)
(* ****** ****** *)
//
(*
#impltmp
< xs:t0 >
< x0:t0 >
gseq_forall(xs) =
strm_vt_forall0<x0>
(
gseq_strmize<xs><x0>(xs))
*)
//
#impltmp
< xs:t0 >
< x0:t0 >
gseq_forall(xs) =
let
#impltmp
forall0$test<x0>(x0) =
(
  forall$test<x0>(x0))
in//let
gseq_forall0<xs><x0>(xs)
end//end-of-[gseq_rforall]
//
(* ****** ****** *)
//
(*
(*
HX-2024-07-10:
It may be more efficient
with an array-based impl!
*)
#impltmp
< xs:t0 >
< x0:t0 >
gseq_rforall(xs) =
list_vt_forall0<x0>
(
gseq_rlistize<xs><x0>(xs))
*)
//
#impltmp
< xs:t0 >
< x0:t0 >
gseq_rforall(xs) =
let
#impltmp
rforall0$test<x0>(x0) =
(
  rforall$test<x0>(x0))
in//let
gseq_rforall0<xs><x0>(xs)
end//end-of-[gseq_rforall]
//
(* ****** ****** *)
(* ****** ****** *)
//
(*
#impltmp
< xs:t0 >
< x0:t0 >
gseq_foritm(xs) =
strm_vt_foritm0<x0>
(
gseq_strmize<xs><x0>(xs))
*)
//
#impltmp
< xs:t0 >
< x0:t0 >
gseq_foritm(xs) =
let
#impltmp
foritm0$work<x0>(x0) =
(
  foritm$work<x0>(x0))
in//let
  gseq_foritm0<xs><x0>(xs)
end//end-of-[gseq_rforitm]
//
(* ****** ****** *)
//
(*
(*
HX-2024-07-10:
It may be more efficient
with an array-based impl!
*)
#impltmp
< xs:t0 >
< x0:t0 >
gseq_rforitm(xs) =
list_vt_foritm0<x0>
(
  gseq_rlistize<xs><x0>(xs))
*)
//
#impltmp
< xs:t0 >
< x0:t0 >
gseq_rforitm(xs) =
let
#impltmp
rforitm0$work<x0>(x0) =
(
  rforitm$work<x0>(x0))
in//let
gseq_rforitm0<xs><x0>(xs)
end//end-of-[gseq_rforitm]
//
(* ****** ****** *)
(* ****** ****** *)
//
(*
#impltmp
< xs:t0 >
< x0:t0 >
< r0:vt >
gseq_folditm(xs, r0) =
strm_vt_folditm0<x0><r0>
(
gseq_strmize<xs><x0>(xs), r0)
*)
//
#impltmp
< xs:t0 >
< x0:t0 >
< r0:vt >
gseq_folditm
  (xs, r0) =
let
#impltmp
folditm0$fopr
<x0><r0>(r0, x0) =
(
folditm$fopr<x0><r0>(r0, x0))
in//let
gseq_folditm0<xs><x0><r0>(xs, r0)
end//end-of-[gseq_folditm(xs, r0)]
//
(* ****** ****** *)
//
(*
(*
HX-2024-07-10:
It may be more efficient with
an array-based implementation
*)
#impltmp
< xs:t0 >
< x0:t0 >
< r0:vt >
gseq_rfolditm(xs, r0) =
let
#impltmp
folditm$fopr
< x0><r0 >
( r0, x0 ) =
(
rfolditm$fopr<x0><r0>(x0, r0))
in//let
list_vt_folditm0<x0><r0>
(gseq_rlistize<xs><x0>(xs), r0)
end//let//end-of-[gseq_rfolditm]
*)
#impltmp
< xs:t0 >
< x0:t0 >
< r0:vt >
gseq_rfolditm
  (xs, r0) =
let
#impltmp
rfolditm0$fopr
<x0><r0>(x0, r0) =
(
rfolditm$fopr<x0><r0>(x0, r0))
in//let
gseq_rfolditm0<xs><x0><r0>(xs, r0)
end//end-of-[gseq_rfolditm(xs, r0)]
//
(* ****** ****** *)
(* ****** ****** *)
//
#impltmp
< xs:t0 >
< x0:t0 >
gseq_filter_self =
gseq_filter_ares<xs><x0><xs>
//
#impltmp
< xs:t0 >
< x0:t0 >
< ys:vt >
gseq_filter_ares
  (xs) =
g_make_lstrm<x0><ys>
(
gseq_filter_lstrm<xs><x0>(xs))
//
(* ****** ****** *)
//
#impltmp
< xs:t0 >
< x0:t0 >
gseq_filter_lstrm
  (xs) =
strm_vt_filter0<x0>(gseq_strmize<xs><x0>(xs))
//
(* ****** ****** *)
(* ****** ****** *)
//
(* ****** ****** *)(* ****** ****** *)
(* ****** ****** *)(* ****** ****** *)

(* end of [ATS3/XANADU_prelude_DATS_gseq000.dats] *)

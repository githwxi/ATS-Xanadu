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
gseq_length(xs) =
strm_vt_length0<x0>
(
gseq_strmize<xs><x0>(xs))
//
(* ****** ****** *)
(* ****** ****** *)
//
#impltmp
< xs:t0 >
< x0:t0 >
gseq_forall(xs) =
strm_vt_forall0<x0>
(gseq_strmize<xs><x0>(xs))
//
#impltmp
< xs:t0 >
< x0:t0 >
gseq_rforall(xs) =
list_vt_forall0<x0>
(gseq_rlistize<xs><x0>(xs))
//
(* ****** ****** *)
(* ****** ****** *)
//
#impltmp
< xs:t0 >
< x0:t0 >
gseq_foreach(xs) =
strm_vt_foreach0<x0>
(gseq_strmize<xs><x0>(xs))
//
#impltmp
< xs:t0 >
< x0:t0 >
gseq_rforeach(xs) =
list_vt_foreach0<x0>
(gseq_rlistize<xs><x0>(xs))
//
(* ****** ****** *)
(* ****** ****** *)
//
#impltmp
< xs:t0 >
< x0:t0 >
< r0:vt >
gseq_foldlft(xs, r0) =
strm_vt_foldlft0<x0><r0>
(gseq_strmize<xs><x0>(xs), r0)
//
#impltmp
< xs:t0 >
< x0:t0 >
< r0:vt >
gseq_rfoldlft(xs, r0) =
let
#impltmp
foldlft$fopr
< x0><r0 >
( r0, x0 ) =
(
rfoldlft$fopr<x0><r0>(x0, r0))
in//let
list_vt_foldlft0<x0><r0>
(gseq_rlistize<xs><x0>(xs), r0)
end//let
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

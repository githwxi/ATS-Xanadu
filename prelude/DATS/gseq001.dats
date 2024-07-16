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
Sat 13 Jul 2024 10:07:23 AM EDT
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
gseq_forall =
gseq_forall0<xs><x0>(*void*)
#impltmp
< xs:t0 >
< x0:t0 >
gseq_rforall =
gseq_rforall0<xs><x0>(*void*)
#impltmp
< xs:t0 >
< x0:t0 >
gseq_iforall =
gseq_iforall0<xs><x0>(*void*)
//
(* ****** ****** *)
//
#impltmp
< xs:t0 >
< x0:t0 >
gseq_foritm =
gseq_foritm0<xs><x0>(*void*)
#impltmp
< xs:t0 >
< x0:t0 >
gseq_rforitm =
gseq_rforitm0<xs><x0>(*void*)
#impltmp
< xs:t0 >
< x0:t0 >
gseq_iforitm =
gseq_iforitm0<xs><x0>(*void*)
//
(* ****** ****** *)
(* ****** ****** *)
//
#impltmp
< xs:t0 >
< x0:t0 >
< r0:vt >
gseq_foldall =
gseq_foldall0<xs><x0><r0>(*void*)
#impltmp
< xs:t0 >
< x0:t0 >
< r0:vt >
gseq_rfoldall =
gseq_rfoldall0<xs><x0><r0>(*void*)
#impltmp
< xs:t0 >
< x0:t0 >
< r0:vt >
gseq_ifoldall =
gseq_ifoldall0<xs><x0><r0>(*void*)
//
(* ****** ****** *)
//
#impltmp
< xs:t0 >
< x0:t0 >
< r0:vt >
gseq_folditm =
gseq_folditm0<xs><x0><r0>(*void*)
#impltmp
< xs:t0 >
< x0:t0 >
< r0:vt >
gseq_rfolditm =
gseq_rfolditm0<xs><x0><r0>(*void*)
#impltmp
< xs:t0 >
< x0:t0 >
< r0:vt >
gseq_ifolditm =
gseq_ifolditm0<xs><x0><r0>(*void*)
//
(* ****** ****** *)
(* ****** ****** *)
//
#impltmp
< xs:t0 >
< x0:t0 >
< ys:vt >
gseq_map_ares(xs) =
g_make0_lstrm<x0><ys>
(
gseq_map_lstrm<xs><x0>(xs))
//
#impltmp
< xs:t0 >
< x0:t0 >
gseq_map_self =
gseq_map_ares<xs><x0><xs>(*void*)
//
(* ****** ****** *)
//
#impltmp
< xs:t0 >
< x0:t0 >
< y0:t0 >
gseq_imap_list(xs) =
list_vt2t{y0}
(
gseq_imap_llist<xs><x0><y0>(xs))
//
#impltmp
< xs:t0 >
< x0:t0 >
< y0:vt >
gseq_imap_llist =
gseq_imap0_llist<xs><x0><y0>(*void*)
#impltmp
< xs:t0 >
< x0:t0 >
< y0:vt >
gseq_imap_lstrm =
gseq_imap0_lstrm<xs><x0><y0>(*void*)
#impltmp
< xs:t0 >
< x0:t0 >
< y0:vt >
gseq_imap_lstrq =
gseq_imap0_lstrq<xs><x0><y0>(*void*)
//
(* ****** ****** *)
(* ****** ****** *)
//
#impltmp
< xs:t0 >
< x0:t0 >
< ys:vt >
gseq_filter_ares
  ( xs ) =
g_make0_lstrm<x0><ys>
(
gseq_filter_lstrm<xs><x0>(xs))
//
#impltmp
< xs:t0 >
< x0:t0 >
gseq_filter_self =
gseq_filter_ares<xs><x0><xs>(*void*)
//
(* ****** ****** *)
//
#impltmp
< xs:t0 >
< x0:t0 >
gseq_filter_list
  ( xs ) =
list_vt2t{x0}
(
gseq_filter_llist<xs><x0>(xs))
//
#impltmp
< xs:t0 >
< x0:t0 >
gseq_filter_llist
  ( xs ) =
g_make0_lstrm
<x0><list_vt(x0)>
(
gseq_filter_lstrm<xs><x0>(xs))
//
(* ****** ****** *)
//
#impltmp
< xs:t0 >
< x0:t0 >
gseq_filter_lstrm =
gseq_filter0_lstrm<xs><x0>(*void*)
#impltmp
< xs:t0 >
< x0:t0 >
gseq_filter_lstrq =
gseq_filter0_lstrq<xs><x0>(*void*)
//
(* ****** ****** *)
(* ****** ****** *)
//
(*
HX-2024-07-15
Mon 15 Jul 2024 03:48:15 PM EDT
*)
//
#impltmp
< xs:t0 >
< x0:t0 >
gseq_get_at =
gseq_get1_at<xs><x0>(*void*)
#impltmp
< xs:t0 >
< x0:t0 >
gseq_get_at_opt =
gseq_get1_at_opt<xs><x0>(*void*)
//
(* ****** ****** *)
(* ****** ****** *)
//
(* ****** ****** *)(* ****** ****** *)
(* ****** ****** *)(* ****** ****** *)

(* end of [ATS3/XANADU_prelude_DATS_gseq001.dats] *)

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
gseq_iforall0
  ( xs ) =
strm_vt_iforall0<x0>
(gseq_strmize0<xs><x0>(xs))
//
#impltmp
< xs:vt >
< x0:vt >
gseq_iforitm0
  ( xs ) =
strm_vt_iforitm0<x0>
(gseq_strmize0<xs><x0>(xs))
//
(* ****** ****** *)
//
#impltmp
< xs:vt >
< x0:vt >
< r0:vt >
gseq_ifoldall0
  (xs, r0) =
strm_vt_ifoldall0<x0><r0>
(
gseq_strmize0<xs><x0>(xs), r0)
//
#impltmp
< xs:vt >
< x0:vt >
< r0:vt >
gseq_ifolditm0
  (xs, r0) =
strm_vt_ifolditm0<x0><r0>
(
gseq_strmize0<xs><x0>(xs), r0)
//
(* ****** ****** *)
(* ****** ****** *)
//
#impltmp
< xs:vt >
< x0:vt >
< y0:vt >
gseq_imap0_llist
  ( xs ) =
list_vt_imap0<x0>
(gseq_listize0<xs><x0>(xs))
//
#impltmp
< xs:vt >
< x0:vt >
< y0:vt >
gseq_imap0_lstrm
  ( xs ) =
strm_vt_imap0<x0>
(gseq_strmize0<xs><x0>(xs))
//
#impltmp
< xs:vt >
< x0:vt >
< y0:vt >
gseq_imap0_lstrq
  ( xs ) =
strq_vt_imap0<x0>
(gseq_strqize0<xs><x0>(xs))
//
(* ****** ****** *)
(* ****** ****** *)
//
#impltmp
< xs:vt >
< x0:vt >
gseq_ifilter0_lstrm
  ( xs ) =
strm_vt_ifilter0<x0>
(gseq_strmize0<xs><x0>(xs))
#impltmp
< xs:vt >
< x0:vt >
gseq_ifilter0_lstrq
  ( xs ) =
strq_vt_ifilter0<x0>
(gseq_strqize0<xs><x0>(xs))
//
(*
HX-2024-07-13:
Laziness here can prevent
the creation of an unnecessarily
long list for temporary use!
*)
#impltmp
< xs:vt >
< x0:vt >
gseq_ifilter0_llist
  ( xs ) =
strq_vt_listize0<x0>
(
gseq_ifilter0_lstrq<xs><x0>(xs))
//
(* ****** ****** *)
(* ****** ****** *)
//
(* ****** ****** *)(* ****** ****** *)(* ****** ****** *)
(* ****** ****** *)(* ****** ****** *)(* ****** ****** *)

(* end of [ATS3/XANADU_prelude_DATS_VT_gseq002_vt.dats] *)

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
Sat 13 Jul 2024 09:24:55 AM EDT
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
fun
<xs:t0>
<x0:t0>
gseq_listize
  (xs: xs): list_vt(x0)
fun
<xs:t0>
<x0:t0>
gseq_strmize
  (xs: xs): strm_vt(x0)
fun
<xs:t0>
<x0:t0>
gseq_strqize
  (xs: xs): strq_vt(x0)
//
(* ****** ****** *)
//
fun
<xs:t0>
<x0:t0>
gseq_rlistize
  (xs: xs): list_vt(x0)
fun
<xs:t0>
<x0:t0>
gseq_rstrmize
  (xs: xs): strm_vt(x0)
fun
<xs:t0>
<x0:t0>
gseq_rstrqize
  (xs: xs): strq_vt(x0)
//
(* ****** ****** *)
//
fun
<xs:t0>
<x0:t0>
gseq_ilistize
  (xs: xs): ilist_vt(x0)
fun
<xs:t0>
<x0:t0>
gseq_istrmize
  (xs: xs): istrm_vt(x0)
fun
<xs:t0>
<x0:t0>
gseq_istrqize
  (xs: xs): istrq_vt(x0)
//
(* ****** ****** *)
(* ****** ****** *)
//
(*
HX: for [gs_forall]
*)
fun
<xs:t0>
g_forall(xs: xs): bool
(*
HX: for [gs_exists]
*)
fun
<xs:t0>
g_exists(xs: xs): bool
//
fun
<xs:t0>
<x0:t0>
gseq_forall(xs: xs): bool
fun
<xs:t0>
<x0:t0>
gseq_exists(xs: xs): bool
fun
<xs:t0>
<x0:t0>
gseq_rforall(xs: xs): bool
fun
<xs:t0>
<x0:t0>
gseq_iforall(xs: xs): bool
fun
<xs:t0>
<x0:t0>
gseq_irforall(xs: xs): bool
//
(*
#symload forall with gseq_forall of 0100
#symload rforall with gseq_rforall of 0100
#symload iforall with gseq_iforall of 0100
#symload irforall with gseq_irforall of 0100
*)
//
fun
<xs:t0>
<x0:t0>
gseq_forall_c1fr
(xs: xs, test: (x0)-<cfr>bool): bool
fun
<xs:t0>
<x0:t0>
gseq_forall_f1np
(xs: xs, test: (x0)-<fnp>bool): bool
//
#symload forall with gseq_forall_c1fr of 0100
#symload forall_cfr with gseq_forall_c1fr of 0100
#symload forall_fnp with gseq_forall_f1np of 0100
//
(* ****** ****** *)
(* ****** ****** *)
//
fun
<xs:t0>
<x0:t0>
gseq_exists_c1fr
(xs: xs, test: (x0)-<cfr>bool): bool
fun
<xs:t0>
<x0:t0>
gseq_exists_f1np
(xs: xs, test: (x0)-<fnp>bool): bool
//
#symload exists with gseq_exists_c1fr of 0100
#symload exists_cfr with gseq_exists_c1fr of 0100
#symload exists_fnp with gseq_exists_f1np of 0100
//
(* ****** ****** *)
(* ****** ****** *)
//
(*
HX: for [gs_foritm]
*)
fun
<xs:t0>
g_foritm(xs: xs): void
//
fun
<xs:t0>
<x0:t0>
gseq_foritm(xs: xs): void
fun
<xs:t0>
<x0:t0>
gseq_rforitm(xs: xs): void
fun
<xs:t0>
<x0:t0>
gseq_iforitm(xs: xs): void
fun
<xs:t0>
<x0:t0>
gseq_irforitm(xs: xs): void
//
(*
#symload foritm with gseq_foritm of 0100
#symload rforitm with gseq_rforitm of 0100
#symload iforitm with gseq_iforitm of 0100
#symload irforitm with gseq_irforitm of 0100
*)
//
fun
<xs:t0>
<x0:t0>
gseq_foritm_c1fr
(xs: xs, work: (x0)-<cfr>void): void
fun
<xs:t0>
<x0:t0>
gseq_foritm_f1np
(xs: xs, work: (x0)-<fnp>void): void
//
#symload foritm with gseq_foritm_c1fr of 0100
#symload foritm_cfr with gseq_foritm_c1fr of 0100
#symload foritm_fnp with gseq_foritm_f1np of 0100
//
fun
<xs:t0>
<x0:t0>
gseq_rforitm_c1fr
(xs: xs, work: (x0)-<cfr>void): void
fun
<xs:t0>
<x0:t0>
gseq_rforitm_f1np
(xs: xs, work: (x0)-<fnp>void): void
//
#symload rforitm with gseq_rforitm_c1fr of 0100
#symload rforitm_cfr with gseq_rforitm_c1fr of 0100
#symload rforitm_fnp with gseq_rforitm_f1np of 0100
//
(* ****** ****** *)
(* ****** ****** *)
//
fun
<xs:t0>
<x0:t0>
<r0:vt>
gseq_folditm(xs, r0): ( r0 )
fun
<xs:t0>
<x0:t0>
<r0:vt>
gseq_rfolditm(xs, r0): ( r0 )
fun
<xs:t0>
<x0:t0>
<r0:vt>
gseq_ifolditm(xs, r0): ( r0 )
fun
<xs:t0>
<x0:t0>
<r0:vt>
gseq_irfolditm(xs, r0): ( r0 )
//
(*
#symload folditm with gseq_folditm of 0100
#symload rfolditm with gseq_rfolditm of 0100
#symload ifolditm with gseq_ifolditm of 0100
#symload irfolditm with gseq_irfolditm of 0100
*)
//
fun
<xs:t0>
<x0:t0>
<r0:vt>
gseq_folditm_c2fr
( xs: xs
, r0: r0, fopr: (r0, x0)-<cfr>(r0)): (r0)
fun
<xs:t0>
<x0:t0>
<r0:vt>
gseq_folditm_f2np
( xs: xs
, r0: r0, fopr: (r0, x0)-<fnp>(r0)): (r0)
//
#symload folditm with gseq_folditm_c2fr of 0100
#symload folditm_cfr with gseq_folditm_c2fr of 0100
#symload folditm_fnp with gseq_folditm_f2np of 0100
//
(* ****** ****** *)
//
fun
<xs:t0>
<x0:t0>
<r0:vt>
gseq_foldall(xs, r0): ( r0 )
fun
<xs:t0>
<x0:t0>
<r0:vt>
gseq_rfoldall(xs, r0): ( r0 )
fun
<xs:t0>
<x0:t0>
<r0:vt>
gseq_ifoldall(xs, r0): ( r0 )
fun
<xs:t0>
<x0:t0>
<r0:vt>
gseq_irfoldall(xs, r0): ( r0 )
//
(* ****** ****** *)
(* ****** ****** *)
//
fun
<xs:t0>
<x0:t0>
<ys:vt>
<y0:vt>
gseq_map_ares(xs: xs): (ys)
fun
<xs:t0>
<x0:t0>
gseq_map_self(xs: xs): (xs)
//
(*
#symload map with gseq_map_ares of 0100
#symload map with gseq_map_self of 0110
*)
//
fun
<xs:t0>
<x0:t0>
<ys:vt>
<y0:vt>
gseq_map_ares_c1fr
(xs: xs, fopr: (x0)-<cfr>(y0)): (ys)
fun
<xs:t0>
<x0:t0>
<ys:vt>
<y0:vt>
gseq_map_ares_f1np
(xs: xs, fopr: (x0)-<cfr>(y0)): (ys)
//
#symload map with gseq_map_ares_c1fr of 0100
#symload map_cfr with gseq_map_ares_c1fr of 0100
#symload map_fnp with gseq_map_ares_c1fr of 0100
//
fun
<xs:t0>
<x0:t0>
gseq_map_self_c1fr
(xs: xs, fopr: (x0)-<cfr>(x0)): (xs)
fun
<xs:t0>
<x0:t0>
gseq_map_self_f1np
(xs: xs, fopr: (x0)-<cfr>(x0)): (xs)
//
#symload map with gseq_map_self_c1fr of 0110
#symload map_cfr with gseq_map_self_c1fr of 0110
#symload map_fnp with gseq_map_self_c1fr of 0110
//
(* ****** ****** *)
//
fun
<xs:t0>
<x0:t0>
<y0:t0>
gseq_map_list(xs: xs): list(y0)
fun
<xs:t0>
<x0:t0>
<y0:vt>
gseq_map_llist(xs: xs): list_vt(y0)
fun
<xs:t0>
<x0:t0>
<y0:vt>
gseq_map_lstrm(xs: xs): strm_vt(y0)
fun
<xs:t0>
<x0:t0>
<y0:vt>
gseq_map_lstrq(xs: xs): strq_vt(y0)
//
(*
#symload map_list with gseq_map_list of 0100
#symload map_llist with gseq_map_llist of 0100
#symload map_lstrm with gseq_map_lstrm of 0100
#symload map_lstrq with gseq_map_lstrq of 0100
*)
//
fun
<xs:t0>
<x0:t0>
<y0:t0>
gseq_map_list_c1fr
(xs: xs, fopr: (x0)-<cfr>(y0)): list(y0)
//
#symload map_list with gseq_map_list_c1fr of 0100
//
fun
<xs:t0>
<x0:t0>
<y0:vt>
gseq_map_llist_c1fr
(xs: xs, fopr: (x0)-<cfr>(y0)): list_vt(y0)
//
#symload map_llist with gseq_map_llist_c1fr of 0100
//
(* ****** ****** *)
//
fun
<xs:t0>
<x0:t0>
<y0:t0>
gseq_map_rlist(xs: xs): list(y0)
fun
<xs:t0>
<x0:t0>
<y0:vt>
gseq_map_rllist(xs: xs): list_vt(y0)
//
fun
<xs:t0>
<x0:t0>
<y0:t0>
gseq_map_rlist_c1fr
(xs: xs, fopr: (x0)-<cfr>(y0)): list(y0)
//
#symload map_rlist with gseq_map_rlist_c1fr of 0100
//
fun
<xs:t0>
<x0:t0>
<y0:vt>
gseq_map_rllist_c1fr
(xs: xs, fopr: (x0)-<cfr>(y0)): list_vt(y0)
//
#symload map_rllist with gseq_map_rllist_c1fr of 0100
//
(* ****** ****** *)
(* ****** ****** *)
//
fun
<xs:t0>
<x0:t0>
<ys:vt>
<y0:vt>
gseq_rmap_ares(xs: xs): (ys)
fun
<xs:t0>
<x0:t0>
gseq_rmap_self(xs: xs): (xs)
//
(* ****** ****** *)
//
fun
<xs:t0>
<x0:t0>
<y0:t0>
gseq_rmap_list(xs: xs): list(y0)
fun
<xs:t0>
<x0:t0>
<y0:vt>
gseq_rmap_llist(xs: xs): list_vt(y0)
//
fun
<xs:t0>
<x0:t0>
<y0:vt>
gseq_rmap_lstrm(xs: xs): strm_vt(y0)
fun
<xs:t0>
<x0:t0>
<y0:vt>
gseq_rmap_lstrq(xs: xs): strq_vt(y0)
//
(* ****** ****** *)
//
fun
<xs:t0>
<x0:t0>
<y0:t0>
gseq_rmap_rlist(xs: xs): list(y0)
fun
<xs:t0>
<x0:t0>
<y0:vt>
gseq_rmap_rllist(xs: xs): list_vt(y0)
//
(* ****** ****** *)
(* ****** ****** *)
//
fun
<xs:t0>
<x0:t0>
<ys:vt>
<y0:vt>
gseq_imap_ares(xs: xs): (ys)
fun
<xs:t0>
<x0:t0>
gseq_imap_self(xs: xs): (xs)
//
(* ****** ****** *)
//
fun
<xs:t0>
<x0:t0>
<y0:t0>
gseq_imap_list(xs: xs): list(y0)
fun
<xs:t0>
<x0:t0>
<y0:vt>
gseq_imap_llist(xs: xs): list_vt(y0)
//
fun
<xs:t0>
<x0:t0>
<y0:vt>
gseq_imap_lstrm(xs: xs): strm_vt(y0)
fun
<xs:t0>
<x0:t0>
<y0:vt>
gseq_imap_lstrq(xs: xs): strq_vt(y0)
//
(* ****** ****** *)
//
fun
<xs:t0>
<x0:t0>
<y0:t0>
gseq_imap_rlist(xs: xs): list(y0)
fun
<xs:t0>
<x0:t0>
<y0:vt>
gseq_imap_rllist(xs: xs): list_vt(y0)
//
(* ****** ****** *)
(* ****** ****** *)
//
(*
HX-2024-07-28:
Sun 28 Jul 2024 05:41:08 PM EDT
*)
//
fun
<xs:t0>
<x0:t0>
<ys:vt>
<y0:vt>
gseq_irmap_ares(xs: xs): (ys)
fun
<xs:t0>
<x0:t0>
gseq_irmap_self(xs: xs): (xs)
//
(* ****** ****** *)
//
fun
<xs:t0>
<x0:t0>
<y0:t0>
gseq_irmap_list(xs: xs): list(y0)
fun
<xs:t0>
<x0:t0>
<y0:vt>
gseq_irmap_llist(xs: xs): list_vt(y0)
//
fun
<xs:t0>
<x0:t0>
<y0:vt>
gseq_irmap_lstrm(xs: xs): strm_vt(y0)
fun
<xs:t0>
<x0:t0>
<y0:vt>
gseq_irmap_lstrq(xs: xs): strq_vt(y0)
//
(* ****** ****** *)
//
fun
<xs:t0>
<x0:t0>
<y0:t0>
gseq_irmap_rlist(xs: xs): list(y0)
fun
<xs:t0>
<x0:t0>
<y0:vt>
gseq_irmap_rllist(xs: xs): list_vt(y0)
//
(* ****** ****** *)
(* ****** ****** *)
//
fun
<xs:t0>
<x0:t0>
<ys:vt>
gseq_filter_ares(xs: xs): (ys)
fun
<xs:t0>
<x0:t0>
gseq_filter_self(xs: xs): (xs)
//
(* ****** ****** *)
//
fun
<xs:t0>
<x0:t0>
gseq_filter_list(xs: xs): list(x0)
fun
<xs:t0>
<x0:t0>
gseq_filter_llist(xs: xs): list_vt(x0)
//
fun
<xs:t0>
<x0:t0>
gseq_filter_lstrm(xs: xs): strm_vt(x0)
fun
<xs:t0>
<x0:t0>
gseq_filter_lstrq(xs: xs): strq_vt(x0)
//
(* ****** ****** *)
//
fun
<xs:t0>
<x0:t0>
gseq_filter_rlist(xs: xs): list(x0)
fun
<xs:t0>
<x0:t0>
gseq_filter_rllist(xs: xs): list_vt(x0)
//
(* ****** ****** *)
(* ****** ****** *)
//
(* ****** ****** *)(* ****** ****** *)
(* ****** ****** *)(* ****** ****** *)

(* end of [ATS3/XANADU_prelude_SATS_gseq001.sats] *)

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
HX: for [gs_exists]
HX: for [gs_iforall]
HX: for [gs_iexists]
*)
fun
<xs:t0>
g_forall(xs: xs): bool
fun
<xs:t0>
g_exists(xs: xs): bool
fun
<xs:t0>
g_iforall(xs: xs): bool
fun
<xs:t0>
g_iexists(xs: xs): bool
//
(* ****** ****** *)
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
gseq_rexists(xs: xs): bool
fun
<xs:t0>
<x0:t0>
gseq_iforall(xs: xs): bool
fun
<xs:t0>
<x0:t0>
gseq_iexists(xs: xs): bool
fun
<xs:t0>
<x0:t0>
gseq_irforall(xs: xs): bool
fun
<xs:t0>
<x0:t0>
gseq_irexists(xs: xs): bool
//
(*
#symload forall with gseq_forall of 0100
#symload exists with gseq_exists of 0100
#symload rforall with gseq_rforall of 0100
#symload rexists with gseq_rexists of 0100
#symload iforall with gseq_iforall of 0100
#symload iexists with gseq_iexists of 0100
#symload irforall with gseq_irforall of 0100
#symload irexists with gseq_irexists of 0100
*)
//
(* ****** ****** *)
//
fun
<xs:t0>
<x0:t0>
gseq_forall$f1un
(xs: xs, test: (x0)->bool): bool
//
#symload forall with gseq_forall$f1un of 0100
#symload forall$fun with gseq_forall$f1un of 0100
//
(* ****** ****** *)
//
fun
<xs:t0>
<x0:t0>
gseq_exists$f1un
(xs: xs, test: (x0)->bool): bool
//
#symload exists with gseq_exists$f1un of 0100
#symload exists$fun with gseq_exists$f1un of 0100
//
(* ****** ****** *)
//
fun
<xs:t0>
<x0:t0>
gseq_rforall$f1un
(xs: xs, test: (x0)->bool): bool
//
#symload rforall with gseq_rforall$f1un of 0100
#symload rforall$fun with gseq_rforall$f1un of 0100
//
(* ****** ****** *)
//
fun
<xs:t0>
<x0:t0>
gseq_rexists$f1un
(xs: xs, test: (x0)->bool): bool
//
#symload rexists with gseq_rexists$f1un of 0100
#symload rexists$fun with gseq_rexists$f1un of 0100
//
(* ****** ****** *)
//
fun
<xs:t0>
<x0:t0>
gseq_iforall$f2un
(xs: xs, test: (ni, x0)->bool): bool
//
#symload iforall with gseq_iforall$f2un of 0100
#symload iforall$fun with gseq_iforall$f2un of 0100
//
(* ****** ****** *)
//
fun
<xs:t0>
<x0:t0>
gseq_iexists$f2un
(xs: xs, test: (ni, x0)->bool): bool
//
#symload iexists with gseq_iexists$f2un of 0100
#symload iexists$fun with gseq_iexists$f2un of 0100
//
(* ****** ****** *)
//
fun
<xs:t0>
<x0:t0>
gseq_irforall$f2un
(xs: xs, test: (ni, x0)->bool): bool
//
#symload irforall with gseq_irforall$f2un of 0100
#symload irforall$fun with gseq_irforall$f2un of 0100
//
(* ****** ****** *)
//
fun
<xs:t0>
<x0:t0>
gseq_irexists$f2un
(xs: xs, test: (ni, x0)->bool): bool
//
#symload irexists with gseq_irexists$f2un of 0100
#symload irexists$fun with gseq_irexists$f2un of 0100
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
fun
<xs:t0>
g_iforitm(xs: xs): void
//
(* ****** ****** *)
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
gseq_foritm$f1un
(xs: xs, work: (x0)->void): void
//
#symload foritm with gseq_foritm$f1un of 0100
#symload foritm$fun with gseq_foritm$f1un of 0100
//
fun
<xs:t0>
<x0:t0>
gseq_rforitm$f1un
(xs: xs, work: (x0)->void): void
//
#symload rforitm with gseq_rforitm$f1un of 0100
#symload rforitm$fun with gseq_rforitm$f1un of 0100
//
fun
<xs:t0>
<x0:t0>
gseq_iforitm$f2un
(xs: xs, work: (ni, x0)->void): void
//
#symload iforitm with gseq_iforitm$f2un of 0100
#symload iforitm$fun with gseq_iforitm$f2un of 0100
//
(* ****** ****** *)
//
fun
<xs:t0>
<x0:t0>
gseq_irforitm$f2un
(xs: xs, work: (ni, x0)->void): void
//
#symload irforitm with gseq_irforitm$f2un of 0100
#symload irforitm$fun with gseq_irforitm$f2un of 0100
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
gseq_folditm$f2un
( xs: xs
, r0: r0, fopr: (r0, x0)->(r0)): (r0)
//
#symload folditm with gseq_folditm$f2un of 0100
#symload folditm$fun with gseq_folditm$f2un of 0100
//
fun
<xs:t0>
<x0:t0>
<r0:vt>
gseq_rfolditm$f2un
( xs: xs
, r0: r0, fopr: (x0, r0)->(r0)): (r0)
//
#symload rfolditm with gseq_rfolditm$f2un of 0100
#symload rfolditm$fun with gseq_rfolditm$f2un of 0100
//
fun
<xs:t0>
<x0:t0>
<r0:vt>
gseq_ifolditm$f3un
( xs: xs
, r0: r0, fopr: (r0,ni,x0)->(r0)): (r0)
//
#symload ifolditm with gseq_ifolditm$f3un of 0100
#symload ifolditm$fun with gseq_ifolditm$f3un of 0100
//
fun
<xs:t0>
<x0:t0>
<r0:vt>
gseq_irfolditm$f3un
( xs: xs
, r0: r0, fopr: (r0,ni,x0)->(r0)): (r0)
//
#symload irfolditm with gseq_irfolditm$f3un of 0100
#symload irfolditm$fun with gseq_irfolditm$f3un of 0100
//
(* ****** ****** *)
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
(*
#symload foldall with gseq_foldall of 0100
#symload rfoldall with gseq_rfoldall of 0100
#symload ifoldall with gseq_ifoldall of 0100
#symload irfoldall with gseq_irfoldall of 0100
*)
//
fun
<xs:t0>
<x0:t0>
<r0:vt>
gseq_foldall$f2un
( xs: xs
, r0: r0
, fopr: (r0, x0)->(bool, r0)): ( r0 )
//
#symload foldall with gseq_foldall$f2un of 0100
#symload foldall$fun with gseq_foldall$f2un of 0100
//
fun
<xs:t0>
<x0:t0>
<r0:vt>
gseq_rfoldall$f2un
( xs: xs
, r0: r0
, fopr: (r0, x0)->(bool, r0)): ( r0 )
//
#symload rfoldall with gseq_rfoldall$f2un of 0100
#symload rfoldall$fun with gseq_rfoldall$f2un of 0100
//
fun
<xs:t0>
<x0:t0>
<r0:vt>
gseq_ifoldall$f3un
( xs: xs
, r0: r0, fopr: (r0,ni,x0)->(r0)): (r0)
//
#symload ifoldall with gseq_ifoldall$f3un of 0100
#symload ifoldall$fun with gseq_ifoldall$f3un of 0100
//
fun
<xs:t0>
<x0:t0>
<r0:vt>
gseq_irfoldall$f3un
( xs: xs
, r0: r0, fopr: (r0,ni,x0)->(r0)): (r0)
//
#symload irfoldall with gseq_irfoldall$f3un of 0100
#symload irfoldall$fun with gseq_irfoldall$f3un of 0100
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
gseq_map$f1un_ares
(xs: xs, fopr: (x0)->(y0)): (ys)
//
#symload map$fun with gseq_map$f1un_ares of 0100
//
fun
<xs:t0>
<x0:t0>
gseq_map$f1un_self
(xs: xs, fopr: (x0)->(x0)): (xs)
//
#symload map$fun with gseq_map$f1un_self of 0110
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
gseq_map$f1un_list
(xs: xs, fopr: (x0)->(y0)): list(y0)
#symload map_list with gseq_map$f1un_list of 0100
//
fun
<xs:t0>
<x0:t0>
<y0:vt>
gseq_map$f1un_llist
(xs: xs, fopr: (x0)->(y0)): list_vt(y0)
#symload map_llist with gseq_map$f1un_llist of 0100
//
fun
<xs:t0>
<x0:t0>
<y0:vt>
gseq_map$f1un_lstrm
(xs: xs, fopr: (x0)->(y0)): strm_vt(y0)
fun
<xs:t0>
<x0:t0>
<y0:vt>
gseq_map$f1un_lstrq
(xs: xs, fopr: (x0)->(y0)): strq_vt(y0)
//
#symload map_lstrm with gseq_map$f1un_lstrm of 0100
#symload map_lstrq with gseq_map$f1un_lstrq of 0100
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
gseq_map$f1un_rlist
(xs: xs, fopr: (x0)->(y0)): list(y0)
//
#symload map_rlist with gseq_map$f1un_rlist of 0100
//
fun
<xs:t0>
<x0:t0>
<y0:vt>
gseq_map$f1un_rllist
(xs: xs, fopr: (x0)->(y0)): list_vt(y0)
//
#symload map_rllist with gseq_map$f1un_rllist of 0100
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
fun
<xs:t0>
<x0:t0>
<y0:vt>
gseq_rmap$f1un_llist
(xs: xs, fopr: (x0)->(y0)): list_vt(y0)
//
#symload rmap_llist with gseq_rmap$f1un_llist of 0100
//
fun
<xs:t0>
<x0:t0>
<y0:vt>
gseq_rmap$f1un_lstrm
(xs: xs, fopr: (x0)->(y0)): strm_vt(y0)
fun
<xs:t0>
<x0:t0>
<y0:vt>
gseq_rmap$f1un_lstrq
(xs: xs, fopr: (x0)->(y0)): strq_vt(y0)
//
#symload rmap_lstrm with gseq_rmap$f1un_lstrm of 0100
#symload rmap_lstrq with gseq_rmap$f1un_lstrq of 0100
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
fun
<xs:t0>
<x0:t0>
<y0:t0>
gseq_rmap$f1un_rlist
(xs: xs, fopr: (x0)->(y0)): list(y0)
//
#symload rmap_rlist with gseq_rmap$f1un_rlist of 0100
//
fun
<xs:t0>
<x0:t0>
<y0:vt>
gseq_rmap$f1un_rllist
(xs: xs, fopr: (x0)->(y0)): list_vt(y0)
//
#symload rmap_rllist with gseq_rmap$f1un_rllist of 0100
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
fun
<xs:t0>
<x0:t0>
<y0:vt>
gseq_imap$f2un_llist
(xs: xs, fopr: (ni, x0)->(y0)): list_vt(y0)
//
#symload imap_llist with gseq_imap$f2un_llist of 0100
//
fun
<xs:t0>
<x0:t0>
<y0:vt>
gseq_imap$f2un_lstrm
(xs: xs, fopr: (ni, x0)->(y0)): strm_vt(y0)
fun
<xs:t0>
<x0:t0>
<y0:vt>
gseq_imap$f2un_lstrq
(xs: xs, fopr: (ni, x0)->(y0)): strq_vt(y0)
//
#symload imap_lstrm with gseq_imap$f2un_lstrm of 0100
#symload imap_lstrq with gseq_imap$f2un_lstrq of 0100
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
fun
<xs:t0>
<x0:t0>
<y0:t0>
gseq_imap$f2un_rlist
(xs: xs, fopr: (ni, x0)->(y0)): list(y0)
//
#symload imap_rlist with gseq_imap$f2un_rlist of 0100
//
fun
<xs:t0>
<x0:t0>
<y0:vt>
gseq_imap$f2un_rllist
(xs: xs, fopr: (ni, x0)->(y0)): list_vt(y0)
//
#symload imap_rllist with gseq_imap$f2un_rllist of 0100
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
fun
<xs:t0>
<x0:t0>
<y0:vt>
gseq_irmap$f2un_llist
(xs: xs, fopr: (ni, x0)->(y0)): list_vt(y0)
//
#symload irmap_llist with gseq_irmap$f2un_llist of 0100
//
fun
<xs:t0>
<x0:t0>
<y0:vt>
gseq_irmap$f2un_lstrm
(xs: xs, fopr: (ni, x0)->(y0)): strm_vt(y0)
fun
<xs:t0>
<x0:t0>
<y0:vt>
gseq_irmap$f2un_lstrq
(xs: xs, fopr: (ni, x0)->(y0)): strm_vt(y0)
//
#symload irmap_lstrm with gseq_irmap$f2un_lstrm of 0100
#symload irmap_lstrq with gseq_irmap$f2un_lstrq of 0100
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
fun
<xs:t0>
<x0:t0>
<y0:t0>
gseq_irmap$f2un_rlist
(xs: xs, fopr: (ni, x0)->(y0)): list(y0)
//
#symload irmap_rlist with gseq_irmap$f2un_rlist of 0100
//
fun
<xs:t0>
<x0:t0>
<y0:vt>
gseq_irmap$f2un_rllist
(xs: xs, fopr: (ni, x0)->(y0)): list_vt(y0)
//
#symload irmap_rllist with gseq_irmap$f2un_rllist of 0100
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
fun
<xs:t0>
<x0:t0>
gseq_filter$f1un_list
(xs: xs, fopr: (x0)->bool): list(x0)
//
#symload filter_list with gseq_filter$f1un_list of 0100
//
fun
<xs:t0>
<x0:t0>
gseq_filter$f1un_lstrm
(xs: xs, fopr: (x0)->bool): strm_vt(x0)
fun
<xs:t0>
<x0:t0>
gseq_filter$f1un_lstrq
(xs: xs, fopr: (x0)->bool): strq_vt(x0)
//
#symload filter_lstrm with gseq_filter$f1un_lstrm of 0100
#symload filter_lstrq with gseq_filter$f1un_lstrq of 0100
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
fun
<xs:t0>
<x0:t0>
gseq_filter$f1un_rlist
(xs: xs, fopr: (x0)->bool): list(x0)
#symload filter_rlist with gseq_filter$f1un_rlist of 0100
//
fun
<xs:t0>
<x0:t0>
gseq_filter$f1un_rllist
(xs: xs, fopr: (x0)->bool): list_vt(x0)
#symload filter_rllist with gseq_filter$f1un_rllist of 0100
//
(* ****** ****** *)
(* ****** ****** *)
//
(*
HX-2024-08-17:
Sat 17 Aug 2024 11:35:35 AM EDT
*)
//
fun
<xs:t0>
<x0:t0>
<y0:vt>
gseq_map$listize
(xs: xs): list_vt(y0) //HX: [map_llist]
//
fun
<xs:t0>
<x0:t0>
<y0:vt>
gseq_map$strmize
(xs: xs): strm_vt(y0) //HX: [map_lstrm]
fun
<xs:t0>
<x0:t0>
<y0:vt>
gseq_map$strqize
(xs: xs): strq_vt(y0) //HX: [map_lstrq]
//
(* ****** ****** *)
(* ****** ****** *)
//
(*
HX-2024-08-16:
Fri 16 Aug 2024 08:33:31 AM EDT
*)
//
fun
<xs:t0>
<x0:t0>
<y0:vt>
// HX: this one composes [map] with
gseq_map$forall(xs: xs): bool // [forall]
fun
<xs:t0>
<x0:t0>
<y0:vt>
// HX: this one composes
gseq_map$forall$f1un // [map] with
(xs: xs, fopr: (x0)->y0): bool // [forall]
//
fun
<xs:t0>
<x0:t0>
<y0:vt>
// HX: this one composes [imap] with
gseq_imap$iforall(xs: xs): bool // [iforall]
fun
<xs:t0>
<x0:t0>
<y0:vt>
// HX: this one composes
gseq_imap$iforall$f2un // [imap] with
(xs: xs, fopr: (ni,x0)->y0): bool // [iforall]
//
(* ****** ****** *)
(* ****** ****** *)
//
(*
//
HX-2024-08-17:
For instance,
a typical use of
gseq_uncons$forall:
//
#impltmp
< x0:t0 >
list_forall =
gseq_uncons$forall<list(x0)><x0>
//
*)
fun
<xs:t0>
<x0:t0> // HX: this one is forall cond.
gseq_uncons$forall(xs: xs): bool // on uncons
//
(* ****** ****** *)
//
(*
//
HX-2024-08-17:
For instance,
a typical use of
gseq_uncons$strmize:
//
#impltmp
< x0:t0 >
list_strmize =
gseq_uncons$strmize<list(x0)><x0>
//
*)
fun
<xs:t0>
<x0:t0> // HX: this one is strmize cond. on
gseq_uncons$strmize(xs: xs): strm_vt(x0)//uncons
fun
<xs:t0>
<x0:t0> // HX: this one is strqize cond. on
gseq_uncons$strqize(xs: xs): strq_vt(x0)//uncons
//
(* ****** ****** *)
(* ****** ****** *)
//
fun
<xs:t0>
<x0:t0>
gseq_fmake_fwork(fwork: ((x0)->void)->void): xs
//
(* ****** ****** *)
(* ****** ****** *)
//
(* ****** ****** *)(* ****** ****** *)
(* ****** ****** *)(* ****** ****** *)

(* end of [ATS3/XANADU_prelude_SATS_gseq001.sats] *)

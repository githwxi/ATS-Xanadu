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
< ys:vt >
< y0:vt >
gseq_map_ares(xs) =
g_make0_lstrm<y0><ys>
(
gseq_map_lstrm<xs><x0><y0>(xs))
//
#impltmp
< xs:t0 >
< x0:t0 >
gseq_map_self(xs) =
g_make0_lstrm<x0><xs>
(
gseq_map_lstrm<xs><x0><x0>(xs))
//
(* ****** ****** *)
//
#impltmp
< xs:t0 >
< x0:t0 >
< ys:vt >
< y0:vt >
gseq_map_ares_c1fr
  (xs, fopr) =
(
gseq_map_ares
<xs><x0>
<ys><y0>( xs )) where
{
#impltmp
map$fopr<x0><y0>(x0) = fopr(x0)
}
//
#impltmp
< xs:t0 >
< x0:t0 >
< ys:vt >
< y0:vt >
gseq_map_ares_f1np
  (xs, fopr) =
(
gseq_map_ares
<xs><x0>
<ys><y0>( xs )) where
{
#impltmp
map$fopr<x0><y0>(x0) = fopr(x0)
}
//
(* ****** ****** *)
//
#impltmp
< xs:t0 >
< x0:t0 >
gseq_map_self_c1fr
  (xs, fopr) =
(
gseq_map_self
<xs><x0>( xs )) where
{
#impltmp
map$fopr<x0><x0>(x0) = fopr(x0)
}
//
#impltmp
< xs:t0 >
< x0:t0 >
gseq_map_self_f1np
  (xs, fopr) =
(
gseq_map_self
<xs><x0>( xs )) where
{
#impltmp
map$fopr<x0><x0>(x0) = fopr(x0)
}
//
(* ****** ****** *)
(* ****** ****** *)
//
#impltmp
< xs:t0 >
< x0:t0 >
< y0:t0 >
gseq_map_list(xs) =
list_vt2t{y0}
(
gseq_map_llist<xs><x0><y0>(xs))
//
#impltmp
< xs:t0 >
< x0:t0 >
< y0:vt >
gseq_map_llist(xs) =
(
gseq_map0_llist<xs><x0><y0>(xs)
) where
{
#impltmp
map$fopr0<x0><y0> = map$fopr<x0><y0>
}
//
#impltmp
< xs:t0 >
< x0:t0 >
< y0:vt >
gseq_map_lstrm(xs) =
(
gseq_map0_lstrm<xs><x0><y0>(xs)
) where
{
#impltmp
map$fopr0<x0><y0> = map$fopr<x0><y0>
}
//
#impltmp
< xs:t0 >
< x0:t0 >
< y0:vt >
gseq_map_lstrq(xs) =
(
gseq_map0_lstrq<xs><x0><y0>(xs)
) where
{
#impltmp
map$fopr0<x0><y0> = map$fopr<x0><y0>
}
//
(* ****** ****** *)
//
#impltmp
< xs:t0 >
< x0:t0 >
< y0:t0 >
gseq_map_rlist(xs) =
list_vt2t{y0}
(
gseq_map_rllist<xs><x0><y0>(xs))
//
#impltmp
< xs:t0 >
< x0:t0 >
< y0:vt >
gseq_map_rllist(xs) =
(
gseq_map0_rllist<xs><x0><y0>(xs)
) where
{
#impltmp
map$fopr0<x0><y0> = map$fopr<x0><y0>
}
(* ****** ****** *)
(* ****** ****** *)
//
#impltmp
< xs:t0 >
< x0:t0 >
< y0:t0 >
gseq_rmap_list(xs) =
list_vt2t{y0}
(
gseq_rmap_llist<xs><x0><y0>(xs))
//
#impltmp
< xs:t0 >
< x0:t0 >
< y0:vt >
gseq_rmap_llist(xs) =
(
gseq_rmap0_llist<xs><x0><y0>(xs)
) where
{
#impltmp
rmap$fopr0<x0><y0> = rmap$fopr<x0><y0>
}
//
#impltmp
< xs:t0 >
< x0:t0 >
< y0:vt >
gseq_rmap_lstrm(xs) =
(
gseq_rmap0_lstrm<xs><x0><y0>(xs)
) where
{
#impltmp
rmap$fopr0<x0><y0> = rmap$fopr<x0><y0>
}
//
#impltmp
< xs:t0 >
< x0:t0 >
< y0:vt >
gseq_rmap_lstrq(xs) =
(
gseq_rmap0_lstrq<xs><x0><y0>(xs)
) where
{
#impltmp
rmap$fopr0<x0><y0> = rmap$fopr<x0><y0>
}
//
(* ****** ****** *)
//
#impltmp
< xs:t0 >
< x0:t0 >
< y0:t0 >
gseq_rmap_rlist(xs) =
list_vt2t{y0}
(
gseq_rmap_rllist<xs><x0><y0>(xs))
//
#impltmp
< xs:t0 >
< x0:t0 >
< y0:vt >
gseq_rmap_rllist(xs) =
(
gseq_rmap0_rllist<xs><x0><y0>(xs)
) where
{
#impltmp
rmap$fopr0<x0><y0> = rmap$fopr<x0><y0>
}
//
(* ****** ****** *)
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
gseq_imap_llist(xs) =
(
gseq_imap0_llist<xs><x0><y0>(xs)
) where
{
#impltmp
imap$fopr0<x0><y0> = imap$fopr<x0><y0>
}
//
#impltmp
< xs:t0 >
< x0:t0 >
< y0:vt >
gseq_imap_lstrm(xs) =
(
gseq_imap0_lstrm<xs><x0><y0>(xs)
) where
{
#impltmp
imap$fopr0<x0><y0> = imap$fopr<x0><y0>
}
//
#impltmp
< xs:t0 >
< x0:t0 >
< y0:vt >
gseq_imap_lstrq(xs) =
(
gseq_imap0_lstrq<xs><x0><y0>(xs)
) where
{
#impltmp
imap$fopr0<x0><y0> = imap$fopr<x0><y0>
}
//
(* ****** ****** *)
//
#impltmp
< xs:t0 >
< x0:t0 >
< y0:t0 >
gseq_imap_rlist(xs) =
list_vt2t{y0}
(
gseq_imap_rllist<xs><x0><y0>(xs))
//
#impltmp
< xs:t0 >
< x0:t0 >
< y0:vt >
gseq_imap_rllist(xs) =
(
gseq_imap0_rllist<xs><x0><y0>(xs)
) where
{
#impltmp
imap$fopr0<x0><y0> = imap$fopr<x0><y0>
}
//
(* ****** ****** *)
(* ****** ****** *)
//
(*
HX-2024-07-28:
Sun 28 Jul 2024 05:43:53 PM EDT
*)
#impltmp
< xs:t0 >
< x0:t0 >
< y0:t0 >
gseq_irmap_list(xs) =
list_vt2t{y0}
(
gseq_irmap_llist<xs><x0><y0>(xs))
//
#impltmp
< xs:t0 >
< x0:t0 >
< y0:vt >
gseq_irmap_llist(xs) =
(
gseq_irmap0_llist<xs><x0><y0>(xs)
) where
{
#impltmp
irmap$fopr0<x0><y0> = irmap$fopr<x0><y0>
}
//
#impltmp
< xs:t0 >
< x0:t0 >
< y0:vt >
gseq_irmap_lstrm(xs) =
(
gseq_irmap0_lstrm<xs><x0><y0>(xs)
) where
{
#impltmp
irmap$fopr0<x0><y0> = irmap$fopr<x0><y0>
}
//
#impltmp
< xs:t0 >
< x0:t0 >
< y0:vt >
gseq_irmap_lstrq(xs) =
(
gseq_irmap0_lstrq<xs><x0><y0>(xs)
) where
{
#impltmp
irmap$fopr0<x0><y0> = irmap$fopr<x0><y0>
}
//
(* ****** ****** *)
//
#impltmp
< xs:t0 >
< x0:t0 >
< y0:t0 >
gseq_irmap_rlist(xs) =
list_vt2t{y0}
(
gseq_irmap_rllist<xs><x0><y0>(xs))
//
#impltmp
< xs:t0 >
< x0:t0 >
< y0:vt >
gseq_irmap_rllist(xs) =
(
gseq_irmap0_rllist<xs><x0><y0>(xs)
) where
{
#impltmp
irmap$fopr0<x0><y0> = irmap$fopr<x0><y0>
}
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
gseq_filter_self
  ( xs ) =
g_make0_lstrm<x0><xs>
(
gseq_filter_lstrm<xs><x0>(xs))
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
strm_vt_listize0<x0>
(
gseq_filter_lstrm<xs><x0>(xs))
//
(* ****** ****** *)
//
#impltmp
< xs:t0 >
< x0:t0 >
gseq_filter_lstrm(xs) =
(
gseq_filter0_lstrm<xs><x0>(xs)
) where
{
#impltmp
filter$test0<x0> = filter$test<x0>
}
//
#impltmp
< xs:t0 >
< x0:t0 >
gseq_filter_lstrq(xs) =
(
gseq_filter0_lstrq<xs><x0>(xs)
) where
{
#impltmp
filter$test0<x0> = filter$test<x0>
}
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

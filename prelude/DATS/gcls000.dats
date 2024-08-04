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
Mon 29 Jul 2024 06:15:29 PM EDT
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
<xs : t0>
<x0 : t0>
GSEQ_unmk
(  gseq  ) = $UN.castxy(gseq)
//
(* ****** ****** *)
//
#impltmp
<xs : t0>
<x0 : vt>
GASZ_unmk
(  gasz  ) = $UN.castxy(gasz)
//
(* ****** ****** *)
(* ****** ****** *)
//
#impltmp
<xs : t0>
<x0 : t0>
GSEQ_sum
  (gseq) =
(
gseq_sum<xs><x0>(GSEQ_unmk(gseq)))
//
#impltmp
<xs : t0>
<x0 : t0>
GSEQ_prod
  (gseq) =
(
gseq_prod<xs><x0>(GSEQ_unmk(gseq)))
//
(* ****** ****** *)
(* ****** ****** *)
//
#impltmp
<xs : t0>
<x0 : t0>
GSEQ_length
  (gseq) =
(
gseq_length<xs><x0>(GSEQ_unmk(gseq)))
//
(* ****** ****** *)
(* ****** ****** *)
//
#impltmp
<xs : t0>
<x0 : t0>
GSEQ_listize
  (gseq) =
(
gseq_listize<xs><x0>(GSEQ_unmk(gseq)))
//
#impltmp
<xs : t0>
<x0 : t0>
GSEQ_rlistize
  (gseq) =
(
gseq_rlistize<xs><x0>(GSEQ_unmk(gseq)))
//
(* ****** ****** *)
(* ****** ****** *)
//
#impltmp
<xs : t0>
<x0 : t0>
GSEQ_forall
  (gseq) =
(
gseq_forall<xs><x0>(GSEQ_unmk(gseq)))
//
#impltmp
<xs : t0>
<x0 : t0>
GSEQ_exists
  (gseq) =
(
gseq_exists<xs><x0>(GSEQ_unmk(gseq)))
//
#impltmp
<xs : t0>
<x0 : t0>
GSEQ_rforall
  (gseq) =
(
gseq_rforall<xs><x0>(GSEQ_unmk(gseq)))
//
#impltmp
<xs : t0>
<x0 : t0>
GSEQ_iforall
  (gseq) =
(
gseq_iforall<xs><x0>(GSEQ_unmk(gseq)))
//
#impltmp
<xs : t0>
<x0 : t0>
GSEQ_irforall
  (gseq) =
(
gseq_irforall<xs><x0>(GSEQ_unmk(gseq)))
//
(* ****** ****** *)
//
#impltmp
<xs : t0>
<x0 : t0>
GSEQ_forall_c1fr
  (gseq, test) =
(
gseq_forall_c1fr<xs><x0>(GSEQ_unmk(gseq), test))
//
(* ****** ****** *)
//
#impltmp
<xs : t0>
<x0 : t0>
GSEQ_exists_c1fr
  (gseq, test) =
(
gseq_exists_c1fr<xs><x0>(GSEQ_unmk(gseq), test))
//
(* ****** ****** *)
//
#impltmp
<xs : t0>
<x0 : t0>
GSEQ_rforall_c1fr
  (gseq, test) =
(
gseq_rforall_c1fr<xs><x0>(GSEQ_unmk(gseq), test))
//
#impltmp
<xs : t0>
<x0 : t0>
GSEQ_rexists_c1fr
  (gseq, test) =
(
gseq_rexists_c1fr<xs><x0>(GSEQ_unmk(gseq), test))
//
(* ****** ****** *)
//
#impltmp
<xs : t0>
<x0 : t0>
GSEQ_iforall_c2fr
  (gseq, test) =
(
gseq_iforall_c2fr<xs><x0>(GSEQ_unmk(gseq), test))
//
(* ****** ****** *)
//
#impltmp
<xs : t0>
<x0 : t0>
GSEQ_irforall_c2fr
  (gseq, test) =
(
gseq_irforall_c2fr<xs><x0>(GSEQ_unmk(gseq), test))
//
(* ****** ****** *)
(* ****** ****** *)
//
#impltmp
<xs : t0>
<x0 : t0>
<r0 : vt>
GSEQ_folditm
 (gseq, r0) =
(
gseq_folditm<xs><x0><r0>(GSEQ_unmk(gseq), r0))
//
#impltmp
<xs : t0>
<x0 : t0>
<r0 : vt>
GSEQ_rfolditm
 (gseq, r0) =
(
gseq_rfolditm<xs><x0><r0>(GSEQ_unmk(gseq), r0))
//
#impltmp
<xs : t0>
<x0 : t0>
<r0 : vt>
GSEQ_ifolditm
 (gseq, r0) =
(
gseq_ifolditm<xs><x0><r0>(GSEQ_unmk(gseq), r0))
//
#impltmp
<xs : t0>
<x0 : t0>
<r0 : vt>
GSEQ_irfolditm
 (gseq, r0) =
(
gseq_irfolditm<xs><x0><r0>(GSEQ_unmk(gseq), r0))
//
(* ****** ****** *)
//
#impltmp
<xs : t0>
<x0 : t0>
<r0 : vt>
GSEQ_folditm_c2fr
 (gseq, r0, fopr) =
(
gseq_folditm_c2fr<xs><x0><r0>(GSEQ_unmk(gseq), r0, fopr))
//
#impltmp
<xs : t0>
<x0 : t0>
<r0 : vt>
GSEQ_rfolditm_c2fr
 (gseq, r0, fopr) =
(
gseq_rfolditm_c2fr<xs><x0><r0>(GSEQ_unmk(gseq), r0, fopr))
//
#impltmp
<xs : t0>
<x0 : t0>
<r0 : vt>
GSEQ_ifolditm_c3fr
 (gseq, r0, fopr) =
(
gseq_ifolditm_c3fr<xs><x0><r0>(GSEQ_unmk(gseq), r0, fopr))
//
#impltmp
<xs : t0>
<x0 : t0>
<r0 : vt>
GSEQ_irfolditm_c3fr
 (gseq, r0, fopr) =
(
gseq_irfolditm_c3fr<xs><x0><r0>(GSEQ_unmk(gseq), r0, fopr))
//
(* ****** ****** *)
(* ****** ****** *)
//
#impltmp
<xs : t0>
<x0 : vt>
GASZ_length
  (gasz) =
(
gasz_length<xs><x0>(GASZ_unmk(gasz)))
//
(* ****** ****** *)
//
#impltmp
<xs : t0>
<x0 : vt>
GASZ_listize
  (gasz) =
(
gasz_listize<xs><x0>(GASZ_unmk(gasz)))
//
#impltmp
<xs : t0>
<x0 : vt>
GASZ_rlistize
  (gasz) =
(
gasz_rlistize<xs><x0>(GASZ_unmk(gasz)))
//
(* ****** ****** *)
//
#impltmp
<xs : t0>
<x0 : vt>
GASZ_forall
  (gasz) =
(
gasz_forall<xs><x0>(GASZ_unmk(gasz)))
//
#impltmp
<xs : t0>
<x0 : vt>
GASZ_rforall
  (gasz) =
(
gasz_rforall<xs><x0>(GASZ_unmk(gasz)))
//
#impltmp
<xs : t0>
<x0 : vt>
GASZ_iforall
  (gasz) =
(
gasz_iforall<xs><x0>(GASZ_unmk(gasz)))
//
#impltmp
<xs : t0>
<x0 : vt>
GASZ_irforall
  (gasz) =
(
gasz_irforall<xs><x0>(GASZ_unmk(gasz)))
//
(* ****** ****** *)
//
#impltmp
<xs : t0>
<x0 : vt>
GASZ_forall_c1fr
  (gasz, test) =
(
gasz_forall_c1fr<xs><x0>(GASZ_unmk(gasz), test))
//
(* ****** ****** *)
//
#impltmp
<xs : t0>
<x0 : vt>
GASZ_rforall_c1fr
  (gasz, test) =
(
gasz_rforall_c1fr<xs><x0>(GASZ_unmk(gasz), test))
//
(* ****** ****** *)
(* ****** ****** *)
//
#impltmp
<xs : t0>
<x0 : vt>
GASZ_exists_c1fr
  (gasz, test) =
(
gasz_exists_c1fr<xs><x0>(GASZ_unmk(gasz), test))
//
(* ****** ****** *)
//
#impltmp
<xs : t0>
<x0 : vt>
GASZ_rexists_c1fr
  (gasz, test) =
(
gasz_rexists_c1fr<xs><x0>(GASZ_unmk(gasz), test))
//
(* ****** ****** *)
(* ****** ****** *)
//
(* ****** ****** *)(* ****** ****** *)
(* ****** ****** *)(* ****** ****** *)

(* end of [ATS3/XANADU_prelude_DATS_gcls000.dats] *)

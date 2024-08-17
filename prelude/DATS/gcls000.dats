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
< xs:t0 >
< x0:t0 >
GSEQ_unmk
(  gseq  ) =
(
  $UN.castxy(gseq))
//
#impltmp
{ xs:t0 }
{ x0:t0 }
g_ptype
<GSEQ(xs,x0)>
(  (*void*)  ) =
( pstrn"GSEQ("
; g_ptype<xs>(); pstrn(",")
; g_ptype<x0>(); pstrn(")"))
//
(* ****** ****** *)
//
#impltmp
< xs:t0 >
< x0:vt >
GASZ_unmk
(  gasz  ) =
(
  $UN.castxy(gasz))
//
#impltmp
{ xs:t0 }
{ x0:t0 }
g_ptype
<GASZ(xs,x0)>
(  (*void*)  ) =
( pstrn"GASZ("
; g_ptype<xs>(); pstrn(",")
; g_ptype<x0>(); pstrn(")"))
//
(* ****** ****** *)
(* ****** ****** *)
//
#impltmp
< xs:t0 >
< x0:t0 >
GSEQ_sum
  (gseq) =
(
gseq_sum<xs><x0>(GSEQ_unmk(gseq)))
//
#impltmp
< xs:t0 >
< x0:t0 >
GSEQ_prod
  (gseq) =
(
gseq_prod<xs><x0>(GSEQ_unmk(gseq)))
//
(* ****** ****** *)
(* ****** ****** *)
//
#impltmp
< xs:t0 >
< x0:t0 >
GSEQ_length
  (gseq) =
(
gseq_length<xs><x0>(GSEQ_unmk(gseq)))
//
(* ****** ****** *)
(* ****** ****** *)
//
#impltmp
< xs:t0 >
< x0:t0 >
GSEQ_listize
  (gseq) =
(
gseq_listize<xs><x0>(GSEQ_unmk(gseq)))
//
#impltmp
< xs:t0 >
< x0:t0 >
GSEQ_rlistize
  (gseq) =
(
gseq_rlistize<xs><x0>(GSEQ_unmk(gseq)))
//
(* ****** ****** *)
(* ****** ****** *)
//
#impltmp
< xs:t0 >
< x0:t0 >
GSEQ_strmize
  (gseq) =
(
gseq_strmize<xs><x0>(GSEQ_unmk(gseq)))
//
#impltmp
< xs:t0 >
< x0:t0 >
GSEQ_rstrmize
  (gseq) =
(
gseq_rstrmize<xs><x0>(GSEQ_unmk(gseq)))
//
(* ****** ****** *)
(* ****** ****** *)
//
#impltmp
< xs:t0 >
< x0:t0 >
GSEQ_forall
  (gseq) =
(
gseq_forall<xs><x0>(GSEQ_unmk(gseq)))
//
#impltmp
< xs:t0 >
< x0:t0 >
GSEQ_exists
  (gseq) =
(
gseq_exists<xs><x0>(GSEQ_unmk(gseq)))
//
#impltmp
< xs:t0 >
< x0:t0 >
GSEQ_rforall
  (gseq) =
(
gseq_rforall<xs><x0>(GSEQ_unmk(gseq)))
//
#impltmp
< xs:t0 >
< x0:t0 >
GSEQ_iforall
  (gseq) =
(
gseq_iforall<xs><x0>(GSEQ_unmk(gseq)))
//
#impltmp
< xs:t0 >
< x0:t0 >
GSEQ_irforall
  (gseq) =
(
gseq_irforall<xs><x0>(GSEQ_unmk(gseq)))
//
(* ****** ****** *)
//
#impltmp
< xs:t0 >
< x0:t0 >
GSEQ_forall_f1un
  (gseq, test) =
(
gseq_forall_f1un<xs><x0>(GSEQ_unmk(gseq), test))
//
(* ****** ****** *)
//
#impltmp
< xs:t0 >
< x0:t0 >
GSEQ_exists_f1un
  (gseq, test) =
(
gseq_exists_f1un<xs><x0>(GSEQ_unmk(gseq), test))
//
(* ****** ****** *)
//
#impltmp
< xs:t0 >
< x0:t0 >
GSEQ_rforall_f1un
  (gseq, test) =
(
gseq_rforall_f1un<xs><x0>(GSEQ_unmk(gseq), test))
//
#impltmp
< xs:t0 >
< x0:t0 >
GSEQ_rexists_f1un
  (gseq, test) =
(
gseq_rexists_f1un<xs><x0>(GSEQ_unmk(gseq), test))
//
(* ****** ****** *)
//
#impltmp
< xs:t0 >
< x0:t0 >
GSEQ_iforall_f2un
  (gseq, test) =
(
gseq_iforall_f2un<xs><x0>(GSEQ_unmk(gseq), test))
//
(* ****** ****** *)
//
#impltmp
< xs:t0 >
< x0:t0 >
GSEQ_irforall_f2un
  (gseq, test) =
(
gseq_irforall_f2un<xs><x0>(GSEQ_unmk(gseq), test))
//
(* ****** ****** *)
(* ****** ****** *)
//
#impltmp
< xs:t0 >
< x0:t0 >
GSEQ_foritm
  (gseq) =
(
gseq_foritm<xs><x0>(GSEQ_unmk(gseq)))
//
#impltmp
< xs:t0 >
< x0:t0 >
GSEQ_rforitm
  (gseq) =
(
gseq_rforitm<xs><x0>(GSEQ_unmk(gseq)))
//
#impltmp
< xs:t0 >
< x0:t0 >
GSEQ_iforitm
  (gseq) =
(
gseq_iforitm<xs><x0>(GSEQ_unmk(gseq)))
//
#impltmp
< xs:t0 >
< x0:t0 >
GSEQ_irforitm
  (gseq) =
(
gseq_irforitm<xs><x0>(GSEQ_unmk(gseq)))
//
(* ****** ****** *)
//
#impltmp
< xs:t0 >
< x0:t0 >
GSEQ_foritm_f1un
  (gseq, test) =
(
gseq_foritm_f1un<xs><x0>(GSEQ_unmk(gseq), test))
//
#impltmp
< xs:t0 >
< x0:t0 >
GSEQ_rforitm_f1un
  (gseq, test) =
(
gseq_rforitm_f1un<xs><x0>(GSEQ_unmk(gseq), test))
//
#impltmp
< xs:t0 >
< x0:t0 >
GSEQ_iforitm_f2un
  (gseq, test) =
(
gseq_iforitm_f2un<xs><x0>(GSEQ_unmk(gseq), test))
//
#impltmp
< xs:t0 >
< x0:t0 >
GSEQ_irforitm_f2un
  (gseq, test) =
(
gseq_irforitm_f2un<xs><x0>(GSEQ_unmk(gseq), test))
//
(* ****** ****** *)
(* ****** ****** *)
//
#impltmp
< xs:t0 >
< x0:t0 >
< r0:vt >
GSEQ_folditm
 (gseq, r0) =
(
gseq_folditm<xs><x0><r0>(GSEQ_unmk(gseq), r0))
//
#impltmp
< xs:t0 >
< x0:t0 >
< r0:vt >
GSEQ_rfolditm
 (gseq, r0) =
(
gseq_rfolditm<xs><x0><r0>(GSEQ_unmk(gseq), r0))
//
#impltmp
< xs:t0 >
< x0:t0 >
< r0:vt >
GSEQ_ifolditm
 (gseq, r0) =
(
gseq_ifolditm<xs><x0><r0>(GSEQ_unmk(gseq), r0))
//
#impltmp
< xs:t0 >
< x0:t0 >
< r0:vt >
GSEQ_irfolditm
 (gseq, r0) =
(
gseq_irfolditm<xs><x0><r0>(GSEQ_unmk(gseq), r0))
//
(* ****** ****** *)
//
#impltmp
< xs:t0 >
< x0:t0 >
< r0:vt >
GSEQ_folditm_f2un
 (gseq, r0, fopr) =
(
gseq_folditm_f2un<xs><x0><r0>(GSEQ_unmk(gseq), r0, fopr))
//
#impltmp
< xs:t0 >
< x0:t0 >
< r0:vt >
GSEQ_rfolditm_f2un
 (gseq, r0, fopr) =
(
gseq_rfolditm_f2un<xs><x0><r0>(GSEQ_unmk(gseq), r0, fopr))
//
#impltmp
< xs:t0 >
< x0:t0 >
< r0:vt >
GSEQ_ifolditm_f3un
 (gseq, r0, fopr) =
(
gseq_ifolditm_f3un<xs><x0><r0>(GSEQ_unmk(gseq), r0, fopr))
//
#impltmp
< xs:t0 >
< x0:t0 >
< r0:vt >
GSEQ_irfolditm_f3un
 (gseq, r0, fopr) =
(
gseq_irfolditm_f3un<xs><x0><r0>(GSEQ_unmk(gseq), r0, fopr))
//
(* ****** ****** *)
(* ****** ****** *)
//
#impltmp
< xs:t0 >
< x0:vt >
GASZ_length
  (gasz) =
(
gasz_length<xs><x0>(GASZ_unmk(gasz)))
//
(* ****** ****** *)
//
#impltmp
< xs:t0 >
< x0:vt >
GASZ_listize
  (gasz) =
(
gasz_listize<xs><x0>(GASZ_unmk(gasz)))
//
#impltmp
< xs:t0 >
< x0:vt >
GASZ_rlistize
  (gasz) =
(
gasz_rlistize<xs><x0>(GASZ_unmk(gasz)))
//
(* ****** ****** *)
(* ****** ****** *)
//
#impltmp
< xs:t0 >
< x0:t0 >
GASZ_strmize
  (gasz) =
(
gasz_strmize<xs><x0>(GASZ_unmk(gasz)))
//
#impltmp
< xs:t0 >
< x0:t0 >
GASZ_rstrmize
  (gasz) =
(
gasz_rstrmize<xs><x0>(GASZ_unmk(gasz)))
//
(* ****** ****** *)
(* ****** ****** *)
//
#impltmp
< xs:t0 >
< x0:vt >
GASZ_forall
  (gasz) =
(
gasz_forall<xs><x0>(GASZ_unmk(gasz)))
#impltmp
< xs:t0 >
< x0:vt >
GASZ_exists
  (gasz) =
(
gasz_exists<xs><x0>(GASZ_unmk(gasz)))
//
#impltmp
< xs:t0 >
< x0:vt >
GASZ_rforall
  (gasz) =
(
gasz_rforall<xs><x0>(GASZ_unmk(gasz)))
//
#impltmp
< xs:t0 >
< x0:vt >
GASZ_iforall
  (gasz) =
(
gasz_iforall<xs><x0>(GASZ_unmk(gasz)))
//
#impltmp
< xs:t0 >
< x0:vt >
GASZ_irforall
  (gasz) =
(
gasz_irforall<xs><x0>(GASZ_unmk(gasz)))
//
(* ****** ****** *)
//
#impltmp
< xs:t0 >
< x0:vt >
GASZ_forall_f1un
  (gasz, test) =
(
gasz_forall_f1un<xs><x0>(GASZ_unmk(gasz), test))
//
(* ****** ****** *)
//
#impltmp
< xs:t0 >
< x0:vt >
GASZ_rforall_f1un
  (gasz, test) =
(
gasz_rforall_f1un<xs><x0>(GASZ_unmk(gasz), test))
//
(* ****** ****** *)
(* ****** ****** *)
//
#impltmp
< xs:t0 >
< x0:vt >
GASZ_exists_f1un
  (gasz, test) =
(
gasz_exists_f1un<xs><x0>(GASZ_unmk(gasz), test))
//
(* ****** ****** *)
//
#impltmp
< xs:t0 >
< x0:vt >
GASZ_rexists_f1un
  (gasz, test) =
(
gasz_rexists_f1un<xs><x0>(GASZ_unmk(gasz), test))
//
(* ****** ****** *)
(* ****** ****** *)
//
(*
HX-2024-08-17:
Sat 17 Aug 2024 07:34:48 AM EDT
The following style seems to be a
superior alternative to introducing
templates like GASZ_foritm?
*)
//
#impltmp
{ xs:t0
, x0:t0 }
gseq_foritm
<GASZ(xs,x0)><x0>
 ( gasz ) =
gseq_foritm<xs><x0>(GASZ_unmk(gasz))
//
#impltmp
{ xs:t0
, x0:t0 }
gseq_foritm_f1un
<GASZ(xs,x0)><x0>
 (gasz, test) =
gseq_foritm_f1un<xs><x0>(GASZ_unmk(gasz), test)
//
(* ****** ****** *)
//
#impltmp
{ xs:t0
, x0:t0 }
gseq_rforitm
<GASZ(xs,x0)><x0>
 ( gasz ) =
gseq_rforitm<xs><x0>(GASZ_unmk(gasz))
//
#impltmp
{ xs:t0
, x0:t0 }
gseq_rforitm_f1un
<GASZ(xs,x0)><x0>
 (gasz, test) =
gseq_rforitm_f1un<xs><x0>(GASZ_unmk(gasz), test)
//
(* ****** ****** *)
//
#impltmp
{ xs:t0
, x0:t0 }
gseq_iforitm
<GASZ(xs,x0)><x0>
 ( gasz ) =
gseq_iforitm<xs><x0>(GASZ_unmk(gasz))
//
#impltmp
{ xs:t0
, x0:t0 }
gseq_iforitm_f2un
<GASZ(xs,x0)><x0>
 (gasz, test) =
gseq_iforitm_f2un<xs><x0>(GASZ_unmk(gasz), test)
//
(* ****** ****** *)
//
#impltmp
{ xs:t0
, x0:t0 }
gseq_irforitm
<GASZ(xs,x0)><x0>
 ( gasz ) =
gseq_irforitm<xs><x0>(GASZ_unmk(gasz))
//
#impltmp
{ xs:t0
, x0:t0 }
gseq_irforitm_f2un
<GASZ(xs,x0)><x0>
 (gasz, test) =
gseq_irforitm_f2un<xs><x0>(GASZ_unmk(gasz), test)
//
(* ****** ****** *)
(* ****** ****** *)
//
(* ****** ****** *)(* ****** ****** *)
(* ****** ****** *)(* ****** ****** *)

(* end of [ATS3/XANADU_prelude_DATS_gcls000.dats] *)

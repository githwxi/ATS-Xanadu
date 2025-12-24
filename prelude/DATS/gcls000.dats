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
GASQ_unmk
(  gasq  ) =
(
  $UN.castxy(gasq))
//
#impltmp
{ xs:t0 }
{ x0:t0 }
g_ptype
<GASQ(xs,x0)>
(  (*void*)  ) =
( pstrn"GASQ("
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
gseq_sum
<xs><x0>(GSEQ_unmk<xs><x0>(gseq)))
//
#impltmp
< xs:t0 >
< x0:t0 >
GSEQ_prod
  (gseq) =
(
gseq_prod
<xs><x0>(GSEQ_unmk<xs><x0>(gseq)))
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
gseq_length
<xs><x0>(GSEQ_unmk<xs><x0>(gseq)))
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
gseq_listize
<xs><x0>(GSEQ_unmk<xs><x0>(gseq)))
//
#impltmp
< xs:t0 >
< x0:t0 >
GSEQ_rlistize
  (gseq) =
(
gseq_rlistize
<xs><x0>(GSEQ_unmk<xs><x0>(gseq)))
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
gseq_strmize
<xs><x0>(GSEQ_unmk<xs><x0>(gseq)))
//
#impltmp
< xs:t0 >
< x0:t0 >
GSEQ_rstrmize
  (gseq) =
(
gseq_rstrmize
<xs><x0>(GSEQ_unmk<xs><x0>(gseq)))
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
gseq_forall
<xs><x0>(GSEQ_unmk<xs><x0>(gseq)))
//
#impltmp
< xs:t0 >
< x0:t0 >
GSEQ_exists
  (gseq) =
(
gseq_exists
<xs><x0>(GSEQ_unmk<xs><x0>(gseq)))
//
#impltmp
< xs:t0 >
< x0:t0 >
GSEQ_rforall
  (gseq) =
(
gseq_rforall
<xs><x0>(GSEQ_unmk<xs><x0>(gseq)))
//
#impltmp
< xs:t0 >
< x0:t0 >
GSEQ_iforall
  (gseq) =
(
gseq_iforall
<xs><x0>(GSEQ_unmk<xs><x0>(gseq)))
//
#impltmp
< xs:t0 >
< x0:t0 >
GSEQ_irforall
  (gseq) =
(
gseq_irforall
<xs><x0>(GSEQ_unmk<xs><x0>(gseq)))
//
(* ****** ****** *)
//
#impltmp
< xs:t0 >
< x0:t0 >
GSEQ_forall$f1un
  (gseq, test) =
(
gseq_forall$f1un
<xs><x0>(GSEQ_unmk<xs><x0>(gseq), test))
//
(* ****** ****** *)
//
#impltmp
< xs:t0 >
< x0:t0 >
GSEQ_exists$f1un
  (gseq, test) =
(
gseq_exists$f1un
<xs><x0>(GSEQ_unmk<xs><x0>(gseq), test))
//
(* ****** ****** *)
//
#impltmp
< xs:t0 >
< x0:t0 >
GSEQ_rforall$f1un
  (gseq, test) =
(
gseq_rforall$f1un
<xs><x0>(GSEQ_unmk<xs><x0>(gseq), test))
//
#impltmp
< xs:t0 >
< x0:t0 >
GSEQ_rexists$f1un
  (gseq, test) =
(
gseq_rexists$f1un
<xs><x0>(GSEQ_unmk<xs><x0>(gseq), test))
//
(* ****** ****** *)
//
#impltmp
< xs:t0 >
< x0:t0 >
GSEQ_iforall$f2un
  (gseq, test) =
(
gseq_iforall$f2un
<xs><x0>(GSEQ_unmk<xs><x0>(gseq), test))
//
(* ****** ****** *)
//
#impltmp
< xs:t0 >
< x0:t0 >
GSEQ_irforall$f2un
  (gseq, test) =
(
gseq_irforall$f2un
<xs><x0>(GSEQ_unmk<xs><x0>(gseq), test))
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
gseq_foritm
<xs><x0>(GSEQ_unmk<xs><x0>(gseq)))
//
#impltmp
< xs:t0 >
< x0:t0 >
GSEQ_rforitm
  (gseq) =
(
gseq_rforitm
<xs><x0>(GSEQ_unmk<xs><x0>(gseq)))
//
#impltmp
< xs:t0 >
< x0:t0 >
GSEQ_iforitm
  (gseq) =
(
gseq_iforitm
<xs><x0>(GSEQ_unmk<xs><x0>(gseq)))
//
#impltmp
< xs:t0 >
< x0:t0 >
GSEQ_irforitm
  (gseq) =
(
gseq_irforitm
<xs><x0>(GSEQ_unmk<xs><x0>(gseq)))
//
(* ****** ****** *)
//
#impltmp
< xs:t0 >
< x0:t0 >
GSEQ_foritm$f1un
  (gseq, test) =
(
gseq_foritm$f1un
<xs><x0>(GSEQ_unmk<xs><x0>(gseq), test))
//
#impltmp
< xs:t0 >
< x0:t0 >
GSEQ_rforitm$f1un
  (gseq, test) =
(
gseq_rforitm$f1un
<xs><x0>(GSEQ_unmk<xs><x0>(gseq), test))
//
#impltmp
< xs:t0 >
< x0:t0 >
GSEQ_iforitm$f2un
  (gseq, test) =
(
gseq_iforitm$f2un
<xs><x0>(GSEQ_unmk<xs><x0>(gseq), test))
//
#impltmp
< xs:t0 >
< x0:t0 >
GSEQ_irforitm$f2un
  (gseq, test) =
(
gseq_irforitm$f2un
<xs><x0>(GSEQ_unmk<xs><x0>(gseq), test))
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
gseq_folditm
<xs><x0><r0>(GSEQ_unmk<xs><x0>(gseq), r0))
//
#impltmp
< xs:t0 >
< x0:t0 >
< r0:vt >
GSEQ_rfolditm
 (gseq, r0) =
(
gseq_rfolditm
<xs><x0><r0>(GSEQ_unmk<xs><x0>(gseq), r0))
//
#impltmp
< xs:t0 >
< x0:t0 >
< r0:vt >
GSEQ_ifolditm
 (gseq, r0) =
(
gseq_ifolditm
<xs><x0><r0>(GSEQ_unmk<xs><x0>(gseq), r0))
//
#impltmp
< xs:t0 >
< x0:t0 >
< r0:vt >
GSEQ_irfolditm
 (gseq, r0) =
(
gseq_irfolditm
<xs><x0><r0>(GSEQ_unmk<xs><x0>(gseq), r0))
//
(* ****** ****** *)
//
#impltmp
< xs:t0 >
< x0:t0 >
< r0:vt >
GSEQ_folditm$f2un
 (gseq, r0, fopr) =
(
gseq_folditm$f2un
<xs><x0><r0>(GSEQ_unmk<xs><x0>(gseq), r0, fopr))
//
#impltmp
< xs:t0 >
< x0:t0 >
< r0:vt >
GSEQ_rfolditm$f2un
 (gseq, r0, fopr) =
(
gseq_rfolditm$f2un
<xs><x0><r0>(GSEQ_unmk<xs><x0>(gseq), r0, fopr))
//
#impltmp
< xs:t0 >
< x0:t0 >
< r0:vt >
GSEQ_ifolditm$f3un
 (gseq, r0, fopr) =
(
gseq_ifolditm$f3un
<xs><x0><r0>(GSEQ_unmk<xs><x0>(gseq), r0, fopr))
//
#impltmp
< xs:t0 >
< x0:t0 >
< r0:vt >
GSEQ_irfolditm$f3un
 (gseq, r0, fopr) =
(
gseq_irfolditm$f3un
<xs><x0><r0>(GSEQ_unmk<xs><x0>(gseq), r0, fopr))
//
(* ****** ****** *)
(* ****** ****** *)
//
#impltmp
< xs:t0 >
< x0:vt >
GASQ_length
  (gasq) =
(
gasq_length
<xs><x0>(GASQ_unmk<xs><x0>(gasq)))
//
(* ****** ****** *)
//
#impltmp
< xs:t0 >
< x0:vt >
GASQ_listize
  (gasq) =
(
gasq_listize
<xs><x0>(GASQ_unmk<xs><x0>(gasq)))
#impltmp
< xs:t0 >
< x0:vt >
GASQ_rlistize
  (gasq) =
(
gasq_rlistize
<xs><x0>(GASQ_unmk<xs><x0>(gasq)))
//
(* ****** ****** *)
//
#impltmp
< xs:t0 >
< x0:t0 >
GASQ_strmize
  (gasq) =
(
gasq_strmize
<xs><x0>(GASQ_unmk<xs><x0>(gasq)))
#impltmp
< xs:t0 >
< x0:t0 >
GASQ_rstrmize
  (gasq) =
(
gasq_rstrmize
<xs><x0>(GASQ_unmk<xs><x0>(gasq)))
//
(* ****** ****** *)
(* ****** ****** *)
//
#impltmp
< xs:t0 >
< x0:vt >
GASQ_forall
  (gasq) =
(
gasq_forall
<xs><x0>(GASQ_unmk<xs><x0>(gasq)))
#impltmp
< xs:t0 >
< x0:vt >
GASQ_exists
  (gasq) =
(
gasq_exists
<xs><x0>(GASQ_unmk<xs><x0>(gasq)))
//
#impltmp
< xs:t0 >
< x0:vt >
GASQ_rforall
  (gasq) =
(
gasq_rforall
<xs><x0>(GASQ_unmk<xs><x0>(gasq)))
//
#impltmp
< xs:t0 >
< x0:vt >
GASQ_iforall
  (gasq) =
(
gasq_iforall
<xs><x0>(GASQ_unmk<xs><x0>(gasq)))
//
#impltmp
< xs:t0 >
< x0:vt >
GASQ_irforall
  (gasq) =
(
gasq_irforall
<xs><x0>(GASQ_unmk<xs><x0>(gasq)))
//
(* ****** ****** *)
//
#impltmp
< xs:t0 >
< x0:vt >
GASQ_forall$f1un
  (gasq, test) =
(
gasq_forall$f1un
<xs><x0>(GASQ_unmk<xs><x0>(gasq), test))
//
(* ****** ****** *)
//
#impltmp
< xs:t0 >
< x0:vt >
GASQ_rforall$f1un
  (gasq, test) =
(
gasq_rforall$f1un
<xs><x0>(GASQ_unmk<xs><x0>(gasq), test))
//
(* ****** ****** *)
(* ****** ****** *)
//
#impltmp
< xs:t0 >
< x0:vt >
GASQ_exists$f1un
  (gasq, test) =
(
gasq_exists$f1un
<xs><x0>(GASQ_unmk<xs><x0>(gasq), test))
//
(* ****** ****** *)
//
#impltmp
< xs:t0 >
< x0:vt >
GASQ_rexists$f1un
  (gasq, test) =
(
gasq_rexists$f1un
<xs><x0>(GASQ_unmk<xs><x0>(gasq), test))
//
(* ****** ****** *)
(* ****** ****** *)
//
(*
HX-2024-08-17:
Sat 17 Aug 2024 07:34:48 AM EDT
The following style seems to be a
superior alternative to introducing
templates like GASQ_foritm?
*)
//
#impltmp
{ xs:t0
, x0:t0 }
gseq_foritm
<GASQ(xs,x0)><x0>
 ( gasq ) =
gseq_foritm
<xs><x0>(GASQ_unmk<xs><x0>(gasq))
#impltmp
{ xs:t0
, x0:t0 }
gseq_foritm$f1un
<GASQ(xs,x0)><x0>
 (gasq, test) =
gseq_foritm$f1un
<xs><x0>(GASQ_unmk<xs><x0>(gasq), test)
//
(* ****** ****** *)
//
#impltmp
{ xs:t0
, x0:t0 }
gseq_rforitm
<GASQ(xs,x0)><x0>
 ( gasq ) =
gseq_rforitm
<xs><x0>(GASQ_unmk<xs><x0>(gasq))
//
#impltmp
{ xs:t0
, x0:t0 }
gseq_rforitm$f1un
<GASQ(xs,x0)><x0>
 (gasq, test) =
gseq_rforitm$f1un
<xs><x0>(GASQ_unmk<xs><x0>(gasq), test)
//
(* ****** ****** *)
//
#impltmp
{ xs:t0
, x0:t0 }
gseq_iforitm
<GASQ(xs,x0)><x0>
 ( gasq ) =
gseq_iforitm
<xs><x0>(GASQ_unmk<xs><x0>(gasq))
//
#impltmp
{ xs:t0
, x0:t0 }
gseq_iforitm$f2un
<GASQ(xs,x0)><x0>
 (gasq, test) =
gseq_iforitm$f2un
<xs><x0>(GASQ_unmk<xs><x0>(gasq), test)
//
(* ****** ****** *)
//
#impltmp
{ xs:t0
, x0:t0 }
gseq_irforitm
<GASQ(xs,x0)><x0>
 ( gasq ) =
gseq_irforitm
<xs><x0>(GASQ_unmk<xs><x0>(gasq))
//
#impltmp
{ xs:t0
, x0:t0 }
gseq_irforitm$f2un
<GASQ(xs,x0)><x0>
 (gasq, test) =
gseq_irforitm$f2un
<xs><x0>(GASQ_unmk<xs><x0>(gasq), test)
//
(* ****** ****** *)
(* ****** ****** *)
//
(***********************************************************************)
(* end of [ATS3/XANADU_prelude_DATS_gcls000.dats] *)
(***********************************************************************)

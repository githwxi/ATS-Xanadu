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
Sun 21 Jul 2024 02:22:12 PM EDT
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
<x0:vt>
gasq_listize
 ( xs: xs ): list_vt(x0)
fun
<xs:t0>
<x0:vt>
gasq_rlistize
 ( xs: xs ): list_vt(x0)
//
(* ****** ****** *)
//
fun
<xs:t0>
<x0:vt>
gasq_strmize
 ( xs: xs ): strm_vt(x0)
fun
<xs:t0>
<x0:vt>
gasq_rstrmize
 ( xs: xs ): strm_vt(x0)
//
fun
<xs:t0>
<x0:vt>
gasq_strqize
 ( xs: xs ): strq_vt(x0)
fun
<xs:t0>
<x0:vt>
gasq_rstrqize
 ( xs: xs ): strq_vt(x0)
//
(* ****** ****** *)
(* ****** ****** *)
//
fun
<xs:t0>
<x0:vt>
gasq_forall(xs: xs): bool
fun
<xs:t0>
<x0:vt>
gasq_exists(xs: xs): bool
fun
<xs:t0>
<x0:vt>
gasq_rforall(xs: xs): bool
fun
<xs:t0>
<x0:vt>
gasq_rexists(xs: xs): bool
//
fun
<xs:t0>
<x0:vt>
gasq_iforall(xs: xs): bool
fun
<xs:t0>
<x0:vt>
gasq_irforall(xs: xs): bool
//
(*
#symload forall with gasq_forall of 0100
#symload exists with gasq_exists of 0100
#symload rforall with gasq_rforall of 0100
#symload rexists with gasq_rexists of 0100
*)
//
fun
<xs:t0>
<x0:vt>
gasq_forall$f1un
(xs: xs, test: (!x0)->bool): bool
//
(*
#symload forall with gasq_forall$f1un of 0100
#symload forall$fun with gasq_forall$f1un of 0100
*)
//
fun
<xs:t0>
<x0:vt>
gasq_exists$f1un
(xs: xs, test: (!x0)->bool): bool
//
(*
#symload exists with gasq_exists$f1un of 0100
#symload exists$fun with gasq_exists$f1un of 0100
*)
//
fun
<xs:t0>
<x0:vt>
gasq_rforall$f1un
(xs: xs, test: (!x0)->bool): bool
//
(*
#symload rforall with gasq_rforall$f1un of 0100
#symload rforall$fun with gasq_rforall$f1un of 0100
*)
//
fun
<xs:t0>
<x0:vt>
gasq_rexists$f1un
(xs: xs, test: (!x0)->bool): bool
//
(*
#symload rexists with gasq_rexists$f1un of 0100
#symload rexists$fun with gasq_rexists$f1un of 0100
*)
//
(* ****** ****** *)
(* ****** ****** *)
//
(*
HX-2024-07-25:
Thu 25 Jul 2024 01:47:26 PM EDT
HX-2025-09-08:
There seems to be overlapping between
[mapref] and [foritm1x]
Let us keep [mapref] as a special combinator for now.
*)
//
fun
<x0:vt>
mapref$fopr0
( itm: ~x0 ): ( x0 )
fun
<x0:vt>
mapref$fopr1x
( ref: &x0 >> x0 ): void
//
(*
fun
<x0:vt>
mapref$fopr0x
( ref: &x0 >> ?x0 ): void
fun
<x0:vt>
mapref$fopr01x
( ref: &(?x0) >> (x0) ): void
fun
<x0:vt>
mapref$fopr10x
( ref: &(?x0) << (x0) ): void
*)
//
fun
<xs:t0>
<x0:vt>
gasq_mapref(xs: xs): void
fun
<xs:t0>
<x0:vt>
gasq_mapref$c1bv
(xs: xs, fopr: (~x0)->(x0)): void
//
(*
#symload mapref with gasq_mapref$c1bv of 0100
#symload mapref$cbv with gasq_mapref$c1bv of 0100
*)
//
(* ****** ****** *)
(* ****** ****** *)
//
fun
<x0:vt>
rmapref$fopr0(~x0): x0
fun
<x0:vt>
rmapref$fopr1x
( ref: &x0 >> x0 ): void
//
fun
<xs:t0>
<x0:vt>
gasq_rmapref(xs: xs): void
fun
<xs:t0>
<x0:vt>
gasq_rmapref$c1bv
(xs: xs, fopr: (~x0)->(x0)): void
//
(*
#symload rmapref with gasq_rmapref$c1bv of 0100
#symload rmapref$cbv with gasq_rmapref$c1bv of 0100
*)
//
(* ****** ****** *)
(* ****** ****** *)
//
fun
<x0:vt>
imapref$fopr0(ni, ~x0): x0
fun
<x0:vt>
imapref$fopr1x
(i0: ni, ref: &x0 >> x0): void
//
//
fun
<xs:t0>
<x0:vt>
gasq_imapref(xs: xs): void
fun
<xs:t0>
<x0:vt>
gasq_imapref$c2bv
(xs: xs, fopr: (ni, ~x0)->(x0)): void
//
(*
#symload imapref with gasq_imapref$c2bv of 0100
#symload imapref$cbv with gasq_imapref$c2bv of 0100
*)
//
(* ****** ****** *)
(* ****** ****** *)
//
fun
<x0:vt>
irmapref$fopr0(ni, ~x0): x0
fun
<x0:vt>
irmapref$fopr1x
(i0: ni, ref: &x0 >> x0): void
//
//
fun
<xs:t0>
<x0:vt>
gasq_irmapref(xs: xs): void
fun
<xs:t0>
<x0:vt>
gasq_irmapref$c2bv
(xs: xs, fopr: (ni, ~x0)->(x0)): void
//
(*
#symload irmapref with gasq_irmapref$c2bv of 0100
#symload irmapref$cbv with gasq_irmapref$c2bv of 0100
*)
//
(* ****** ****** *)
(* ****** ****** *)
//
(*
HX-2026-01-05:
Mon Jan  5 06:44:09 PM EST 2026
*)
fun
<xs:t0>
<x0:t0>
gasq_sortedq(xs: xs): bool
fun
<xs:t0>
<x0:t0>
gasq_sortedq$f2un
(xs: xs, lteq: (x0, x0) -> bool): bool
#symload gasq_sortedq with gasq_sortedq$f2un of 0100
//
(* ****** ****** *)
(* ****** ****** *)
//
(***********************************************************************)
(* end of [ATS3/XANADU_prelude_SATS_gasq001.sats] *)
(***********************************************************************)

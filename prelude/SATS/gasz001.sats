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
gasz_listize
 ( xs: xs ): list_vt(x0)
fun
<xs:t0>
<x0:vt>
gasz_rlistize
 ( xs: xs ): list_vt(x0)
//
(* ****** ****** *)
//
fun
<xs:t0>
<x0:vt>
gasz_strmize
 ( xs: xs ): strm_vt(x0)
fun
<xs:t0>
<x0:vt>
gasz_rstrmize
 ( xs: xs ): strm_vt(x0)
//
fun
<xs:t0>
<x0:vt>
gasz_strqize
 ( xs: xs ): strq_vt(x0)
fun
<xs:t0>
<x0:vt>
gasz_rstrqize
 ( xs: xs ): strq_vt(x0)
//
(* ****** ****** *)
(* ****** ****** *)
//
fun
<xs:t0>
<x0:vt>
gasz_forall(xs: xs): bool
fun
<xs:t0>
<x0:vt>
gasz_exists(xs: xs): bool
fun
<xs:t0>
<x0:vt>
gasz_rforall(xs: xs): bool
fun
<xs:t0>
<x0:vt>
gasz_rexists(xs: xs): bool
//
fun
<xs:t0>
<x0:vt>
gasz_iforall(xs: xs): bool
fun
<xs:t0>
<x0:vt>
gasz_irforall(xs: xs): bool
//
(*
#symload forall with gasz_forall of 0100
#symload exists with gasz_exists of 0100
#symload rforall with gasz_rforall of 0100
#symload rexists with gasz_rexists of 0100
*)
//
fun
<xs:t0>
<x0:vt>
gasz_forall$f1un
(xs: xs, test: (!x0)->bool): bool
//
(*
#symload forall with gasz_forall$f1un of 0100
#symload forall$fun with gasz_forall$f1un of 0100
*)
//
fun
<xs:t0>
<x0:vt>
gasz_exists$f1un
(xs: xs, test: (!x0)->bool): bool
//
(*
#symload exists with gasz_exists$f1un of 0100
#symload exists$fun with gasz_exists$f1un of 0100
*)
//
fun
<xs:t0>
<x0:vt>
gasz_rforall$f1un
(xs: xs, test: (!x0)->bool): bool
//
(*
#symload rforall with gasz_rforall$f1un of 0100
#symload rforall$fun with gasz_rforall$f1un of 0100
*)
//
fun
<xs:t0>
<x0:vt>
gasz_rexists$f1un
(xs: xs, test: (!x0)->bool): bool
//
(*
#symload rexists with gasz_rexists$f1un of 0100
#symload rexists$fun with gasz_rexists$f1un of 0100
*)
//
(* ****** ****** *)
(* ****** ****** *)
//
(*
HX-2024-07-25:
Thu 25 Jul 2024 01:47:26 PM EDT
*)
//
fun
<x0:vt>
mapref$fopr0(~x0): x0
fun
<x0:vt>
mapref$fopr1(!x0): x0
fun
<x0:vt>
mapref$fopr1r
( ref: &x0 >> x0 ): void
(*
fun
<x0:vt>
mapref$fopr01r//ini
( ref: &(?x0) >> x0 ): void
fun
<x0:vt>
mapref$fopr10r//clr
( ref: &(?x0) << x0 ): void
*)
//
fun
<xs:t0>
<x0:vt>
gasz_mapref(xs: xs): void
fun
<xs:t0>
<x0:vt>
gasz_mapref_c1bv
(xs: xs, fopr: (~x0)->(x0)): void
//
(*
#symload mapref with gasz_mapref_c1bv of 0100
#symload mapref_cbv with gasz_mapref_c1bv of 0100
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
imapref$fopr1(ni, !x0): x0
fun
<x0:vt>
imapref$fopr1r
(i0: ni, ref: &x0 >> x0): void
//
//
fun
<xs:t0>
<x0:vt>
gasz_imapref(xs: xs): void
fun
<xs:t0>
<x0:vt>
gasz_imapref_c2bv
(xs: xs, fopr: (ni, ~x0)->(x0)): void
//
(*
#symload imapref with gasz_imapref_c2bv of 0100
#symload imapref_cbv with gasz_imapref_c2bv of 0100
*)
//
(* ****** ****** *)
(* ****** ****** *)
//
(* ****** ****** *)(* ****** ****** *)
(* ****** ****** *)(* ****** ****** *)

(* end of [ATS3/XANADU_prelude_SATS_gasz001.sats] *)

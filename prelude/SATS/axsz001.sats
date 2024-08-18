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
(* ****** ****** *)
//
(*
Author: Hongwei Xi
Mon 12 Aug 2024 09:34:49 PM EDT
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
<a:vt>
a1sz_forall(A: a1sz(a)): bool
fun
<a:vt>
a1sz_forall_f1un
(A: a1sz(a), test: (!a) -> bool): bool
//
#symload forall with a1sz_forall of 1000
#symload forall with a1sz_forall_f1un of 1000
//
(* ****** ****** *)
//
fun
<a:vt>
a1sz_rforall(A: a1sz(a)): bool
fun
<a:vt>
a1sz_rforall_f1un
(A: a1sz(a), test: (!a) -> bool): bool
//
#symload rforall with a1sz_rforall of 1000
#symload rforall with a1sz_rforall_f1un of 1000
//
(* ****** ****** *)
(* ****** ****** *)
//
(*
HX-2024-08-17:
Sat 17 Aug 2024 07:25:27 PM EDT
*)
//
(*
fun
<x0:vt>
a1sz_fmake((*void*)): a1sz(x0)
*)
fun
<x0:vt>
a1sz_fmake_fwork
( fwork
: ((~x0)->void) -> void): a1sz(x0)//HX:3rd-order!
//
(* ****** ****** *)
(* ****** ****** *)
//
//
(*
HX-2024-08-17:
Sat 17 Aug 2024 11:43:41 PM EDT
*)
//
fun
<xs:t0>
<x0:vt>
<y0:vt>
gasz_map_a1sz(xs: xs): a1sz(y0)
fun
<xs:t0>
<x0:vt>
<y0:vt>
gasz_map_la1sz(xs: xs): a1sz_vt(y0)
//
(* ****** ****** *)
//
fun
<xs:t0>
<x0:vt>
<y0:vt>
gasz_map_f1un_a1sz
(xs: xs, fopr: (!x0)->(y0)): a1sz(y0)
#symload map_a1sz with gasz_map_f1un_a1sz of 0100
//
fun
<xs:t0>
<x0:vt>
<y0:vt>
gasz_map_f1un_la1sz
(xs: xs, fopr: (!x0)->(y0)): a1sz_vt(y0)
#symload map_la1sz with gasz_map_f1un_la1sz of 0100
//
(* ****** ****** *)
(* ****** ****** *)
//
(* ****** ****** *)(* ****** ****** *)
(* ****** ****** *)(* ****** ****** *)

(* end of [ATS3/XANADU_prelude_SATS_axsz001.sats] *)

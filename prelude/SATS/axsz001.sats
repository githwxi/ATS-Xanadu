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
a1sz_strmize
  (A: a1sz(a)): strm_vt(a)
//
#symload strmize with a1sz_strmize of 1000
//
(* ****** ****** *)
(* ****** ****** *)
//
fun
<a:vt>
a1sz_forall(A: a1sz(a)): bool
fun
<a:vt>
a1sz_forall$f1un
(A: a1sz(a), test: (!a) -> bool): bool
//
#symload forall with a1sz_forall of 1000
#symload forall with a1sz_forall$f1un of 1000
//
(* ****** ****** *)
//
fun
<a:vt>
a1sz_rforall(A: a1sz(a)): bool
fun
<a:vt>
a1sz_rforall$f1un
(A: a1sz(a), test: (!a) -> bool): bool
//
#symload rforall with a1sz_rforall of 1000
#symload rforall with a1sz_rforall$f1un of 1000
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
(
fwork:
((~x0)->void)->void): a1sz(x0)//HX:3rd-order!
//
(* ****** ****** *)
(* ****** ****** *)
//
(*
HX-2024-08-18:
Sun 18 Aug 2024 08:55:31 AM EDT
*)
//
fun
<x0:vt>
a1sz_mapref(A: a1sz(x0)): void
fun
<x0:vt>
a1sz_mapref_c1bv
(A: a1sz(x0), fopr: (~x0)->(x0)): void
(*
fun
<x0:vt>
a1sz_mapref_c1br
(A: a1sz(x0), fopr: (&x0)->void): void
*)
//
#symload mapref with a1sz_mapref of 1000
#symload mapref with a1sz_mapref_c1bv of 1000
(*
#symload mapref with a1sz_mapref_c1br of 1000
*)
//
fun
<x0:vt>
a1sz_imapref(A: a1sz(x0)): void
fun
<x0:vt>
a1sz_imapref_c2bv
(A: a1sz(x0), fopr: (ni,~x0)->(x0)): void
(*
fun
<x0:vt>
a1sz_imapref_c2br
(A: a1sz(x0), fopr: (ni,&x0)->void): void
*)
#symload imapref with a1sz_imapref of 1000
#symload imapref with a1sz_imapref_c2bv of 1000
(*
#symload imapref with ia1sz_mapref_c2br of 1000
*)
//
(* ****** ****** *)
(* ****** ****** *)
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
gasz_map$f1un_a1sz
(xs: xs, fopr: (!x0)->(y0)): a1sz(y0)
#symload map_a1sz with gasz_map$f1un_a1sz of 0100
(*
HX-2024-08-18:
This is another way to name the function:
#symload map_a1sz with gasz_map_a1sz_$f1un of 0100
*)
//
(* ****** ****** *)
//
fun
<xs:t0>
<x0:vt>
<y0:vt>
gasz_map$f1un_la1sz
(xs: xs, fopr: (!x0)->(y0)): a1sz_vt(y0)
#symload map_la1sz with gasz_map$f1un_la1sz of 0100
//
(* ****** ****** *)
(* ****** ****** *)
//
(* ****** ****** *)(* ****** ****** *)
(* ****** ****** *)(* ****** ****** *)

(* end of [ATS3/XANADU_prelude_SATS_axsz001.sats] *)

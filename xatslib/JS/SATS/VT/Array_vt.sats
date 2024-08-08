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
(*
Thu 25 Jul 2024 10:54:54 PM EDT
*)
Authoremail: gmhwxiATgmailDOTcom
*)
//
(* ****** ****** *)
(* ****** ****** *)
(*
HX-2024-08-08:
Note that jarray_vt(a) can
be refined into jarray_vt(a)!
But we do not do it here as we
do need to keep things simple.
*)
(* ****** ****** *)
(* ****** ****** *)
#staload "./../Array.sats"
(* ****** ****** *)
(* ****** ****** *)
//
fcast
UN_jsarray_t2vt
 {a:vt}
(jsarray(a)): jsarray_vt(a)
//
fcast
UN_jsarray_vt2t
 {a:vt}
(!jsarray_vt(a)): jsarray(a)
//
(* ****** ****** *)
(* ****** ****** *)
//
(*
HX-2024-07-26:
Fri 26 Jul 2024 10:52:28 AM EDT
*)
//
fun<>
jsarray_vt_make_jsarray
 {a:vt}
(jsarray(a)): jsarray_vt(a)
//
#symload
jsarray_vt with
jsarray_vt_make_jsarray of 1000
//
(* ****** ****** *)
(* ****** ****** *)
//
fun<>
jsarray_vt_make_ncpy
 {a:t0}
(n0: nint, x0: a):jsarray_vt(a)
//
(* ****** ****** *)
(* ****** ****** *)
//
fun<>
jsarray_vt_make0_1val
 {a:vt}( x: a ): jsarray_vt(a)
fun<>
jsarray_vt_make0_2val
 {a:vt}( a, a ): jsarray_vt(a)
fun<>
jsarray_vt_make0_3val
 {a:vt}( a, a, a ): jsarray_vt(a)
//
#symload
jsarray_vt with jsarray_vt_make0_1val of 1000
#symload
jsarray_vt with jsarray_vt_make0_2val of 1000
#symload
jsarray_vt with jsarray_vt_make0_3val of 1000
//
(* ****** ****** *)
(* ****** ****** *)
//
(*
HX-2024-07-25:
[fwork] may be linear
in the future!
#vwtpdef
fwork_vt(a:vt) =
((~a)-<lcfr>void)->void
*)
//
fun<>
jsarray_vt_make_fwork
{a:vt}
(fwork: ~fwork(a)): jsarray_vt(a)
//
#symload
jsarray_vt with jsarray_vt_make_fwork of 1000
//
(* ****** ****** *)
//
fun<>
jsarray_vt_make0_lstrm
 {a:vt}
(xs: ~strm_vt(a)):jsarray_vt(a)
fun<>
jsarray_vt_make0_lstrq
 {a:vt}
(xs: ~strq_vt(a)):jsarray_vt(a)
//
#symload
jsarray_vt with jsarray_vt_make0_lstrm of 1000
#symload
jsarray_vt with jsarray_vt_make0_lstrq of 1000
//
(* ****** ****** *)
(* ****** ****** *)
//
fun<>
jsarray_vt_length1
 {a:vt}
(A: !jsarray_vt(a)): nint
//
#symload length1 with jsarray_vt_length1 of 1000
//
(* ****** ****** *)
(* ****** ****** *)
//
fun<>
jsarray_vt_get1_at
 {a:t0}//HX: it's t0; not vt
(A: !jsarray_vt(a), i:nint): (a)
fun<>
jsarray_vt_set1_at
 {a:t0}//HX: it's t0; not vt
(A: !jsarray_vt(a), i:nint, x:a): void
//
#symload get1_at with jsarray_vt_get1_at of 1000
#symload set1_at with jsarray_vt_set1_at of 1000
//
(* ****** ****** *)
(* ****** ****** *)
(*
//
HX-2024-07-25:
Shall we come back here
when dependent type-checking
is supported?
Thu 25 Jul 2024 06:42:41 AM EDT
//
fun<>
jsarray_vt_getn1_at
 {a:t0}{n:nat}
(A:
!jsarray_vt(a,n), i:nintlt(n)): (a)
fun<>
jsarray_vt_setn1_at
 {a:t0}{n:nat}
(A:
!jsarray_vt(a,n), i:nintlt(n), x:a): void
//
#symload getn_at with jsarray_vt_getn1_at of 1000
#symload setn_at with jsarray_vt_setn1_at of 1000
//
*)
(* ****** ****** *)
(* ****** ****** *)
//
fun<>
jsarray_vt_strmize0
{a:vt}
(A: ~jsarray_vt(a)): strm_vt(a)
fun<>
jsarray_vt_strqize0
{a:vt}
(A: ~jsarray_vt(a)): strq_vt(a)
//
#symload strmize0 with jsarray_vt_strmize0 of 1000
#symload strqize0 with jsarray_vt_strqize0 of 1000
//
(* ****** ****** *)
(* ****** ****** *)
//
fun
<a:vt>
jsarray_vt_forall1
(A: !jsarray_vt(a)): bool
//
fun<>
jsarray_vt_forall1_c1fr
 {a:vt}
( A: !jsarray_vt(a)
, test: (~a)-<cfr>bool): bool
//
#symload
forall0 with jsarray_vt_forall0 of 1000
#symload
forall0 with jsarray_vt_forall0_c1fr of 1000
//
(* ****** ****** *)
//
fun
<a:vt>
jsarray_vt_rforall1
( A: !jsarray_vt(a)): bool
fun<>
jsarray_vt_rforall1_c1fr
 {a:vt}
( A: !jsarray_vt(a)
, test: (~a)-<cfr>bool): bool
//
#symload
rforall0 with jsarray_vt_rforall0 of 1000
#symload
rforall0 with jsarray_vt_rforall0_c1fr of 1000
//
(* ****** ****** *)
(* ****** ****** *)
//
fun
<a:vt>
jsarray_vt_mapref1
( A: !jsarray_vt(a)): void
fun<>
jsarray_vt_mapref1_c1fr
 {a:vt}
( A: !jsarray_vt(a)
, fopr: (~a)-<cfr>(a)): void
//
#symload
mapref1 with jsarray_vt_mapref1 of 1000
#symload
mapref1 with jsarray_vt_mapref1_c1fr of 1000
//
(* ****** ****** *)
(* ****** ****** *)
//
fun
<a:vt>
jsarray_vt_sortref1
(A: !jsarray_vt(a)): void
fun<>
jsarray_vt_sortref1_c2fr
 {a:vt}
( A: !jsarray_vt(a)
, cmpr: (!a, !a)-<cfr>sint): void
//
#symload
sortref1 with jsarray_vt_sortref1 of 1000
#symload
sortref1 with jsarray_vt_sortref1_c2fr of 1000
//
(* ****** ****** *)
(* ****** ****** *)
//
(* ****** ****** *)(* ****** ****** *)(* ****** ****** *)
(* ****** ****** *)(* ****** ****** *)(* ****** ****** *)

(* end of [ATS3/XANADU_xatslib_JS_SATS_VT_Array_vt.sats] *)

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
Sat 20 Jul 2024 09:41:27 PM EDT
*)
Authoremail: gmhwxiATgmailDOTcom
*)
//
(* ****** ****** *)
(* ****** ****** *)
(*
HX-2024-08:
JS arrays are dynamic!
So we cannot have the
an index type for capturing
the size of such an array.
*)
(* ****** ****** *)
(* ****** ****** *)
#abstbox
jsarray_tbox(a:vt)
#absvtbx
jsarray_vtbx(a:vt)
(* ****** ****** *)
#typedef
jsarray(a:vt) = jsarray_tbox(a)
#vwtpdef
jsarray_vt(a:vt) = jsarray_vtbx(a)
(* ****** ****** *)
(* ****** ****** *)
//
fcast
jsarray_vt2t
 {a:vt}
(jsarray_vt(a)): jsarray(a)
//
(* ****** ****** *)
(* ****** ****** *)
//
fun<>
jsarray_make_ncpy
 {a:t0}
(n0: nint, x0: a): jsarray(a)
//
fun<>
jsarray_make_nfun
 {a:vt}{n:nat}
( n0: sint(n)
, f0: nintlt(n) -> (a)):jsarray(a)
//
(* ****** ****** *)
(* ****** ****** *)
//
fun<>
jsarray_make0_1val
 {a:vt}( x: a ): jsarray(a)
fun<>
jsarray_make0_2val
 {a:vt}( a, a ): jsarray(a)
fun<>
jsarray_make0_3val
 {a:vt}( a, a, a ): jsarray(a)
//
#symload
jsarray with jsarray_make0_1val of 1000
#symload
jsarray with jsarray_make0_2val of 1000
#symload
jsarray with jsarray_make0_3val of 1000
//
(* ****** ****** *)
(* ****** ****** *)
//
(*
HX-2024-07-25:
[fwork] may be linear
in the future!
*)
#typedef
fwork(a:vt) =
((~a)->void)->void
//
fun<>
jsarray_fmake_fwork
{a:vt}
(fwork: fwork(a)): jsarray(a)
//
#symload
jsarray with jsarray_fmake_fwork of 1000
//
(* ****** ****** *)
//
fun<>
jsarray_make0_lstrm
 {a:vt}
(xs: ~strm_vt(a)):jsarray(a)
fun<>
jsarray_make0_lstrq
 {a:vt}
(xs: ~strq_vt(a)):jsarray(a)
//
#symload
jsarray with jsarray_make0_lstrm of 1000
#symload
jsarray with jsarray_make0_lstrq of 1000
//
(* ****** ****** *)
(* ****** ****** *)
//
fun<>
jsarray_length
 {a:vt}
(A: jsarray(a)): nint
//
#symload length with jsarray_length of 1000
//
(* ****** ****** *)
(* ****** ****** *)
//
fun<>
jsarray_get$at
 {a:t0}//HX: t0(not vt)
(A:jsarray(a), i:nint): (a)
fun<>
jsarray_set$at
 {a:t0}//HX: t0(not vt)
(A:jsarray(a), i:nint, x:a): void
//
#symload get$at with jsarray_get$at of 1000
#symload set$at with jsarray_set$at of 1000
//
(* ****** ****** *)
(* ****** ****** *)
//
fun<>
jsarray_forall_f1un
 {a:vt}
( A: jsarray(a)
, test: (!a) -> bool): bool
//
#symload
forall with jsarray_forall_f1un of 1000
//
fun<>
jsarray_rforall_f1un
 {a:vt}
( A: jsarray(a)
, test: (!a) -> bool): bool
//
#symload
rforall with jsarray_rforall_f1un of 1000
//
fun<>
jsarray_iforall_f2un
 {a:vt}
( A: jsarray(a)
, test: (nint, !a) -> bool): bool
//
#symload
iforall with jsarray_iforall_f2un of 1000
//
(* ****** ****** *)
(* ****** ****** *)
//
fun<>
jsarray_mapref_f1un
 {a:vt}
( A: jsarray(a)
, fopr: (~a) -> (a)): void
//
#symload
mapref with jsarray_mapref_f1un of 1000
//
(* ****** ****** *)
(* ****** ****** *)
//
fun
<a:vt>
jsarray_sortref
(A: jsarray(a)): void
fun<>
jsarray_sortref_f2un
 {a:vt}
( A: jsarray(a)
, cmpr: (!a, !a) -> sint): void
//
#symload
sortref with jsarray_sortref of 1000
#symload
sortref with jsarray_sortref_f2un of 1000
//
(* ****** ****** *)
(* ****** ****** *)
//
(*
HX-2024-07-29:
Mon 29 Jul 2024 11:19:25 PM EDT
*)
//
fcast // fun
GSEQ_make_jsarray
{a:t0}
(A:jsarray(a)): GSEQ(jsarray(a), a)
#symload GSEQ with GSEQ_make_jsarray of 1000
fcast // fun
GASZ_make_jsarray
{a:vt}
(A:jsarray(a)): GASZ(jsarray(a), a)
#symload GASZ with GASZ_make_jsarray of 1000
//
(* ****** ****** *)
(* ****** ****** *)
//
(*
HX-2024-08-09:
Fri 09 Aug 2024 08:24:11 AM EDT
*)
//
#absvwtp jsarray_iter(a:vt)
//
(*
HX: This is like jsarray_istrmize
*)
fun
jsarray_iter_next
 {a:vt}
(jsarray_iter(a)): optn_vt@(nint,a)
//
(* ****** ****** *)
(* ****** ****** *)
//
(* ****** ****** *)(* ****** ****** *)
(* ****** ****** *)(* ****** ****** *)

(* end of [ATS3/XANADU_xatslib_JS_SATS_Array.sats] *)

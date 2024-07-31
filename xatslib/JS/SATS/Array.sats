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
#abstype
jsarray_tbox(a:vt,n:i0)
#absvwtp
jsarray_vtbx(a:vt,n:i0)
(* ****** ****** *)
#typedef
jsarray
(a:vt,n:i0) = jsarray_tbox(a,n)
#typedef
jsarray(a:vt) = [n:i0] jsarray(a,n)
(* ****** ****** *)
#vwtpdef
jsarray_vt
(a:vt,n:i0) = jsarray_vtbx(a,n)
#vwtpdef
jsarray_vt(a:vt) = [n:i0] jsarray_vt(a,n)
(* ****** ****** *)
(* ****** ****** *)
//
fcast
jsarray_vt2t
 {a:vt}{n:i0}
(jsarray_vt(a,n)): jsarray(a,n)
//
(* ****** ****** *)
(* ****** ****** *)
//
fun<>
jsarray_make_ncpy
 {a:t0}{n:nat}
(n: sint(n), x: a):jsarray(a,n)
//
fun<>
jsarray_make_nfun
 {a:t0}{n:nat}
( n: sint(n)
, f: nintlt(n)-<cfr>a):jsarray(a,n)
//
(* ****** ****** *)
(* ****** ****** *)
//
fun<>
jsarray_make0_1val
 {a:vt}
( x: a ): jsarray(a, 1)
fun<>
jsarray_make0_2val
 {a:vt}
( a, a ): jsarray(a, 2)
fun<>
jsarray_make0_3val
 {a:vt}
( a, a, a ): jsarray(a, 3)
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
[fwork] is linear!
*)
#vwtpdef
fwork(a:vt) =
((~a)-<cfr>void)->void
//
fun<>
jsarray_make0_fwork
{a:vt}
(fwork: ~fwork(a)): jsarray(a)
//
#symload
jsarray with jsarray_make0_fwork of 1000
//
(* ****** ****** *)
//
fun<>
jsarray_make0_lstrm
 {a:vt}
(xs: ~strm_vt(a)):jsarray(a)
fun<>
jsarray_make0_lstrq
 {a:vt}{n:nat}
(xs: ~strq_vt(a,n)):jsarray(a,n)
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
 {a:vt}{n:nat}
(A: jsarray(a,n)): sint(n)
//
#symload length with jsarray_length of 1000
//
(* ****** ****** *)
(* ****** ****** *)
//
fun<>
jsarray_get_at
 {a:t0}//HX: t0(not vt)
(A:jsarray(a), i:nint): (a)
fun<>
jsarray_set_at
 {a:t0}//HX: t0(not vt)
(A:jsarray(a), i:nint, x:a): void
//
#symload get_at with jsarray_get_at of 1000
#symload set_at with jsarray_set_at of 1000
//
(* ****** ****** *)
(* ****** ****** *)
(*
//
HX-2024-07-25:
We will come back here
when dependent type-checking
is supported!
Thu 25 Jul 2024 06:42:41 AM EDT
//
fun<>
jsarray_getn_at
 {a:t0}{n:nat}
(A:jsarray(a,n), i:nintlt(n)): (a)
fun<>
jsarray_setn_at
 {a:t0}{n:nat}
(A:jsarray(a,n), i:nintlt(n), x:a): void
//
#symload getn_at with jsarray_getn_at of 1000
#symload setn_at with jsarray_setn_at of 1000
//
*)
(* ****** ****** *)
(* ****** ****** *)
//
fun<>
jsarray_strmize
{a:vt}
(A: jsarray(a)): strm_vt(a)
fun<>
jsarray_strqize
{a:vt}{n:i0}
(A: jsarray(a,n)): strq_vt(a,n)
//
#symload strmize with jsarray_strmize of 1000
#symload strqize with jsarray_strqize of 1000
//
(* ****** ****** *)
(* ****** ****** *)
//
fun
<a:vt>
jsarray_forall
( A: jsarray(a)): bool
//
fun<>
jsarray_forall_c1fr
 {a:vt}
( A: jsarray(a)
, test: (!a)-<cfr>bool): bool
//
#symload
forall with jsarray_forall of 1000
#symload
forall with jsarray_forall_c1fr of 1000
//
(* ****** ****** *)
//
fun
<a:vt>
jsarray_rforall
( A: jsarray(a)): bool
fun<>
jsarray_rforall_c1fr
 {a:vt}
( A: jsarray(a)
, test: (!a)-<cfr>bool): bool
//
#symload
rforall with jsarray_rforall of 1000
#symload
rforall with jsarray_rforall_c1fr of 1000
//
(* ****** ****** *)
(* ****** ****** *)
//
fun
<a:vt>
jsarray_mapref
( A: jsarray(a)): void
fun<>
jsarray_mapref_c1fr
 {a:vt}
( A: jsarray(a)
, fopr: (~a)-<cfr>(a)): void
//
#symload
mapref with jsarray_mapref of 1000
#symload
mapref with jsarray_mapref_c1fr of 1000
//
(* ****** ****** *)
(* ****** ****** *)
//
fun
<a:vt>
jsarray_sortref
(A: jsarray(a)): void
fun<>
jsarray_sortref_c2fr
 {a:vt}
( A: jsarray(a)
, cmpr: (!a, !a)-<cfr>sint): void
//
#symload
sortref with jsarray_sortref of 1000
#symload
sortref with jsarray_sortref_c2fr of 1000
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
//
fcast // fun
GASZ_make_jsarray
{a:vt}
(A:jsarray(a)): GASZ(jsarray(a), a)
#symload GASZ with GASZ_make_jsarray of 1000
//
(* ****** ****** *)
(* ****** ****** *)
//
(* ****** ****** *)(* ****** ****** *)
(* ****** ****** *)(* ****** ****** *)

(* end of [ATS3/XANADU_xatslib_JS_SATS_Array.sats] *)

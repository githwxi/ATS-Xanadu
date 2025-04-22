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
#typedef ni = nint
(* ****** ****** *)
(* ****** ****** *)
#staload "./../Array00.dats"
(* ****** ****** *)
(* ****** ****** *)
//
#extern
fcast
UN_jsarray_t2vt
{a:vt}(A: jsa0(a)): jsla(a)
#extern
fcast
UN_jsarray_vt2t
{a:vt}(A: !jsla(a)): jsa0(a)
//
(* ****** ****** *)
(* ****** ****** *)
//
#impltmp
{ a: vt }
g_ptype
<jsla(a)>
( (*void*) ) =
(
pstrn"jsarray_vt(";
g_ptype<a>();pstrn")")
//
(* ****** ****** *)
(* ****** ****** *)
//
#impltmp
{ a: vt }
g_print1
<jsla(a)>
  ( xs ) =
let
//
#vwtpdef x0 = (a)
#vwtpdef xs = jsla(a)
//
#impltmp
gseq_sep<xs><x0>() = ","
#impltmp
gseq_beg<xs><x0>() = "jsarray_vt("
#impltmp
gseq_end<xs><x0>() = ")"
in//let
  gseq_print1<xs><x0>(xs)
end//end-of-[g_print1<jsla(a)>]
//
(* ****** ****** *)
(* ****** ****** *)
//
#extern
fun<>
jsarray_vt_make_ncpy
 {a:t0}(n:nint, x:a): jsla(a)
//
(* ****** ****** *)
(* ****** ****** *)
//
(*
HX-2024-07-26:
Fri 26 Jul 2024 10:52:28 AM EDT
*)
//
#extern
fun<>
jsarray_vt_make_jsarray
 {a:vt}(A: jsa0(a)): jsla(a)
//
#symload
jsarray_vt
with jsarray_vt_make_jsarray of 1000
//
(* ****** ****** *)
(* ****** ****** *)
//
#extern
fun<>
jsarray_vt_make0_1val
 {a:vt}( x1: (a) ): jsla(a)
#extern
fun<>
jsarray_vt_make0_2val
 {a:vt}( x1:a, x2:a ): jsla(a)
#extern
fun<>
jsarray_vt_make0_3val
 {a:vt}( x1:a, x2:a, x3:a ): jsla(a)
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
((~a)-<lfun>void)->void
*)
//
#extern
fun<>
jsarray_vt_make_fwork
{a:vt}
(fwork: ~fwork(a)): jsla(a)
//
#symload
jsarray_vt with jsarray_vt_make_fwork of 1000
//
(* ****** ****** *)
//
#extern
fun<>
jsarray_vt_make0_lstrm
 {a:vt}(xs: ~strm_vt(a)): jsla(a)
#extern
fun<>
jsarray_vt_make0_lstrq
 {a:vt}(xs: ~strq_vt(a)): jsla(a)
//
#symload
jsarray_vt with jsarray_vt_make0_lstrm of 1000
#symload
jsarray_vt with jsarray_vt_make0_lstrq of 1000
//
(* ****** ****** *)
(* ****** ****** *)
//
#extern
fun<>
jsarray_vt_length1
 {a:vt}(A: !jsla(a)): nint
//
#symload length1 with jsarray_vt_length1 of 1000
//
(* ****** ****** *)
(* ****** ****** *)
//
#extern
fun<>
jsarray_vt_get$at1
 {a:t0}//HX: it's t0; not vt
(A: !jsla(a), i:nint): (a)
#extern
fun<>
jsarray_vt_set$at1
 {a:t0}//HX: it's t0; not vt
(A: !jsla(a), i:nint, x:a): void
//
#symload get$at1 with jsarray_vt_get$at1 of 1000
#symload set$at1 with jsarray_vt_set$at1 of 1000
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
#extern
fun<>
jsarray_vt_getn$at1
 {a:t0}{n:nat}
(A: !jsla(a,n), i:nintlt(n)): (a)
#extern
fun<>
jsarray_vt_setn$at1
 {a:t0}{n:nat}
(A: !jsla(a,n), i:nintlt(n), x:a): void
//
#symload getn_at with jsarray_vt_getn$at1 of 1000
#symload setn_at with jsarray_vt_setn$at1 of 1000
//
*)
(* ****** ****** *)
(* ****** ****** *)
//
#extern
fun<>
jsarray_vt_strmize0
{a:vt}(A: ~jsla(a)): strm_vt(a)
#extern
fun<>
jsarray_vt_strqize0
{a:vt}(A: ~jsla(a)): strq_vt(a)
//
#symload strmize0 with jsarray_vt_strmize0 of 1000
#symload strqize0 with jsarray_vt_strqize0 of 1000
//
(* ****** ****** *)
(* ****** ****** *)
//
#extern
fun<>
jsarray_vt_forall1_f1un
 {a:vt}
( A:
! jsla(a)
, test: (~a) -> bool): bool
//
#symload
forall1 with jsarray_vt_forall1_f1un of 1000
//
(* ****** ****** *)
//
#extern
fun<>
jsarray_vt_rforall1_f1un
 {a:vt}
( A:
! jsla(a)
, test: (~a) -> bool): bool
//
#symload
rforall1 with jsarray_vt_rforall1_f1un of 1000
//
(* ****** ****** *)
(* ****** ****** *)
//
#extern
fun<>
jsarray_vt_mapref1_f1un
 {a:vt}
( A:
! jsla(a)
, fopr: (~a) -> (a)): void
#extern
fun<>
jsarray_vt_imapref1_f1un
 {a:vt}
( A:
! jsla(a)
, fopr: (ni, ~a) -> (a)): void
//
#symload
mapref1 with jsarray_vt_mapref1_f1un of 1000
#symload
imapref1 with jsarray_vt_imapref1_f1un of 1000
//
(* ****** ****** *)
(* ****** ****** *)
//
#extern
fun
<a:vt>
jsarray_vt_sortref1
( A: !jsla(a) ): void
#extern
fun<>
jsarray_vt_sortref1_f2un
 {a:vt}
( A:
! jsla(a)
, cmpr: (!a, !a) -> sint): void
//
#symload
sortref1 with jsarray_vt_sortref1 of 1000
#symload
sortref1 with jsarray_vt_sortref1_f2un of 1000
//
(* ****** ****** *)
(* ****** ****** *)
//
#impltmp
{ x0:vt }
gseq_length1
<jsla(x0)><x0> =
jsarray_vt_length1<>{x0}
//
#impltmp
<(*tmp*)>
jsarray_vt_length1
  ( A ) =
(
jsarray_length<>(UN_jsarray_vt2t(A)))
//
(* ****** ****** *)
(* ****** ****** *)
//
#impltmp
{ x0:t0 }
gasz_get$at1
<jsla(x0)><x0> =
jsarray_vt_get$at1<>{x0}(*void*)
#impltmp
{ x0:t0 }
gasz_set$at1
<jsla(x0)><x0> =
jsarray_vt_set$at1<>{x0}(*void*)
//
#impltmp
{ x0:t0 }
$UN.gasz_get$at$raw1
<jsla(x0)><x0> =
jsarray_vt_get$at1<>{x0}(*void*)
#impltmp
{ x0:t0 }
$UN.gasz_set$at$raw1
<jsla(x0)><x0> =
jsarray_vt_set$at1<>{x0}(*void*)
//
#impltmp
<(*tmp*)>
jsarray_vt_get$at1
  {a}(A, i) =
(
jsarray_get$at<>(UN_jsarray_vt2t(A), i))
//
#impltmp
<(*tmp*)>
jsarray_vt_set$at1
  {a}(A, i, x) =
(
jsarray_set$at<>(UN_jsarray_vt2t(A), i, x))
//
(* ****** ****** *)
(* ****** ****** *)
//
#impltmp
<(*tmp*)>
jsarray_vt_make_ncpy
  (n, x) =
(
UN_jsarray_t2vt(jsarray_make_ncpy<>(n, x)))
//
(* ****** ****** *)
(* ****** ****** *)
//
#impltmp
<(*tmp*)>
jsarray_vt_make0_1val
  ( x1 ) =
(
  UN_jsarray_t2vt(jsarray_make0_1val<>(x1)))
//
#impltmp
<(*tmp*)>
jsarray_vt_make0_2val
  (x1, x2) =
UN_jsarray_t2vt(jsarray_make0_2val<>(x1, x2))
//
#impltmp
<(*tmp*)>
jsarray_vt_make0_3val
  (x1, x2, x3) =
UN_jsarray_t2vt(jsarray_make0_3val<>(x1, x2, x3))
//
(* ****** ****** *)
(* ****** ****** *)
//
#impltmp
{ x0:vt }
gseq_strmize0
<jsla(x0)><x0> =
gasz_strmize0<jsla(x0)><x0>(*void*)
//
#impltmp
{ x0:vt }
gseq_rstrmize0
<jsla(x0)><x0> =
gasz_rstrmize0<jsla(x0)><x0>(*void*)
//
(* ****** ****** *)
(* ****** ****** *)
//
#impltmp
{ x0:vt }
gseq_forall1
<jsla(x0)><x0>
  ( A ) =
(
jsarray_vt_forall1_f1un<>
(A
,lam(x)=>forall$test1<x0>(x)))
//
#impltmp
<(*tmp*)>
jsarray_vt_forall1_f1un
  (A, test) =
(
jsarray_forall_f1un<>(UN_jsarray_vt2t(A), test))
//
(* ****** ****** *)
(* ****** ****** *)
//
#impltmp
{ x0:vt }
gseq_rforall1
<jsla(x0)><x0>
  ( A ) =
(
jsarray_vt_rforall1_f1un<>
(A
,lam(x)=>rforall$test1<x0>(x)))
//
#impltmp
<(*tmp*)>
jsarray_vt_rforall1_f1un
  (A, test) =
(
jsarray_rforall_f1un<>(UN_jsarray_vt2t(A), test))
//
(* ****** ****** *)
(* ****** ****** *)
//
#impltmp
<(*tmp*)>
jsarray_vt_mapref1_f1un
  (A, fopr) =
(
jsarray_mapref_f1un<>(UN_jsarray_vt2t(A), fopr))
//
#impltmp
<(*tmp*)>
jsarray_vt_imapref1_f1un
  (A, fopr) =
(
jsarray_imapref_f1un<>(UN_jsarray_vt2t(A), fopr))
//
(* ****** ****** *)
(* ****** ****** *)
//
#impltmp
< a: vt >
jsarray_vt_sortref1
  ( A ) =
(
jsarray_vt_sortref1_f2un<>
(A, lam(x,y)=>g_cmp11<a>(x, y)))
//
#impltmp
<(*tmp*)>
jsarray_vt_sortref1_f2un
  (A, cmpr) =
(
jsarray_sortref_f2un<>(UN_jsarray_vt2t(A), cmpr))
//
(* ****** ****** *)
(* ****** ****** *)
//
(* ****** ****** *)(* ****** ****** *)(* ****** ****** *)
(* ****** ****** *)(* ****** ****** *)(* ****** ****** *)

(* end of [ATS3/XANADU_xatslib_DATS_CATS_JS_VT_Array00_vt.dats] *)

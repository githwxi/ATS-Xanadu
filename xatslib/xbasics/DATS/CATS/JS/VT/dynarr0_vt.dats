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
#staload "./../dynarr0.dats"
(* ****** ****** *)
(* ****** ****** *)
//
#extern
fcast
UN_jsdasz_t2vt
{a:vt}(A: jsa1(a)): jsla(a)
#extern
fcast
UN_jsdasz_vt2t
{a:vt}(A: !jsla(a)): jsa1(a)
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
pstrn"jsdasz_vt(";
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
gseq_beg<xs><x0>() = "jsdasz_vt("
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
jsdasz_vt_make_ncpy
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
jsdasz_vt_make_jsdasz
 {a:vt}(A: jsa1(a)): jsla(a)
//
#symload
jsdasz_vt
with jsdasz_vt_make_jsdasz of 1000
//
(* ****** ****** *)
(* ****** ****** *)
//
#extern
fun<>
jsdasz_vt_make_1val
 {a:vt}( x1: (a) ): jsla(a)
#extern
fun<>
jsdasz_vt_make_2val
 {a:vt}( x1:a, x2:a ): jsla(a)
#extern
fun<>
jsdasz_vt_make_3val
 {a:vt}( x1:a, x2:a, x3:a ): jsla(a)
//
#symload
jsdasz_vt with jsdasz_vt_make_1val of 1000
#symload
jsdasz_vt with jsdasz_vt_make_2val of 1000
#symload
jsdasz_vt with jsdasz_vt_make_3val of 1000
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
jsdasz_vt_make_fwork
{a:vt}
(fwork: ~fwork(a)): jsla(a)
//
#symload
jsdasz_vt with jsdasz_vt_make_fwork of 1000
//
(* ****** ****** *)
//
#extern
fun<>
jsdasz_vt_make_lstrm
 {a:vt}(xs: ~strm_vt(a)): jsla(a)
#extern
fun<>
jsdasz_vt_make_lstrq
 {a:vt}(xs: ~strq_vt(a)): jsla(a)
//
#symload
jsdasz_vt with jsdasz_vt_make_lstrm of 1000
#symload
jsdasz_vt with jsdasz_vt_make_lstrq of 1000
//
(* ****** ****** *)
(* ****** ****** *)
//
#extern
fun<>
jsdasz_vt_length1
 {a:vt}(A: !jsla(a)): nint
//
#symload length1 with jsdasz_vt_length1 of 1000
//
(* ****** ****** *)
(* ****** ****** *)
//
#extern
fun<>
jsdasz_vt_get$at1
 {a:t0}//HX: it's t0; not vt
(A: !jsla(a), i:nint): (a)
#extern
fun<>
jsdasz_vt_set$at1
 {a:t0}//HX: it's t0; not vt
(A: !jsla(a), i:nint, x:a): void
//
#symload get$at1 with jsdasz_vt_get$at1 of 1000
#symload set$at1 with jsdasz_vt_set$at1 of 1000
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
jsdasz_vt_getn$at1
 {a:t0}{n:nat}
(A: !jsla(a,n), i:nintlt(n)): (a)
#extern
fun<>
jsdasz_vt_setn$at1
 {a:t0}{n:nat}
(A: !jsla(a,n), i:nintlt(n), x:a): void
//
#symload getn_at with jsdasz_vt_getn$at1 of 1000
#symload setn_at with jsdasz_vt_setn$at1 of 1000
//
*)
(* ****** ****** *)
(* ****** ****** *)
//
#extern
fun<>
jsdasz_vt_strmize0
{a:vt}(A: ~jsla(a)): strm_vt(a)
#extern
fun<>
jsdasz_vt_strqize0
{a:vt}(A: ~jsla(a)): strq_vt(a)
//
#symload strmize0 with jsdasz_vt_strmize0 of 1000
#symload strqize0 with jsdasz_vt_strqize0 of 1000
//
(* ****** ****** *)
(* ****** ****** *)
//
#extern
fun<>
jsdasz_vt_forall1$f1un
 {a:vt}
( A:
! jsla(a)
, test: (~a) -> bool): bool
//
#symload
forall1 with jsdasz_vt_forall1$f1un of 1000
//
(* ****** ****** *)
//
#extern
fun<>
jsdasz_vt_rforall1$f1un
 {a:vt}
( A:
! jsla(a)
, test: (~a) -> bool): bool
//
#symload
rforall1 with jsdasz_vt_rforall1$f1un of 1000
//
(* ****** ****** *)
(* ****** ****** *)
//
#extern
fun<>
jsdasz_vt_mapref1$f1un
 {a:vt}
( A:
! jsla(a)
, fopr: (~a) -> (a)): void
#extern
fun<>
jsdasz_vt_imapref1$f1un
 {a:vt}
( A:
! jsla(a)
, fopr: (ni, ~a) -> (a)): void
//
#symload
mapref1 with jsdasz_vt_mapref1$f1un of 1000
#symload
imapref1 with jsdasz_vt_imapref1$f1un of 1000
//
(* ****** ****** *)
(* ****** ****** *)
//
#extern
fun
<a:vt>
jsdasz_vt_sortref1
( A: !jsla(a) ): void
#extern
fun<>
jsdasz_vt_sortref1$f2un
 {a:vt}
( A:
! jsla(a)
, cmpr: (!a, !a) -> sint): void
//
#symload
sortref1 with jsdasz_vt_sortref1 of 1000
#symload
sortref1 with jsdasz_vt_sortref1$f2un of 1000
//
(* ****** ****** *)
(* ****** ****** *)
//
#impltmp
{ x0:vt }
gseq_length1
<jsla(x0)><x0> =
jsdasz_vt_length1<>{x0}
//
#impltmp
<(*tmp*)>
jsdasz_vt_length1
  ( A ) =
(
jsdasz_length<>(UN_jsdasz_vt2t(A)))
//
(* ****** ****** *)
(* ****** ****** *)
//
#impltmp
{ x0:t0 }
gasq_get$at1
<jsla(x0)><x0> =
jsdasz_vt_get$at1<>{x0}(*void*)
#impltmp
{ x0:t0 }
gasq_set$at1
<jsla(x0)><x0> =
jsdasz_vt_set$at1<>{x0}(*void*)
//
#impltmp
{ x0:t0 }
$UN.gasq_get$at$raw1
<jsla(x0)><x0> =
jsdasz_vt_get$at1<>{x0}(*void*)
#impltmp
{ x0:t0 }
$UN.gasq_set$at$raw1
<jsla(x0)><x0> =
jsdasz_vt_set$at1<>{x0}(*void*)
//
#impltmp
<(*tmp*)>
jsdasz_vt_get$at1
  {a}(A, i) =
(
jsdasz_get$at<>(UN_jsdasz_vt2t(A), i))
//
#impltmp
<(*tmp*)>
jsdasz_vt_set$at1
  {a}(A, i, x) =
(
jsdasz_set$at<>(UN_jsdasz_vt2t(A), i, x))
//
(* ****** ****** *)
(* ****** ****** *)
//
#impltmp
<(*tmp*)>
jsdasz_vt_make_ncpy
  (n, x) =
(
UN_jsdasz_t2vt(jsdasz_make_ncpy<>(n, x)))
//
(* ****** ****** *)
(* ****** ****** *)
//
#impltmp
<(*tmp*)>
jsdasz_vt_make_1val
  ( x1 ) =
(
  UN_jsdasz_t2vt(jsdasz_make_1val<>(x1)))
//
#impltmp
<(*tmp*)>
jsdasz_vt_make_2val
  (x1, x2) =
UN_jsdasz_t2vt(jsdasz_make_2val<>(x1, x2))
//
#impltmp
<(*tmp*)>
jsdasz_vt_make_3val
  (x1, x2, x3) =
UN_jsdasz_t2vt(jsdasz_make_3val<>(x1, x2, x3))
//
(* ****** ****** *)
(* ****** ****** *)
//
#impltmp
{ x0:vt }
gseq_strmize0
<jsla(x0)><x0> =
gasq_strmize0<jsla(x0)><x0>(*void*)
//
#impltmp
{ x0:vt }
gseq_rstrmize0
<jsla(x0)><x0> =
gasq_rstrmize0<jsla(x0)><x0>(*void*)
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
jsdasz_vt_forall1$f1un<>
(A
,lam(x)=>forall$test1<x0>(x)))
//
#impltmp
<(*tmp*)>
jsdasz_vt_forall1$f1un
  (A, test) =
(
jsdasz_forall$f1un<>(UN_jsdasz_vt2t(A), test))
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
jsdasz_vt_rforall1$f1un<>
(A
,lam(x)=>rforall$test1<x0>(x)))
//
#impltmp
<(*tmp*)>
jsdasz_vt_rforall1$f1un
  (A, test) =
(
jsdasz_rforall$f1un<>(UN_jsdasz_vt2t(A), test))
//
(* ****** ****** *)
(* ****** ****** *)
//
#impltmp
<(*tmp*)>
jsdasz_vt_mapref1$f1un
  (A, fopr) =
(
jsdasz_mapref$f1un<>(UN_jsdasz_vt2t(A), fopr))
//
#impltmp
<(*tmp*)>
jsdasz_vt_imapref1$f1un
  (A, fopr) =
(
jsdasz_imapref$f1un<>(UN_jsdasz_vt2t(A), fopr))
//
(* ****** ****** *)
(* ****** ****** *)
//
#impltmp
< a: vt >
jsdasz_vt_sortref1
  ( A ) =
(
jsdasz_vt_sortref1$f2un<>
(A, lam(x,y)=>g_cmp11<a>(x, y)))
//
#impltmp
<(*tmp*)>
jsdasz_vt_sortref1$f2un
  (A, cmpr) =
(
jsdasz_sortref$f2un<>(UN_jsdasz_vt2t(A), cmpr))
//
(* ****** ****** *)
(* ****** ****** *)
//
(***********************************************************************)
(* end of [ATS3/XANADU_xatslib_DATS_CATS_JS_VT_Array00_vt.dats] *)
(***********************************************************************)

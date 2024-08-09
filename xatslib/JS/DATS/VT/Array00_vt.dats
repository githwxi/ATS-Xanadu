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
Fri 26 Jul 2024 10:56:37 AM EDT
*)
Authoremail: gmhwxiATgmailDOTcom
*)
//
(* ****** ****** *)
(* ****** ****** *)
#staload UN =
"prelude/SATS/VT/unsfx00_vt.sats"
(* ****** ****** *)
(* ****** ****** *)
//
#staload
"./../../SATS/Array.sats"
#staload
"./../../SATS/VT/Array_vt.sats"
//
(* ****** ****** *)
(* ****** ****** *)
#typedef
jsa(a:vt) = jsarray(a)
(* ****** ****** *)
#vwtpdef
jsla(a:vt) = jsarray_vt(a)
(* ****** ****** *)
(* ****** ****** *)
//
#impltmp
{ a: vt }
g_print1<jsla(a)>
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
#impltmp
<(*tmp*)>
jsarray_vt_make_ncpy
  (n, x) =
UN_jsarray_t2vt
(jsarray_make_ncpy<>(n,x))
//
(* ****** ****** *)
(* ****** ****** *)
//
#impltmp
<(*tmp*)>
jsarray_vt_make0_1val
  ( x1 ) =
UN_jsarray_t2vt
(jsarray_make0_1val<>(x1))
//
#impltmp
<(*tmp*)>
jsarray_vt_make0_2val
  (x1, x2) =
UN_jsarray_t2vt
(jsarray_make0_2val<>(x1, x2))
//
#impltmp
<(*tmp*)>
jsarray_vt_make0_3val
  (x1, x2, x3) =
UN_jsarray_t2vt
(jsarray_make0_3val<>(x1, x2, x3))
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
//
#impltmp
{ x0:t0 }
gasz_get$at1
<jsla(x0)><x0> =
jsarray_vt_get$at1<>{x0}
#impltmp
{ x0:t0 }
gasz_set$at1
<jsla(x0)><x0> =
jsarray_vt_set$at1<>{x0}
//
#impltmp
{ x0:t0 }
$UN.gasz_get$at$raw1
<jsla(x0)><x0> =
jsarray_vt_get$at1<>{x0}//safe
#impltmp
{ x0:t0 }
$UN.gasz_set$at$raw1
<jsla(x0)><x0> =
jsarray_vt_set$at1<>{x0}//safe
//
(* ****** ****** *)
(* ****** ****** *)
//
#impltmp
{ x0:vt }
gseq_strmize0
<jsla(x0)><x0> =
gasz_strmize0<jsla(x0)><x0>
//
#impltmp
{ x0:vt }
gseq_rstrmize0
<jsla(x0)><x0> =
gasz_rstrmize0<jsla(x0)><x0>
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
jsarray_forall_f1un<>
(UN_jsarray_vt2t(A), test))//end(impltmp)
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

(* end of [ATS3/XANADU_xatslib_JS_DATS_VT_Array00_vt.dats] *)

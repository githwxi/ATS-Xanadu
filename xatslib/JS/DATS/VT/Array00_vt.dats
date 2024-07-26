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
#typedef
jsa(a:vt,n:i0) = jsarray(a,n)
(* ****** ****** *)
#vwtpdef
jsla(a:vt) = jsarray_vt(a)
#vwtpdef
jsla(a:vt,n:i0) = jsarray_vt(a,n)
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
gseq$sep<xs><x0>() = ","
#impltmp
gseq$beg<xs><x0>() = "jsarray_vt("
#impltmp
gseq$end<xs><x0>() = ")"
in//let
  gseq_print1<xs><x0>(xs)
end//end-of-[g_print1<jsla(a)>]
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
<(*tmp*)>
jsarray_vt_length1
  ( A ) =
(
jsarray_length<>(UN_jsarray_vt2t(A)))
//
#impltmp
{ x0:vt }
gseq_length1
<jsla(x0)><x0> = jsarray_vt_length1<>{x0}
(*
#impltmp
{ x0:vt }
gasz_length1
<jsla(x0)><x0> = jsarray_vt_length1<>{x0}
*)
//
(* ****** ****** *)
(* ****** ****** *)
//
#impltmp
<(*tmp*)>
jsarray_vt_get1_at
  {a}(A, i) =
(
jsarray_get_at<>(UN_jsarray_vt2t(A), i))
//
#impltmp
<(*tmp*)>
jsarray_vt_set1_at
  {a}(A, i, x) =
(
jsarray_set_at<>(UN_jsarray_vt2t(A), i, x))
//
(* ****** ****** *)
(* ****** ****** *)
//
(* ****** ****** *)(* ****** ****** *)(* ****** ****** *)
(* ****** ****** *)(* ****** ****** *)(* ****** ****** *)

(* end of [ATS3/XANADU_xatslib_JS_DATS_VT_Array00_vt.dats] *)

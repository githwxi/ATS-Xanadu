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
Sun 21 Jul 2024 01:21:25 AM EDT
*)
Authoremail: gmhwxiATgmailDOTcom
*)
//
(* ****** ****** *)
(* ****** ****** *)
//
#staload
"./../SATS/Array.sats"
//
(* ****** ****** *)
(* ****** ****** *)
//
(*
#impltmp
< x0:t0 >
jsarray_forall
  ( A ) =
nint_forall<>
(
jsarray_length<>(A)) where
{
#impltmp
forall$test
<nint>( i0 ) =
forall$test<x0>
(jsarray_get_at<x0>(A, i0))}
*)
//
#impltmp
<(*tmp*)>
jsarray_forall
  {a}( A ) =
(
jsarray_forall_c1fr
(A,lam(x)=>forall$test<a>(x)))
//
(* ****** ****** *)
//
#impltmp
<(*tmp*)>
jsarray_rforall
  {a}( A ) =
(
jsarray_rforall_c1fr
(A,lam(x)=>rforall$test<a>(x)))
//
(* ****** ****** *)
(* ****** ****** *)
//
#implfun
jsarray_forall_c1fr
  (A, test) =
(
XATS2JS_jsarray_forall_c1fr(A, test)
) where
{
#extern
fun
XATS2JS_jsarray_forall_c1fr
{ a: t0 }
( A: jsarray(a)
, test: (a)-<cfr>bool): bool = $extnam()
}
//
(* ****** ****** *)
//
#implfun
jsarray_rforall_c1fr
  (A, test) =
(
XATS2JS_jsarray_rforall_c1fr(A, test)
) where
{
#extern
fun
XATS2JS_jsarray_rforall_c1fr
{ a: t0 }
( A: jsarray(a)
, test: (a)-<cfr>bool): bool = $extnam()
}
//
(* ****** ****** *)(* ****** ****** *)
(* ****** ****** *)(* ****** ****** *)

(* end of [ATS3/XANADU_xatslib_JS_DATS_Array.dats] *)

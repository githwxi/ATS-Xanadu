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
Thu 15 Aug 2024 05:05:45 AM EDT
Authoremail: gmhwxiATgmailDOTcom
*)
//
(* ****** ****** *)
(* ****** ****** *)
#absimpl
a1sz_vt_i0_tx
(a: vt, n: i0) = $extbox("jsarray")
#absimpl
a1sz_vt_i0_vx
(a: vt, n: i0) = $extbox("jsarray")
(* ****** ****** *)
(* ****** ****** *)
//
#impltmp
< a: vt >
a1sz_length
 {n:i0}( A ) =
(
XATS2JS_a1sz_length
 {a}{n}( A )) where
{
#extern
fun
XATS2JS_a1sz_length
{a:vt}
{n:i0}(A: a1sz(a, n)): sint(n) = $extnam()
}
//
(* ****** ****** *)
(* ****** ****** *)
//
#impltmp
< a: vt >
a1sz_lget$at
  (A, i) =
(
XATS2JS_a1sz_lget$at
  (A, i)) where
{
#extern
fun
XATS2JS_a1sz_lget$at
{a:vt}
( A
: a1sz(a)
, i: nint): (owed(a) | a) = $extnam()
}
//
#impltmp
< a: vt >
a1sz_lset$at
  (f | A, i, x) =
(
XATS2JS_a1sz_lset$at
  (f | A, i, x)) where
{
#extern
fun
XATS2JS_a1sz_lset$at
{a:vt}
(f:owed(a)
|A:a1sz(a),i:nint,x:a): void = $extnam()
}
//
(* ****** ****** *)
(* ****** ****** *)
//
#impltmp
< a: t0 >
a1sz_make_ncpy
  (n, x) =
(
XATS2JS_a1sz_make_ncpy
  (n, x)) where
{
#extern
fun
XATS2JS_a1sz_make_ncpy
{a:t0}(n:nint, x:a): a1sz(a) = $extnam()
}
//
(* ****** ****** *)
//
#impltmp
< a: vt >
a1sz_make_nfun
  (n, f) =
(
XATS2JS_a1sz_make_nfun
  (n, f)) where
{
#extern
fun
XATS2JS_a1sz_make_nfun
{a:t0}
(n:nint, f:(nint)->(a)): a1sz(a) = $extnam()
}
//
(* ****** ****** *)
(* ****** ****** *)
//
(* ****** ****** *)(* ****** ****** *)
(* ****** ****** *)(* ****** ****** *)

(* end of [ATS3/XANADU_prelude_DATS_CATS_JS_axsz000.dats] *)
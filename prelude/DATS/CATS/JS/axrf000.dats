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
Mon 12 Aug 2024 09:36:20 AM EDT
Authoremail: gmhwxiATgmailDOTcom
*)
//
(* ****** ****** *)
(* ****** ****** *)
#absimpl
a0rf_vt_tx(a:vt) = $extbox("jsarray")
#absimpl
a0rf_vt_vx(a:vt) = $extbox("jsarray")
(* ****** ****** *)
(* ****** ****** *)
//
#impltmp
< a: vt >
a0rf_lget
  ( A ) =
(
XATS2JS_a0rf_lget
  ( A )) where
{
#extern
fun
XATS2JS_a0rf_lget
{a:vt}
( A
: a0rf(a))
: (owed(a) | a) = $extnam()
}
//
#impltmp
< a: vt >
a0rf_lset
(f | A, x) =
(
XATS2JS_a0rf_lset
  (f | A, x)) where
{
#extern
fun
XATS2JS_a0rf_lset
{a:vt}
(f:owed(a)
|A:a0rf(a), x:a): void = $extnam()
}
//
(* ****** ****** *)
//
#impltmp
< a: vt >
a0rf_make_1val
  ( x1 ) =
(
XATS2JS_a0rf_make_1val
  ( x1 )) where
{
#extern
fun
XATS2JS_a0rf_make_1val
{a:vt}( x1: a ): a0rf(a) = $extnam()
}
//
(* ****** ****** *)
(* ****** ****** *)
//
//
#impltmp
< a: vt >
a1rf_lget$at
  (A, i) =
(
XATS2JS_a1rf_lget$at
  (A, i)) where
{
#extern
fun
XATS2JS_a1rf_lget$at
{a:vt}
( A
: a1rf(a)
, i: nint): (owed(a) | a) = $extnam()
}
//
#impltmp
< a: vt >
a1rf_lset$at
  (f | A, i, x) =
(
XATS2JS_a1rf_lset$at
  (f | A, i, x)) where
{
#extern
fun
XATS2JS_a1rf_lset$at
{a:vt}
(f:owed(a)
|A:a1rf(a),i:nint,x:a): void = $extnam()
}
//
(* ****** ****** *)
//
#impltmp
< a: t0 >
a1rf_make_ncpy
  (n, x) =
(
XATS2JS_a1rf_make_ncpy
  (n, x)) where
{
#extern
fun
XATS2JS_a1rf_make_ncpy
{a:t0}(n:nint, x:a): a1rf(a) = $extnam()
}
//
(* ****** ****** *)
//
#impltmp
< a: vt >
a1rf_make_nfun
  (n, f) =
(
XATS2JS_a1rf_make_nfun
  (n, f)) where
{
#extern
fun
XATS2JS_a1rf_make_nfun
{a:t0}
(n:nint, f:(nint)->(a)): a1rf(a) = $extnam()
}
//
(* ****** ****** *)
(* ****** ****** *)
//
(* ****** ****** *)(* ****** ****** *)
(* ****** ****** *)(* ****** ****** *)

(* end of [ATS3/XANADU_prelude_DATS_CATS_JS_axrf000.dats] *)
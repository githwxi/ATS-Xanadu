(***********************************************************************)
(*                                                                     *)
(*                         Applied Type System                         *)
(*                                                                     *)
(***********************************************************************)

(*
** ATS/Xanadu - Unleashing the Potential of Types!
** Copyright (C) 2025 Hongwei Xi, ATS Trustful Software, Inc.
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
Wed Jan  1 03:28:47 PM EST 2025
Authoremail: gmhwxiATgmailDOTcom
*)
//
(* ****** ****** *)
(* ****** ****** *)
//
#absimpl
a0rf_vt_tx
(  a:vt  ) = $extbox("a0rf_tx")
#absimpl
a0rf_vt_vx
(  a:vt  ) = $extbox("a0rf_vx")
//
(* ****** ****** *)
//
#absimpl
a1rf_vt_i0_tx
( a:vt,n:i0 ) = $extbox("a1rf_tx")
#absimpl
a1rf_vt_i0_vx
( a:vt,n:i0 ) = $extbox("a1rf_vx")
//
(* ****** ****** *)
(* ****** ****** *)
//
//
#impltmp
< a: vt >
a0rf_lget
  ( A ) =
(
XATS2PY_a0rf_lget
  ( A )) where
{
#extern
fun
XATS2PY_a0rf_lget
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
XATS2PY_a0rf_lset
  (f | A, x)) where
{
#extern
fun
XATS2PY_a0rf_lset
{a:vt}
(f:owed(a)
|A:a0rf(a), x:a): void = $extnam()
}
//
(* ****** ****** *)
(* ****** ****** *)
//
#impltmp
< a: vt >
a0rf_make_1val
  ( x1 ) =
(
XATS2PY_a0rf_make_1val
  ( x1 )) where
{
#extern
fun
XATS2PY_a0rf_make_1val
{a:vt}( x1: a ): a0rf(a) = $extnam()
}
//
(* ****** ****** *)
(* ****** ****** *)
//
#impltmp
< a: vt >
a1rf_lget$at
  (A, i) =
(
XATS2PY_a1rf_lget$at
  (A, i)) where
{
#extern
fun
XATS2PY_a1rf_lget$at
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
XATS2PY_a1rf_lset$at
  (f | A, i, x)) where
{
#extern
fun
XATS2PY_a1rf_lset$at
{a:vt}
(f:owed(a)
|A:a1rf(a),i:nint,x:a): void = $extnam()
}
//
(* ****** ****** *)
(* ****** ****** *)
//
#impltmp
< a: t0 >
a1rf_make_ncpy
  (n, x) =
(
XATS2PY_a1rf_make_ncpy
  (n, x)) where
{
#extern
fun
XATS2PY_a1rf_make_ncpy
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
XATS2PY_a1rf_make_nfun
  (n, f)) where
{
#extern
fun
XATS2PY_a1rf_make_nfun
{a:t0}
(n:nint, f:(nint)->(a)): a1rf(a) = $extnam()
}
//
(* ****** ****** *)
(* ****** ****** *)
//
(* ****** ****** *)(* ****** ****** *)(* ****** ****** *)
(* ****** ****** *)(* ****** ****** *)(* ****** ****** *)

(* end of [ATS3/XANADU_prelude_DATS_CATS_PY_axrf000.dats] *)

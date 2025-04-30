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
Tue Apr 29 10:15:02 PM EDT 2025
Authoremail: gmhwxiATgmailDOTcom
*)
//
(* ****** ****** *)
(* ****** ****** *)
//
#extern
fun
XATS000_gint_sint2uint
  ( x0: sint ): uint = $extnam()
#extern
fun
XATS000_gint_uint2sint
  ( x0: uint ): sint = $extnam()
//
#impltmp
<(*tmp*)>
gint_sint2uint =
XATS000_gint_sint2uint(*sint->uint*)
#impltmp
<(*tmp*)>
gint_uint2sint =
XATS000_gint_uint2sint(*uint->sint*)
//
(* ****** ****** *)
(* ****** ****** *)
//
#extern
fun
XATS000_gint_neg$sint
{i:int}
( x0
: sint(i)): sint(-i) = $extnam()
#impltmp
<(*tmp*)>
gint_neg$sint = XATS000_gint_neg$sint
//
(* ****** ****** *)
//
#extern
fun
XATS000_gint_abs$sint
{i:int}
( x0
: sint(i)): sint(abs(i)) = $extnam()
#impltmp
<(*tmp*)>
gint_abs$sint = XATS000_gint_abs$sint
//
(* ****** ****** *)
//
#extern
fun
XATS000_gint_suc$sint
{i:int}
( x0
: sint(i)): sint(i+1) = $extnam()
#extern
fun
XATS000_gint_suc$uint
{i:int}
( x0
: uint(i)): uint(i+1) = $extnam()
#impltmp
<(*tmp*)>
gint_suc$sint = XATS000_gint_suc$sint
#impltmp
<(*tmp*)>
gint_suc$uint = XATS000_gint_suc$uint
//
(* ****** ****** *)
//
#extern
fun
XATS000_gint_pre$sint
{i:int}
( x0
: sint(i)): sint(i-1) = $extnam()
#extern
fun
XATS000_gint_pre$uint
{i:int|i>0}
( x0
: uint(i)): uint(i-1) = $extnam()
#impltmp
<(*tmp*)>
gint_pre$sint = XATS000_gint_pre$sint
#impltmp
<(*tmp*)>
gint_pre$uint = XATS000_gint_pre$uint
//
(* ****** ****** *)
//
#extern
fun
XATS000_gint_lnot$uint
(    x:uint    ):uint = $extnam()
#extern
fun
XATS000_gint_lor2$uint
(x:uint, y:uint):uint = $extnam()
#extern
fun
XATS000_gint_land$uint
(x:uint, y:uint):uint = $extnam()
#extern
fun
XATS000_gint_lxor$uint
(x:uint, y:uint):uint = $extnam()
//
#impltmp
<(*tmp*)>
gint_lnot$uint = XATS000_gint_lnot$uint
#impltmp
<(*tmp*)>
gint_lor2$uint = XATS000_gint_lor2$uint
#impltmp
<(*tmp*)>
gint_land$uint = XATS000_gint_land$uint
#impltmp
<(*tmp*)>
gint_lxor$uint = XATS000_gint_lxor$uint
//
(* ****** ****** *)
//
#extern
fun
XATS000_gint_asrn$sint
(x: sint, n: nint):sint = $extnam()
#extern
fun
XATS000_gint_lsln$uint
(x: uint, n: nint):uint = $extnam()
#extern
fun
XATS000_gint_lsrn$uint
(x: uint, n: nint):uint = $extnam()
//
#impltmp
<(*tmp*)>
gint_asrn$sint = XATS000_gint_asrn$sint
#impltmp
<(*tmp*)>
gint_lsln$uint = XATS000_gint_lsln$uint
#impltmp
<(*tmp*)>
gint_lsrn$uint = XATS000_gint_lsrn$uint
//
(* ****** ****** *)
(* ****** ****** *)
//
#extern
fun
XATS000_gint_lt$sint$sint
{i,j:int}
( x
: sint(i)
, y
: sint(j)): bool(i<j) = $extnam()
#impltmp
<(*tmp*)>
gint_lt$sint$sint = XATS000_gint_lt$sint$sint
#extern
fun
XATS000_gint_lt$uint$uint
{i,j:int}
( x
: uint(i)
, y
: uint(j)): bool(i<j) = $extnam()
#impltmp
<(*tmp*)>
gint_lt$uint$uint = XATS000_gint_lt$uint$uint
//
(* ****** ****** *)
//
#extern
fun
XATS000_gint_gt$sint$sint
{i,j:int}
( x
: sint(i)
, y
: sint(j)): bool(i>j) = $extnam()
#impltmp
<(*tmp*)>
gint_gt$sint$sint = XATS000_gint_gt$sint$sint
#extern
fun
XATS000_gint_gt$uint$uint
{i,j:int}
( x
: uint(i)
, y
: uint(j)): bool(i>j) = $extnam()
#impltmp
<(*tmp*)>
gint_gt$uint$uint = XATS000_gint_gt$uint$uint
//
(* ****** ****** *)
//
#extern
fun
XATS000_gint_eq$sint$sint
{i,j:int}
( x
: sint(i)
, y
: sint(j)): bool(i=j) = $extnam()
#impltmp
<(*tmp*)>
gint_eq$sint$sint = XATS000_gint_eq$sint$sint
#extern
fun
XATS000_gint_eq$uint$uint
{i,j:int}
( x
: uint(i)
, y
: uint(j)): bool(i=j) = $extnam()
#impltmp
<(*tmp*)>
gint_eq$uint$uint = XATS000_gint_eq$uint$uint
//
(* ****** ****** *)
//
#extern
fun
XATS000_gint_lte$sint$sint
{i,j:int}
( x
: sint(i)
, y
: sint(j)): bool(i<=j) = $extnam()
#impltmp
<(*tmp*)>
gint_lte$sint$sint = XATS000_gint_lte$sint$sint
#extern
fun
XATS000_gint_lte$uint$uint
{i,j:int}
( x
: uint(i)
, y
: uint(j)): bool(i<=j) = $extnam()
#impltmp
<(*tmp*)>
gint_lte$uint$uint = XATS000_gint_lte$uint$uint
//
(* ****** ****** *)
//
#extern
fun
XATS000_gint_gte$sint$sint
{i,j:int}
( x
: sint(i)
, y
: sint(j)): bool(i>=j) = $extnam()
#impltmp
<(*tmp*)>
gint_gte$sint$sint = XATS000_gint_gte$sint$sint
#extern
fun
XATS000_gint_gte$uint$uint
{i,j:int}
( x
: uint(i)
, y
: uint(j)): bool(i>=j) = $extnam()
#impltmp
<(*tmp*)>
gint_gte$uint$uint = XATS000_gint_gte$uint$uint
//
(* ****** ****** *)
//
#extern
fun
XATS000_gint_neq$sint$sint
{i,j:int}
( x
: sint(i)
, y
: sint(j)): bool(i!=j) = $extnam()
#impltmp
<(*tmp*)>
gint_neq$sint$sint = XATS000_gint_neq$sint$sint
#extern
fun
XATS000_gint_neq$uint$uint
{i,j:int}
( x
: uint(i)
, y
: uint(j)): bool(i!=j) = $extnam()
#impltmp
<(*tmp*)>
gint_neq$uint$uint = XATS000_gint_neq$uint$uint
//
(* ****** ****** *)
//
#extern
fun
XATS000_gint_cmp$sint$sint
{i,j:int}
( x
: sint(i)
, y
: sint(j))
: sint(sgn(i-j)) = $extnam((*self*))
#impltmp
<(*tmp*)>
gint_cmp$sint$sint = XATS000_gint_cmp$sint$sint
//
#extern
fun
XATS000_gint_cmp$uint$uint
{i,j:int}
( x
: uint(i)
, y
: uint(j))
: sint(sgn(i-j)) = $extnam((*self*))
#impltmp
<(*tmp*)>
gint_cmp$uint$uint = XATS000_gint_cmp$uint$uint
//
(* ****** ****** *)
(* ****** ****** *)
//
#extern
fun
XATS000_gint_add$sint$sint
{i,j:int}
( x
: sint(i)
, y
: sint(j)): sint( i+j ) = $extnam()
#impltmp
<(*tmp*)>
gint_add$sint$sint = XATS000_gint_add$sint$sint
//
(* ****** ****** *)
(* ****** ****** *)
//
(***********************************************************************)
(* end of [ATS3/XANADU_srcgen1_prelude_DATS_CATS_gint000.dats] *)
(***********************************************************************)

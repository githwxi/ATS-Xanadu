(***********************************************************************)
(*                                                                     *)
(*                         Applied Type System                         *)
(*                                                                     *)
(***********************************************************************)

(*
** ATS/Xanadu - Unleashing the Potential of Types!
** Copyright (C) 2019 Hongwei Xi, ATS Trustful Software, Inc.
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
// For generic integers
//
(* ****** ****** *)
//
// Author: Hongwei Xi
// Start Time: June, 2019
// Authoremail: gmhwxiATgmailDOTcom
//
(* ****** ****** *)
//
fun
<k:type>
gint_lt
{i,j:int}
( x: gint(k, i)
, y: gint(k, j)): bool(i < j)
#symload < with gint_lt of 200
fun
<k:type>
gint_gt
{i,j:int}
( x: gint(k, i)
, y: gint(k, j)): bool(i > j)
#symload > with gint_gt of 200
fun
<k:type>
gint_eq
{i,j:int}
( x: gint(k, i)
, y: gint(k, j)): bool(i = j)
#symload = with gint_eq of 200
//
fun
<k:type>
gint_lte
{i,j:int}
( x: gint(k, i)
, y: gint(k, j)): bool(i <= j)
#symload <= with gint_lte of 200
fun
<k:type>
gint_gte
{i,j:int}
( x: gint(k, i)
, y: gint(k, j)): bool(i >= j)
#symload >= with gint_gte of 200
fun
<k:type>
gint_neq
{i,j:int}
( x: gint(k, i)
, y: gint(k, j)): bool(i != j)
#symload != with gint_neq of 200
//
(* ****** ****** *)

fun
<k:type>
gint_cmp
{i,j:int}
( x: gint(k, i)
, y: gint(k, j)): sint(sgn(i-j))
#symload cmp with gint_cmp of 200

(* ****** ****** *)
//
fun
<k:type>
gint_add
{i,j:int}
( x: gint(k, i)
, y: gint(k, j)): gint(k, i+j)
fun
<k:type>
gint_sub
{i,j:int}
( x: gint(k, i)
, y: gint(k, j)): gint(k, i-j)
fun
<k:type>
gint_mul
{i,j:int}
( x: gint(k, i)
, y: gint(k, j)): gint(k, i*j)
fun
<k:type>
gint_div
{i,j:int | j != 0}
( x: gint(k, i)
, y: gint(k, j)): gint(k, i/j)
fun
<k:type>
gint_mod
{i,j:int | j >= 1}
( x: gint(k, i)
, y: gint(k, j)): gint(k, mod(i,j))
//
#symload + with gint_add of 200
#symload - with gint_sub of 200
#symload * with gint_mul of 200
#symload / with gint_div of 200
#symload % with gint_mod of 200
//
(* ****** ****** *)
//
fun//<>
gint_lt_sint_sint
{i,j:int}
( x: sint(i)
, y: sint(j)): bool(i<j) = $ext()
#symload < with gint_lt_sint_sint of 220
fun//<>
gint_gt_sint_sint
{i,j:int}
( x: sint(i)
, y: sint(j)): bool(i>j) = $ext()
#symload > with gint_gt_sint_sint of 220
fun//<>
gint_eq_sint_sint
{i,j:int}
( x: sint(i)
, y: sint(j)): bool(i=j) = $ext()
#symload = with gint_eq_sint_sint of 220
//
fun//<>
gint_lte_sint_sint
{i,j:int}
( x: sint(i)
, y: sint(j)): bool(i<=j) = $ext()
#symload <= with gint_lte_sint_sint of 220
fun//<>
gint_gte_sint_sint
{i,j:int}
( x: sint(i)
, y: sint(j)): bool(i>=j) = $ext()
#symload >= with gint_gte_sint_sint of 220
//
fun//<>
gint_neq_sint_sint
{i,j:int}
( x: sint(i)
, y: sint(j)): bool(i!=j) = $ext()
#symload != with gint_neq_sint_sint of 220
//
(* ****** ****** *)
//
fun//<>
gint_cmp_sint_sint
{i,j:int}
( x: sint(i)
, y: sint(j)): sint(sgn(i-j)) = $ext()
#symload cmp with gint_cmp_sint_sint of 220
//
(* ****** ****** *)

fun//<>
gint_add_sint_sint
{i,j:int}
( x: sint(i)
, y: sint(j)): sint(i+j) = $ext()
fun//<>
gint_sub_sint_sint
{i,j:int}
( x: sint(i)
, y: sint(j)): sint(i-j) = $ext()
fun//<>
gint_mul_sint_sint
{i,j:int}
( x: sint(i)
, y: sint(j)): sint(i*j) = $ext()
fun//<>
gint_div_sint_sint
{i,j:int | j != 0}
( x: sint(i)
, y: sint(j)): sint(i/j) = $ext()
fun//<>
gint_mod_sint_sint
{i,j:int | j >= 1}
( x: sint(i)
, y: sint(j)): sint(mod(i,j)) = $ext()
//
#symload + with gint_add_sint_sint of 220
#symload - with gint_sub_sint_sint of 220
#symload * with gint_mul_sint_sint of 220
#symload / with gint_div_sint_sint of 220
#symload % with gint_mod_sint_sint of 220
//
(* ****** ****** *)

fun//<>
gint_add_uint_uint
{i,j:int}
( x: uint(i)
, y: uint(j)): uint(i+j) = $ext()
fun//<>
gint_sub_uint_uint
{i,j:int | i >= j}
( x: uint(i)
, y: uint(j)): uint(i-j) = $ext()
fun//<>
gint_mul_uint_uint
{i,j:int}
( x: uint(i)
, y: uint(j)): uint(i*j) = $ext()
fun//<>
gint_div_uint_uint
{i,j:int | j >= 1}
( x: uint(i)
, y: uint(j)): uint(i/j) = $ext()
fun//<>
gint_mod_uint_uint
{i,j:int | j >= 1}
( x: uint(i)
, y: uint(j)): uint(mod(i,j)) = $ext()
//
#symload + with gint_add_uint_uint of 220
#symload - with gint_sub_uint_uint of 220
#symload * with gint_mul_uint_uint of 220
#symload / with gint_div_uint_uint of 220
#symload % with gint_mod_uint_uint of 220
//
(* ****** ****** *)

(* end of [gint.sats] *)

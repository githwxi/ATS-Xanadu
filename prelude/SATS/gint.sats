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
gint_print(x: gint(k)): void
//
#symload
print with gint_print of 100
//
(* ****** ****** *)
//
fun
<k:type>
gint_lt
{i,j:int}
( x: gint(k, i)
, y: gint(k, j)): bool(i < j)
#symload < with gint_lt of 100
fun
<k:type>
gint_gt
{i,j:int}
( x: gint(k, i)
, y: gint(k, j)): bool(i > j)
#symload > with gint_gt of 100
fun
<k:type>
gint_eq
{i,j:int}
( x: gint(k, i)
, y: gint(k, j)): bool(i = j)
#symload = with gint_eq of 100
//
fun
<k:type>
gint_lte
{i,j:int}
( x: gint(k, i)
, y: gint(k, j)): bool(i <= j)
#symload <= with gint_lte of 100
fun
<k:type>
gint_gte
{i,j:int}
( x: gint(k, i)
, y: gint(k, j)): bool(i >= j)
#symload >= with gint_gte of 100
fun
<k:type>
gint_neq
{i,j:int}
( x: gint(k, i)
, y: gint(k, j)): bool(i != j)
#symload != with gint_neq of 100
//
(* ****** ****** *)

fun
<k:type>
gint_cmp
{i,j:int}
( x: gint(k, i)
, y: gint(k, j)): sint(sgn(i-j))
#symload cmp with gint_cmp of 100

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
#symload + with gint_add of 100
#symload - with gint_sub of 100
#symload * with gint_mul of 100
#symload / with gint_div of 100
#symload % with gint_mod of 100
//
(* ****** ****** *)
//
fun//<>
gint_print_sint
  (x: sint): void = $ext()
fun//<>
gint_print_uint
  (y: uint): void = $ext()
//
#symload
print with gint_print_sint of 110
#symload
print with gint_print_uint of 110
//
(* ****** ****** *)
//
fun//<>
gint_lt_sint_sint
{i,j:int}
( x: sint(i)
, y: sint(j)): bool(i<j) = $ext()
#symload < with gint_lt_sint_sint of 120
fun//<>
gint_gt_sint_sint
{i,j:int}
( x: sint(i)
, y: sint(j)): bool(i>j) = $ext()
#symload > with gint_gt_sint_sint of 120
fun//<>
gint_eq_sint_sint
{i,j:int}
( x: sint(i)
, y: sint(j)): bool(i=j) = $ext()
#symload = with gint_eq_sint_sint of 120
//
fun//<>
gint_lte_sint_sint
{i,j:int}
( x: sint(i)
, y: sint(j)): bool(i<=j) = $ext()
#symload <= with gint_lte_sint_sint of 120
fun//<>
gint_gte_sint_sint
{i,j:int}
( x: sint(i)
, y: sint(j)): bool(i>=j) = $ext()
#symload >= with gint_gte_sint_sint of 120
//
fun//<>
gint_neq_sint_sint
{i,j:int}
( x: sint(i)
, y: sint(j)): bool(i!=j) = $ext()
#symload != with gint_neq_sint_sint of 120
//
(* ****** ****** *)
//
fun//<>
gint_cmp_sint_sint
{i,j:int}
( x: sint(i)
, y: sint(j)): sint(sgn(i-j)) = $ext()
#symload cmp with gint_cmp_sint_sint of 120
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
#symload + with gint_add_sint_sint of 120
#symload - with gint_sub_sint_sint of 120
#symload * with gint_mul_sint_sint of 120
#symload / with gint_div_sint_sint of 120
#symload % with gint_mod_sint_sint of 120
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
#symload + with gint_add_uint_uint of 120
#symload - with gint_sub_uint_uint of 120
#symload * with gint_mul_uint_uint of 120
#symload / with gint_div_uint_uint of 120
#symload % with gint_mod_uint_uint of 120
//
(* ****** ****** *)
//
// For gseq-operations
//
(* ****** ****** *)
//
fun<>
gseq_nilq_sint(ub: sint): bool
fun<>
gseq_nilq_uint(ub: uint): bool
fun<>
gseq_consq_sint(ub: sint): bool
fun<>
gseq_consq_uint(ub: uint): bool
//
#symload nil? with gseq_nilq_sint of 110
#symload nil? with gseq_nilq_uint of 110
#symload cons? with gseq_consq_sint of 110
#symload cons? with gseq_consq_uint of 110
//
(* ****** ****** *)
//
fun<>
gseq_forall_sint(ub: sint): bool
fun<>
gseq_forall_uint(ub: uint): bool
//
#symload forall with gseq_forall_sint of 110
#symload forall with gseq_forall_uint of 110
//
(* ****** ****** *)
//
fun<>
gseq_rforall_sint(ub: sint): bool
fun<>
gseq_rforall_uint(ub: uint): bool
//
#symload rforall with gseq_rforall_sint of 110
#symload rforall with gseq_rforall_uint of 110
//
(* ****** ****** *)

(* end of [gint.sats] *)

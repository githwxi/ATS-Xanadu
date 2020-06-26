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
(*
fun
<k:type>
gint_print(x: gint(k)): void
*)
//
(* ****** ****** *)
//
fun<>
gint_print_sint(x: sint): void
fun<>
gint_print_uint(u: uint): void
//
(* ****** ****** *)
//
fun<>
gint_neg_sint
{i:int}(x: sint(i)): sint(-i)
//
(* ****** ****** *)
//
fun<>
gint_abs_sint
{i:int}(x: sint(i)): sint(abs(i))
//
(* ****** ****** *)
//
fun<>
gint_succ_sint
{i:int}(x: sint(i)): sint(i+1)
fun<>
gint_pred_sint
{i:int}(x: sint(i)): sint(i-1)
//
(* ****** ****** *)
//
fun<>
gint_succ_uint
{i:int}(x: uint(i)): uint(i+1)
fun<>
gint_pred_uint
{i:int|i>0}(x: uint(i)): uint(i-1)
//
(* ****** ****** *)
//
fun<>
gint_lt_sint_sint
{i,j:int}
( x: sint(i)
, y: sint(j)): bool(i<j) // = $ext()
fun<>
gint_gt_sint_sint
{i,j:int}
( x: sint(i)
, y: sint(j)): bool(i>j) // = $ext()
fun<>
gint_eq_sint_sint
{i,j:int}
( x: sint(i)
, y: sint(j)): bool(i=j) // = $ext()
//
fun<>
gint_lte_sint_sint
{i,j:int}
( x: sint(i)
, y: sint(j)): bool(i<=j) // = $ext()
fun<>
gint_gte_sint_sint
{i,j:int}
( x: sint(i)
, y: sint(j)): bool(i>=j) // = $ext()
//
fun<>
gint_neq_sint_sint
{i,j:int}
( x: sint(i)
, y: sint(j)): bool(i!=j) // = $ext()
//
(* ****** ****** *)
//
fun<>
gint_lt_uint_uint
{i,j:int}
( x: uint(i)
, y: uint(j)): bool(i<j) // = $ext()
fun<>
gint_gt_uint_uint
{i,j:int}
( x: uint(i)
, y: uint(j)): bool(i>j) // = $ext()
fun<>
gint_eq_uint_uint
{i,j:int}
( x: uint(i)
, y: uint(j)): bool(i=j) // = $ext()
//
fun<>
gint_lte_uint_uint
{i,j:int}
( x: uint(i)
, y: uint(j)): bool(i<=j) // = $ext()
fun<>
gint_gte_uint_uint
{i,j:int}
( x: uint(i)
, y: uint(j)): bool(i>=j) // = $ext()
//
fun<>
gint_neq_uint_uint
{i,j:int}
( x: uint(i)
, y: uint(j)): bool(i!=j) // = $ext()
//
(* ****** ****** *)
//
fun<>
gint_cmp_sint_sint
{i,j:int}
( x: sint(i)
, y: sint(j)): sint(sgn(i-j)) // = $ext()
//
(* ****** ****** *)
//
fun<>
gint_cmp_uint_uint
{i,j:int}
( x: uint(i)
, y: uint(j)): uint(sgn(i-j)) // = $ext()
//
(* ****** ****** *)

fun<>
gint_add_sint_sint
{i,j:int}
( x: sint(i)
, y: sint(j)): sint(i+j) // = $ext()
fun<>
gint_sub_sint_sint
{i,j:int}
( x: sint(i)
, y: sint(j)): sint(i-j) // = $ext()
fun<>
gint_mul_sint_sint
{i,j:int}
( x: sint(i)
, y: sint(j)): sint(i*j) // = $ext()
fun<>
gint_div_sint_sint
{i,j:int | j != 0}
( x: sint(i)
, y: sint(j)): sint(i/j) // = $ext()
fun<>
gint_mod_sint_sint
{i,j:int | j >= 1}
( x: sint(i)
, y: sint(j)): sint(mod(i,j)) // = $ext()
//
(* ****** ****** *)

fun<>
gint_add_uint_uint
{i,j:int}
( x: uint(i)
, y: uint(j)): uint(i+j) // = $ext()
fun<>
gint_sub_uint_uint
{i,j:int | i >= j}
( x: uint(i)
, y: uint(j)): uint(i-j) // = $ext()
fun<>
gint_mul_uint_uint
{i,j:int}
( x: uint(i)
, y: uint(j)): uint(i*j) // = $ext()
fun<>
gint_div_uint_uint
{i,j:int | j >= 1}
( x: uint(i)
, y: uint(j)): uint(i/j) // = $ext()
fun<>
gint_mod_uint_uint
{i,j:int | j >= 1}
( x: uint(i)
, y: uint(j)): uint(mod(i,j)) // = $ext()
//
(* ****** ****** *)
//
// For gseq-operations
//
(* ****** ****** *)
//
fun<>
gint_nilq_sint(ub: sint): bool
fun<>
gint_consq_sint(ub: sint): bool
//
fun<>
gint_nilq_uint(ub: uint): bool
fun<>
gint_consq_uint(ub: uint): bool
//
#symload nil? with gint_nilq_sint of 110
#symload nil? with gint_nilq_uint of 110
#symload cons? with gint_consq_sint of 110
#symload cons? with gint_consq_uint of 110
//
(* ****** ****** *)
//
fun<>
gint_forall_sint(ub: sint): bool
fun<>
gint_forall_uint(ub: uint): bool
//
#symload forall with gint_forall_sint of 110
#symload forall with gint_forall_uint of 110
//
(* ****** ****** *)
//
fun<>
gint_rforall_sint(ub: sint): bool
fun<>
gint_rforall_uint(ub: uint): bool
//
(* ****** ****** *)

fun<>
gint_listize_nint
{n:nat}
(n0: sint(n)): stream_vt(nintlt(n))
fun<>
gint_rlistize_nint
{n:nat}
(n0: sint(n)): stream_vt(nintlt(n))
fun<>
gint_streamize_nint
{n:nat}
(n0: sint(n)): stream_vt(nintlt(n))

(* ****** ****** *)

fun
<a:vt>
gint_map_list_nint
{n:nat}(n0: sint(n)): list_vt(a, n)

(* ****** ****** *)
//
// HX-2020-05-30:
// symbol overloading for gint
//
(* ****** ****** *)
//
#symload - with gint_neg_sint of 1000

(* ****** ****** *)

#symload abs with gint_abs_sint of 1000

(* ****** ****** *)
//
#symload succ with gint_succ_sint of 1000
#symload pred with gint_pred_sint of 1000
//
#symload succ with gint_succ_uint of 1000
#symload pred with gint_pred_uint of 1000
//
(* ****** ****** *)
//
#symload < with gint_lt_sint_sint of 1000
#symload > with gint_gt_sint_sint of 1000
#symload = with gint_eq_sint_sint of 1000
#symload <= with gint_lte_sint_sint of 1000
#symload >= with gint_gte_sint_sint of 1000
#symload != with gint_neq_sint_sint of 1000
//
#symload < with gint_lt_uint_uint of 1000
#symload > with gint_gt_uint_uint of 1000
#symload = with gint_eq_uint_uint of 1000
#symload <= with gint_lte_uint_uint of 1000
#symload >= with gint_gte_uint_uint of 1000
#symload != with gint_neq_uint_uint of 1000
//
(* ****** ****** *)
//
#symload cmp with gint_cmp_sint_sint of 1000
#symload cmp with gint_cmp_uint_uint of 1000
//
(* ****** ****** *)
//
#symload + with gint_add_sint_sint of 1000
#symload - with gint_sub_sint_sint of 1000
#symload * with gint_mul_sint_sint of 1000
#symload / with gint_div_sint_sint of 1000
#symload % with gint_mod_sint_sint of 1000
//
#symload + with gint_add_uint_uint of 1000
#symload - with gint_sub_uint_uint of 1000
#symload * with gint_mul_uint_uint of 1000
#symload / with gint_div_uint_uint of 1000
#symload % with gint_mod_uint_uint of 1000
//
(* ****** ****** *)
//
#symload print with gint_print_sint of 1000
#symload print with gint_print_uint of 1000
//
(* ****** ****** *)
//
#symload rforall with gint_rforall_sint of 1000
#symload rforall with gint_rforall_uint of 1000
//
(* ****** ****** *)

(* end of [gint.sats] *)

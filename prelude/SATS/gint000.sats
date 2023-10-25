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
(*
#typedef strn = string
*)
(* ****** ****** *)
fun<>
gint_sint2uint(sint): uint
fun<>
gint_uint2sint(uint): sint
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
gint_print_sint(sint): void
fun<>
gint_print_uint(uint): void
//
(* ****** ****** *)
//
fun<>
gint_parse_sint(strn): sint
fun<>
gint_parse_uint(strn): uint
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
gint_lnot_uint(x: uint): uint
fun<>
gint_lor2_uint(x: uint, y: uint): uint
fun<>
gint_land_uint(x: uint, y: uint): uint
fun<>
gint_lxor_uint(x: uint, y: uint): uint
//
(* ****** ****** *)
fun<> // arith r-shift: sign-filling
gint_asrn_sint(x: sint, n: nint): sint
fun<> // logic l-shift: zero-filling
gint_lsln_uint(x: uint, n: nint): uint
fun<> // logic r-shift: zero-filling
gint_lsrn_uint(x: uint, n: nint): uint
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
fun<>
gint_cmp_uint_uint
{i,j:int}
( x: uint(i)
, y: uint(j)): sint(sgn(i-j)) // = $ext()
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
(* ****** ****** *)
//
fun
<r0:vt>
gint_foldl_sint
(ub: sint, r0: r0): (   r0   )
fun
<r0:vt>
gint_foldl_uint
(ub: uint, r0: r0): (   r0   )
//
(* ****** ****** *)
//
fun
<r0:vt>
gint_foldr_sint
(ub: sint, r0: r0): (   r0   )
fun
<r0:vt>
gint_foldr_uint
(ub: uint, r0: r0): (   r0   )
//
(* ****** ****** *)
//
fun<>
gint_forall_sint(ub: sint): bool
fun<>
gint_forall_uint(ub: uint): bool
//
(* ****** ****** *)
//
fun<>
gint_foreach_sint(ub: sint): void
fun<>
gint_foreach_uint(ub: uint): void
//
(* ****** ****** *)
//
fun<>
gint_rforall_sint(ub: sint): bool
fun<>
gint_rforall_uint(ub: uint): bool
//
(* ****** ****** *)
//
fun<>
gint_listize_nint
{n:nat}
(n0:sint(n)): list_vt(nintlt(n),n)
fun<>
gint_rlistize_nint
{n:nat}
(n0:sint(n)): list_vt(nintlt(n),n)
//
(* ****** ****** *)
//
fun<>
gint_listize_sint
{i:int}
(i0: sint(i)): list_vt( nintlt(i) )
fun<>
gint_strmize_sint
{i:int}
(i0: sint(i)): strm_vt( nintlt(i) )
//
(* ****** ****** *)
//
fun<>
gint_strmize_nint
{n:nat}
(n0: sint(n)): strm_vt( nintlt(n) )
//
(* ****** ****** *)
//
fun
<a:t0>
gint_map_list_nint
{n:nat}( n0: sint(n) ): list(a,n)
fun
<a:vt>
gint_map_llist_nint
{n:nat}( n0: sint(n) ): list_vt(a,n)
//
(* ****** ****** *)
//
fun<>
gint_repeat_sint_c0fr
(i0: sint, work: ()-<cfr>void): void
//
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
#symload lnot with gint_lnot_uint of 1000
#symload lor2 with gint_lor2_uint of 1000
#symload land with gint_land_uint of 1000
#symload lxor with gint_lxor_uint of 1000
//
(* ****** ****** *)
#symload asrn with gint_asrn_sint of 1000
#symload lsln with gint_lsln_uint of 1000
#symload lsrn with gint_lsrn_uint of 1000
(* ****** ****** *)
//
#symload
cmp with gint_cmp_sint_sint of 1000
#symload
cmp with gint_cmp_uint_uint of 1000
//
#symload < with gint_lt_sint_sint of 1000
#symload > with gint_gt_sint_sint of 1000
#symload = with gint_eq_sint_sint of 1000
#symload < with gint_lt_uint_uint of 1000
#symload > with gint_gt_uint_uint of 1000
#symload = with gint_eq_uint_uint of 1000
//
#symload <= with gint_lte_sint_sint of 1000
#symload >= with gint_gte_sint_sint of 1000
#symload != with gint_neq_sint_sint of 1000
#symload <= with gint_lte_uint_uint of 1000
#symload >= with gint_gte_uint_uint of 1000
#symload != with gint_neq_uint_uint of 1000
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

#symload g0s2u with gint_sint2uint of 1000
#symload g0u2s with gint_uint2sint of 1000

(* ****** ****** *)
//
(*
#symload print with gint_print_sint of 1000
#symload print with gint_print_uint of 1000
*)
//
(* ****** ****** *)
//
(*
//HX-2020:
//For treating [n] as the seq (0,...,n-1)
*)
//
(* ****** ****** *)
//
#symload nilq with gint_nilq_sint of 1000
#symload nilq with gint_nilq_uint of 1000
//
#symload consq with gint_consq_sint of 1000
#symload consq with gint_consq_uint of 1000
//
(* ****** ****** *)
//
#symload foldl with gint_foldl_sint of 1000
#symload foldl with gint_foldl_uint of 1000
//
#symload foldr with gint_foldr_sint of 1000
#symload foldr with gint_foldr_uint of 1000
//
(* ****** ****** *)
//
#symload forall with gint_forall_sint of 1000
#symload forall with gint_forall_uint of 1000
//
(* ****** ****** *)
//
#symload foreach with gint_foreach_sint of 1000
#symload foreach with gint_foreach_uint of 1000
//
(* ****** ****** *)
//
#symload rforall with gint_rforall_sint of 1000
#symload rforall with gint_rforall_uint of 1000
//
(* ****** ****** *)
#symload listize with gint_listize_sint of 1000
#symload strmize with gint_strmize_sint of 1000
(* ****** ****** *)
#symload sint_listize with gint_listize_sint of 1000
#symload sint_strmize with gint_strmize_sint of 1000
(* ****** ****** *)
#symload nint_listize with gint_listize_nint of 1000
#symload nint_strmize with gint_strmize_nint of 1000
(* ****** ****** *)
#symload nint_rlistize with gint_rlistize_nint of 1000
(* ****** ****** *)
#symload nint_map_list with gint_map_list_nint of 1000
(* ****** ****** *)
(* ****** ****** *)
(*
Tue Aug 15 08:19:43 EDT 2023
*)
#symload repeat_cfr with gint_repeat_sint_c0fr of 1000
(* ****** ****** *)
(* ****** ****** *)

(* end of [ATS3/XANADU_prelude_gint000.sats] *)

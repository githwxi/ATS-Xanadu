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
sint_print(sint): void
fun<>
gint_print$sint(sint): void
//
fun<>
gint_print$uint(uint): void
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
sint_neg
{i:int}(x: sint(i)): sint(-i)
fun<>
gint_neg$sint
{i:int}(x: sint(i)): sint(-i)
//
(* ****** ****** *)
//
fun<>
sint_suc
{i:int}(x: sint(i)): sint(i+1)
fun<>
gint_suc$sint
{i:int}(x: sint(i)): sint(i+1)
//
fun<>
sint_pre
{i:int}(x: sint(i)): sint(i-1)
fun<>
gint_pre$sint
{i:int}(x: sint(i)): sint(i-1)
//
(* ****** ****** *)
//
fun<>
sint_abs
{i:int}(x: sint(i)): sint(abs(i))
fun<>
gint_abs$sint
{i:int}(x: sint(i)): sint(abs(i))
//
(* ****** ****** *)
//
fun<>
gint_suc$uint
{i:int}(x: uint(i)): uint(i+1)
fun<>
gint_pre$uint
{i:int|i>0}(x: uint(i)): uint(i-1)
//
(* ****** ****** *)
//
fun<>
gint_lnot$uint(x: uint): uint
fun<>
gint_lor2$uint(x: uint, y: uint): uint
fun<>
gint_land$uint(x: uint, y: uint): uint
fun<>
gint_lxor$uint(x: uint, y: uint): uint
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
sint_lt$sint
{i,j:int}
( x: sint(i)
, y: sint(j)): bool(i<j) // = $ext()
fun<>
gint_lt$sint$sint
{i,j:int}
( x: sint(i)
, y: sint(j)): bool(i<j) // = $ext()
//
fun<>
sint_gt$sint
{i,j:int}
( x: sint(i)
, y: sint(j)): bool(i>j) // = $ext()
fun<>
gint_gt$sint$sint
{i,j:int}
( x: sint(i)
, y: sint(j)): bool(i>j) // = $ext()
//
fun<>
sint_eq$sint
{i,j:int}
( x: sint(i)
, y: sint(j)): bool(i=j) // = $ext()
fun<>
gint_eq$sint$sint
{i,j:int}
( x: sint(i)
, y: sint(j)): bool(i=j) // = $ext()
//
fun<>
sint_lte$sint
{i,j:int}
( x: sint(i)
, y: sint(j)): bool(i<=j) // = $ext()
fun<>
gint_lte$sint$sint
{i,j:int}
( x: sint(i)
, y: sint(j)): bool(i<=j) // = $ext()
//
fun<>
sint_gte$sint
{i,j:int}
( x: sint(i)
, y: sint(j)): bool(i>=j) // = $ext()
fun<>
gint_gte$sint$sint
{i,j:int}
( x: sint(i)
, y: sint(j)): bool(i>=j) // = $ext()
//
fun<>
sint_neq$sint
{i,j:int}
( x: sint(i)
, y: sint(j)): bool(i!=j) // = $ext()
fun<>
gint_neq$sint$sint
{i,j:int}
( x: sint(i)
, y: sint(j)): bool(i!=j) // = $ext()
//
(* ****** ****** *)
//
fun<>
gint_lt$uint$uint
{i,j:int}
( x: uint(i)
, y: uint(j)): bool(i<j) // = $ext()
fun<>
gint_gt$uint$uint
{i,j:int}
( x: uint(i)
, y: uint(j)): bool(i>j) // = $ext()
fun<>
gint_eq$uint$uint
{i,j:int}
( x: uint(i)
, y: uint(j)): bool(i=j) // = $ext()
//
fun<>
gint_lte$uint$uint
{i,j:int}
( x: uint(i)
, y: uint(j)): bool(i<=j) // = $ext()
fun<>
gint_gte$uint$uint
{i,j:int}
( x: uint(i)
, y: uint(j)): bool(i>=j) // = $ext()
fun<>
gint_neq$uint$uint
{i,j:int}
( x: uint(i)
, y: uint(j)): bool(i!=j) // = $ext()
//
(* ****** ****** *)
//
fun<>
sint_cmp$sint
{i,j:int}
( x: sint(i)
, y: sint(j)): sint(sgn(i-j)) // = $ext()
fun<>
gint_cmp$sint$sint
{i,j:int}
( x: sint(i)
, y: sint(j)): sint(sgn(i-j)) // = $ext()
//
fun<>
gint_cmp$uint$uint
{i,j:int}
( x: uint(i)
, y: uint(j)): sint(sgn(i-j)) // = $ext()
//
(* ****** ****** *)
//
fun<>
sint_add$sint
{i,j:int}
( x: sint(i)
, y: sint(j)): sint(i+j) // = $ext()
fun<>
gint_add$sint$sint
{i,j:int}
( x: sint(i)
, y: sint(j)): sint(i+j) // = $ext()
//
fun<>
sint_sub$sint
{i,j:int}
( x: sint(i)
, y: sint(j)): sint(i-j) // = $ext()
fun<>
gint_sub$sint$sint
{i,j:int}
( x: sint(i)
, y: sint(j)): sint(i-j) // = $ext()
//
fun<>
sint_mul$sint
{i,j:int}
( x: sint(i)
, y: sint(j)): sint(i*j) // = $ext()
fun<>
gint_mul$sint$sint
{i,j:int}
( x: sint(i)
, y: sint(j)): sint(i*j) // = $ext()
//
fun<>
sint_div$sint
{i,j:int | j != 0}
( x: sint(i)
, y: sint(j)): sint(i/j) // = $ext()
fun<>
gint_div$sint$sint
{i,j:int | j != 0}
( x: sint(i)
, y: sint(j)): sint(i/j) // = $ext()
//
fun<>
sint_mod$sint
{i,j:int | j >= 1}
( x: sint(i)
, y: sint(j)): sint(mod(i,j)) // = $ext()
fun<>
gint_mod$sint$sint
{i,j:int | j >= 1}
( x: sint(i)
, y: sint(j)): sint(mod(i,j)) // = $ext()
//
(* ****** ****** *)
//
fun<>
gint_add$uint$uint
{i,j:int}
( x: uint(i)
, y: uint(j)): uint(i+j) // = $ext()
fun<>
gint_sub$uint$uint
{i,j:int | i >= j}
( x: uint(i)
, y: uint(j)): uint(i-j) // = $ext()
fun<>
gint_mul$uint$uint
{i,j:int}
( x: uint(i)
, y: uint(j)): uint(i*j) // = $ext()
fun<>
gint_div$uint$uint
{i,j:int | j >= 1}
( x: uint(i)
, y: uint(j)): uint(i/j) // = $ext()
fun<>
gint_mod$uint$uint
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
gint_nilq$sint(ub: sint): bool
fun<>
gint_consq$sint(ub: sint): bool
//
fun<>
gint_nilq$uint(ub: uint): bool
fun<>
gint_consq$uint(ub: uint): bool
//
(* ****** ****** *)
//
fun
<r0:vt>
gint_foldl$sint
(ub: sint, r0: r0): (   r0   )
fun
<r0:vt>
gint_foldl$uint
(ub: uint, r0: r0): (   r0   )
//
(* ****** ****** *)
//
fun
<r0:vt>
gint_foldr$sint
(ub: sint, r0: r0): (   r0   )
fun
<r0:vt>
gint_foldr$uint
(ub: uint, r0: r0): (   r0   )
//
(* ****** ****** *)
//
fun<>
gint_forall$sint(ub: sint): bool
fun<>
gint_forall$uint(ub: uint): bool
//
(* ****** ****** *)
//
fun<>
gint_foritm$sint(ub: sint): void
fun<>
gint_foritm$uint(ub: uint): void
//
(* ****** ****** *)
//
fun<>
gint_rforall$sint(ub: sint): bool
fun<>
gint_rforall$uint(ub: uint): bool
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
gint_listize$sint
{i:int}
(i0: sint(i)): list_vt( nintlt(i) )
fun<>
gint_rlistize$sint
{i:int}
(i0: sint(i)): list_vt( nintlt(i) )
//
(* ****** ****** *)
//
fun<>
gint_strmize_nint
{n:nat}
(n0: sint(n)): strm_vt( nintlt(n) )
//
fun<>
gint_strmize$sint
{i:int}
(i0: sint(i)): strm_vt( nintlt(i) )
//
(* ****** ****** *)
//
fun
<a:t0>
gint_map_list_nint
{n:nat}
( n0: sint(n) ): list(a,n)
fun
<a:vt>
gint_map_llist_nint
{n:nat}
( n0: sint(n) ): list_vt(a,n)
//
(* ****** ****** *)
//
fun<>
gint_repeat$sint$f0un
( i0: sint
, work: ((*void*))->void): void
//
(* ****** ****** *)
(* ****** ****** *)
//
// HX-2020-05-30:
// symbol overloading for gint
//
(* ****** ****** *)
(* ****** ****** *)
//
#symload - with gint_neg$sint of 1002
//
(* ****** ****** *)
//
#symload abs with gint_abs$sint of 1002
//
(* ****** ****** *)
//
#symload suc with gint_suc$sint of 1002
#symload pre with gint_pre$sint of 1002
//
#symload suc with gint_suc$uint of 1000
#symload pre with gint_pre$uint of 1000
//
(* ****** ****** *)
//
#symload lnot with gint_lnot$uint of 1000
#symload lor2 with gint_lor2$uint of 1000
#symload land with gint_land$uint of 1000
#symload lxor with gint_lxor$uint of 1000
//
(* ****** ****** *)
//
#symload asrn with gint_asrn_sint of 1000
#symload lsln with gint_lsln_uint of 1000
#symload lsrn with gint_lsrn_uint of 1000
//
(* ****** ****** *)
(* ****** ****** *)
//
#symload
cmp with gint_cmp$sint$sint of 1002
//
(* ****** ****** *)
//
#symload < with gint_lt$sint$sint of 1002
#symload > with gint_gt$sint$sint of 1002
#symload = with gint_eq$sint$sint of 1002
//
#symload <= with gint_lte$sint$sint of 1002
#symload >= with gint_gte$sint$sint of 1002
#symload != with gint_neq$sint$sint of 1002
//
(* ****** ****** *)
//
#symload + with gint_add$sint$sint of 1002
#symload - with gint_sub$sint$sint of 1002
#symload * with gint_mul$sint$sint of 1002
#symload / with gint_div$sint$sint of 1002
#symload % with gint_mod$sint$sint of 1002
//
(* ****** ****** *)
(* ****** ****** *)
//
#symload
cmp with gint_cmp$uint$uint of 1000
//
#symload < with gint_lt$uint$uint of 1000
#symload > with gint_gt$uint$uint of 1000
#symload = with gint_eq$uint$uint of 1000
//
#symload <= with gint_lte$uint$uint of 1000
#symload >= with gint_gte$uint$uint of 1000
#symload != with gint_neq$uint$uint of 1000
//
(* ****** ****** *)
//
#symload + with gint_add$uint$uint of 1000
#symload - with gint_sub$uint$uint of 1000
#symload * with gint_mul$uint$uint of 1000
#symload / with gint_div$uint$uint of 1000
#symload % with gint_mod$uint$uint of 1000
//
(* ****** ****** *)
(* ****** ****** *)
//
#symload g0s2u with gint_sint2uint of 1000
#symload g0u2s with gint_uint2sint of 1000
//
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
#symload nilq with gint_nilq$sint of 1000
#symload nilq with gint_nilq$uint of 1000
//
#symload consq with gint_consq$sint of 1000
#symload consq with gint_consq$uint of 1000
//
(* ****** ****** *)
//
#symload foldl with gint_foldl$sint of 1000
#symload foldl with gint_foldl$uint of 1000
//
#symload foldr with gint_foldr$sint of 1000
#symload foldr with gint_foldr$uint of 1000
//
(* ****** ****** *)
//
#symload forall with gint_forall$sint of 1000
#symload forall with gint_forall$uint of 1000
//
(* ****** ****** *)
//
#symload foritm with gint_foritm$sint of 1000
#symload foritm with gint_foritm$uint of 1000
//
(* ****** ****** *)
//
#symload rforall with gint_rforall$sint of 1000
#symload rforall with gint_rforall$uint of 1000
//
(* ****** ****** *)
#symload listize with gint_listize$sint of 1000
#symload strmize with gint_strmize$sint of 1000
(* ****** ****** *)
#symload sint_listize with gint_listize$sint of 1000
#symload sint_strmize with gint_strmize$sint of 1000
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
#symload repeat$fun with gint_repeat$sint$f0un of 1000
(* ****** ****** *)
(* ****** ****** *)

(* end of [ATS3/XANADU_srcgen1_prelude_SATS_gint000.sats] *)

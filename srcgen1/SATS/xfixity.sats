(***********************************************************************)
(*                                                                     *)
(*                         Applied Type System                         *)
(*                                                                     *)
(***********************************************************************)

(*
** ATS/Xanadu - Unleashing the Potential of Types!
** Copyright (C) 2018 Hongwei Xi, ATS Trustful Software, Inc.
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
// Author: Hongwei Xi
// Start Time: August, 2018
// Authoremail: gmhwxiATgmailDOTcom
//
(* ****** ****** *)
#define
ATS_PACKNAME
"ATS3.XANADU.xatsopt"
(* ****** ****** *)
//
#staload
LOC = "./locinfo.sats"
//
  typedef loc_t = $LOC.loc_t
//
(* ****** ****** *)
//
datatype
assoc =
ASSOCnon | ASSOClft | ASSOCrgt
//
fun
print_assoc(assoc): void
fun
prerr_assoc(assoc): void
fun
fprint_assoc: fprint_type(assoc)
//
overload print with print_assoc
overload prerr with prerr_assoc
overload fprint with fprint_assoc
//
(* ****** ****** *)
//
// HX: precedence value
//
abstflt prcdv_tflt = int
//
typedef prcdv = prcdv_tflt
//
(* ****** ****** *)
//
fun
prcdv2int: prcdv -> int
and
int2prcdv: int -> prcdv
//
fun
print_prcdv(prcdv): void
fun
prerr_prcdv(prcdv): void
fun
fprint_prcdv: fprint_type(prcdv)
//
overload print with print_prcdv
overload prerr with prerr_prcdv
overload fprint with fprint_prcdv
//
(* ****** ****** *)
//
fun
add_prcdv_int(prcdv, int): prcdv
and
sub_prcdv_int(prcdv, int): prcdv
//
fun
cmp_prcdv_prcdv
(p1:prcdv, p2:prcdv): int(*sgn*)
//
overload + with add_prcdv_int
overload - with sub_prcdv_int
//
overload cmp with cmp_prcdv_prcdv
//
(* ****** ****** *)
//
val
the_neginf_prcdv: prcdv // lowest precedence value
and
the_posinf_prcdv: prcdv // highest precedence value
//
(* ****** ****** *)
//
val app_assoc : assoc
val app_prcdv : prcdv
//
val imp_assoc : assoc
val imp_prcdv : prcdv
//
val brack_prcdv : prcdv
val dtsel_prcdv : prcdv
//
(*
val raise_prcdv : prcdv
*)
//
val forall_prcdv : prcdv
and exists_prcdv : prcdv
//
(* ****** ****** *)
//
val backslash_prcdv : prcdv
val infixtemp_prcdv : prcdv // for temp infix status
//
(* ****** ****** *)
//
datatype
fixty =
| FIXTYnon
| FIXTYpre of prcdv
| FIXTYpos of prcdv
| FIXTYinf of (prcdv, assoc)
//
| FIXTYpreinf of (prcdv, prcdv, assoc)
(*
| FIXTYposinf of (prcdv, prcdv, assoc)
*)
//
// end of [fixty]
//
(* ****** ****** *)
//
val app_fixty : fixty
//
val imp_fixty : fixty
//
val brack_fixty : fixty
val dtsel_fixty : fixty
//
(*
val raise_fixty : fixty
*)
//
val forall_fixty : fixty
and exists_fixty : fixty
//
val postplus_fixty : fixty
and postmnus_fixty : fixty
//
val backslash_fixty : fixty
val infixtemp_fixty : fixty
//
(* ****** ****** *)
//
fun
print_fixty(fixty): void
fun
prerr_fixty(fixty): void
fun
fprint_fixty: fprint_type(fixty)
//
overload print with print_fixty
overload prerr with prerr_fixty
overload fprint with fprint_fixty
//
(* ****** ****** *)
//
fun
fixty_prcdv(fixty): prcdv
fun
fixty_assoc(fixty): assoc
//
(* ****** ****** *)
//
datatype
fxitm(a:type) =
| FXITMatm(a) of (a)
| FXITMopr(a) of (a, fixty)
//
(* ****** ****** *)
//
typedef
fxitmlst(a:type) = List0(fxitm(a))
//
(* ****** ****** *)
//
fun
fxopr_prcdv{a:type}(fxitm(a)): prcdv
fun
fxopr_assoc{a:type}(fxitm(a)): assoc
//
(* ****** ****** *)
//
fun
{a:type}
fxatm_none: loc_t -> (a)
fun
{a:type}
fxopr_get_loc: (a) -> loc_t
//
fun
{a:type}
fxitm_get_loc: fxitm(a) -> loc_t
//
(* ****** ****** *)
//
(*
fun
{a:type}
fxitm_make(x0: a): fxitm(a)
*)
//
fun
{a:type}
fxopr_make_app(y0: fxitm(a)): fxitm(a)
//
(* ****** ****** *)
//
fun
{a:type}
fxitmlst_resolve
  (loc0: loc_t, xs: fxitmlst(a)): (a)
//
(* ****** ****** *)
//
fun
{a:type}
fxitm_infix
(x0: a, f1: a, x2: a): fxitm(a) // f0(x1,x2)
//
fun
{a:type}
fxitm_prefix(f0: a, x1: a): fxitm(a) // f0(x1)
fun
{a:type}
fxitm_postfix(x0: a, f1: a): fxitm(a) // f1(x0)
//
(* ****** ****** *)

(* end of [xats_xfixity.sats] *)

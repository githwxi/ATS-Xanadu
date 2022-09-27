(***********************************************************************)
(*                                                                     *)
(*                         Applied Type System                         *)
(*                                                                     *)
(***********************************************************************)

(*
** ATS/Xanadu - Unleashing the Potential of Types!
** Copyright (C) 2022 Hongwei Xi, ATS Trustful Software, Inc.
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
(*
Author: Hongwei Xi
(*
Mon Jul 25 12:00:21 EDT 2022
*)
Authoremail: gmhwxiATgmailDOTcom
*)
//
(* ****** ****** *)
#include
"./../HATS/xatsopt_sats.hats"
(* ****** ****** *)
#define
ATS_PACKNAME
"ATS3.XANADU.xatsopt-20220500"
(* ****** ****** *)
//
#staload
LOC = "./locinfo.sats"
//
#typedef loc_t = $LOC.loc_t
//
(* ****** ****** *)
//
datatype assoc =
|ASSOCnon|ASSOClft|ASSOCrgt
//
(* ****** ****** *)
val app_assoc: assoc
val imp_assoc: assoc
(* ****** ****** *)
fun
assoc_fprint:(FILR,assoc)->void
(* ****** ****** *)
//
#abstype
prcdv_tflt//sint(*flat-type*)
#typedef
prcdv = prcdv_tflt(*prcd-val*)
//
(* ****** ****** *)
//
val app_prcdv: prcdv
val imp_prcdv: prcdv
//
val brckt_prcdv: prcdv
val dtsel_prcdv: prcdv
//
val forall_prcdv: prcdv
and exists_prcdv: prcdv
//
val bslash_prcdv: prcdv
val inftmp_prcdv: prcdv // for temp-infixity
//
(* ****** ****** *)
val
the_prcdv_neginf: prcdv
val
the_prcdv_posinf: prcdv
(* ****** ****** *)
//
fun
prcdv_decode:(prcdv)->sint
#symload decd with prcdv_decode
//
fun
prcdv_encode(cdv:sint):prcdv
#symload prcdv with prcdv_encode
(* ****** ****** *)
fun
prcdv_fprint:(FILR,prcdv)->void
(* ****** ****** *)
//
fun
add_prcdv_int:(prcdv,sint)->prcdv
and
sub_prcdv_int:(prcdv,sint)->prcdv
//
(* ****** ****** *)
fun
cmp_prcdv_prcdv
(p1:prcdv, p2:prcdv): sint(*sgn*)
(* ****** ****** *)
//
datatype
fxitm(a:type) =
| FXITMatm(a) of (a)
| FXITMopr(a) of (a, fixty)
//
and
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
val app_fixty: fixty
//
val imp_fixty: fixty
//
val brckt_fixty: fixty
val dtsel_fixty: fixty
//
(*
val raise_fixty: fixty
*)
//
val forall_fixty: fixty
and exists_fixty: fixty
//
val bslash_fixty: fixty
val inftmp_fixty: fixty
//
val postplus_fixty: fixty
and postmnus_fixty: fixty
//
(* ****** ****** *)
fun
fixty_prcdv(fxt: fixty): prcdv
fun
fixty_assoc(fxt: fixty): assoc
(* ****** ****** *)
fun
fixty_fprint:(FILR,fixty)->void
fun
<a:t0>
fxitm_fprint:(FILR,fxitm(a))->void
(* ****** ****** *)
//
#typedef
fxitmlst
(a:type) = list(fxitm(a))
//
(* ****** ****** *)
//
fun
fixty_prcdv: (fixty)->prcdv
fun
fixty_assoc: (fixty)->assoc
//
(* ****** ****** *)
//
fun
<a:t0>
fxopr_prcdv:(fxitm(a))->prcdv
fun
<a:t0>
fxopr_assoc:(fxitm(a))->assoc
//
(* ****** ****** *)
//
fun
<a:t0>
fxatm_none: loc_t -> (a)
fun
<a:t0>
fxopr_get_lctn: (a) -> loc_t
fun
<a:t0>
fxitm_get_lctn: fxitm(a) -> loc_t
//
(* ****** ****** *)
//
fun
<a:t0>
fxitmlst_resolve
( loc0: loc_t
, itms: fxitmlst(a)): (a)
//
fun
<a:t0>
fxitmlst_resolve$appopr
(  itm: fxitm(a)  ): fxitm(a)
//
fun
<a:t0>
fxitmlst_resolve$oprerr:(fxitm(a))->(a)
fun
<a:t0>
fxitmlst_resolve$apperr:(fxitm(a))->(a)
//
fun
<a:t0>
fxitmlst_resolve$rederr
( loc0: loc_t, itms: fxitmlst(a) ): (a)
//
(* ****** ****** *)
//
fun
<a:t0>
fxitm_infix0
(x0: a, f1: a, x2: a): fxitm(a) // f0(x1,x2)
//
fun
<a:t0>
fxitm_prefix(f0: a, x1: a): fxitm(a) // f0(x1)
fun
<a:t0>
fxitm_pstfix(x0: a, f1: a): fxitm(a) // f1(x0)
//
(* ****** ****** *)

(* end of [ATS3/XATSOPT_srcgen2_xfixity.sats] *)

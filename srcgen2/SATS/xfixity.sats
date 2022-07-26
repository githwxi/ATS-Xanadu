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

(* end of [ATS3/XATSOPT_xfixity.sats] *)

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
SYM = "./xsymbol.sats"
//
typedef sym_t = $SYM.sym_t
//
(* ****** ****** *)
//
absvtype
symmap_vtype(itm:type) = ptr
vtypedef
symmap(itm:type) = symmap_vtype(itm)
//
(* ****** ****** *)
//
fun
symmap_make_nil
  {itm:type}(): symmap(itm)
//
(* ****** ****** *)
//
fun
symmap_free
  {itm:type}
  (map: symmap(itm)):<!wrt> void
//
(* ****** ****** *)

fun
symmap_search
  {itm:type}
(
  kxs: !symmap(itm), k0: sym_t
) :<> Option_vt(itm) // end-of-fun

(* ****** ****** *)

fun
symmap_insert
  {itm:type}
(
  kxs: &symmap(itm), k0: sym_t, x0: itm
) :<> void // end of [symmap_insert]

(* ****** ****** *)

fun
symmap_insert2
  {itm:type}
( kxs: &symmap(itm)
, key: sym_t, itm: itm, mix: (itm, itm) -<0> itm
) :<> void // end of [symmap_insert2]

(* ****** ****** *)
//
fun
symmap_joinwth
  {itm:type}
  (m1: &symmap(itm), m2: !symmap(itm)): void
// end of [symmap_joinwth]
//
(* ****** ****** *)

fun
fprint_symmap
  {itm:type}
( out: FILEref
, map: !symmap(itm), fpr: (FILEref, itm) -> void
) : void // end of [fprint_symmap]

(* ****** ****** *)

(* end of [xats_xsymmap.sats] *)

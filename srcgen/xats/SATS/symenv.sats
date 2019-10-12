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
//
#staload
SYM = "./symbol.sats"
typedef sym_t = $SYM.sym_t
//
#staload
MAP = "./symmap.sats"
vtypedef
symmap(itm:type) = $MAP.symmap(itm)
//
(* ****** ****** *)

absvt0ype
symenv_vt0ype(itm:type)
vtypedef
symenv(itm:type) = symenv_vt0ype(itm)

(* ****** ****** *)

fun
symenv_make_nil
  {itm:type}
(
// nothing
) : [l:addr] (symenv(itm) @ l | ptr(l))
// end of [symenv_make_nil]

(* ****** ****** *)
//
fun
symenv_search
{itm:type} // HX: search all
(env: &symenv(itm), k0: sym_t):<> Option_vt(itm)
// end of [symenv_search]
fun
symenv_psearch // p: pervasive
{itm:type}
(env: &symenv(itm), k0: sym_t):<> Option_vt(itm)
// end of [symenv_psearch]
//
(* ****** ****** *)

fun
symenv_insert
{itm:type} // HX: insert first
(env: &symenv(itm), k0: sym_t, x0: itm):<> void
// end of [symenv_insert]

fun
symenv_insert2
{itm:type} // HX: insert first
( env: &symenv(itm)
, key: sym_t, itm: itm, mix: (itm, itm) -<0> itm):<> void
// end of [symenv_insert2]

(* ****** ****** *)
//
fun
symenv_pinsert // p: pervasive
{itm:type}
(env: &symenv(itm), k0: sym_t, x0: itm):<> void
// end of [symenv_pinsert]
//
(* ****** ****** *)
//
fun
symenv_pop
{itm:type}
(env: &symenv(itm) >> _): symmap(itm)
fun
symenv_push
{itm:type}
(env: &symenv(itm) >> _, map: symmap(itm)): void
//
(* ****** ****** *)
//
fun
symenv_popfree
  {itm:type}(env: &symenv(itm) >> _): void
fun
symenv_pushnil
  {itm:type}(env: &symenv(itm) >> _): void
//
(* ****** ****** *)
//
// HX:
// For handling: local ... in ... end
//
fun
symenv_locjoin
  {itm:type}(env: &symenv(itm) >> _): void
// end of [symenv_locjoin]
//
(* ****** ****** *)
//
fun
symenv_pjoinwth0
  {itm:type}
  (env: &symenv(itm), map: symmap(itm)): (void)
// end of [symenv_pjoinwth0]
fun
symenv_pjoinwth1
  {itm:type}
  (env: &symenv(itm), map: !symmap(itm)): (void)
// end of [symenv_pjoinwth1]
//
(* ****** ****** *)
//
// HX: saving the current env
//
fun
symenv_savecur
  {itm:type}(env: &symenv(itm) >> _): void
// end of [symenv_savecur]
//
// HX: restoring the last saved env
//
fun
symenv_restore
  {itm:type}(env: &symenv(itm) >> _): symmap(itm)
// end of [symenv_restore]
//
(* ****** ****** *)

fun
fprint_symenv_top
  {itm:type}
( out: FILEref
, map: &symenv(itm), fpr: (FILEref, itm) -> void
) : void // end of [fprint_symenv_top]
fun
fprint_symenv_ptop
  {itm:type}
( out: FILEref
, map: &symenv(itm), fpr: (FILEref, itm) -> void
) : void // end of [fprint_symenv_ptop]

(* ****** ****** *)

(* end of [xats_symenv.sats] *)

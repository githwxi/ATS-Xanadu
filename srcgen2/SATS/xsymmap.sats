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
Mon Jul 25 11:44:59 EDT 2022
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
SYM = "./xsymbol.sats"
//
#typedef sym_t = $SYM.sym_t
//
(* ****** ****** *)
//
#absvtbx
symmap_vtbx(x0:t0) // ptr
#vwtpdef
symmap(x0:t0) = symmap_vtbx(x0)
//
(* ****** ****** *)
//
fun
symmap_make_nil
{x0:type}((*void*)): symmap(x0)
//
(* ****** ****** *)
//
fun
symmap_free
{x0:type}(map: symmap(x0)): void
//
(* ****** ****** *)
//
fun
symmap_search
  {x0:type}
(
  kxs:
! symmap(x0),k0:sym_t): optn_vt(x0)
//
(* ****** ****** *)
//
fun
symmap_insert
  {x0:type}
( kxs:
& symmap(x0),k0:sym_t,x0:x0): void
//
(* ****** ****** *)

fun
symmap_insert2
  {x0:type}
( kxs:
& symmap(x0)
, k0: sym_t, x0: x0, mix:(x0,x0)->x0
) : void // end of [ symmap_insert2 ]

(* ****** ****** *)
//
fun
symmap_joinwth
  {x0:type}
( m1: &symmap(x0)
, m2: !symmap(x0)): void // end-of-fun
//
(* ****** ****** *)
//
fun
symmap_fprint_f2np
  {x0:type}
( out: FILR
, map:
! symmap(x0)
, fpr: (FILR,x0)->void): void//end(fun)
//
(* ****** ****** *)

(* end of [ATS3/XATSOPT_xsymmap.sats] *)

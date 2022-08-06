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
#abstbox
topmap_tbox(x0:t0) // ptr
#typedef
topmap(x0:t0) = topmap_tbox(x0)
//
(* ****** ****** *)
//
#absvtbx
stkmap_vtbx(x0:t0) // ptr
#vwtpdef
stkmap(x0:t0) = stkmap_vtbx(x0)
//
(* ****** ****** *)
fun
topmap_make_nil{itm:tbox}(): topmap(itm)
fun
stkmap_make_nil{itm:tbox}(): stkmap(itm)
(* ****** ****** *)
//
fun
topmap_search_opt
{itm:tbox}
( map:
  topmap(itm), key: sym_t): optn_vt(itm)
fun
topmap_insert_any
{itm:tbox}
( map:
  topmap(itm), key: sym_t, itm: itm): void
//
(* ****** ****** *)
//
fun
stkmap_search_opt
{itm:tbox}
( map:
! stkmap(itm), key: sym_t): optn_vt(itm)
fun
stkmap_insert_any
{itm:tbox}
( map:
& stkmap(itm) >> _, key: sym_t, itm: itm): void
//
(* ****** ****** *)

(* end of [ATS3/XATSOPT_xsymmap.sats] *)

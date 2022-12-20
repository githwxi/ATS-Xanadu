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
#typedef key = $SYM.sym_t
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
stkmap_nilq
{itm:tbox}(!stkmap(itm)): bool
fun
stkmap_topq
{itm:tbox}(!stkmap(itm)): bool
(* ****** ****** *)
fun
topmap_make_nil
{itm:tbox}((*void*)): topmap(itm)
fun
stkmap_make_nil
{itm:tbox}((*void*)): stkmap(itm)
(* ****** ****** *)
//
fun
topmap_strmize
{itm:tbox}
(topmap(itm))
: strm_vt(@(sint,list(itm)))
//
(* ****** ****** *)
//
fun
<x0:t0>
topmap_fprint(FILR, topmap(x0)):void
fun
<x0:t0>
stkmap_fprint1(FILR,!stkmap(x0)):void
//
(* ****** ****** *)
//
fun
topmap_search_opt
{itm:tbox}
( map:
  topmap(itm), key: key): optn_vt(itm)
//
(* ****** ****** *)
//
fun
topmap_insert_any
{itm:tbox}
( map:
  topmap(itm), key: key, itm: itm): void
fun
topmap_insert_kxs
{itm:tbox}
( map:
  topmap(itm), kxs: list_vt@(key,itm)): void
//
(* ****** ****** *)
//
fun
stkmap_free_nil
{itm:tbox}(map: stkmap(itm)): void
//
(* ****** ****** *)
//
fun
stkmap_poptop0
  {itm:tbox}
(map: &stkmap(itm) >> _): sint
//
(* ****** ****** *)
//
fun
stkmap_poplam0
  {itm:tbox}
(map: &stkmap(itm) >> _): sint
//
fun
stkmap_pshlam0
  {itm:tbox}
(map: &stkmap(itm) >> _): void
//
(* ****** ****** *)
//
fun
stkmap_poplet0
  {itm:tbox}
(map: &stkmap(itm) >> _): sint
//
fun
stkmap_pshlet0
  {itm:tbox}
(map: &stkmap(itm) >> _): void
//
(* ****** ****** *)
//
fun
stkmap_poploc0
  {itm:tbox}
( map:
& stkmap(itm) >> _):
(sint(*err*), list_vt@(key, itm))
//
fun
stkmap_pshloc1
{itm:tbox}(map: &stkmap(itm) >> _): void
fun
stkmap_pshloc2
{itm:tbox}(map: &stkmap(itm) >> _): void
//
(* ****** ****** *)
//
fun
stkmap_search_opt
{itm:tbox}
( map:
! stkmap(itm), key: key): optn_vt(itm)
//
(* ****** ****** *)
//
fun
stkmap_insert_any
{itm:tbox}
( map:
& stkmap(itm) >> _, key, itm): void
fun
stkmap_insert_kxs
{itm:tbox}
( map:
& stkmap(itm) >> _, list_vt@(key,itm)): void
//
(* ****** ****** *)
(*
// HX-2022-08-18:
// for inserting with mixing
*)
(* ****** ****** *)
//
fun
topmap_insmix_any
{itm:tbox}
( map: topmap(itm)
, key, itm, mix: (itm, itm) -> itm): void
fun
topmap_insmix_kxs
{itm:tbox}
( map: topmap(itm)
, kxs
: list_vt@(key,itm), mix: (itm,itm)->itm): void
//
(* ****** ****** *)
//
fun
stkmap_insmix_any
{itm:tbox}
( map:
& stkmap(itm) >> _
, key, itm, mix: (itm, itm) -> itm): void
fun
stkmap_insmix_kxs
{itm:tbox}
( map:
& stkmap(itm) >> _
, kxs
: list_vt@(key,itm), mix: (itm,itm)->itm): void
//
(* ****** ****** *)

(* end of [ATS3/XATSOPT_srcgen2_xsymmap.sats] *)

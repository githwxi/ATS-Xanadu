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
Sat Aug  6 12:22:41 EDT 2022
*)
Authoremail: gmhwxiATgmailDOTcom
*)
//
(* ****** ****** *)
#define
ATS_PACKNAME
"ATS3.XANADU.xatsopt-20220500"
(* ****** ****** *)
#include
"./../HATS/xatsopt_sats.hats"
#include
"./../HATS/xatsopt_dats.hats"
(* ****** ****** *)
#staload "./../SATS/xsymbol.sats"
(* ****** ****** *)
#staload "./../SATS/xsymmap.sats"
(* ****** ****** *)

#typedef key = sym_t

(* ****** ****** *)
local
(* ****** ****** *)
//
datavwtp
stkmap(itm:type) =
//
| stkmap_nil of ()
//
| stkmap_cons of
  (key, itm, stkmap(itm))
//
| stkmap_let0 of stkmap(itm)
| stkmap_loc1 of stkmap(itm)
| stkmap_loc2 of stkmap(itm)
//
(* ****** ****** *)
#absimpl
stkmap_vtbx(itm:type) = stkmap(itm)
(* ****** ****** *)

in//local

(* ****** ****** *)
//
#implfun
stkmap_make_nil
  ( (*nil*) ) =
  stkmap_nil((*void*))
//
(* ****** ****** *)
#implfun
stkmap_search_opt
  {itm}
( map, key ) =
(
  loop(map, key)) where
{
//
#vwtpdef
kxs = stkmap(itm)
//
fnx
loop
( kxs:
! kxs
, k0: key): optn_vt(itm) =
(
case+ kxs of
//
| !
stkmap_nil() => optn_vt_nil()
//
| !
stkmap_cons(k1, x1, kxs) =>
(
if
(k0 = k1)
then
optn_vt_cons(x1) else loop(kxs,k0))
//
| !stkmap_let0(kxs) => loop(kxs, k0)
| !stkmap_loc1(kxs) => loop(kxs, k0)
| !stkmap_loc2(kxs) => loop(kxs, k0)
//
)
//
} (*where*) // end of [stkmap_search_opt]
(* ****** ****** *)
//
#implfun
stkmap_insert_any
  {itm}
( map, key, itm ) =
(
  map := stkmap_cons(key,itm,map) )
//
(* ****** ****** *)

endloc (*local*) // end of [ local(stkmap) ]

(* ****** ****** *)

(* end of [ATS3/XATSOPT_xsymmap_stkmap.dats] *)

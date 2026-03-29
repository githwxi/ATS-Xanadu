(***********************************************************************)
(*
//
HX-2026-03-28: Porting ATS2!!!
Sat Mar 28 09:24:42 PM EDT 2026
//
*)
(***********************************************************************)
(*                                                                     *)
(*                         Applied Type System                         *)
(*                                                                     *)
(***********************************************************************)

(*
** ATS/Postiats - Unleashing the Potential of Types!
** Copyright (C) 2011-2013 Hongwei Xi, ATS Trustful Software, Inc.
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

(* Author: Hongwei Xi *)
(* Authoremail:
   hwxi AT cs DOT bu DOT edu *)
(* Start time: December, 2012 *)

(* ****** ****** *)
(* ****** ****** *)
//
(*
HX-2012-12: For maps
associating keys with items of
types [key] and [itm], respectively
*)
//
#abstype
fmap_tbox // HX: boxed
(key:type,itm:type+) <= p0tr
#sexpdef fmap = fmap_tbox(*key,itm*)
//
(* ****** ****** *)
(* ****** ****** *)
//
fun
<key:t0>
equal_key_key
(k1: key, k2: key): bool
fun
<key:t0>
compare_key_key
(k1: key, k2: key): sint
//
(* ****** ****** *)
(* ****** ****** *)
//
fun<>
funmap_nil
{key,itm:t0}
((*void*)): fmap(key, itm)
fun<>
funmap_make_nil
{key,itm:t0}
((*void*)): fmap(key, itm)
//
(* ****** ****** *)
(* ****** ****** *)
//
fun<>
funmap_nilq
{key,itm:t0}
(map: fmap(key,itm)): bool
fun<>
funmap_consq
{key,itm:t0}
(map: fmap(key,itm)): bool
//
(* ****** ****** *)
(* ****** ****** *)
//
fun
<key:t0>
<itm:t0>
funmap_size
(map: fmap(key, itm)): nint
//
(* ****** ****** *)
(* ****** ****** *)
//
fun
<key:t0>
<itm:t0>
funmap_keyval$print
(map: fmap(key, itm)): void
#symload print with funmap_keyval$print
//
(* ****** ****** *)
//
fun
<key:t0>
<itm:t0>
funmap_key$strmize
(
map: fmap(key, itm)): strm_vt(key)
//
fun
<key:t0>
<itm:t0>
funmap_keyval$strmize
(
map:
fmap(key, itm)): strm_vt(@(key,itm))
#symload strmize
  with funmap_keyval$strmize of 1000
//
(* ****** ****** *)
(* ****** ****** *)
//
fun
<key:t0>
<itm:t0>
funmap_keyval$forall
(map: fmap(key, itm)): bool
#symload
forall with funmap_keyval$forall of 1000
//
fun
<key:t0>
<itm:t0>
funmap_keyval$foritm
(map: fmap(key, itm)): void
#symload
foritm with funmap_keyval$foritm of 1000
//
(* ****** ****** *)
(* ****** ****** *)
//
fun
<key:t0>
<itm:t0>
funmap_search$any
(
map:
fmap(key, itm), k0: key): itm(*found*)
fun
<key:t0>
<itm:t0>
funmap_search$opt
(
map:
fmap(key, itm), k0: key): optn_vt(itm)
//
(* ****** ****** *)
//
fun
<key:t0>
<itm:t0>
(*
funmap_insert$new
*)
funmap_insert$any
(
map:
fmap
(key, itm), k0: key, x0: itm): fmap(key,itm)
fun
<key:t0>
<itm:t0>
funmap_insert$opt
(
map:
fmap(key, itm),
k0: key, x0: itm): (fmap(key,itm), optn_vt(itm))
//
fun
<key:t0>
<itm:t0>
(*
funmap$cbr_insert$new
*)
funmap$cbr_insert$any
(
map: &
fmap
(key, itm) >> _, k0: key, x0: itm): (  void  )
fun
<key:t0>
<itm:t0>
funmap$cbr_insert$opt
(
map: &
fmap(key, itm) >> _, k0: key, x0: itm): optn_vt(itm)
//
(* ****** ****** *)
(* ****** ****** *)
//
fun
<key:t0>
<itm:t0>
(*
funmap_remove$old
*)
funmap_remove$any
(
map:
fmap
(key, itm), k0: key): fmap(key,itm)
fun
<key:t0>
<itm:t0>
funmap_remove$opt
(
map:
fmap
(key, itm), k0: key): (fmap(key,itm),bool)
//
fun
<key:t0>
<itm:t0>
(*
funmap$cbr_remove$old
*)
funmap$cbr_remove$any
(
map: &fmap(key, itm) >> _, k0: key): (void)
fun
<key:t0>
<itm:t0>
funmap$cbr_remove$opt
(
map: &fmap(key, itm) >> _, k0: key): (bool)
//
(* ****** ****** *)
//
fun
<key:t0>
<itm:t0>
(*
funmap_getout$old
*)
funmap_getout$any
(
map:
fmap
(key, itm), k0: key): (fmap(key,itm), itm)
fun
<key:t0>
<itm:t0>
funmap_getout$opt
(
map:
fmap
(key, itm), k0: key): (fmap(key,itm),optn_vt(itm))
//
fun
<key:t0>
<itm:t0>
(*
funmap$cbr_getout$old
*)
funmap$cbr_getout$any
(
map: &fmap(key, itm) >> _, k0: key): ( itm )
fun
<key:t0>
<itm:t0>
funmap$cbr_getout$opt
(
map: &fmap(key, itm) >> _, k0: key): optn_vt( itm )
//
(* ****** ****** *)
(* ****** ****** *)
//
(***********************************************************************)
(* end of [ATS3/XANADU_xatslib_githwxi_ATS2_SATS_funmap.sats] *)
(***********************************************************************)

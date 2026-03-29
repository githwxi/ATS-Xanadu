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
(* Authoremail: hwxi AT cs DOT bu DOT edu *)
(* Start time: December, 2012 *)

(* ****** ****** *)
(* ****** ****** *)
//
(*
HX-2012-12:
for maps associating keys with items
of types [key] and [itm], respectively
*)
//
#abstype
fmap_tbox
(key:type
,itm:type+) = p0tr // HX: boxed
#sexpdef
fmap(key:t0,itm:t0) = fmap_tbox(key,itm)
//
(* ****** ****** *)
(* ****** ****** *)
//
fun
<key:t0>
equal_key_key
(x1: key, x2: key): bool
fun
<key:t0>
compare_key_key
(x1: key, x2: key): sint
//
(* ****** ****** *)
(* ****** ****** *)
//
fun<>
funmap_nil
{key,itm:t0}((*0*)): fmap(key, itm)
fun<>
funmap_make_nil
{key,itm:t0}((*0*)): fmap(key, itm)
//
(* ****** ****** *)
(* ****** ****** *)
//
fun<>
funmap_nilq
{key,itm:t0}(map:fmap(key,itm)): bool
fun<>
funmap_consq
{key,itm:t0}(map:fmap(key,itm)): bool
//
(* ****** ****** *)
(* ****** ****** *)
//
fun
<key:t0>
<itm:t0>
funmap_size(map: fmap(key, itm)): nint
//
(* ****** ****** *)
(* ****** ****** *)
//
fun
<key:t0>
<itm:t0>
funmap_key$strmize
(
map: fmap(key, itm)): stream_vt(key)
//
fun
<key:t0>
<itm:t0>
funmap_keyval$strmize
(
map: fmap(key, itm)): stream_vt(@(key,itm))
#symload strmize with funmap_keyval$strmize
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
(***********************************************************************)
(* end of [ATS3/XANADU_xatslib_githwxi_ATS2_SATS_funmap.sats] *)
(***********************************************************************)
////
fun{
key,itm:t0p
} funmap_search
(
  fmap: fmap(key, INV(itm))
, key: key, res: &itm? >> opt(itm, b)
) : #[b:bool] bool(b)

fun{
key,itm:t0p
} funmap_search_opt
  (fmap: fmap(key, INV(itm)), k0: key): Option_vt(itm)
// end of [funmap_search_opt]

(* ****** ****** *)
//
// HX-2012-12:
// if [k0] occurs in [fmap], [x0] replaces the
// item associated with [k0] in [fmap] while the
// item is stored in [res] instead.
//
fun{
key,itm:t0p
} funmap_insert
(
  fmap: &fmap(key, INV(itm)) >> _
, key: key, itm: itm, res: &itm? >> opt(itm, b)
) : #[b:bool] bool(b)

fun{
key,itm:t0p
} funmap_insert_opt
(
  fmap: &fmap(key, INV(itm)) >> _, k0: key, x0: itm
) : Option_vt(itm) // endfun

(* ****** ****** *)
//
// HX-2012-12:
// insertion always happens regardless whether
// [k0] is associated with some item in [fmap]
//
fun{
key,itm:t0p
} funmap_insert_any
  (fmap: &fmap(key, INV(itm)) >> _, k0: key, x0: itm): void
// end of [funmap_insert_any]

(* ****** ****** *)
//
fun{
key,itm:t0p
} funmap_takeout (
  &fmap(key, INV(itm)) >> _, k0: key, res: &itm? >> opt (itm, b)
) : #[b:bool] bool (b) // end-of-function
//
fun{
key,itm:t0p
} funmap_takeout_opt
  (fmap: &fmap(key, INV(itm)) >> _, k0: key) : Option_vt (itm)
//
(* ****** ****** *)

fun{
key,itm:t0p
} funmap_remove
  (fmap: &fmap(key, INV(itm)) >> _, k0: key): bool
// end of [funmap_remove]

(* ****** ****** *)
//
fun{}
fprint_funmap$sep (out: FILEref): void // "; "
fun{}
fprint_funmap$fmapto (out: FILEref): void // "->"
//
fun{
key,itm:t@ype
} fprint_funmap
  (out: FILEref, fmap: fmap(key, INV(itm))): void
//
overload fprint with fprint_funmap
//
(* ****** ****** *)

(* end of [funmap.hats] *)

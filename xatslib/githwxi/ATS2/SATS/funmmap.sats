(***********************************************************************)
(*                                                                     *)
(*                         Applied Type System                         *)
(*                                                                     *)
(***********************************************************************)

(*
** ATS/Postiats - Unleashing the Potential of Types!
** Copyright (C) 2026 Hongwei Xi, ATS Trustful Software, Inc.
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
(* ****** ****** *)
(*
Author: Hongwei Xi
Sun Mar 29 01:04:45 PM EDT 2026
Authoremail: gmhwxiATgmailDOTcom
*)
(* ****** ****** *)
(* ****** ****** *)
//
(*
HX-2026-03-29:
For multi-maps (mmaps)
associating keys with items of
types [key] and [itm], respectively.
Note that a key can be associated
with multiple items in a multi-map.
*)
//
#abstype
fmmap_tbox // HX: boxed
(key:type,itm:type+) <= p0tr
#sexpdef fmmap = fmmap_tbox(*key,itm*)
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
funmmap_nil
{key,itm:t0}
((*void*)): fmmap(key, itm)
fun<>
funmmap_make_nil
{key,itm:t0}
((*void*)): fmmap(key, itm)
//
(* ****** ****** *)
(* ****** ****** *)
//
fun<>
funmmap_nilq
{key,itm:t0}
(map: fmmap(key,itm)): bool
fun<>
funmmap_consq
{key,itm:t0}
(map: fmmap(key,itm)): bool
//
#symload
nilq with funmmap_nilq of 1000
#symload
consq with funmmap_consq of 1000
//
(* ****** ****** *)
(* ****** ****** *)
//
(*
HX-2026-04-01:
It counts the number of keyvals.
*)
fun
<key:t0>
<itm:t0>
funmmap_size
(map: fmmap(key, itm)): nint
#symload size with funmmap_size of 1000
//
(* ****** ****** *)
(* ****** ****** *)
//
fun
<key:t0>
<itm:t0>
funmmap_keyval$print
(map: fmmap(key, itm)): void
(*
#symload print with funmmap_keyval$print
*)
//
(* ****** ****** *)
//
fun
<key:t0>
<itm:t0>
funmmap_key$strmize
(
map: fmmap(key, itm)): strm_vt(key)
//
fun
<key:t0>
<itm:t0>
funmmap_keyval$strmize
(
map:
fmmap(key, itm)): strm_vt(@(key,itm))
#symload strmize
  with funmmap_keyval$strmize of 1000
//
(* ****** ****** *)
(* ****** ****** *)
//
fun
<key:t0>
<itm:t0>
funmmap_keyval$forall
(map: fmmap(key, itm)): bool
#symload
forall with funmmap_keyval$forall of 1000
//
fun
<key:t0>
<itm:t0>
funmmap_keyval$foritm
(map: fmmap(key, itm)): void
#symload
foritm with funmmap_keyval$foritm of 1000
//
(* ****** ****** *)
(* ****** ****** *)
//
fun
<key:t0>
<itm:t0>
funmmap_search$tst
(
map:
fmmap(key, itm), k0: key): (bool)
fun
<key:t0>
<itm:t0>
funmmap_search$old
(
map:
fmmap(key, itm), k0: key): itm(*found*)
fun
<key:t0>
<itm:t0>
funmmap_search$opt
(
map:
fmmap(key, itm), k0: key): optn_vt(itm)
//
(* ****** ****** *)
(* ****** ****** *)
//
fun
<key:t0>
<itm:t0>
funmmap_insert$any
(
map:
fmmap
(key, itm), k0: key, x0: itm): fmmap(key,itm)
//
(* ****** ****** *)
(* ****** ****** *)
//
fun
<key:t0>
<itm:t0>
funmmap_remove$old
(
map:
fmmap
(key, itm), k0: key): fmmap(key,itm)
fun
<key:t0>
<itm:t0>
funmmap_remove$opt
(
map:
fmmap
(key, itm), k0: key): (fmmap(key,itm),bool)
//
(* ****** ****** *)
//
fun
<key:t0>
<itm:t0>
funmmap_getout$old
(
map:
fmmap
(key, itm), k0: key): (fmmap(key,itm), itm)
fun
<key:t0>
<itm:t0>
funmmap_getout$opt
(
map:
fmmap
(key, itm), k0: key): (fmmap(key,itm),optn_vt(itm))
//
(* ****** ****** *)
(* ****** ****** *)
//
(***********************************************************************)
(* end of [ATS3/XANADU_xatslib_githwxi_ATS2_SATS_funmmap.sats] *)
(***********************************************************************)

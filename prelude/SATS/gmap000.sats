(***********************************************************************)
(*                                                                     *)
(*                         Applied Type System                         *)
(*                                                                     *)
(***********************************************************************)

(*
** ATS/Xanadu - Unleashing the Potential of Types!
** Copyright (C) 2024 Hongwei Xi, ATS Trustful Software, Inc.
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
Sun 08 Sep 2024 10:45:33 AM EDT
*)
Authoremail: gmhwxiATgmailDOTcom
*)
//
(* ****** ****** *)
(* ****** ****** *)
//
fun
<map:vt>
<key:t0>
<itm:vt>
gmap_nil((*0*)): map
//
(* ****** ****** *)
(* ****** ****** *)
//
fun
<map:t0>
<key:t0>
<itm:vt>
gmap_size(kxs: map): nint
//
(* ****** ****** *)
(* ****** ****** *)
//
(*
HX-2024-09-08:
For print0/1 as well
*)
fun
<map:vt>
<key:t0>
<itm:vt>
gmap_beg((*void*)): strn
fun
<map:vt>
<key:t0>
<itm:vt>
gmap_end((*void*)): strn
fun
<map:vt>
<key:t0>
<itm:vt>
gmap_sep((*void*)): strn
//
(* ****** ****** *)
//
fun
<map:t0>
<key:t0>
<itm:vt>
gmap_print(kxs: map): void
//
(* ****** ****** *)
(* ****** ****** *)
//
fun
<map:t0>
<key:t0>
<itm:vt>
gmap_keyq
(kxs: map, key: key): bool
//
(* ****** ****** *)
(* ****** ****** *)
//
fun
<map:t0>
<key:t0>
<itm:vt>
gmap_cget$at
(kxs: map, key: key): itm
fun
<map:t0>
<key:t0>
<itm:vt>
gmap_cget$at$opt
// HX: nil if !keyq(key)
// HX: cons(old) if keyq(key)
(kxs: map, key: key): optn_vt(itm)
//
(* ****** ****** *)
//
(*
HX-2024-09-20:
These are for imperative maps!
*)
fun
<map:t0>
<key:t0>
<itm:vt>
gmap_setf$at
(kxs: map
,key: key, itm: itm): void
fun
<map:t0>
<key:t0>
<itm:vt>
gmap_setf$at$opt
// HX: nil if !keyq(key)
// HX: cons(old) if keyq(key)
(kxs: map
,key: key, itm: itm): optn_vt(itm)
//
(* ****** ****** *)
(* ****** ****** *)
//
fun
<map:t0>
<key:t0>
<itm:vt>
gmap_strmize
(kxs: map): strm_vt@(key, itm)
//
(* ****** ****** *)
(* ****** ****** *)
//
fun
<map:t0>
<key:t0>
<itm:vt>
gmap_search$tst
(kxs: map, key: key): bool
fun
<map:t0>
<key:t0>
<itm:vt>
gmap_search$cpy
(kxs: map, key: key): optn_vt(itm)
//
(* ****** ****** *)
(* ****** ****** *)
//
(*
HX-2024-09-08:
These are for imperative maps!
*)
//
(*
HX-2024-09-08:
Using [getout$old] if [key]
is known in the given map [map]
*)
#extern
fun
<map:t0>
<key:t0>
<itm:vt>
gmap_getout$any
(kxs: map, key: key): itm
#extern
fun
<map:t0>
<key:t0>
<itm:vt>
gmap_getout$old
(kxs: map, key: key): itm
#extern
fun
<map:t0>
<key:t0>
<itm:vt>
gmap_getout$opt
(kxs: map, key: key): optn_vt(itm)
//
(* ****** ****** *)
(* ****** ****** *)
//
(*
HX-2024-09-08:
These are for imperative maps!
*)
(*
HX-2024-09-08
Using [insert$new] if [key] is
known not in the given map [map]
*)
#extern
fun
<map:t0>
<key:t0>
<itm:vt>
gmap_insert$any
(kxs: map
,key: key, itm: itm): void
#extern
fun
<map:t0>
<key:t0>
<itm:vt>
gmap_insert$new
(kxs: map
,key: key, itm: itm): void
#extern
fun
<map:t0>
<key:t0>
<itm:vt>
gmap_insert$opt
(kxs: map
,key: key, itm: itm): optn_vt(itm)
//
(* ****** ****** *)
(* ****** ****** *)
//
(*
HX-2024-09-08
These are for functional maps!
*)
//
#extern
fun
<map:t0>
<key:t0>
<itm:t0>
gmap_getout$any
(kxs: map, key: key): map
#extern
fun
<map:t0>
<key:t0>
<itm:t0>
gmap_getout$old
(kxs: map, key: key): map
#extern
fun
<map:t0>
<key:t0>
<itm:t0>
gmap_getout$opt
( kxs: map
, key: key): (map, optn_vt(itm))
//
(* ****** ****** *)
(* ****** ****** *)
//
#extern
fun
<map:t0>
<key:t0>
<itm:t0>
gmap_finsert$any
(kxs: map
,key: key, itm: itm): map
#extern
fun
<map:t0>
<key:t0>
<itm:t0>
gmap_finsert$new
(kxs: map
,key: key, itm: itm): map
#extern
fun
<map:t0>
<key:t0>
<itm:t0>
gmap_finsert$opt
( kxs: map
, key: key
, itm: itm): (map, optn_vt(itm))
//
(* ****** ****** *)
(* ****** ****** *)
//
(* ****** ****** *)(* ****** ****** *)
(* ****** ****** *)(* ****** ****** *)

(* end of [ATS3/XANADU_prelude_SATS_gmap000.sats] *)

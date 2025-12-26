(***********************************************************************)
(*                                                                     *)
(*                         Applied Type System                         *)
(*                                                                     *)
(***********************************************************************)

(*
** ATS/Xanadu - Unleashing the Potential of Types!
** Copyright (C) 2025 Hongwei Xi, ATS Trustful Software, Inc.
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
AMP: array-based map
Wed Dec 24 04:22:13 PM EST 2025
*)
Authoremail: gmhwxiATgmailDOTcom
*)
//
(* ****** ****** *)
(* ****** ****** *)
//
(*
HX-2025-12-24:
For gamp_print
For print0/1 as well
*)
fun
<amp:vt>
<key:vt>
<itm:vt>
gamp_beg((*void*)): strn
fun
<amp:vt>
<key:vt>
<itm:vt>
gamp_end((*void*)): strn
fun
<amp:vt>
<key:vt>
<itm:vt>
gamp_sep((*void*)): strn
//
(* ****** ****** *)
//
fun
<amp:t0>
<key:t0>
<itm:vt>
gamp_print(kxs: amp): void
//
(* ****** ****** *)
(* ****** ****** *)
//
fun
<amp:t0>
<key:t0>
<itm:vt>
gamp_keyq
(kxs: amp, key: key): bool
//
(* ****** ****** *)
(* ****** ****** *)
//
fun
<amp:t0>
<key:t0>
<itm:vt>
gamp_cget$at
(kxs: amp, key: key): itm
fun
<amp:t0>
<key:t0>
<itm:vt>
gamp_cget$at$opt
// HX: nil if !keyq(key)
// HX: cons(old) if keyq(key)
(kxs: amp, key: key): optn_vt(itm)
//
(* ****** ****** *)
//
(*
HX-2025-12-24:
These are for imperative maps!
Wed Dec 24 01:07:13 PM EST 2025
*)
fun
<amp:t0>
<key:t0>
<itm:vt>
gamp_setf$at
(kxs: amp
,key: key, itm: itm): void
fun
<amp:t0>
<key:t0>
<itm:vt>
gamp_setf$at$opt
// HX: nil if !keyq(key)
// HX: cons(old) if keyq(key)
(kxs: amp
,key: key, itm: itm): optn_vt(itm)
//
(* ****** ****** *)
(* ****** ****** *)
//
(*
HX-2025-12-24:
The semantics is involved
for a mutable map (hashmap)!
Wed Dec 24 01:07:13 PM EST 2025
*)
fun
<amp:t0>
<key:t0>
<itm:vt>
gamp_strmize
(kxs: amp): strm_vt@(key, itm)
//
(* ****** ****** *)
(* ****** ****** *)
//
fun
<amp:t0>
<key:t0>
<itm:vt>
gamp_search$tst
(kxs: amp, key: key): bool
fun
<amp:t0>
<key:t0>
<itm:vt>
gamp_search$cpy
(kxs: amp, key: key): optn_vt(itm)
//
(* ****** ****** *)
(* ****** ****** *)
//
(*
HX-2025-12-24:
These are for imperative maps!
Wed Dec 24 01:08:59 PM EST 2025
*)
//
(*
HX-2025-12-24:
Using [getout$old] if [key]
is known in the given map [map]
*)
(*
fun
<amp:t0>
<key:t0>
<itm:vt>
gamp_getout$any
(kxs: amp, key: key): itm
*)
fun
<amp:t0>
<key:t0>
<itm:vt>
gamp_getout$old
(kxs: amp, key: key): itm
fun
<amp:t0>
<key:t0>
<itm:vt>
gamp_getout$opt
(kxs: amp, key: key): optn_vt(itm)
//
(* ****** ****** *)
(* ****** ****** *)
//
(*
HX-2025-12-24:
These are for imperative maps!
Wed Dec 24 01:10:05 PM EST 2025
*)
(*
HX-2025-12-24:
Using [insert$new] if [key] is
known not in the given map [map]
*)
(*
fun
<amp:t0>
<key:t0>
<itm:vt>
gamp_insert$any
(kxs: amp
,key: key, itm: itm): void
*)
fun
<amp:t0>
<key:t0>
<itm:vt>
gamp_insert$new
(kxs: amp
,key: key, itm: itm): void
fun
<amp:t0>
<key:t0>
<itm:vt>
gamp_insert$opt
(kxs: amp
,key: key, itm: itm): optn_vt(itm)
//
(* ****** ****** *)
(* ****** ****** *)
//
(***********************************************************************)
(* end of [ATS3/XANADU_prelude_SATS_gamp000.sats] *)
(***********************************************************************)

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
(* ****** ****** *)
//
(*
Author: Hongwei Xi
(*
Thu 08 Aug 2024 07:48:50 AM EDT
*)
Authoremail: gmhwxiATgmailDOTcom
*)
//
(* ****** ****** *)
(* ****** ****** *)
(*
HX: For hashmap support in JS
*)
(* ****** ****** *)
(* ****** ****** *)
#abstbox
jshsmap_tbox(k:t0,x:vt)
#absvtbx
jshsmap_vtbx(k:t0,x:vt)
(* ****** ****** *)
#sexpdef jshsmap = jshsmap_tbox
#sexpdef jshsmap_vt = jshsmap_vtbx
(* ****** ****** *)
(* ****** ****** *)
//
fun<>
jshsmap_length
 {k:t0}{x:t0}
 (map: jshsmap(k,x)): nint
//
(* ****** ****** *)
(* ****** ****** *)
//
fun<>
jshsmap_make_nil
 {k:t0}{x:vt}
(   (*void*)   ): jshsmap(k,x)
//
fun<>
jshsmap_make_list
 {k:t0}{x:t0}
( kxs:list@(k,x) ): jshsmap(k,x)
//
fun<>
jshsmap_make0_llist
 {k:t0}{x:vt}
( kxs:list_vt@(k,x) ): jshsmap(k,x)
//
#symload
jshsmap with jshsmap_make_nil of 1000
#symload
jshsmap with jshsmap_make_list of 1000
#symload
jshsmap with jshsmap_make0_llist of 1000
//
(* ****** ****** *)
(* ****** ****** *)
//
fun<>
jshsmap_get$at
 {k:t0}{x:t0}
(jshsmap(k,x), k): (x)
fun<>
jshsmap_set$at
 {k:t0}{x:t0}
(jshsmap(k,x), k, x): void
//
#symload [] with jshsmap_get$at of 1000
#symload [] with jshsmap_set$at of 1000
//
(* ****** ****** *)
(* ****** ****** *)
//
fun<>
jshsmap_strmize
 {k:t0}{x:vt}
(map: jshsmap(k,x)): strm_vt@(k,x)
//
(* ****** ****** *)
(* ****** ****** *)
//
(*
HX-2024-08-10:
There is no [rforall] as there
is no natural ordering of pairs
in a hashmap.
*)
fun<>
jshsmap_forall_f2un
 {k:t0}{x:vt}
( map: jshsmap(k,x)
, test: (k, !x) -> bool): bool
//
#symload
forall with jshsmap_forall_f2un of 1000
//
(* ****** ****** *)
(* ****** ****** *)
//
fun<>
jshsmap_search$tst
 {k:t0}{x:vt}
(map: jshsmap(k,x), key: k): bool
//
fun<>
jshsmap_search$cpy
 {k:t0}{x:vt}
(map: jshsmap(k,x), key: k): optn_vt(x)
//
(* ****** ****** *)
//
fun<>
jshsmap_remove$opt
 {k:t0}{x:vt}
(map: jshsmap(k,x), key: k): optn_vt(x)
//
(* ****** ****** *)
//
fun<>
jshsmap_insert$any
 {k:t0}{x:vt}
(map: jshsmap(k,x), key: k, itm: x): void
fun<>
jshsmap_insert$opt
 {k:t0}{x:vt}
(map: jshsmap(k,x), key: k, itm: x): optn_vt(x)
//
(* ****** ****** *)
//
(*
HX-2024-08-09:
The prefix "UN" indicate that
the declared function is unsafe
in nature; it is usually only used
to implement some safe functions.
*)
fun<>
UN_jshsmap_get$at$raw
 {k:t0}{x:t0}
(map: jshsmap(k,x), key: k): ( x )
fun<>
UN_jshsmap_set$at$raw
 {k:t0}{x:t0}
(map: jshsmap(k,x), key: k, itm: x): void
//
(*
HX-2024-08-09:
This assume that [key] is not in [map]
*)
fun<>
UN_jshsmap_insert$raw
 {k:t0}{x:vt}
(map: jshsmap(k,x), key: k, itm: x): void
//
(* ****** ****** *)
(* ****** ****** *)
//
fcast // fun
GSEQ_make_jshsmap
{k:t0}{x:t0}
( map: jshsmap(k, x))
: GSEQ(jshsmap(k, x), @(k, x))
#symload GSEQ with GSEQ_make_jshsmap of 1000
//
(* ****** ****** *)
(* ****** ****** *)
//
(* ****** ****** *)(* ****** ****** *)
(* ****** ****** *)(* ****** ****** *)

(* end of [ATS3/XANADU_xatslib_JS_SATS_Hsmap.sats] *)

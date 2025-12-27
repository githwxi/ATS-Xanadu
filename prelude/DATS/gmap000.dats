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
Sun 08 Sep 2024 12:39:45 PM EDT
*)
Authoremail: gmhwxiATgmailDOTcom
*)
//
(* ****** ****** *)
(* ****** ****** *)
//
#impltmp
< m0:vt >
< k0:vt >
< x0:vt >
gmap_sep((*void*)) = ","
#impltmp
< m0:vt >
< k0:vt >
< x0:vt >
gmap_end((*void*)) = "}"
#impltmp
< m0:vt >
< k0:vt >
< x0:vt >
gmap_beg((*void*)) = "gmap{"
//
(* ****** ****** *)
(* ****** ****** *)
//
(*
#impltmp
< m0:t0 >
< k0:t0 >
< x0:t0 >
gmap_keyq
(map, k0) =
gseq_exists0
<strm_vt(k0)><x0>
(
gmap_key$strmize
<m0><k0><x0>(map)) where
{
#impltmp
exists$test0
< k0 >( k1 ) = g_equal<k0>(k0, k1)
}(*where*)//end-of-[gmap_keyq(map,k0)]
*)
#impltmp
< m0:t0 >
< k0:t0 >
< x0:t0 >
gmap_keyq
(map, k0) =
gmap_search$tst<m0><k0><x0>(map, k0)
//
(* ****** ****** *)
(* ****** ****** *)
//
(*
HX-2025-12-27:
Sat Dec 27 08:54:59 AM EST 2025
*)
//
#impltmp
< m0:t0 >
< k0:t0 >
< x0:t0 >
gmap_get$at
  (map, k0) =
(
case+ opt of
| ~
optn_vt_cons(itm) => itm)
where
{
val opt =
gmap_get$at$opt<m0><k0><x0>(map, k0)
}(*where*)//end-of-[gmap_get$at(...)]
//
#impltmp
< m0:t0 >
< k0:t0 >
< x0:t0 >
gmap_get$at$opt
  (map, k0) =
(
gmap_search$opt<m0><k0><x0>(map, k0))
//
(* ****** ****** *)
(* ****** ****** *)
//
(*
#impltmp
< m0:t0 >
< k0:t0 >
< x0:t0 >
gmap_search$tst
  (map, k0) =
let
//
#typedef
kx = @(k0, x0)
//
in//let
//
gseq_consq0
<strm_vt(kx)><kx>
(
strm_vt_filter0<kx>
(
let
#impltmp
filter$test
< kx >( kx ) =
(
  g_equal<k0>(k0, kx.0))
in//let
  gseq_strmize<m0><(k0,x0)>(map)end))
//
end//let//end-of-[gmap_search$tst(map,k0)]
*)
//
#impltmp
< m0:t0 >
< k0:t0 >
< x0:t0 >
gmap_search$tst
  (map, k0) =
(
case+ opt0 of
| ~
optn_vt_nil() => false
| ~
optn_vt_cons(x0) => true)
where
{
val opt0 =
gmap_search$opt<m0><k0><x0>(map, k0)
}(*where*)//end-of-[gmap_search$tst(map,k0)]
//
(* ****** ****** *)
//
#impltmp
< m0:t0 >
< k0:t0 >
< x0:t0 >
gmap_search$opt
  (map, k0) =
(
case+ opt0 of
| ~
optn_vt_nil
( (*void*) ) => optn_vt_nil()
| ~
optn_vt_cons
(    kx    ) => optn_vt_cons(kx.1)
) where
{
//
#typedef
kx = (k0, x0)
//
val opt0 =
gseq_head$opt0
<strm_vt(kx)><kx>
(
strm_vt_filter0<kx>
(
let
#impltmp
filter$test
< kx >( kx ) =
(
  g_equal<k0>(k0, kx.0))
in//let
  gseq_strmize<m0><(k0,x0)>(map)end))
//
}(*where*)//end-of-[gmap_search$opt(map,k0)]
//
(* ****** ****** *)
(* ****** ****** *)
//
#impltmp
< m0:t0 >
< k0:t0 >
< x0:t0 >
gmap_insert$new
( map, k0, x0 ) =
(
case+ opt of
| ~
optn_vt_nil() => map
) where{
val (map, opt) =
(
gmap_insert$opt<m0><k0><x0>(map, k0, x0))
}(*where*)//end-of-[gmap_insert$new(map,...)]
//
(* ****** ****** *)
(* ****** ****** *)
//
#impltmp
< m0:t0 >
< k0:t0 >
< x0:t0 >
gmap_getout$old
  (map, k0) =
(
case+ opt of
| ~
optn_vt_cons(x0) => (map, x0))
where{
val (map, opt) =
(
  gmap_getout$opt<m0><k0><x0>( map, k0 ))
}(*where*)//end-of-[gmap_getout$old(map,...)]
//
(* ****** ****** *)
(* ****** ****** *)
//
(***********************************************************************)
(* end of [ATS3/XANADU_prelude_DATS_gmap000.dats] *)
(***********************************************************************)

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
#impltmp
< m0:t0 >
< k0:t0 >
< x0:vt >
gmap_keyq(map, k0) =
gseq_exists0
(
gmap_key$strmize
<m0><k0><x0>(map)) where
{
#impltmp
exists$test0<k0>(k1) = g_equal<k0>(k0, k1)
}
//
(* ****** ****** *)
(* ****** ****** *)
//
#impltmp
< m0:t0 >
< k0:t0 >
< x0:t0 >
gmap_search$tst
 (map, k0) =
let
#typedef kx = @(k0, x0) in
gseq_consq0(
strm_vt_filter0$f1un(
gseq_strmize<m0><(k0,x0)>(map),
lam(kx:kx) => g_equal<k0>(k0, kx.0))) end
//
(* ****** ****** *)
//
#impltmp
< m0:t0 >
< k0:t0 >
< x0:t0 >
gmap_search$cpy
 (map, k0) =
(
case+ opt0 of
| ~
optn_vt_nil() => optn_vt_nil()
| ~
optn_vt_cons(kx) => optn_vt_cons(kx.1)
) where
{
//
#typedef kx = (k0, x0)
//
val opt0 =
gseq_head$opt0
<strm_vt(kx)><kx>(
strm_vt_filter0$f1un<kx>(
gmap_keyval$strmize<m0><k0><x0>(map), lam(kx) => g_equal<k0>(k0, kx.0)))
//
}
//
(* ****** ****** *)
(* ****** ****** *)
//
(* ****** ****** *)(* ****** ****** *)
(* ****** ****** *)(* ****** ****** *)

(* end of [ATS3/XANADU_prelude_DATS_gmap000.dats] *)

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
Sun 08 Sep 2024 02:06:44 PM EDT
*)
Authoremail: gmhwxiATgmailDOTcom
*)
//
(* ****** ****** *)
(* ****** ****** *)
//
#impltmp
<map:t0>
<key:vt>
<itm:vt>
gmap_key$strmize
  ( map ) =
let
//
val kxs =
(
gmap_keyval$strmize
< map >< key >< itm >(map))
//
in//let
(
strm_vt_map0<kx>(kxs)) where
{
#vwtpdef kx = (key,itm)
#impltmp map$fopr0<kx>(kx) = kx.0}
end//let//end(gmap_key$strmize(map))
//
(* ****** ****** *)
//
#impltmp
<map:t0>
<key:vt>
<itm:vt>
gmap_val$strmize
  ( map ) =
let
//
val kxs =
(
gmap_keyval$strmize
< map >< key >< itm >(map))
//
in//let
(
strm_vt_map0<kx>(kxs)) where
{
#vwtpdef kx = (key,itm)
#impltmp map$fopr0<kx>(kx) = kx.1}
end//let//end(gmap_val$strmize(map))
//
(* ****** ****** *)
//
#impltmp
<map:t0>
<key:vt>
<itm:vt>
gmap_keyval$strmize =
gseq_strmize1<map><(key,itm)>(*void*)
//
(* ****** ****** *)
(* ****** ****** *)
//
(* ****** ****** *)(* ****** ****** *)
(* ****** ****** *)(* ****** ****** *)

(* end of [ATS3/XANADU_prelude_DATS_gmap001.dats] *)

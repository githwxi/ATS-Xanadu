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
(* ****** ****** *)
//
(*
Author: Hongwei Xi
(*
Wed 04 Jan 2023 12:36:34 AM EST
*)
Authoremail: gmhwxiATgmailDOTcom
*)
//
(* ****** ****** *)
(* ****** ****** *)
#define
ATS_PACKNAME
"ATS3.XANADU.xatsopt-20220500"
(* ****** ****** *)
(* ****** ****** *)
//
#include
"./../HATS/xatsopt_sats.hats"
#include
"./../HATS/xatsopt_dpre.hats"
//
(* ****** ****** *)
(* ****** ****** *)
#staload "./../SATS/xlibext.sats"
#staload "./../SATS/xstamp0.sats"
(* ****** ****** *)
(* ****** ****** *)
//
#if
defq(_XATS2JS_)
#staload
_(*tmp*) =
"srcgen1\
/prelude/DATS/CATS/JS/basics3.dats"
#endif//end-of-(#ifdefq(_XATS2JS_))
#if
defq(_XATS2PY_)
#staload
_(*tmp*) =
"srcgen1\
/prelude/DATS/CATS/PY/basics3.dats"
#endif//end-of-(#ifdefq(_XATS2PY_))
//
(* ****** ****** *)
(* ****** ****** *)

local
//
(* ****** ****** *)
#typedef key = sint
(* ****** ****** *)
//
#absimpl
tmpmap_tbox
(itm:type) = mydict(key, itm)
//
(* ****** ****** *)
in//local
(* ****** ****** *)

#implfun
tmpmap_make_nil
  ( (*nil*) ) =
mydict_make_nil<key>((*void*))

(* ****** ****** *)
//
#implfun
tmpmap_strmize
  {itm:tbox}(map) =
(
gmap_strmize
<gmap><key><itm>(map)) where
{
#typedef gmap = mydict(key, itm) }
//
(* ****** ****** *)
//
#implfun
tmpmap_search$opt
  {itm:tbox}(map,key) =
let
//
val key = g0u2s(uint(key))
//
in//let
//
mydict_search$opt<key><itm>(map, key)
//
end(*let*)//end-of-[tmpmap_search$opt(...)]
//
(* ****** ****** *)
//
#implfun
tmpmap_insert$any
{itm:tbox}(map,key,itm) =
let
//
val key = g0u2s(uint(key))
//
in//let
//
mydict_insert$any<key><itm>(map,key,itm)
//
end(*let*)//end-of-[tmpmap_insert$any(...)]
//
(* ****** ****** *)

endloc (*local*) // end of [  local(topmap)  ]

(* ****** ****** *)

(* end of [ATS3/XATSOPT_srcgen2_DATS_xstamp0_tmpmap.dats] *)

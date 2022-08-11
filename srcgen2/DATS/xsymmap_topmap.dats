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
//
(*
Author: Hongwei Xi
(*
Sat Aug  6 12:22:41 EDT 2022
*)
Authoremail: gmhwxiATgmailDOTcom
*)
//
(* ****** ****** *)
#define
ATS_PACKNAME
"ATS3.XANADU.xatsopt-20220500"
(* ****** ****** *)
#include
"./../HATS/xatsopt_sats.hats"
#include
"./../HATS/xatsopt_dats.hats"
(* ****** ****** *)
#staload "./../SATS/xstamp0.sats"
(* ****** ****** *)
#staload "./../SATS/xsymbol.sats"
(* ****** ****** *)
#staload "./../SATS/xsymmap.sats"
(* ****** ****** *)

local

(* ****** ****** *)
#staload
"prelude\
/DATS/CATS/JS/basics1.dats"
(* ****** ****** *)

#typedef key = sint

(* ****** ****** *)

#absimpl
topmap_tbox
(itm:type) =
jsobjmap(key, list(itm))

(* ****** ****** *)
in//local
(* ****** ****** *)

#implfun
topmap_make_nil
  ( (*nil*) ) =
XATS2JS_jsobjmap_make_nil<key>()

(* ****** ****** *)

#implfun
topmap_search_opt
  {itm}(map, key) =
let
//
#typedef
itms = list(itm)
//
val
key =
g0u2s(uint(key.stmp()))
val
opt = 
XATS2JS_jsobjmap_search_opt<key>{itms}(map,key)
//
in//let
//
case+ opt of
| ~
optn_vt_nil() =>
optn_vt_nil()
| ~
optn_vt_cons(itms) =>
let
val-list_cons(itm, _) = itms in optn_vt_cons(itm)
end (*let*) // end of [optn_vt_cons]
//
end (*let*) // end of [topmap_search_opt(...]

(* ****** ****** *)

#implfun
topmap_insert_any
  {itm}
  (map, key, itm) =
let
//
#typedef
itms = list(itm)
//
val
key =
g0u2s(uint(key.stmp()))
val
opt = 
XATS2JS_jsobjmap_search_opt<key>{itms}(map,key)
//
in//let
//
case+ opt of
| ~
optn_vt_nil() =>
let
val itms = list_sing(itm)
in//let
XATS2JS_jsobjmap_insert_any<key>{itms}(map,key,itms)
end (*let*) // end of [optn_vt_nil()]
| ~
optn_vt_cons(itms) =>
let
val itms = list_cons(itm, itms)
in
XATS2JS_jsobjmap_insert_any<key>{itms}(map,key,itms)
end (*let*) // end of [optn_vt_cons(...)]
//
end (*let*) // end of [topmap_insert_any(...)]
(* ****** ****** *)

endloc (*local*) // end of [  local(topmap)  ]

(* ****** ****** *)

#implfun
topmap_insert_kxs
{itm}( map, kxs ) =
(
loop(kxs) ) where
{
fnx
loop
( kxs
: list_vt@(key,itm)): void =
(
case+ kxs of
| ~
list_vt_nil
( (*void*) ) => ()
| ~
list_vt_cons
( kx1, kxs ) =>
loop(kxs) where {
  val () =
  topmap_insert_any(map, kx1.0, kx1.1)
} // end of-(list_vt_cons)
) (* end of [loop(kxs)] *)
} (*where*)//end-of-[topmap_insert_kxs(map,kxs)]

(* ****** ****** *)

(* end of [ATS3/XATSOPT_xsymmap_topmap.dats] *)

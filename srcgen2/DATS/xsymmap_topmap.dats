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
Sat Aug  6 12:22:41 EDT 2022
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
(*
#include
"./../HATS/xatsopt_dats.hats"
*)
#include
"./../HATS/xatsopt_dpre.hats"
//
(* ****** ****** *)
#staload "./../SATS/xlibext.sats"
(* ****** ****** *)
#staload "./../SATS/xstamp0.sats"
#staload "./../SATS/xsymbol.sats"
#staload "./../SATS/xsymmap.sats"
(* ****** ****** *)
#staload "./../SATS/xglobal.sats"
(* ****** ****** *)
(* ****** ****** *)

local
//
(* ****** ****** *)
//
#typedef key = sint
//
(* ****** ****** *)
//
#absimpl
topmap_tbox
(itm:type) =
mydict(key, list(itm))
//
(* ****** ****** *)
in//local
(* ****** ****** *)
//
#implfun
topmap_make_nil
{itm:tbox}((*nil*)) =
let
#typedef itms = list(itm)
in//let
mydict_make_nil<key><itms>((*0*))
end//let//end-of-[topmap_make_nil()]
//
(* ****** ****** *)
//
#implfun
topmap_strmize
{itm:tbox}(map) =
(
gmap_strmize<gmap><key><itms>(map)
) where
{
  #typedef itms = list(itm)
  #typedef gmap = mydict(key, itms)
}(*where*)//end-of-[topmap_strmize(...)]
//
(* ****** ****** *)

#implfun
topmap_search$opt
  {itm:tbox}
  (map, key) =
let
//
#typedef
itms = list(itm)
//
val
key = g0u2s(uint(key.stmp()))
val
opt = 
mydict_search$opt<key><itms>(map,key)
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
end (*let*) // end of [topmap_search$opt(...]

(* ****** ****** *)

#implfun
topmap_insert$any
  {itm:tbox}
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
mydict_search$opt<key><itms>(map, key)
//
in//let
//
case+ opt of
| ~
optn_vt_nil() =>
let
val itms = list_sing(itm)
in//let
mydict_insert$any<key><itms>(map, key, itms)
end (*let*) // end of [optn_vt_nil()]
| ~
optn_vt_cons(itms) =>
let
val itms = list_cons(itm, itms)
in
mydict_insert$any<key><itms>(map, key, itms)
end (*let*) // end of [optn_vt_cons(itms)]
//
end (*let*) // end of [topmap_insert$any(...)]
(* ****** ****** *)

endloc (*local*) // end of [  local(topmap)  ]

(* ****** ****** *)
(* ****** ****** *)

#implfun
topmap_insert$kxs
  {itm:tbox}
  (map, kxs) =
(
loop(map, kxs) ) where
{
fnx
loop
( map
: topmap(itm)
, kxs
: list_vt@(key,itm)): void =
(
case+ kxs of
| ~
list_vt_nil
( (*void*) ) => ()
| ~
list_vt_cons
( kx1, kxs ) =>
loop(map, kxs) where {
  val () =
  topmap_insert$any(map, kx1.0, kx1.1)
} // end of-(list_vt_cons)
) (* end of [loop(map, kxs)] *)
} (*where*)//end-of-[topmap_insert$kxs(map,kxs)]

(* ****** ****** *)

#implfun
topmap_insmix$any
  {itm:tbox}
( map
, k0, x0, mix ) =
let
val opt =
topmap_search$opt(map, k0)
in//let
//
case+ opt of
| ~
optn_vt_nil() =>
topmap_insert$any(map, k0, x0)
| ~
optn_vt_cons(x1) =>
topmap_insert$any(map, k0, mix(x0, x1))
//
end (*let*)//end(topmap_insmix$any(map,k0,x0,mix))

(* ****** ****** *)

#implfun
topmap_insmix$kxs
  {itm:tbox}
( map, kxs, mix ) =
(
loop(map, kxs)) where
{
#vwtpdef
topmap = topmap( itm )
fnx
loop
( map: topmap
, kxs
: list_vt@(key,itm)): void =
(
case+ kxs of
| ~
list_vt_nil
( (*void*) ) => ()
| ~
list_vt_cons
( kx1, kxs ) =>
loop(map, kxs) where {
  val () =
  topmap_insmix$any(map, kx1.0, kx1.1, mix)
} // end of-(list_vt_cons)
) (* end of [loop(map,kxs)] *)
} (*where*)//end-of-[topmap_insmix$kxs(map,kxs,mix)]

(* ****** ****** *)
//
#impltmp
<itm:t0>
topmap_fprint
 (tmap, out) =
let
//
#impltmp
g_print$out<>() = out
//
in//let
auxloop
(
topmap_strmize(tmap)
) where
{
//
#vwtpdef
kx = (int, list(itm))
//
fun
auxkey
(k0: int) =
let
//
val opt =
the_xsymbls_search(k0)
//
in//let
//
case+ opt of
| ~
optn_vt_nil
( (*void*) ) =>
(
  print("(nil)"))
| ~
optn_vt_cons(sym) => print(sym)
//
end (*let*) // end of [auxkey(k0)]
//
fun
auxloop
( kxs
: strm_vt(kx)): void =
(
case+ !kxs of
| ~
strmcon_vt_nil
(   (*void*)   ) =>
(   (*void*)   )
| ~
strmcon_vt_cons
(   kx1, kxs   ) =>
(
  auxloop(kxs) ) where
{
val () = auxkey(kx1.0)
(*
val () = println(" -> ", kx1.1)
*)
val () = // HX: [kx1.1] is list1
printsln(" -> ", list_head(kx1.1))
} (*where*)
) (*case+*) // end of [ auxloop(kxs) ]
}
end (*let*) // end of [topmap_fprint(tmap,out)]
//
(* ****** ****** *)
(* ****** ****** *)

(* end of [ATS3/XATSOPT_srcgen2_DATS_xsymmap_topmap.dats] *)

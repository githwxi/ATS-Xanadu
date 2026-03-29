(***********************************************************************)
(*
//
HX-2026-03-28: Porting ATS2!!!
Sat Mar 28 09:24:42 PM EDT 2026
//
*)
(***********************************************************************)
(*                                                                     *)
(*                         Applied Type System                         *)
(*                                                                     *)
(***********************************************************************)

(*
** ATS/Postiats - Unleashing the Potential of Types!
** Copyright (C) 2011-2013 Hongwei Xi, ATS Trustful Software, Inc.
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

(* Author: Hongwei Xi *)
(* Authoremail:
   hwxi AT cs DOT bu DOT edu *)
(* Start time: December, 2012 *)

(* ****** ****** *)
(* ****** ****** *)
//
#staload "./../SATS/funmap.sats"
//
(* ****** ****** *)
(* ****** ****** *)
//
#impltmp
{ k:t0 }
{ x:t0 }
g_ptype
<fmap(k,x)>() =
(
pstrn
("fmap(");
g_ptype<k>(); pstrn(",");
g_ptype<x>(); pstrn(")"))
//
(* ****** ****** *)
(* ****** ****** *)
//
#impltmp
<key:t0>
equal_key_key
(k1, k2) = g_equal<key>(k1, k2)
//
#impltmp
<key:t0>
compare_key_key
( k1, k2 ) = g_cmp<key>( k1, k2 )
//
(* ****** ****** *)
(* ****** ****** *)
//
#impltmp
<(*tmp*)>
funmap_nil
{key,itm:t0}() =
(
funmap_make_nil<>{key,itm}((*0*)))
//
(* ****** ****** *)
(* ****** ****** *)
//
#impltmp
<(*tmp*)>
funmap_nilq
{key,itm:t0}(map) =
(
not(funmap_consq<>{key,itm}(map)))
//
#impltmp
<(*tmp*)>
funmap_consq
{key,itm:t0}(map) =
(
  not(funmap_nilq<>{key,itm}(map)))
//
(* ****** ****** *)
(* ****** ****** *)
//
(*
HX-2026-03-28:
This one is O(n) time!!!
*)
#impltmp
<key:t0>
<itm:t0>
funmap_size
(     map     ) =
(
strm_vt_length0(
funmap_key$strmize<key><itm>(map)))
//
(* ****** ****** *)
(* ****** ****** *)
//
#impltmp
<key:t0>
<itm:t0>
funmap_search$tst
(   kxs, k0   ) =
(
case+ opt of
| ~optn_vt_nil() => false
| ~optn_vt_cons(x0) => true)
where
{
val opt =
funmap_search$opt<key><itm>(kxs, k0)
}(*where*)//end(funmap_search$tst(...))
//
#impltmp
<key:t0>
<itm:t0>
funmap_search$any
(   kxs, k0   ) =
(
case- opt of
| ~optn_vt_cons(x0) => ( x0 ))
where
{
val opt =
funmap_search$opt<key><itm>(kxs, k0)
}(*where*)//end(funmap_search$any(...))
//
(* ****** ****** *)
(* ****** ****** *)
//
#impltmp
{key:t0}
{itm:t0}
g_print
<fmap
(key,itm)> =
funmap_keyval$print<key><itm>(*map*)
//
#impltmp
<key:t0>
<itm:t0>
funmap_keyval$print
(     map     ) =
(
strm_vt_print0<x0>(kxs))
where
{
//
#typedef x0 = (key, itm)
#vwtpdef xs = strm_vt(x0)
//
#impltmp
gseq$beg<xs><x0>() = "funmap("
//
val kxs =
(
funmap_keyval$strmize
<   key   ><   itm   >(   map   ))
//
}(*where*)//end(funmap_keyval$print(map))
//
(* ****** ****** *)
(* ****** ****** *)
//
#impltmp
{key:t0}
{itm:t0}
gseq_strmize
<fmap
(key,itm)>
<t0up
(key,itm)>
(     map     ) =
(
  funmap_keyval$strmize<key><itm>(map))
//
#impltmp
{key:t0}
{itm:t0}
gmap_keyval$strmize
<fmap
(key,itm)>
<key><itm>
(     map     ) =
(
  funmap_keyval$strmize<key><itm>(map))
//
(* ****** ****** *)
//
#impltmp
<key:t0>
<itm:t0>
funmap_key$strmize
(     map     ) =
(
strm_vt_map0<kx><k0>(
  funmap_keyval$strmize<key><itm>(map)))
where
{
#typedef k0 = key
#typedef kx = @(key, itm)
#impltmp map$fopr0<kx><k0>(kx) = ( kx.0 )
}(*where*)//end-of-[funmap_key$strmize(map)]
//
(* ****** ****** *)
(* ****** ****** *)
//
#impltmp
<key:t0>
<itm:t0>
funmap_keyval$forall
(     map     ) =
gseq_forall<fmap(key,itm)><t0up(key,itm)>(map)
//
#impltmp
<key:t0>
<itm:t0>
funmap_keyval$foritm
(     map     ) =
gseq_foritm<fmap(key,itm)><t0up(key,itm)>(map)
//
(* ****** ****** *)
(* ****** ****** *)
//
#impltmp
<key:t0>
<itm:t0>
funmap_insert$any
( kxs, k0, x0 ) =
(
case- opt of
| ~
optn_vt_nil((*0*)) => kxs)
where
{
val (kxs, opt) =
funmap_insert$opt< key >< itm >(kxs, k0, x0)
}(*where*)//end(funmap_insert$any(kxs,k0,x0))
//
#impltmp
<key:t0>
<itm:t0>
funmap$cbr_insert$any
(   map, k0, x0   ) =
let
val kxs = map
val kxs =
funmap_insert$any
< key >< itm >(kxs, k0, x0) in map := kxs end
//
#impltmp
<key:t0>
<itm:t0>
funmap$cbr_insert$opt
(   map, k0, x0   ) =
let
val kxs = map
val (kxs, res) =
funmap_insert$opt
< key >< itm >(kxs, k0, x0) in map := kxs; res end
//
(* ****** ****** *)
(* ****** ****** *)
//
#impltmp
<key:t0>
<itm:t0>
funmap_remove$any
(   kxs, k0   ) =
(
case- opt of true => kxs)
where
{
val (kxs, opt) =
funmap_remove$opt< key >< itm >(kxs, k0)
}(*where*)//end(funmap_remove$any(kxs,k0))
//
#impltmp
<key:t0>
<itm:t0>
funmap_remove$opt
(   kxs, k0   ) =
(
case- opt of
| ~
optn_vt_nil() => (kxs, false)
| ~
optn_vt_cons(x0) => (kxs, true))
where
{
val (kxs, opt) =
funmap_getout$opt< key >< itm >(kxs, k0)
}(*where*)//end(funmap_remove$opt(kxs,k0))
//
#impltmp
<key:t0>
<itm:t0>
funmap$cbr_remove$any
(     map, k0     ) =
let
val kxs = map
val kxs =
funmap_remove$any
<  key  ><  itm  >(kxs, k0) in map := kxs end
//
#impltmp
<key:t0>
<itm:t0>
funmap$cbr_remove$opt
(     map, k0     ) =
let
val kxs = map
val (kxs, res) =
funmap_remove$opt
<  key  ><  itm  >(kxs, k0) in map := kxs; res end
//
(* ****** ****** *)
(* ****** ****** *)
//
#impltmp
<key:t0>
<itm:t0>
funmap_getout$any
(   kxs, k0   ) =
(
case- opt of
| ~
optn_vt_cons( x0 ) => (kxs, x0))
where
{
val (kxs, opt) =
funmap_getout$opt< key >< itm >(kxs, k0)
}(*where*)//end(funmap_getout$any(kxs,k0))
//
#impltmp
<key:t0>
<itm:t0>
funmap_getout$opt
(   kxs, k0   ) =
let
//
val opt =
funmap_search$opt<key><itm>(kxs, k0)
//
in//let
//
case+ opt of
|
optn_vt_nil
(  (*0*)  ) => (kxs, opt)
|
optn_vt_cons
(    x0    ) =>
(
  kxs, opt ) where
{
val kxs =
funmap_remove$any<key><itm>(kxs, k0) }
//
end(*let*)//end(funmap_getout$opt(kxs,k0))
//
(* ****** ****** *)
//
#impltmp
<key:t0>
<itm:t0>
funmap$cbr_getout$any
(     map, k0     ) =
let
val kxs = map
val (kxs, res) =
funmap_getout$any
<  key  ><  itm  >(kxs, k0) in map := kxs; res end
//
#impltmp
<key:t0>
<itm:t0>
funmap$cbr_getout$opt
(     map, k0     ) =
let
val kxs = map
val (kxs, res) =
funmap_getout$opt
<  key  ><  itm  >(kxs, k0) in map := kxs; res end
//
(* ****** ****** *)
(* ****** ****** *)
//
(***********************************************************************)
(* end of [ATS3/XANADU_xatslib_githwxi_ATS2_DATS_funmap.dats] *)
(***********************************************************************)

(***********************************************************************)
(*                                                                     *)
(*                         Applied Type System                         *)
(*                                                                     *)
(***********************************************************************)

(*
** ATS/Postiats - Unleashing the Potential of Types!
** Copyright (C) 2026 Hongwei Xi, ATS Trustful Software, Inc.
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
(*
Author: Hongwei Xi
Sun Mar 29 01:30:09 PM EDT 2026
Authoremail: gmhwxiATgmailDOTcom
*)
(* ****** ****** *)
(* ****** ****** *)
//
#staload "./../SATS/funmmap.sats"
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
funmmap_nil
{key,itm:t0}() =
(
funmmap_make_nil<>{key,itm}((*0*)))
//
(* ****** ****** *)
(* ****** ****** *)
//
#impltmp
<(*tmp*)>
funmmap_nilq
{key,itm:t0}(map) =
(
not(funmmap_consq<>{key,itm}(map)))
//
#impltmp
<(*tmp*)>
funmmap_consq
{key,itm:t0}(map) =
(
  not(funmmap_nilq<>{key,itm}(map)))
//
(* ****** ****** *)
(* ****** ****** *)
//
#impltmp
<key:t0>
<itm:t0>
funmmap_search$tst
(   kxs, k0   ) =
(
case+ opt of
| ~optn_vt_nil() => false
| ~optn_vt_cons(x0) => true)
where
{
val opt =
funmmap_search$opt<key><itm>(kxs, k0)
}(*where*)//end(funmmap_search$tst(...))
//
#impltmp
<key:t0>
<itm:t0>
funmmap_search$any
(   kxs, k0   ) =
(
case- opt of
| ~optn_vt_cons(x0) => ( x0 ))
where
{
val opt =
funmmap_search$opt<key><itm>(kxs, k0)
}(*where*)//end(funmmap_search$any(...))
//
(* ****** ****** *)
(* ****** ****** *)
//
#impltmp
<key:t0>
<itm:t0>
funmmap_keyval$print
(     map     ) =
(
strm_vt_print0<x0>(kxs))
where
{
//
#typedef x0 = (key, itm)
#typedef xs = fmmap(key, itm)
//
#impltmp
gseq$beg<xs><x0>() = "funmmap("
//
val kxs =
(
funmmap_keyval$strmize
<   key   ><   itm   >(   map   ))
//
}(*where*)//end(funmmap_keyval$print(map))
//
(* ****** ****** *)
(* ****** ****** *)
//
//
#impltmp
{key:t0}
{itm:t0}
gseq_strmize
<fmmap
(key,itm)>
<t0up
(key,itm)>
(     map     ) =
(
  funmmap_keyval$strmize<key><itm>(map))
//
#impltmp
{key:t0}
{itm:t0}
gmap_keyval$strmize
<fmmap
(key,itm)>
<key><itm>
(     map     ) =
(
  funmmap_keyval$strmize<key><itm>(map))
//
(* ****** ****** *)
//
#impltmp
<key:t0>
<itm:t0>
funmmap_key$strmize
(     map     ) =
(
strm_vt_map0<kx><k0>(
  funmmap_keyval$strmize<key><itm>(map)))
where
{
#typedef k0 = key
#typedef kx = @(key, itm)
#impltmp map$fopr0<kx><k0>(kx) = ( kx.0 )
}(*where*)//end-of-[funmmap_key$strmize(map)]
//
(* ****** ****** *)
(* ****** ****** *)
//
#impltmp
<key:t0>
<itm:t0>
funmmap_keyval$forall
(     map     ) =
gseq_forall<fmmap(key,itm)><t0up(key,itm)>(map)
//
#impltmp
<key:t0>
<itm:t0>
funmmap_keyval$foritm
(     map     ) =
gseq_foritm<fmmap(key,itm)><t0up(key,itm)>(map)
//
(* ****** ****** *)
(* ****** ****** *)
//
#impltmp
<key:t0>
<itm:t0>
funmmap_insert$any
( kxs, k0, x0 ) =
(
case- opt of
| ~
optn_vt_nil((*0*)) => kxs)
where
{
val (kxs, opt) =
funmmap_insert$opt< key >< itm >(kxs, k0, x0)
}(*where*)//end(funmmap_insert$any(kxs,k0,x0))
//
(* ****** ****** *)
(* ****** ****** *)
//
#impltmp
<key:t0>
<itm:t0>
funmmap_remove$any
(   kxs, k0   ) =
(
case- opt of true => kxs)
where
{
val (kxs, opt) =
funmmap_remove$opt< key >< itm >(kxs, k0)
}(*where*)//endof(funmmap_remove$any(kxs,k0))
//
(* ****** ****** *)
//
#impltmp
<key:t0>
<itm:t0>
funmmap_getout$any
(   kxs, k0   ) =
(
case- opt of
| ~
optn_vt_cons( x0 ) => (kxs, x0))
where
{
val (kxs, opt) =
funmmap_getout$opt< key >< itm >(kxs, k0)
}(*where*)//endof(funmmap_getout$any(kxs,k0))
//
(* ****** ****** *)
(* ****** ****** *)
//
(***********************************************************************)
(* end of [ATS3/XANADU_xatslib_githwxi_ATS2_DATS_funmmap.dats] *)
(***********************************************************************)

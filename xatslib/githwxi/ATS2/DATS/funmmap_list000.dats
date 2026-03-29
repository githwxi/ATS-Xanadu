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
#absimpl
fmmap_tbox
(key:t0, itm:t0) = list@(key,itm)
// end of [fmmap_tbox]
(* ****** ****** *)
(* ****** ****** *)
//
#impltmp
<(*tmp*)>
funmmap_nil
  ( (*void*) ) = list_nil(*0*)
#impltmp
<(*tmp*)>
funmmap_make_nil
  ( (*void*) ) = list_nil(*0*)
//
(* ****** ****** *)
(* ****** ****** *)
//
#impltmp
<key:t0>
<itm:t0>
funmmap_search$tst
  ( kxs, k0 ) =
(
  auxloop(kxs)) where
{
//
#typedef
fmmap = fmmap(key, itm)
//
fun
auxloop
(kxs: fmmap): bool =
(
case+ kxs of
|list_nil
( (*0*) ) => false
|list_cons
(kx1, kxs) =>
if
equal_key_key
( k0, kx1.0 )
then true else auxloop(kxs))
//
}(*where*)//end-of-[fmmap_search$tst(kxs,k0)]
//
(* ****** ****** *)
//
#impltmp
<key:t0>
<itm:t0>
funmmap_search$opt
  ( kxs, k0 ) =
(
  auxloop(kxs)) where
{
//
#typedef
fmmap = fmmap(key, itm)
//
fun
auxloop
(kxs: fmmap): optn_vt(itm) =
(
case+ kxs of
|list_nil
( (*0*) ) => optn_vt_nil(*0*)
|list_cons
(kx1, kxs) =>
if
equal_key_key
( k0, kx1.0 ) then
optn_vt_cons(kx1.1) else auxloop(kxs))
//
}(*where*)//end-of-[fmmap_search$opt(kxs,k0)]
//
(* ****** ****** *)
(* ****** ****** *)
//
#impltmp
{key:t0}
{itm:t0}
gseq_strmize
<
fmmap(key,itm)>
<t0up(key,itm)>(*kxs*) =
funmmap_keyval$strmize<key><itm>(*kxs*)
//
#impltmp
<key:t0>
<itm:t0>
funmmap_keyval$strmize
  (* kxs *) = list_strmize<(key,itm)>(*kxs*)
//
(* ****** ****** *)
//
#impltmp
{key:t0}
{itm:t0}
gseq_forall
<
fmmap(key,itm)>
<t0up(key,itm)>(*kxs*) =
funmmap_keyval$forall<key><itm>(*kxs*)
#impltmp
{key:t0}
{itm:t0}
gseq_foritm
<
fmmap(key,itm)>
<t0up(key,itm)>(*kxs*) =
funmmap_keyval$foritm<key><itm>(*kxs*)
//
#impltmp
<key:t0>
<itm:t0>
funmmap_keyval$forall
  (* kxs *) = list_forall<(key,itm)>(*kxs*)
#impltmp
<key:t0>
<itm:t0>
funmmap_keyval$foritm
  (* kxs *) = list_foritm<(key,itm)>(*kxs*)
//
(* ****** ****** *)
(* ****** ****** *)
//
#impltmp
<key:t0>
<itm:t0>
funmmap_insert$any
  (kxs, k0, x0) =
(
  list_cons((k0, x0), kxs))
#impltmp
<key:t0>
<itm:t0>
funmmap_insert$opt
  (kxs, k0, x0) =
(
  list_cons((k0, x0), kxs), optn_vt_nil())
//
(* ****** ****** *)
(* ****** ****** *)
//
#impltmp
<key:t0>
<itm:t0>
funmmap_remove$any
  (  map, k0  ) =
(
auxloop
(map, list_vt_nil())
) where
{
//
#typedef kx = (key, itm)
//
fnx
rappend
(krs
:list_vt(kx)
,kxs: list(kx)): list(kx) =
(
case+ krs of
| ~
list_vt_nil
( (*void*) ) => kxs
| ~
list_vt_cons
( kr1, krs ) =>
(
rappend
(krs, list_cons(kr1, kxs))))
//
fnx
auxloop
(kxs: list(kx)
,krs: list_vt(kx)): list(kx) =
(
case+ kxs of
|list_nil
( (*0*) ) =>
(
  map ) where
{
val () =
list_vt_free(krs) }
|list_cons
(kx1, kxs) =>
(
if // if
equal_key_key
( k0, kx1.0 )
then rappend(krs, kxs)
else auxloop(kxs, list_vt_cons(kx1, krs))))
//
}(*where*)//end-of-[funmmap_remove$any(kxs,k0)]
//
(* ****** ****** *)
//
#impltmp
<key:t0>
<itm:t0>
funmmap_remove$opt
  (  map, k0  ) =
(
auxloop
(map, list_vt_nil())
) where
{
//
#typedef kx = (key, itm)
//
fnx
rappend
(krs
:list_vt(kx)
,kxs: list(kx)): list(kx) =
(
case+ krs of
| ~
list_vt_nil
( (*void*) ) => kxs
| ~
list_vt_cons
( kr1, krs ) =>
(
rappend
(krs, list_cons(kr1, kxs))))
//
fnx
auxloop
( kxs
: list(kx)
, krs
: list_vt(kx))
: (list(kx), bool) =
(
case+ kxs of
//
|list_nil
( (*0*) ) =>
(
map, false) where
{
val () =
list_vt_free(krs) }
//
|list_cons
(kx1, kxs) =>
(
if // if
equal_key_key
( k0, kx1.0 )
then (
rappend(krs, kxs), true)
else auxloop(kxs, list_vt_cons(kx1, krs))))
//
}(*where*)//end-of-[funmmap_remove$opt(kxs,k0)]
//
(* ****** ****** *)
(* ****** ****** *)
//
(***********************************************************************)
(* end of [ATS3/XANADU_xatslib_githwxi_ATS2_DATS_funmmap_list000.dats] *)
(***********************************************************************)

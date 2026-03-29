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
Sun Mar 29 06:09:14 PM EDT 2026
Authoremail: gmhwxiATgmailDOTcom
*)
(* ****** ****** *)
(* ****** ****** *)
//
#staload "./../SATS/funmap.sats"
//
(* ****** ****** *)
(* ****** ****** *)
//
#absimpl
fmap_tbox
(key:t0, itm:t0) = lsrt@(key,itm)
// end of [fmmap_tbox]
(* ****** ****** *)
(* ****** ****** *)
//
#impltmp
<(*tmp*)>
funmap_nil
  ( (*void*) ) = lsrt_nil((*0*))
#impltmp
<(*tmp*)>
funmap_make_nil
  ( (*void*) ) = lsrt_nil((*0*))
//
(* ****** ****** *)
(* ****** ****** *)
//
#impltmp
<(*tmp*)>
funmap_nilq
  (  map  ) = lsrt_nilq(map)
#impltmp
<(*tmp*)>
funmap_consq
  (  map  ) = lsrt_consq(map)
//
(* ****** ****** *)
(* ****** ****** *)
//
(*
HX: This one is O(n) time!
*)
#impltmp
<key:t0>
<itm:t0>
funmap_size(*map*) =
lsrt_length<(key,itm)>(*map*)
//
(* ****** ****** *)
(* ****** ****** *)
//
#impltmp
<key:t0>
<itm:t0>
funmap_search$tst
  ( map, k0 ) =
(
auxloop(
lsrt_decd(map))) where
{
//
#typedef
kx = @(key, itm)
//
fnx
auxloop(
kxs: list(kx)): bool =
(
case+ kxs of
|list_nil
( (*0*) ) => false
|list_cons
(kx1, kxs) =>
let
val sgn =
compare_key_key<key>(k0, kx1.0)
in//let
(
if // if
(sgn < 0)
then false else
( if // if
  (sgn = 0)
  then (true) else auxloop(kxs)))
end//let//end-of-[list_cons(kx1,kxs)]
)(*case+*)//end-of-[auxloop(kxs):bool]
//
}(*where*)//end-of-[funmap_search$tst(map,k0)]
//
(* ****** ****** *)
//
#impltmp
<key:t0>
<itm:t0>
funmap_search$opt
  ( map, k0 ) =
(
auxloop(
lsrt_decd(map))) where
{
//
#typedef
kx = @(key, itm)
//
fnx
auxloop
(
kxs:
list(kx)): optn_vt(itm) =
(
case+ kxs of
|list_nil
( (*0*) ) =>
(
  optn_vt_nil(*void*))
|list_cons
(kx1, kxs) =>
let
val sgn =
compare_key_key<key>(k0, kx1.0)
in//let
(
if // if
(sgn < 0)
then optn_vt_nil()
else
(
if // if
(sgn = 0)
then
optn_vt_cons
(   kx1.1   ) else auxloop(kxs)))
end//let//end-of-[list_cons(kx1,kxs)]
)(*case+*)//end-of-[auxloop(kxs):optn_vt]
//
}(*where*)//end-of-[funmap_search$opt(map,k0)]
//
(* ****** ****** *)
(* ****** ****** *)
//
#impltmp
{key:t0}
{itm:t0}
gseq_strmize
<fmap(key,itm)>
<t0up(key,itm)>(*kxs*) =
funmap_keyval$strmize<key><itm>(*kxs*)
//
#impltmp
<key:t0>
<itm:t0>
funmap_keyval$strmize
  (   map   ) =
(
list_strmize<(key,itm)>(lsrt_decd(map)))
//
(* ****** ****** *)
//
#impltmp
{key:t0}
{itm:t0}
gseq_forall
<fmap(key,itm)>
<t0up(key,itm)>(*kxs*) =
funmap_keyval$forall<key><itm>(*kxs*)
#impltmp
{key:t0}
{itm:t0}
gseq_foritm
<fmap(key,itm)>
<t0up(key,itm)>(*kxs*) =
funmap_keyval$foritm<key><itm>(*kxs*)
//
#impltmp
<key:t0>
<itm:t0>
funmap_keyval$forall
  (   map   ) =
(
  list_forall<(key,itm)>(lsrt_decd(map)))
#impltmp
<key:t0>
<itm:t0>
funmap_keyval$foritm
  (   map   ) =
(
  list_foritm<(key,itm)>(lsrt_decd(map)))
//
(* ****** ****** *)
(* ****** ****** *)
//
#impltmp
<key:t0>
<itm:t0>
funmap_insert$opt
  (map, k0, x0) =
(
auxloop(
lsrt_decd(map),
list_vt_nil(*0*))) where
{
//
#typedef
kx = @(key, itm)
//
fnx
rappend
(
krs:
list_vt(kx),
kxs: list(kx)): lsrt(kx) =
(
case+ krs of
| ~
list_vt_nil
( (*void*) ) =>
(
UN_lsrt_encd(kxs))
| ~
list_vt_cons
( kr1, krs ) =>
(
rappend
(krs, list_cons(kr1, kxs))))
//
fnx
auxloop(
kxs: list(kx),
krs: list_vt(kx)):
(
lsrt(kx), optn_vt(itm)) =
(
case+ kxs of
//
|list_nil
( (*0*) ) =>
(
rappend(krs, kxs),
optn_vt_nil((*0*)))
where
{
val
kxs = list_sing@(k0, x0)}
//
|list_cons
(kx1, kys) =>
let
val sgn =
compare_key_key<key>(k0, kx1.0)
in//let
(
if // if
(sgn < 0)
then
(
rappend(krs, kxs),
optn_vt_nil((*0*)))
where
{
val
kxs = list_cons((k0,x0), kxs)}
else
(
if // if
(sgn = 0)
then
(
rappend(krs, kxs),
optn_vt_cons(kx1.1))
where
{
val
kxs = list_cons((k0,x0), kys)}
else
auxloop(
  kys, list_vt_cons(kx1, krs)))
)
//
end//let//end-of-[list_cons(kx1,kxs)]
)(*case+*)//end-of-[auxloop(kxs):bool]
//
}(*where*)//end-of-[funmap_insert$opt(map,k0)]
//
(* ****** ****** *)
(* ****** ****** *)
//
#impltmp
<key:t0>
<itm:t0>
funmap_getout$opt
  (  map, k0  ) =
(
auxloop(
lsrt_decd(map),
list_vt_nil(*0*))) where
{
//
#typedef
kx = @(key, itm)
//
fnx
rappend
(
krs:
list_vt(kx),
kxs: list(kx)): lsrt(kx) =
(
case+ krs of
| ~
list_vt_nil
( (*void*) ) =>
(
UN_lsrt_encd(kxs))
| ~
list_vt_cons
( kr1, krs ) =>
(
rappend
(krs, list_cons(kr1, kxs))))
//
fnx
auxloop(
kxs: list(kx),
krs: list_vt(kx)):
(
lsrt(kx), optn_vt(itm)) =
(
case+ kxs of
//
|list_nil
( (*0*) ) =>
(
rappend(krs, kxs),
optn_vt_nil((*0*)))
//
|list_cons
(kx1, kys) =>
let
val sgn =
compare_key_key<key>(k0, kx1.0)
in//let
(
if // if
(sgn < 0)
then
(
rappend(krs, kxs),
optn_vt_nil((*0*)))
else
(
if // if
(sgn = 0)
then
(
rappend(krs, kys),
optn_vt_cons(kx1.1))
else
auxloop(
  kys, list_vt_cons(kx1, krs)))
)
//
end//let//end-of-[list_cons(kx1,kxs)]
)(*case+*)//end-of-[auxloop(kxs):bool]
//
}(*where*)//end-of-[funmap_getout$opt(map,k0)]
//
(* ****** ****** *)
(* ****** ****** *)
//
(***********************************************************************)
(* end of [ATS3/XANADU_xatslib_githwxi_ATS2_DATS_funmap_lsrt000.dats] *)
(***********************************************************************)

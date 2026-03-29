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
Sun Mar 29 03:53:39 PM EDT 2026
Authoremail: gmhwxiATgmailDOTcom
*)
(* ****** ****** *)
(* ****** ****** *)
//
#staload "./../SATS/funmap.sats"
#staload "./../SATS/funmmap.sats"
//
(* ****** ****** *)
(* ****** ****** *)
//
#absimpl
fmmap_tbox
(key:t0, itm:t0) =
fmap(key, list(itm))
// end of [fmmap_tbox]
(* ****** ****** *)
(* ****** ****** *)
//
#impltmp
<(*tmp*)>
funmmap_nil() = funmap_nil<>()
#impltmp
<(*tmp*)>
funmmap_make_nil() = funmap_make_nil<>()
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
  (   map   ) =
(
auxmain1(
funmap_keyval$strmize
<key><list(itm)>(map))
) where
{
//
#typedef k0 = key
#typedef x0 = itm
#typedef y0 = list(x0)
//
fun
auxmain1
( kys
: strm_vt@(k0,y0)
)
: strm_vt@(k0,x0) =
$llazy(
case+ !kys of
| ~
strmcon_vt_nil
(  (*void*)  ) =>
(
  strmcon_vt_nil(*void*))
| ~
strmcon_vt_cons
(  ky1, kys  ) => !
(
  auxmain2(ky1.0, ky1.1, kys)))
//
and
auxmain2
( k0: k0
, xs: y0
, kys
: strm_vt@(k0,y0)): strm_vt@(k0,x0) =
(
case+ xs of
|
list_nil() => auxmain1(kys)
|
list_cons(x1, xs) => $llazy(
strmcon_vt_cons((k0,x1), auxmain2(k0,xs,kys)))
)
//
}(*where*)//end-of-[funmmap_keyval$strmize(map)]
//
(* ****** ****** *)
(* ****** ****** *)
//
#impltmp
<key:t0>
<itm:t0>
funmmap_search$tst =
funmap_search$tst<key><list(itm)>
//
#impltmp
<key:t0>
<itm:t0>
funmmap_search$opt
  (  map, k0  ) =
(
case+ opt of
| ~
optn_vt_nil() => optn_vt_nil()
| ~
optn_vt_cons(xs) =>
let
val-
list_cons(x0, _) = xs in optn_vt_cons(x0)
end//let
) where
{
val opt =
(
  funmap_search$opt<key><list(itm)>(map, k0))
}(*where*)//end-of-[funmmap_search$opt(map,k0)]
//
(* ****** ****** *)
(* ****** ****** *)
//
#impltmp
<key:t0>
<itm:t0>
funmmap_insert$opt
  (map, k0, x0) =
(
//
case+ opt of
| ~
optn_vt_nil() =>
( map
, optn_vt_nil())
where
{
val map =
funmap_insert$any
<key><list(itm)>(
map, k0, list_sing(x0))}
| ~
optn_vt_cons(xs) =>
( map
, optn_vt_nil())
where
{
val map =
funmap_insert$any
<key><list(itm)>(
map, k0, list_cons(x0, xs))}
//
) where
{
val (map, opt) =
(
  funmap_getout$opt<key><list(itm)>(map, k0))
}(*where*)//end-of-[funmmap_getout$opt(map,k0)]
//
(* ****** ****** *)
(* ****** ****** *)
//
#impltmp
<key:t0>
<itm:t0>
funmmap_getout$opt
  (  map, k0  ) =
(
//
case+ opt of
| ~
optn_vt_nil() =>
( map
, optn_vt_nil())
| ~
optn_vt_cons(xs) =>
let
val-
list_cons(x0, xs) = xs
in//let
case+ xs of
| list_nil _ =>
( map
, optn_vt_cons(x0))
| list_cons _ =>
( map
, optn_vt_cons(x0)) where
{
val map =
(
funmap_insert$any
<key><list(itm)>(map, k0, xs)) }
//
end//let//end-of-[optn_vt_cons(xs)]
//
) where
{
val (map, opt) =
(
  funmap_getout$opt<key><list(itm)>(map, k0))
}(*where*)//end-of-[funmmap_getout$opt(map,k0)]
//
(* ****** ****** *)
(* ****** ****** *)
//
(***********************************************************************)
(* end of [ATS3/XANADU_xatslib_githwxi_ATS2_DATS_funmmap_fmaplst.dats] *)
(***********************************************************************)

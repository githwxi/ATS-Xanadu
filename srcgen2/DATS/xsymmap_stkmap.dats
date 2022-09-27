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
#staload "./../SATS/xsymbol.sats"
(* ****** ****** *)
#staload "./../SATS/xsymmap.sats"
(* ****** ****** *)

#typedef key = sym_t

(* ****** ****** *)
local
(* ****** ****** *)
//
datavwtp
stkmap(itm:type) =
//
| stkmap_nil of ()
//
| stkmap_cons of
  (key, itm, stkmap(itm))
//
| stkmap_lam0 of stkmap(itm)
| stkmap_let0 of stkmap(itm)
| stkmap_loc1 of stkmap(itm)
| stkmap_loc2 of stkmap(itm)
//
(* ****** ****** *)
#absimpl
stkmap_vtbx(itm:type) = stkmap(itm)
(* ****** ****** *)

in//local

(* ****** ****** *)
//
#implfun
stkmap_nilq
(   map   ) =
(
case+ map of
| !
stkmap_nil() => true | _ => false
) (* end of [stkmap_nilq(map)] *)
//
(* ****** ****** *)
//
#implfun
stkmap_topq
  {itm}(map) =
(
  loop(map) ) where
{
fnx
loop
( kxs:
! stkmap(itm)): bool =
(
case+ kxs of
| !
stkmap_nil
((*void*)) => true
| !
stkmap_cons
(k1, x1, kxs) => loop(kxs)
|
_ (*rest-of-stkmap*) => ( false )
)
} (*where*)//end-of-[stkmap_topq]
//
(* ****** ****** *)
//
#implfun
stkmap_make_nil() = stkmap_nil()
//
(* ****** ****** *)
//
#implfun
stkmap_free_nil
  (   map   ) =
(
case- map of ~stkmap_nil() => ())
//
(* ****** ****** *)
//
#implfun
stkmap_pshlam0
  {itm}(map) =
(
  map := stkmap_lam0(map))
(* end of [stkmap_pshlam0(map)] *)
//
(* ****** ****** *)
//
#implfun
stkmap_pshlet0
  {itm}(map) =
(
  map := stkmap_let0(map))
(* end of [stkmap_pshlet0(map)] *)
//
(* ****** ****** *)
//
#implfun
stkmap_pshloc1
  {itm}(map) =
(
  map := stkmap_loc1(map))
(* end of [stkmap_pshloc1(map)] *)
//
(* ****** ****** *)
//
#implfun
stkmap_pshloc2
  {itm}(map) =
(
  map := stkmap_loc2(map))
(* end of [stkmap_pshloc2(map)] *)
//
(* ****** ****** *)
//
#implfun
stkmap_poplam0
  {itm}(map) = let
//
fnx
loop
( kxs
: stkmap(itm)
, err: &sint >> _): stkmap(itm) =
(
case+ kxs of
| ~
stkmap_lam0
(   kxs   ) => kxs
| ~
stkmap_cons
(k1, x1, kxs) => loop(kxs, err)
//
| !
stkmap_nil() => (err := 1; kxs)
//
| !
stkmap_let0 _ => (err := 1; kxs)
//
| !
stkmap_loc1 _ => (err := 1; kxs)
| !
stkmap_loc2 _ => (err := 1; kxs)
//
)
//
in//let
let
var
err: sint = 0
val
( ) =
(map := loop(map, err)) in err end
end (*let*) // [ stkmap_poplam0(map) ]
//
(* ****** ****** *)
//
#implfun
stkmap_poplet0
  {itm}(map) = let
//
fnx
loop
( kxs
: stkmap(itm)
, err: &sint >> _): stkmap(itm) =
(
case+ kxs of
| ~
stkmap_let0
(   kxs   ) => kxs
| ~
stkmap_cons
(k1, x1, kxs) => loop(kxs, err)
//
| !
stkmap_nil() => (err := 1; kxs)
//
| !
stkmap_lam0 _ => (err := 1; kxs)
//
| !
stkmap_loc1 _ => (err := 1; kxs)
| !
stkmap_loc2 _ => (err := 1; kxs)
//
)
//
in//let
let
var
err: sint = 0
val
( ) =
(map := loop(map, err)) in err end
end (*let*) // [ stkmap_poplet0(map) ]
//
(* ****** ****** *)
//
#implfun
stkmap_poploc0
  {itm}(map) = let
//
#vwtpdef
kxs = stkmap(itm)
#vwtpdef
res = list_vt@(key,itm)
//
fnx
loop0
( kxs: kxs
, err:
& sint >> _
, res: res): (kxs, res) =
(
  kxs, list_vt_reverse0(res)
)
//
fnx
loop1
( kxs: kxs
, err:
& sint >> _
, res: res): (kxs, res) =
(
case+ kxs of
//
| ~
stkmap_loc1
(   kxs   ) => loop0(kxs, err, res)
//
| ~
stkmap_cons
(k1, x1, kxs) => loop1(kxs, err, res)
//
| !
stkmap_nil() =>
( err := err+1; loop0(kxs, err, res) )
| !
stkmap_lam0 _ =>
( err := err+1; loop0(kxs, err, res) )
| !
stkmap_let0 _ =>
( err := err+1; loop0(kxs, err, res) )
| !
stkmap_loc2 _ =>
( err := err+1; loop0(kxs, err, res) )
//
) (*case+*) // end-[loop1(kxs,err,res)]
//
fnx
loop2
( kxs: kxs
, err:
& sint >> _
, res: res): (kxs, res) =
(
case+ kxs of
//
| ~
stkmap_loc2
(   kxs   ) => loop1(kxs, err, res)
//
| ~
stkmap_cons
(k1, x1, kxs) =>
loop1(kxs, err, res) where
{
  val
  res = list_vt_cons(@(k1,x1), res) }
//
| !
stkmap_nil() =>
( err := err+1; loop1(kxs, err, res) )
| !
stkmap_lam0 _ =>
( err := err+1; loop1(kxs, err, res) )
| !
stkmap_let0 _ =>
( err := err+1; loop1(kxs, err, res) )
| !
stkmap_loc1 _ =>
( err := err+1; loop1(kxs, err, res) )
//
) (*case+*) // end-[loop2(kxs,err,res)]
//
in//let
let
//
var
err: sint = 0
val
res =
list_vt_nil(*nil*)
//
val
(kxs,res) =
loop2(map,err,res) in map := kxs;(err,res)
end
end (*let*) // end of [stkmap_poploc0(map)]
//
(* ****** ****** *)
//
#implfun
stkmap_search_opt
  {itm}
( map, key ) =
(
  loop(map, key)) where
{
//
#vwtpdef
kxs = stkmap(itm)
//
fnx
loop
( kxs:
! kxs
, k0: key): optn_vt(itm) =
(
case+ kxs of
//
| !
stkmap_nil() =>
optn_vt_nil((*void*))
//
| !
stkmap_cons(k1, x1, kxs) =>
(
if
(k0 = k1)
then
optn_vt_cons(x1) else loop(kxs,k0))
//
| !stkmap_lam0(kxs) => loop(kxs, k0)
| !stkmap_let0(kxs) => loop(kxs, k0)
| !stkmap_loc1(kxs) => loop(kxs, k0)
| !stkmap_loc2(kxs) => loop(kxs, k0)
//
) (*case+*) // end of [loop(kxs, k0)]
//
} (*where*) // end of [stkmap_search_opt]
//
(* ****** ****** *)
//
#implfun
stkmap_insert_any
  {itm}
( map, key, itm ) =
(
  map := stkmap_cons(key, itm, map) )
//
(* ****** ****** *)

#implfun
stkmap_insert_kxs
{itm}( map, kxs ) =
(
map :=
loop(map, kxs)) where
{
#vwtpdef
stkmap = stkmap( itm )
fnx
loop
( map: stkmap
, kxs
: list_vt@(key,itm)): stkmap =
(
case+ kxs of
| ~
list_vt_nil
( (*void*) ) => map
| ~
list_vt_cons
( kx1, kxs ) =>
loop(map, kxs) where {
  val map = stkmap_cons(kx1.0, kx1.1, map)
} // end of-(list_vt_cons)
) (* end of [loop(map,kxs)] *)
} (*where*)//end-of-[stkmap_insert_kxs(map,kxs)]

(* ****** ****** *)

endloc (*local*) // end of [ local(stkmap) ]

(* ****** ****** *)

#implfun
stkmap_insmix_any
  {itm}
( map
, k0, x0, mix ) =
let
val opt =
stkmap_search_opt(map, k0)
in//let
//
case+ opt of
| ~
optn_vt_nil() =>
stkmap_insert_any(map, k0, x0)
| ~
optn_vt_cons(x1) =>
stkmap_insert_any(map, k0, mix(x0, x1))
//
end (*let*)//end(stkmap_insmix_any(map,k0,x0,mix))

(* ****** ****** *)

#implfun
stkmap_insmix_kxs
  {itm}
( map, kxs, mix ) =
(
loop(map, kxs)) where
{
#vwtpdef
stkmap = stkmap( itm )
fnx
loop
( map:
& stkmap >> _
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
  stkmap_insmix_any(map, kx1.0, kx1.1, mix)
} // end of-(list_vt_cons)
) (* end of [loop(map,kxs)] *)
} (*where*)//end-of-[stkmap_insmix_kxs(map,kxs,mix)]

(* ****** ****** *)

(* end of [ATS3/XATSOPT_srcgen2_xsymmap_stkmap.dats] *)

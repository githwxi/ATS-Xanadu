(***********************************************************************)
(*                                                                     *)
(*                         Applied Type System                         *)
(*                                                                     *)
(***********************************************************************)

(*
** ATS/Xanadu - Unleashing the Potential of Types!
** Copyright (C) 2021 Hongwei Xi, ATS Trustful Software, Inc.
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
// Author: Hongwei Xi
// Start Time: January, 2021
// Authoremail: gmhwxiATgmailDOTcom
//
(* ****** ****** *)
//
#include
"share/atspre_staload.hats"
#staload
UN = "prelude/SATS/unsafe.sats"
//
(* ****** ****** *)
#staload "./../SATS/xstamp0.sats"
(* ****** ****** *)
#staload "./../SATS/staexp2.sats"
#staload "./../SATS/dynexp2.sats"
(* ****** ****** *)
#staload "./../SATS/dynexp4.sats"
(* ****** ****** *)
#staload
FM =
"libats/SATS/funmap_avltree.sats"
(* ****** ****** *)
#staload
_(*FM*) =
"libats/DATS/funmap_avltree.dats"
#staload
_(*QL*) = "libats/DATS/qlist.dats"
(* ****** ****** *)
//
typedef
key = d2var and itm = s2exp
//
(* ****** ****** *)
//
absimpl
stmap_type = $FM.map(key, itm)
//
(* ****** ****** *)
//
implement
$FM.equal_key_key<key>
(k1, k2) =
$effmask_all
(k1.stamp() = k2.stamp())
implement
$FM.compare_key_key<key>
(k1, k2) =
$effmask_all
(compare(k1.stamp(), k2.stamp()))
//
(* ****** ****** *)
//
implement
stmap_nil() = $FM.funmap_nil()
//
(* ****** ****** *)

implement
stmap_ismem
(map, key) =
let
//
var res: itm
//
val ans =
$FM.funmap_search<key,itm>(map,key,res)
//
in
let
  prval () = opt_clear{itm}(res) in ans
end
end (*let*) // end of [stmap_ismem]

(* ****** ****** *)

implement
stmap_insert
(map, key, itm) =
let
val
ismem = stmap_ismem(map, key)
(*
val () =
println!("stmap_insert: key = ", key)
val () =
println!("stmap_insert: itm = ", itm)
*)
in
if
ismem
then false
else (true) where
{
val-
~None_vt() =
$FM.funmap_insert_opt<key,itm>(map,key,itm)
} (*where*)
end (*let*) // end of [stmap_insert]

(* ****** ****** *)

implement
stmap_remove
( map, key ) =
$FM.funmap_remove<key,itm>(map, key)

(* ****** ****** *)
//
implement
stmap_listize
( map ) = $FM.funmap_listize<key,itm>(map)
//
(* ****** ****** *)

implement
{env}(*tmp*)
stmap_foreach_env
( map, env ) = let
//
implement
$FM.funmap_foreach$fwork<key,itm><env>
  (k0, x0, env) =
(
  stmap_foreach$fwork<env>(k0, x0, env)
)
//
in
$FM.funmap_foreach_env<key,itm><env>(map, env)
end (*end*) // end of [stmap_foreach_env]

(* ****** ****** *)

(* end of [xats_dynexp4_stmap.dats] *)


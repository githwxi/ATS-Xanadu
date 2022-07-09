(***********************************************************************)
(*                                                                     *)
(*                         Applied Type System                         *)
(*                                                                     *)
(***********************************************************************)

(*
** ATS/Xanadu - Unleashing the Potential of Types!
** Copyright (C) 2020 Hongwei Xi, ATS Trustful Software, Inc.
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
#staload
"./../SATS/genv000.sats"
(* ****** ****** *)
#staload
UN =
"prelude/SATS/unsafex.sats"
(* ****** ****** *)

#impltmp
<xs>
<x0>
<r0>
<e1>
gseq_foldl_env1
( xs, r0, env ) =
(
gseq_foldl
<xs>
<x0>
<r0>(xs, r0)) where
{
val env =
$UN.datacopy( env )
#impltmp
foldl$fopr<x0>(r0, x0) =
let
//
val env =
$UN.castlin10{e1}(env)
val res =
foldl_env1$fopr
< x0><r0 >< e1>(r0, x0, env)
//
in//let
//
let
val
env = $UN.delinear(env) in res end
//
endlet//end-of(foldl$fopr<x0><r0>(x0))
} (*where*) // end-of-(gseq_foldl_env1)

(* ****** ****** *)

#impltmp
<xs>
<x0>
<r0>
<e1>
gseq_foldr_env1
( xs, r0, env ) =
(
gseq_foldr
<xs>
<x0>
<r0>(xs, r0)) where
{
val env =
$UN.datacopy( env )
#impltmp
foldr$fopr<x0>(x0, r0) =
let
//
val env =
$UN.castlin10{e1}(env)
val res =
foldr_env1$fopr
< x0><r0 >< e1>(x0, r0, env)
//
in//let
//
let
val
env = $UN.delinear(env) in res end
//
endlet//end-of(foldr$fopr<x0><r0>(x0))
} (*where*) // end-of-(gseq_foldr_env1)

(* ****** ****** *)

#impltmp
<xs>
<x0>
<e1>
gseq_forall_env1
  (xs, env) =
(
gseq_forall
< xs >
< x0 >( xs )) where
{
val env =
$UN.datacopy( env )
#impltmp
forall$test<x0>(x0) =
let
//
val env =
$UN.castlin10{e1}(env)
val res =
forall_env1$test<x0><e1>(x0, env)
//
in//let
//
let
val env = $UN.delinear(env) in res end
//
endlet // end of [forall$test<x0>(x0)]
} (*where*) // end-of(gseq_forall_env1)

(* ****** ****** *)

#impltmp
<xs>
<x0>
<e1>
gseq_foreach_env1
  (xs, env) =
(
gseq_foreach
< xs >
< x0 >( xs )) where
{
val env =
$UN.datacopy( env )
#impltmp
foreach$work<x0>(x0) =
let
//
val env =
$UN.castlin10{e1}(env)
val res =
foreach_env1$work<x0>(x0, env)
//
in//let
//
let
val env = $UN.delinear(env) in res end
//
endlet // end of [foreach$work<x0>(x0)]
} (*where*) // end-of(gseq_foreach_env1)

(* ****** ****** *)

#impltmp
<xs>
<x0>
<y0>
<e1>
gseq_map_env1
  (xs, env) =
(
gseq_map
<xs>
<x0><y0>( xs )) where
{
val env =
$UN.datacopy( env )
#impltmp
map$fopr<x0><y0>(x0) =
let
//
val env =
$UN.castlin10{e1}(env)
val res =
map_env1$fopr<x0><y0>(x0, env)
//
in//let
//
let
val env = $UN.delinear(env) in res end
//
endlet // end of [map$fopr<x0><y0>(x0)]
}(*where*)//end-of(gseq_map_env1(xs,env))

(* ****** ****** *)

#impltmp
<xs>
<x0>
<y0>
<e1>
gseq_map_env1_list
  (xs, env) =
(
gseq_map_list
<xs>
<x0><y0>( xs )) where
{
val env =
$UN.datacopy( env )
#impltmp
map$fopr<x0><y0>(x0) =
let
//
val env =
$UN.castlin10{e1}(env)
val res =
map_env1$fopr<x0><y0>(x0, env)
//
in//let
//
let
val env = $UN.delinear(env) in res end
//
endlet // end of [map$fopr<x0><y0>(x0)]
} (*where*) // end-of(gseq_map_env1_list)

(* ****** ****** *)

#impltmp
<xs>
<x0>
<y0>
<e1>
gseq_map_env1_strm
  (xs, env) =
(
gseq_map_strm
<xs>
<x0><y0>( xs )) where
{
val env =
$UN.datacopy( env )
#impltmp
map$fopr<x0><y0>(x0) =
let
//
val env =
$UN.castlin10{e1}(env)
val res =
map_env1$fopr<x0><y0>(x0, env)
//
in//let
//
let
val env = $UN.delinear(env) in res end
//
endlet // end of [map$fopr<x0><y0>(x0)]
} (*where*) // end-of(gseq_map_env1_strm)

(* ****** ****** *)

(* end of [ATS3/XANADU_xatslib_githwxi_genv000.dats] *)

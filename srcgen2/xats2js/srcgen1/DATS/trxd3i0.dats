(***********************************************************************)
(*                                                                     *)
(*                         Applied Type System                         *)
(*                                                                     *)
(***********************************************************************)

(*
** ATS/Xanadu - Unleashing the Potential of Types!
** Copyright (C) 2024 Hongwei Xi, ATS Trustful Software, Inc.
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
//
Sat 02 Mar 2024 06:04:06 PM EST
//
Authoremail: gmhwxiATgmailDOTcom
*)
//
(* ****** ****** *)
(*
#define
XATSOPT "./../../.."
*)
(* ****** ****** *)
#include
"./../../..\
/HATS/xatsopt_sats.hats"
#include
"./../../..\
/HATS/xatsopt_dpre.hats"
(* ****** ****** *)
(* ****** ****** *)
//
#staload
"./../../../SATS/dynexp3.sats"
//
(* ****** ****** *)
//
#staload "./../SATS/intrep0.sats"
#staload "./../SATS/trxd3i0.sats"
//
(* ****** ****** *)
(* ****** ****** *)

#implfun
i0parsed_of_trxd3i0
  (dpar) =
let
//
val stadyn =
d3parsed_get_stadyn(dpar)
//
val nerror =
d3parsed_get_nerror(dpar)
//
val source =
d3parsed_get_source(dpar)
//
val parsed =
d3parsed_get_parsed(dpar)
//
val env0 = envd3i0_make_nil()
//
val parsed =
trxd3i0_d3eclistopt(env0, parsed)
//
in//let
let
val ((*0*)) = envd3i0_free_top(env0)
in//let
(
  i0parsed(stadyn,nerror,source,parsed))
end//let
end (*let*) // end of [i0parsed_trxd3i0(dpar)]

(* ****** ****** *)
(* ****** ****** *)
//
#impltmp
<x0><y0>
list_trxd3i0_fnp
( e1, xs, fopr ) =
(
list_map$e1nv<x0><y0><e1>(xs, e1)) where
{
#vwtpdef e1 = envd3i0
#impltmp
map$e1nv$fopr<x0><y0><e1>(x0, e1) = fopr(e1, x0)
} (*where*)//end of [list_trxd3i0_fnp(e1,xs,fopr)]
//
(* ****** ****** *)
//
#impltmp
<x0><y0>
optn_trxd3i0_fnp
( e1, xs, fopr ) =
(
optn_map$e1nv<x0><y0><e1>(xs, e1)) where
{
#vwtpdef e1 = envd3i0
#impltmp
map$e1nv$fopr<x0><y0><e1>(x0, e1) = fopr(e1, x0)
} (*where*)//end of [optn_trxd3i0_fnp(e1,xs,fopr)]
//
(* ****** ****** *)
(* ****** ****** *)
//
#implfun
trxd3i0_d3patlst
( env0, d3ps ) =
(
  list_trxd3i0_fnp(env0, d3ps, trxd3i0_d3pat))
//
(* ****** ****** *)
//
#implfun
trxd3i0_l3d3plst
( env0, ldps ) =
(
  list_trxd3i0_fnp(env0, ldps, trxd3i0_l3d3p))
//
(* ****** ****** *)
(* ****** ****** *)
//
#implfun
trxd3i0_d3explst
( env0, d3es ) =
(
  list_trxd3i0_fnp(env0, d3es, trxd3i0_d3exp))
//
#implfun
trxd3i0_d3expopt
( env0, dopt ) =
(
  optn_trxd3i0_fnp(env0, dopt, trxd3i0_d3exp))
//
(* ****** ****** *)
//
#implfun
trxd3i0_l3d3elst
( env0, ldes ) =
(
  list_trxd3i0_fnp(env0, ldes, trxd3i0_l3d3e))
//
(* ****** ****** *)
(* ****** ****** *)
//
#implfun
trxd3i0_d3gualst
( env0, d3gs) =
(
  list_trxd3i0_fnp(env0, d3gs, trxd3i0_d3gua))
//
#implfun
trxd3i0_d3clslst
( env0, dcls) =
(
  list_trxd3i0_fnp(env0, dcls, trxd3i0_d3cls))
//
(* ****** ****** *)
(* ****** ****** *)
//
#implfun
trxd3i0_d3eclist
( env0, dcls ) =
(
  list_trxd3i0_fnp(env0, dcls, trxd3i0_d3ecl))
//
(* ****** ****** *)
(* ****** ****** *)
//
#implfun
trxd3i0_d3valdclist
  ( env0 , d3vs ) =
(
  list_trxd3i0_fnp(env0, d3vs, trxd3i0_d3valdcl))
//
#implfun
trxd3i0_d3vardclist
  ( env0 , d3vs ) =
(
  list_trxd3i0_fnp(env0, d3vs, trxd3i0_d3vardcl))
//
(* ****** ****** *)
//
#implfun
trxd3i0_d3fundclist
  ( env0 , d3fs ) =
(
  list_trxd3i0_fnp(env0, d3fs, trxd3i0_d3fundcl))
//
(* ****** ****** *)
(* ****** ****** *)
//
#implfun
trxd3i0_d3eclistopt
  (env0, dopt) =
(
  optn_trxd3i0_fnp(env0, dopt, trxd3i0_d3eclist))
//
(* ****** ****** *)
(* ****** ****** *)
//
(***********************************************************************)
(* end of [ATS3/XANADU_srcgen2_xats2js_srcgen1_DATS_trxd3i0.dats] *)
(***********************************************************************)

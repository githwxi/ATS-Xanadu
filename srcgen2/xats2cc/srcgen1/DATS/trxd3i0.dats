(***********************************************************************)
(*                                                                     *)
(*                         Applied Type System                         *)
(*                                                                     *)
(***********************************************************************)

(*
** ATS/Xanadu - Unleashing the Potential of Types!
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
//
(*
Author: Hongwei Xi
//
Mon Mar  9 03:14:34 PM EDT 2026
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
#staload
"./../../../SATS/staexp2.sats"
#staload
"./../../../SATS/statyp2.sats"
#staload
"./../../../SATS/dynexp2.sats"
#staload
"./../../../SATS/dynexp3.sats"
(* ****** ****** *)
//
#staload "./../SATS/intrep0.sats"
#staload "./../SATS/trxd3i0.sats"
//
(* ****** ****** *)
(* ****** ****** *)
//
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
d3eclistopt_trxd3i0(parsed, env0)
//
in//let
//
let
val ((*0*)) = envd3i0_free_top(env0)
in//let
(
  i0parsed(stadyn,nerror,source,parsed))
end//let
//
end(*let*)//end-of-[i0parsed_of_trxd3i0(dpar)]
//
(* ****** ****** *)
(* ****** ****** *)
//
#impltmp
<x0><y0>
list_trxd3i0_fnp
( xs, e1, fopr ) =
(
list_map$e1nv<x0><y0><e1>(xs, e1)) where
{
#vwtpdef e1 = envd3i0
#impltmp
map$e1nv$fopr<x0><y0><e1> = fopr(*x0, e1*)
}(*where*)//end-of-[list_trxd3i0_fnp(xs,e1,fopr)]
//
(* ****** ****** *)
//
#impltmp
<x0><y0>
optn_trxd3i0_fnp
( xs, e1, fopr ) =
(
optn_map$e1nv<x0><y0><e1>(xs, e1)) where
{
#vwtpdef e1 = envd3i0
#impltmp
map$e1nv$fopr<x0><y0><e1> = fopr(*x0, e1*)
}(*where*)//end-of-[optn_trxd3i0_fnp(xs,e1,fopr)]
//
(* ****** ****** *)
(* ****** ****** *)
//
#implfun
s2typlst_trxd3i0
( env0, t2ps ) =
(
  list_trxd3i0_fnp(env0, t2ps, s2typ_trxd3i0))
//
(* ****** ****** *)
//
#implfun
d3patlst_trxd3i0
( env0, d3ps ) =
(
  list_trxd3i0_fnp(env0, d3ps, d3pat_trxd3i0))
//
(* ****** ****** *)
//
#implfun
l3d3plst_trxd3i0
( env0, ldps ) =
(
  list_trxd3i0_fnp(env0, ldps, l3d3p_trxd3i0))
//
(* ****** ****** *)
(* ****** ****** *)
//
#implfun
d3explst_trxd3i0
( env0, d3es ) =
(
  list_trxd3i0_fnp(env0, d3es, d3exp_trxd3i0))
//
#implfun
d3expopt_trxd3i0
( env0, dopt ) =
(
  optn_trxd3i0_fnp(env0, dopt, d3exp_trxd3i0))
//
(* ****** ****** *)
//
#implfun
l3d3elst_trxd3i0
( env0, ldes ) =
(
  list_trxd3i0_fnp(env0, ldes, l3d3e_trxd3i0))
//
(* ****** ****** *)
(* ****** ****** *)
//
#implfun
d3gualst_trxd3i0
( env0, d3gs) =
(
  list_trxd3i0_fnp(env0, d3gs, d3gua_trxd3i0))
//
#implfun
d3clslst_trxd3i0
( env0, d3cs) =
(
  list_trxd3i0_fnp(env0, d3cs, d3cls_trxd3i0))
//
(* ****** ****** *)
(* ****** ****** *)
//
#implfun
d3eclist_trxd3i0
( env0, dcls ) =
(
  list_trxd3i0_fnp(env0, dcls, d3ecl_trxd3i0))
//
(* ****** ****** *)
(* ****** ****** *)
//
#implfun
d3valdclist_trxd3i0
( env0, d3vs ) =
(
  list_trxd3i0_fnp(env0, d3vs, d3valdcl_trxd3i0))
//
#implfun
d3vardclist_trxd3i0
( env0, d3vs ) =
(
  list_trxd3i0_fnp(env0, d3vs, d3vardcl_trxd3i0))
//
(* ****** ****** *)
//
#implfun
d3fundclist_trxd3i0
( env0, d3fs ) =
(
  list_trxd3i0_fnp(env0, d3fs, d3fundcl_trxd3i0))
//
(* ****** ****** *)
(* ****** ****** *)
//
#implfun
d3eclistopt_trxd3i0
( env0, d3fs ) =
(
  optn_trxd3i0_fnp(env0, d3fs, d3eclist_trxd3i0))
//
(* ****** ****** *)
(* ****** ****** *)
//
(***********************************************************************)
(* end of [ATS3/XANADU_srcgen2_xats2js_srcgen1_DATS_trxd3i0.dats] *)
(***********************************************************************)

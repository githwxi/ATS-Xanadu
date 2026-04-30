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
Mon Apr  6 12:38:23 AM EDT 2026
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
#staload "./../SATS/tryd3i0.sats"
//
(* ****** ****** *)
(* ****** ****** *)
//
#implfun
i0parsed_of_tryd3i0
  (  ipar  ) =
let
//
val stadyn =
i0parsed_stadyn$get(ipar)
//
val nerror =
i0parsed_nerror$get(ipar)
//
val source =
i0parsed_source$get(ipar)
//
val parsed =
i0parsed_parsed$get(ipar)
//
val enw0 = enwd3i0_make_nil()
//
val parsed =
i0dclistopt_tryd3i0(parsed, enw0)
//
in//let
//
let
val ((*0*)) = enwd3i0_free_nil(enw0)
in//let
(
  i0parsed(stadyn,nerror,source,parsed))
end//let
//
end(*let*)//end-of-[i0parsed_of_tryd3i0(ipar)]
//
(* ****** ****** *)
(* ****** ****** *)
//
#impltmp
<x0><y0>
list_tryd3i0_fnp
( xs, e1, fopr ) =
(
list_map$e1nv<x0><y0><e1>(xs, e1)) where
{
#vwtpdef e1 = enwd3i0
#impltmp
map$e1nv$fopr<x0><y0><e1> = fopr(*x0, e1*)
}(*where*)//end-of-[list_tryd3i0_fnp(xs,e1,fopr)]
//
(* ****** ****** *)
//
#impltmp
<x0><y0>
optn_tryd3i0_fnp
( xs, e1, fopr ) =
(
optn_map$e1nv<x0><y0><e1>(xs, e1)) where
{
#vwtpdef e1 = enwd3i0
#impltmp
map$e1nv$fopr<x0><y0><e1> = fopr(*x0, e1*)
}(*where*)//end-of-[optn_tryd3i0_fnp(xs,e1,fopr)]
//
(* ****** ****** *)
(* ****** ****** *)
//
#implfun
i0patlst_tryd3i0
( enw0, i0ps ) =
(
  list_tryd3i0_fnp(enw0, i0ps, i0pat_tryd3i0))
//
(* ****** ****** *)
//
#implfun
l0i0plst_tryd3i0
( enw0, ldps ) =
(
  list_tryd3i0_fnp(enw0, ldps, l0i0p_tryd3i0))
//
(* ****** ****** *)
(* ****** ****** *)
//
#implfun
i0explst_tryd3i0
( enw0, i0es ) =
(
  list_tryd3i0_fnp(enw0, i0es, i0exp_tryd3i0))
//
#implfun
i0expopt_tryd3i0
( enw0, dopt ) =
(
  optn_tryd3i0_fnp(enw0, dopt, i0exp_tryd3i0))
//
(* ****** ****** *)
//
#implfun
l0i0elst_tryd3i0
( enw0, ldes ) =
(
  list_tryd3i0_fnp(enw0, ldes, l0i0e_tryd3i0))
//
(* ****** ****** *)
(* ****** ****** *)
//
#implfun
fiarglst_tryd3i0
( enw0, f3as) =
(
  list_tryd3i0_fnp(enw0, f3as, fiarg_tryd3i0))
//
(* ****** ****** *)
(* ****** ****** *)
//
#implfun
i0gualst_tryd3i0
( enw0, i0gs) =
(
  list_tryd3i0_fnp(enw0, i0gs, i0gua_tryd3i0))
//
#implfun
i0clslst_tryd3i0
( enw0, icls) =
(
  list_tryd3i0_fnp(enw0, icls, i0cls_tryd3i0))
//
(* ****** ****** *)
(* ****** ****** *)
//
#implfun
i0dclist_tryd3i0
( enw0, dcls ) =
(
  list_tryd3i0_fnp(enw0, dcls, i0dcl_tryd3i0))
//
(* ****** ****** *)
(* ****** ****** *)
//
#implfun
i0valdclist_tryd3i0
( enw0, i0vs ) =
(
  list_tryd3i0_fnp(enw0, i0vs, i0valdcl_tryd3i0))
//
#implfun
i0vardclist_tryd3i0
( enw0, i0vs ) =
(
  list_tryd3i0_fnp(enw0, i0vs, i0vardcl_tryd3i0))
//
(* ****** ****** *)
//
#implfun
i0fundclist_tryd3i0
( enw0, i0fs ) =
(
  list_tryd3i0_fnp(enw0, i0fs, i0fundcl_tryd3i0))
//
(* ****** ****** *)
(* ****** ****** *)
//
#implfun
i0dclistopt_tryd3i0
( enw0, i0fs ) =
(
  optn_tryd3i0_fnp(enw0, i0fs, i0dclist_tryd3i0))
//
(* ****** ****** *)
(* ****** ****** *)
//
(***********************************************************************)
(* end of [ATS3/XANADU_srcgen2_xats2js_srcgen1_DATS_tryd3i0.dats] *)
(***********************************************************************)

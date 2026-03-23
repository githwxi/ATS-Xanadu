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
Sat 16 Mar 2024 07:02:57 PM EDT
//
Authoremail: gmhwxiATgmailDOTcom
*)
//
(* ****** ****** *)
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
#staload "./../SATS/intrep0.sats"
#staload "./../SATS/intrep1.sats"
//
#staload "./../SATS/trxi0i1.sats"
//
(* ****** ****** *)
(* ****** ****** *)
//
#implfun
i1parsed_of_trxi0i1
  (dpar) =
let
//
val stadyn =
i0parsed_stadyn$get(dpar)
//
val nerror =
i0parsed_nerror$get(dpar)
//
val source =
i0parsed_source$get(dpar)
//
val parsed =
i0parsed_parsed$get(dpar)
//
val env0 = envi0i1_make_nil()
//
val parsed =
trxi0i1_i0dclistopt(env0, parsed)
//
in//let
let
val ((*0*)) = envi0i1_free_top(env0)
in//let
(
  i1parsed(stadyn,nerror,source,parsed))
end//let
end (*let*) // end of [i1parsed_trxi0i1(dpar)]
//
(* ****** ****** *)
(* ****** ****** *)
//
#impltmp
<x0><y0>
list_trxi0i1_fnp
( e1, xs, fopr ) =
(
list_map$e1nv<x0><y0><e1>(xs, e1)) where
{
#vwtpdef e1 = envi0i1
#impltmp
map$e1nv$fopr<x0><y0><e1>(x0, e1) = fopr(e1, x0)
} (*where*)//end of [list_trxi0i1_fnp(e1,xs,fopr)]
//
(* ****** ****** *)
//
#impltmp
<x0><y0>
optn_trxi0i1_fnp
( e1, xs, fopr ) =
(
optn_map$e1nv<x0><y0><e1>(xs, e1)) where
{
#vwtpdef e1 = envi0i1
#impltmp
map$e1nv$fopr<x0><y0><e1>(x0, e1) = fopr(e1, x0)
} (*where*)//end of [optn_trxi0i1_fnp(e1,xs,fopr)]
//
(* ****** ****** *)
(* ****** ****** *)
//
#implfun
trxi0i1_i0patlst
( env0, i0ps ) =
(
list_trxi0i1_fnp(env0, i0ps, trxi0i1_i0pat))
//
(* ****** ****** *)
(* ****** ****** *)
//
#implfun
trxi0i1_i0explst
( env0, i0es ) =
(
 list_trxi0i1_fnp(env0, i0es, trxi0i1_i0exp))
//
#implfun
trxi0i1_i0blklst
( env0, i0es ) =
(
 list_trxi0i1_fnp(env0, i0es, trxi0i1_i0blk))
//
(* ****** ****** *)
//
#implfun
trxi0i1_l0i0elst
( env0, lies ) =
let
fun
trxi0i1_l0i0e
(env0:
!envi0i1, l0x1: l0i0e): l1i1v =
let
val
I0LAB(l0, x1) = l0x1 in//let
I1LAB(l0, trxi0i1_i0exp(env0, x1)) end
in//let
  list_trxi0i1_fnp(env0, lies, trxi0i1_l0i0e)
end//let//end-of-[trxi0i1_l0i0elst(env0,lies)]
//
(* ****** ****** *)
(* ****** ****** *)
//
#implfun
trxi0i1_i0gualst
( env0, i0gs ) =
(
  list_trxi0i1_fnp(env0, i0gs, trxi0i1_i0gua))
//
(* ****** ****** *)
//
#implfun
trxi0i1_i0clslst
( env0, icls ) =
(
  list_trxi0i1_fnp(env0, icls, trxi0i1_i0cls))
//
(* ****** ****** *)
(* ****** ****** *)
//
(*
(*
HX:
This one is implemented
directly in [trxi0i1_dynexp.dats]
*)
#implfun
trxi0i1_fiarglst
( env0, fias ) =
(
  list_trxi0i1_fnp(env0, fias, trxi0i1_fiarg))
*)
//
(* ****** ****** *)
(* ****** ****** *)
//
#implfun
trxi0i1_i0dclist
( env0, dcls ) =
(
  list_trxi0i1_fnp(env0, dcls, trxi0i1_i0dcl))
//
(* ****** ****** *)
(* ****** ****** *)
//
#implfun
trxi0i1_i0valdclist
  ( env0 , i0vs ) =
(
  list_trxi0i1_fnp(env0, i0vs, trxi0i1_i0valdcl))
//
#implfun
trxi0i1_i0vardclist
  ( env0 , i0vs ) =
(
  list_trxi0i1_fnp(env0, i0vs, trxi0i1_i0vardcl))
//
(* ****** ****** *)
//
#implfun
trxi0i1_i0fundclist
  ( env0 , i0fs ) =
(
  list_trxi0i1_fnp(env0, i0fs, trxi0i1_i0fundcl))
//
(* ****** ****** *)
(* ****** ****** *)
//
#implfun
trxi0i1_i0dclistopt
  (env0, dopt) =
(
  optn_trxi0i1_fnp(env0, dopt, trxi0i1_i0dclist))
//
(* ****** ****** *)
(* ****** ****** *)
//
(***********************************************************************)
(* end of [ATS3/XANADU_srcgen2_xats2js_srcgen1_DATS_trxi0i1.dats] *)
(***********************************************************************)

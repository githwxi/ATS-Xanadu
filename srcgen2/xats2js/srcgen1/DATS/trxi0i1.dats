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
(* ****** ****** *)
//
#staload "./../SATS/intrep0.sats"
#staload "./../SATS/intrep1.sats"
//
#staload "./../SATS/trxi0i1.sats"
//
(* ****** ****** *)
(* ****** ****** *)

#implfun
i1parsed_of_trxi0i1
  (dpar) =
let
//
val stadyn =
i0parsed_get_stadyn(dpar)
//
val nerror =
i0parsed_get_nerror(dpar)
//
val source =
i0parsed_get_source(dpar)
//
val parsed =
i0parsed_get_parsed(dpar)
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

(* ****** ****** *)
(* ****** ****** *)
//
#impltmp
<x0><y0>
list_trxi0i1_fnp
( e1, xs, fopr ) =
(
list_map_e1nv<x0><y0><e1>(xs, e1)) where
{
#vwtpdef e1 = envi0i1
#impltmp
map$fopr_e1nv<x0><y0><e1>(x0, e1) = fopr(e1, x0)
} (*where*)//end of [list_trxi0i1_fnp(e1,xs,fopr)]
//
(* ****** ****** *)
//
#impltmp
<x0><y0>
optn_trxi0i1_fnp
( e1, xs, fopr ) =
(
optn_map_e1nv<x0><y0><e1>(xs, e1)) where
{
#vwtpdef e1 = envi0i1
#impltmp
map$fopr_e1nv<x0><y0><e1>(x0, e1) = fopr(e1, x0)
} (*where*)//end of [optn_trxi0i1_fnp(e1,xs,fopr)]
//
(* ****** ****** *)
(* ****** ****** *)

(***********************************************************************)
(* end of [ATS3/XANADU_srcgen2_xats2js_srcgen1_DATS_trxi0i1.dats] *)
(***********************************************************************)

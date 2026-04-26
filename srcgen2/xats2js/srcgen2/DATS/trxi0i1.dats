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
Sat Apr 18 06:17:19 PM EDT 2026
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
#staload ".\
/../../../xats2cc\
/srcgen1/SATS/intrep0.sats"//...
//
#staload "./../SATS/intrep1.sats"
#staload "./../SATS/trxi0i1.sats"
//
(* ****** ****** *)
(* ****** ****** *)
//
#implfun
i1parsed_of_trxi0i1
  (   dpar   ) =
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
i0dclistopt_trxi0i1(parsed, env0)
//
in//let
let
val ((*0*)) = envi0i1_free$top(env0)
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
( xs, e1, fopr ) =
(
list_map$e1nv<x0><y0><e1>(xs, e1)) where
{
#vwtpdef e1 = envi0i1
#impltmp
map$e1nv$fopr<x0><y0><e1> = fopr(*x0, e1*)
}(*where*)//end-of-[list_trxi0i1_fnp(xs,e1,fopr)]
//
(* ****** ****** *)
//
#impltmp
<x0><y0>
optn_trxi0i1_fnp
( xs, e1, fopr ) =
(
optn_map$e1nv<x0><y0><e1>(xs, e1)) where
{
#vwtpdef e1 = envi0i1
#impltmp
map$e1nv$fopr<x0><y0><e1> = fopr(*x0, e1*)
}(*where*)//end-of-[optn_trxi0i1_fnp(xs,e1,fopr)]
//
(* ****** ****** *)
(* ****** ****** *)
//
#implfun
i0dclist_trxi0i1
( dcls, env0 ) =
(
  list_trxi0i1_fnp(dcls, env0, i0dcl_trxi0i1))
//
(* ****** ****** *)
(* ****** ****** *)
//
#implfun
i0valdclist_trxi0i1
  ( i0vs, env0 ) =
(
  list_trxi0i1_fnp(i0vs, env0, i0valdcl_trxi0i1))
//
#implfun
i0vardclist_trxi0i1
  ( i0vs, env0 ) =
(
  list_trxi0i1_fnp(i0vs, env0, i0vardcl_trxi0i1))
//
(* ****** ****** *)
//
#implfun
i0fundclist_trxi0i1
  ( i0fs, env0 ) =
(
  list_trxi0i1_fnp(i0fs, env0, i0fundcl_trxi0i1))
//
(* ****** ****** *)
(* ****** ****** *)
//
#implfun
i0dclistopt_trxi0i1
  ( dopt, env0 ) =
(
  optn_trxi0i1_fnp(dopt, env0, i0dclist_trxi0i1))
//
(* ****** ****** *)
(* ****** ****** *)
//
(***********************************************************************)
(* end of [ATS3/XANADU_srcgen2_xats2js_srcgen2_DATS_trxi0i1.dats] *)
(***********************************************************************)

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
Sun 11 Sep 2022 02:24:37 PM EDT
*)
Authoremail: gmhwxiATgmailDOTcom
*)
//
(* ****** ****** *)
#include
"./../HATS/xatsopt_sats.hats"
#include
"./../HATS/xatsopt_dats.hats"
(* ****** ****** *)
#define
ATS_PACKNAME
"ATS3.XANADU.xatsopt-20220500"
(* ****** ****** *)
#staload "./../SATS/staexp1.sats"
#staload "./../SATS/dynexp1.sats"
(* ****** ****** *)
#staload "./../SATS/staexp2.sats"
#staload "./../SATS/dynexp2.sats"
(* ****** ****** *)
#staload "./../SATS/trans12.sats"
(* ****** ****** *)

#impltmp
<x0><y0>
list_trans12_fnp
( e1, xs, fopr ) =
(
list_map_e1nv<x0><y0>(xs, e1)) where
{
#impltmp
map$fopr_e1nv<x0><y0>(x0, e1) = fopr(e1, x0)
} (*where*)//end of [list_trans12_fnp(e1,xs,fopr)]

(* ****** ****** *)

#impltmp
<x0><y0>
optn_trans12_fnp
( e1, xs, fopr ) =
(
optn_map_e1nv<x0><y0>(xs, e1)) where
{
#impltmp
map$fopr_e1nv<x0><y0>(x0, e1) = fopr(e1, x0)
} (*where*)//end of [optn_trans12_fnp(e1,xs,fopr)]

(* ****** ****** *)
//
(*
HX-2019-02:
Please note that
a non-functional s2cst is
preferred over the functional ones
*)
//
#implfun
s2cst_select_any
  (   s2cs   ) =
(
  test1(s2cs)) where
{
//
fun
test1
(
xs: s2cstlst
) : s2cstopt_vt =
(
case+ xs of
|
list_nil() =>
(
  test2(s2cs)
)
|
list_cons(x0, xs) =>
if
sort2_funq(x0.sort())
then
test1(xs) else optn_vt_cons(x0) 
)
and
test2
(
xs: s2cstlst
) : s2cstopt_vt =
(
case+ xs of
|
list_nil() => optn_vt_nil()
|
list_cons(x0, xs) => optn_vt_cons(x0)
)
//
} (*where*) // end of [s2cst_select_any]

(* ****** ****** *)

#implfun
d2parsed_from_trans
  (dpar) =
let
val stadyn =
d1parsed_get_stadyn(dpar)
val nerror =
d1parsed_get_nerror(dpar)
val source =
d1parsed_get_source(dpar)
val parsed =
d1parsed_get_parsed(dpar)
//
val env0 = tr12env_make_nil()
//
val parsed =
trans12_d1eclistopt(env0, parsed)
//
in//let
let
val (  ) = tr12env_free_top(env0)
in//let
d2parsed(stadyn,nerror,source,parsed)
end
end (*let*) // end of [d1parsed_trans12(dpar)]

(* ****** ****** *)

(* end of [ATS3/XATSOPT_srcgen2_trans12.dats] *)

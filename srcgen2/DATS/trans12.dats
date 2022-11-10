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
#symload lctn with s1exp_get_lctn
#symload node with s1exp_get_node
(* ****** ****** *)
//
#impltmp
g_lte<sort2> = lte_sort2_sort2
#impltmp
g_lte<sort2lst> = lte_sort2lst_sort2lst
//
(* ****** ****** *)

#impltmp
<x0><y0>
list_trans12_fnp
( e1, xs, fopr ) =
(
list_map_e1nv<x0><y0><e1>(xs, e1)) where
{
#vwtpdef e1 = tr12env
#impltmp
map$fopr_e1nv<x0><y0><e1>(x0, e1) = fopr(e1, x0)
} (*where*)//end of [list_trans12_fnp(e1,xs,fopr)]

(* ****** ****** *)

#impltmp
<x0><y0>
optn_trans12_fnp
( e1, xs, fopr ) =
(
optn_map_e1nv<x0><y0><e1>(xs, e1)) where
{
#vwtpdef e1 = tr12env
#impltmp
map$fopr_e1nv<x0><y0><e1>(x0, e1) = fopr(e1, x0)
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
s2cst_select_list
  (s2cs, s2es) =
(
gseq_search_opt(s2cs)
) where
{
fun
f0_test0
(s2c0: s2cst): bool = let
//
in
//
case+
s2c0.sort() of
| S2Tfun1(s2ts, _) =>
  f0_test1(s2ts, s2es)
| _(* non-S2Tfun *) => false
//
end // end of [f0_test0]

and
f0_test1
( s2ts
: sort2lst
, s2es
: s2explst): bool =
(
case+ s2ts of
|
list_nil() =>
(
case+ s2es of
| list_nil() => true
| list_cons _ => false
)
|
list_cons(s2t0, s2ts) =>
(
case+ s2es of
| list_nil() => false
| list_cons(s2e0, s2es) =>
  if
  s2e0.sort() <= s2t0
  then
  f0_test1(s2ts, s2es) else false
)
) (*case+*) // end of [f0_test1(...)]
//
#implfun search$test<s2cst> = f0_test0
//
} (*where*)//end-of-[s2cst_select_list(...)]

(* ****** ****** *)

#implfun
s1exp_get_s2cstlst
  (env0, s1e0) =
let
(*
val () =
println!
("s1exp_get_s2cstlst: s1e0 = ", s1e0)
*)
in
case+
s1e0.node() of
|
S1Eid0(sid1) => let
val
opt1 =
tr12env_find_s2itm(env0, sid1)
in//let
case+ opt1 of
| ~
optn_vt_nil
( (*void*) ) => list_nil()
| ~
optn_vt_cons
(   s2i1   ) =>
(
case+ s2i1 of
|
S2ITMcst(s2cs) => s2cs | _ => list_nil()
)
end // end of [S1Eid0]
| _(* non-S1Eid0 *) => list_nil((*void*))
//
end (*let*) // end of [s1exp_get_s2cstlst(...)]

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

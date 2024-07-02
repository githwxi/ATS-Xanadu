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
#staload "./../SATS/xsymbol.sats"
(* ****** ****** *)
#staload "./../SATS/lexing0.sats"
(* ****** ****** *)
#staload "./../SATS/staexp1.sats"
#staload "./../SATS/dynexp1.sats"
(* ****** ****** *)
#staload "./../SATS/trans01.sats"
#staload "./../SATS/tread01.sats"
(* ****** ****** *)
#staload "./../SATS/staexp2.sats"
#staload "./../SATS/statyp2.sats"
#staload "./../SATS/dynexp2.sats"
(* ****** ****** *)
#staload "./../SATS/trans12.sats"
(* ****** ****** *)
#symload lctn with token_get_lctn
#symload node with token_get_node
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
//
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
//
(* ****** ****** *)
//
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
//
(* ****** ****** *)
//
(*
HX-2019-02:
Please note that
a non-functional s2cst is
preferred over functional ones
*)
//
#implfun
s2cst_select_any
  (   s2cs   ) =
(
f0_test1(s2cs)) where
{
//
fun
f0_test1
(
xs: s2cstlst
) : s2cstopt_vt =
(
case+ xs of
|
list_nil() =>
(
  f0_test2(s2cs))
|
list_cons(x1, xs) =>
if
sort2_funq(x1.sort())
then
f0_test1(xs) else optn_vt_cons(x1))
//
and
f0_test2
(
xs: s2cstlst
) : s2cstopt_vt =
(
case+ xs of
|list_nil() => optn_vt_nil()
|list_cons(x1, xs) => optn_vt_cons(x1)
) (*case+*) // end of [ f0_test2(xs) ]
//
} (*where*) // end of [s2cst_select_any(...)]

(* ****** ****** *)

local
//
fun
mat // match
( x1: sort2
, x2: sort2): bool =
(
case+ x1 of
S2Tnone0()=>true | _ =>(x1 <= x2))
//
fun
f0_test1
( s2c0: s2cst
, s2t1: sort2
, s2t2: sort2): bool = let
//
val
s2t0 = s2c0.sort()
//
in//let
//
case+ s2t0 of
|
S2Tfun1(s2ts, _) =>
f0_test2(s2ts, s2t1, s2t2)
|
_(* non-S2Tfun1 *) => false
//
end (*let*)//end-[f0_test1(s2c0,s1t1,s2t2)]
//
and
f0_test2
( s2ts
: sort2lst
, s2t1: sort2
, s2t2: sort2): bool =
(
case+ s2ts of
|
list_nil() => false
|
list_cons(t2x1, s2ts) =>
(
case+ s2ts of
|
list_nil() => false
|
list_cons(t2x2, s2ts) =>
(
case+ s2ts of
|
list_nil() =>
(
if
s2t1\mat(t2x1)
then
s2t2\mat(t2x2) else false)
|list_cons(_, _) => false))
) (*case+*)//end-[f0_test2(s2ts,s2t1,s2t2)]
//
(* ****** ****** *)
in//local
(* ****** ****** *)

(*
#implfun
s2cst_select_bin
(s2cs, s2t1, s2t2) =
let
(*
val () =
prerrln
("s2cst_select_bin: s2cs = ", s2cs)
val () =
prerrln
("s2cst_select_bin: s2t1 = ", s2t1)
val () =
prerrln
("s2cst_select_bin: s2t2 = ", s2t2)
*)
in//let
loop(s2cs) where
{
fun
loop
( s2cs
: s2cstlst): s2cstopt_vt =
(
case+ s2cs of
|
list_nil() =>
optn_vt_nil((*void*))
|
list_cons(s2c1, s2cs) =>
if
f0_test1(s2c1, s2t1, s2t2)
then optn_vt_cons(s2c1) else loop(s2cs))
}
end (*let*) // end of [s2cst_select_bin(...)]
*)

(* ****** ****** *)

#implfun
s2cst_selects_bin
(s2cs, s2t1, s2t2) =
let
//
(*
val () =
prerrln
("s2cst_selects_bin: s2cs = ", s2cs)
val () =
prerrln
("s2cst_selects_bin: s2t1 = ", s2t1)
val () =
prerrln
("s2cst_selects_bin: s2t2 = ", s2t2)
*)
//
in//let
//
list_filter<s2cst>(s2cs) where
{
#impltmp
filter$test
<s2cst>(s2c1) = f0_test1(s2c1, s2t1, s2t2)
}
//
end (*let*) // end of [s2cst_selects_bin(...)]

end (*local*)//end-of-[local(s2cst_select/s_bin)]

(* ****** ****** *)

local
//
fun
mat // match
( x1: sort2
, x2: sort2): bool =
(
case+ x1 of
S2Tnone0()=>true | _ =>(x1 <= x2))
//
fun
f0_test1
( s2c0: s2cst
, s2es: s2explst): bool =
let
//
(*
val () =
prerrln("f0_test1: s2c0 = ", s2c0)
val () =
prerrln("f0_test1: s2es = ", s2es)
*)
//
in//let
//
case+
s2c0.sort() of
|
S2Tfun1
(s2ts, _) => f0_test2(s2ts, s2es)
| _(* non-S2Tfun1 *) => ( false )
//
end (*let*) // end of [f0_test1(s2c0,s2es)]
//
and
f0_test2
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
|
list_nil() => true
|
list_cons _ => false)
|
list_cons(s2t1, s2ts) =>
(
case+ s2es of
|
list_nil() => false
|
list_cons(s2e1, s2es) =>
(
if
s2e1.sort()\mat(s2t1)
then f0_test2(s2ts, s2es) else false))
) (*case+*) // end of [f0_test2(s2ts,s2es)]
//
(* ****** ****** *)
in//local
(* ****** ****** *)

(*
#implfun
s2cst_select_list
  (s2cs, s2es) =
(
gseq_search_opt(s2cs)
) where
{
//
#implfun
search$test
<s2cst>(s2c0) = f0_test1(s2c0, s2es)
//
} (*where*)//end-of-[s2cst_select_list(...)]
*)

(* ****** ****** *)

#implfun
s2cst_selects_list
  (s2cs, s2es) =
(
list_filter
<s2cst>(s2cs)) where
{
//
#implfun
filter$test
<s2cst>(s2c0) = f0_test1(s2c0, s2es)
//
} (*where*)//end-of-[s2cst_selects_list(...)]

end (*local*)//end-of-[local(s2cst_select/s_list)]

(* ****** ****** *)

local

fun
f0_s1exp
( envs
: f2envlst
, sexp: s1exp): s2cstlst =
(
case+
sexp.node() of
|
S1Eid0(seid) =>
let
val sopt =
f2envlst_find_s2itm(envs, seid)
//
(*
val (  ) =
prerrln("f0_s1exp: sopt = ", sopt)
*)
//
in//let
case+ sopt of
| ~
optn_vt_nil() => list_nil((*void*))
| ~
optn_vt_cons(sitm) =>
(
case+ sitm of
| S2ITMcst(s2cs) => s2cs//HX:found!
| _(*otherwise*) => list_nil((*void*))
)
end(*let*) // end of [ S1Eid0(seid) ]
| _(*otherwise*) => list_nil((*void*))
//
) where
{
(*
val
( ) = prerrln("f0_s1exp: sexp = ", sexp)
*)
} (*where*) // end of [f0_s1exp(envs,sexp)]

(* ****** ****** *)
in//local
(* ****** ****** *)

#implfun
s1exp_get_s2cstlst
  (env0, s1e0) =
(
case+
s1e0.node() of
|
S1Eid0(sid1) => let
//
val
opt1 =
tr12env_find_s2itm(env0, sid1)
//
(*
val () =
prerrln
("s1exp_get_s2cstlst: s1e0 = ", s1e0)
val () =
prerrln
("s1exp_get_s2cstlst: opt1 = ", opt1)
*)
//
in//let
case+ opt1 of
| ~
optn_vt_nil
( (*void*) ) =>
list_nil((*0*))
| ~
optn_vt_cons
(   s2i1   ) =>
(
case+ s2i1 of
|
S2ITMcst
(   s2cs   ) => ( s2cs )
|
_(*non-S2ITMcst*) => list_nil(*0*)
)
end (*let*) // end of [S1Eid0(sid1)]
//
|
S1Equal0(tok1, s1e2) =>
(
case+
tok1.node() of
|
T_IDQUA(name) =>
let
val
sym1 =
symbl_make_name(name)
val
opt1 =
tr12env_find_s2itm(env0, sym1)
//
(*
val () =
prerrln
("s1exp_get_s2cstlst: opt1 = ", opt1)
*)
//
in//let
case+ opt1 of
| ~
optn_vt_nil() =>
list_nil((*void*))
| ~
optn_vt_cons(s2i1) =>
(
case+ s2i1 of
|
S2ITMenv(envs) => f0_s1exp(envs,s1e2)
|_(*otherwise*) => list_nil((*void*)))
end (*let*) // end-of-[ T_IDQUA(...) ]
|
_(*non-T_IDQUA*) => list_nil((*void*)))
//
|
_(*non-S1Eid0(seid)*) => list_nil((*void*))
//
) where
{
(*
val () =
prerrln("s1exp_get_s2cstlst: s1e0 = ", s1e0)
*)
} (*where*) // end of [s1exp_get_s2cstlst(...)]

end (*local*) // end of [s1exp_get_s2cstlst(...)]

(* ****** ****** *)

#implfun
d2parsed_of_trans12
  (dpar) =
let
val stadyn =
d1parsed_get_stadyn(dpar)
val nerror =
d1parsed_get_nerror(dpar)
val source =
d1parsed_get_source(dpar)
val t1penv =
d1parsed_get_topenv(dpar)
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
val t2penv = tr12env_free_top(env0)
in//let
d2parsed
( stadyn
, nerror, source, t1penv, t2penv, parsed)
end
end (*let*) // end of [d1parsed_trans12(dpar)]

(* ****** ****** *)
//
#implfun
d2parsed_from_fpath
  (stadyn, source) =
(
  d2parsed_of_trans12(dpar)) where
{
//
val dpar =
d1parsed_from_fpath(stadyn, source)
//
val dpar = d1parsed_of_tread01(dpar)
//
} (*where*)//end-of-[d2parsed_from_fpath(...)]
//
(* ****** ****** *)

(* end of [ATS3/XATSOPT_srcgen2_DATS_trans12.dats] *)

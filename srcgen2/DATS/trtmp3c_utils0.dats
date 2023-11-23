(***********************************************************************)
(*                                                                     *)
(*                         Applied Type System                         *)
(*                                                                     *)
(***********************************************************************)

(*
** ATS/Xanadu - Unleashing the Potential of Types!
** Copyright (C) 2023 Hongwei Xi, ATS Trustful Software, Inc.
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
Thu Nov  9 13:21:34 EST 2023
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
#staload "./../SATS/xstamp0.sats"
(* ****** ****** *)
#staload "./../SATS/xsymmap.sats"
(* ****** ****** *)
#staload "./../SATS/staexp2.sats"
#staload "./../SATS/statyp2.sats"
(* ****** ****** *)
#staload "./../SATS/dynexp2.sats"
#staload "./../SATS/dynexp3.sats"
(* ****** ****** *)
#staload "./../SATS/trtmp3c.sats"
(* ****** ****** *)
#symload stmp with timpl_get_stmp
#symload node with timpl_get_node
(* ****** ****** *)
//
#implfun
tr3cenv_timp_process
  (  env0, timp  ) =
(
case+
timp.node() of
|
TIMPLallx _ => timp
|
TIMPLall1 _ =>
(
if
nimp >= NIMP
then timp else
(
  f0_all1(env0, timp) )
) where//end-(TIMPLall1)
{
//
val NIMP = 10
(*
val NIMP = 100
*)
//
val nimp =
(
  tr3cenv_getnimp(env0))
}
//
) where // end-of-(case+)
{
//
fun
f0_all1
( env0:
! tr3cenv
, timp: timpl): timpl =
let
//
val
stmp = timp.stmp((*0*))
//
val-
TIMPLall1
(d2c0, dcls) = timp.node()
//
in//in
case+ dcls of
|
list_nil
((*void*)) =>
(  timp  ) // HX: ~found
|
list_cons
(dcl1, dcls) =>
let
//
val-
D3Ctmpsub
(svts, dcl2) = dcl1.node()
//
val () =
tr3cenv_pshsvts(env0, svts)
//
val dcl2 =
let
val
dcl3 =
d3ecl_impsub//stamp as is
(0, svts, dcl2)//val(dcl2)
val () =
tr3cenv_insert_timp
(env0 , stmp , dcl3)//val()
in//let
trtmp3c_impltmpx(env0, dcl2)
end//let//end-of-[val(dcl2)]
//
val () = tr3cenv_popsvts(env0)
//
in//let
let
val dcl1 =
d3ecl_tmpsub(svts, dcl2)
val dcls = list_cons(dcl1, dcls)
in//let
timpl(stmp, TIMPLallx(d2c0, dcls))
end//let
end//let//end-of-[list_cons( ... )]
end//let//end-of-[f0_all1(env0,timp)]
//
val () =
// (*
prerrln
("tr3cenv_timp_process: timp = ", timp)
// *)
//
}(*where*)//end-of-[tr3cenv_timp_process]
//
(* ****** ****** *)
local
(* ****** ****** *)
(*
HX-2023-11-17:
It is implemented in
[dynexp3_utils0.dats]:
tmpmatch_d3cl_t2js(d3cl,t2js)
*)
(* ****** ****** *)
//
fn0
s2typlst_subst0
( t2ps
: s2typlst
, svts: s2vts): s2typlst =
(
case+ svts of
|
list_nil
( (*nil*) ) => t2ps
|
list_cons _ =>
s2typlst_subst0(t2ps, svts))
(*case+*) // end of [s2typlst_subst0]
//
(* ****** ****** *)
//
fun
t2jaglst_subst0
( t2js
: t2jaglst
, svts: s2vts): t2jaglst =
(
case+ svts of
|
list_nil
( (*nil*) ) => t2js
|
list_cons _ =>
(
  list_map(t2js)) where

{
//
#typedef x0 = t2jag
#typedef y0 = t2jag
//
#impltmp
map$fopr
<x0><y0>(x0) =
(
t2jag_make_t2ps
( loc0 , t2ps )) where
{
val loc0 =
t2jag_get_lctn(x0)
val t2ps =
t2jag_get_t2ps(x0)
val t2ps =
s2typlst_subst0(t2ps, svts) }
//
}
)(*case+*) // end of [t2jaglst_subst0]
//
(* ****** ****** *)
in (*local*)
(* ****** ****** *)
//
#implfun
tr3cenv_tapq_resolve
  (env0, d2c0, t2js) =
let
//
val
dcls =
implfilter(dcls)
//
val
dcls =
impltmprec(env0, dcls)
//
val dcls = list_vt2t(dcls)
//
in//let
//
(
timpl_make_node
(stmp, TIMPLall1(d2c0, dcls))
) where
{
// (*
val () =
prerrln
("tr3cenv_tapq_resolve: dcls = ", dcls)
// *)
}
//
end where // end-of-let
{
//
fun
implfilter
(
dcls
: d3eclist_vt
)
: d3eclist_vt =
(
//
case+ dcls of
| ~
list_vt_nil
( (*nil*) ) =>
list_vt_nil((*nil*))
| ~
list_vt_cons
(dcl1, dcls) =>
let
//
val
opt1 =
tmpmatch_d3cl_t2js
(dcl1(*imp*),t2js(*arg*))
//
in//let
//
case+ opt1 of
//
|optn_nil
( (*0*) ) =>
implfilter(dcls)
//
|optn_cons(tsub) =>
let
//
val
dcl1 =
(
case+
dcl1.node() of
|D3Ctmpsub(_, dcl1) =>
(
  d3ecl_tmpsub(tsub,dcl1) )
|_(*non-D3Ctmpsub*) =>
(
  d3ecl_tmpsub(tsub,dcl1) ) )
//
// (*
val (  ) =
prerr
("tr3cenv_tapq_resolve:")
val (  ) =
prerrln
("implfilter: dcl1 = ", dcl1)
// *)
//
in//let
list_vt_cons(dcl1, implfilter(dcls))
end//let
end//let // end-of-[ list_cons(...) ]
//
)(*case+*) // end of [implfilter(dcls)]
//
(* ****** ****** *)
//
fun
impltmprec
( env0:
! tr3cenv
, dcls
: d3eclist_vt): d3eclist_vt =
(
case+ dcls of
//
| ~
list_vt_nil
( (*nil*) ) =>
list_vt_nil( (*nil*) )
//
| ~
list_vt_cons
(dcl1, dcls) =>
(
if
stamp_nilq(test)
then
list_vt_cons(dcl1, dcls)
else
(
if
d3ecl_impltmprq(dcl1)
then
(
list_vt_cons(dcl1, dcls)
) where {
val dcl1 =
d3ecl_impltmpr(test, dcl1)
}//whr//end-of-then
else impltmprec(env0, dcls))
) where {
//
val
test = // test: stamp
tr3cenv_impltmprecq(env0, dcl1, t2js)
//
val () =
(
 prerrln("impltmprec: test = ", test) )
//
}(*where*) // end of [ list_cons(...) ]
//
)(*case+*) // end of [impltmprec(dcls)]
//
(* ****** ****** *)
//
} where {
//
val () =
prerrln
("tr3cenv_tapq_resolve: d2c0 = ", d2c0)
val () =
prerrln
("tr3cenv_tapq_resolve: t2js = ", t2js)
//
(*
HX:
The stamp is for the
stack of tmplt resolution
*)
val
stmp = tr3cenv_getstmp(env0)//val(stmp)
(*
HX:
[trtmp3b]
guarantees [svts] to exist
*)
val
svts = tr3cenv_getsvts(env0)//val(svts) 
//
val () =
prerrln
("tr3cenv_tapq_resolve: stmp = ", stmp)
val () =
prerrln
("tr3cenv_tapq_resolve: svts = ", svts)
//
val t2js =
(
 t2jaglst_subst0(t2js, svts))//val(t2js)
//
val () =
prerrln
("tr3cenv_tapq_resolve: t2js = ", t2js)
//
val dcls =
(
 tr3cenv_search_dcst(env0, d2c0))//val(dcls)
//
(*
val (  ) =
prerrln("tr3cenv_tapq_resolve: dcls = ", dcls)
*)
//
} (*where*)//end-of-[tr3cenv_tapq_resolve(env0,...)]
//
(* ****** ****** *)

end(*local*) // end-of-[local(tr3cenv_tapq_resolve)]

(* ****** ****** *)

(* end of [ATS3/XATSOPT_srcgen2_trtmp3c_utils0.dats] *)

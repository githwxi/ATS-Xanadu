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
Fri 24 Feb 2023 04:49:55 PM EST
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
#staload "./../SATS/xbasics.sats"
(* ****** ****** *)
#staload "./../SATS/xsymbol.sats"
(* ****** ****** *)
#staload "./../SATS/locinfo.sats"
(* ****** ****** *)
#staload "./../SATS/lexing0.sats"
(* ****** ****** *)
#staload "./../SATS/staexp2.sats"
#staload "./../SATS/statyp2.sats"
(* ****** ****** *)
#staload "./../SATS/dynexp2.sats"
(* ****** ****** *)
#staload "./../SATS/dynexp3.sats"
(* ****** ****** *)
#staload "./../SATS/trans23.sats"
(* ****** ****** *)
#staload _ = "./statyp2_tmplib.dats"
(* ****** ****** *)
#symload lctn with token_get_lctn
#symload node with token_get_node
(* ****** ****** *)
#symload lctn with d3pat_get_lctn
#symload node with d3pat_get_node
#symload styp with d3pat_get_styp
#symload styp with d3pat_set_styp
(* ****** ****** *)
#symload lctn with d3exp_get_lctn
#symload node with d3exp_get_node
#symload styp with d3exp_get_styp
#symload styp with d3exp_set_styp
(* ****** ****** *)
//
fn0
s2typ_subst0
( t2p0: s2typ
, svts: s2vts): s2typ =
(
case+ svts of
|list_nil() => t2p0 // identity
|list_cons _ =>
 s2typ_subst0(t2p0, svts) )//end-fn0
//
(* ****** ****** *)
//
#implfun
s2typlst_of_d3patlst
( d3ps ) =
(
list_map<x0><y0>(d3ps)) where
{
#typedef x0 = d3pat
#typedef y0 = s2typ
#impltmp
map$fopr<x0><y0>(d3p) = d3p.styp()
}
// end of [s2typlst_of_d3patlst(d3ps)]
//
(* ****** ****** *)
//
#implfun
s2typlst_of_d3explst
( d3es ) =
(
list_map<x0><y0>(d3es)) where
{
#typedef x0 = d3exp
#typedef y0 = s2typ
#impltmp
map$fopr<x0><y0>(d3e) = d3e.styp()
}
// end of [s2typlst_of_d3explst(d3es)]
//
(* ****** ****** *)
//
#implfun
l2t2plst_of_l3d3plst
( ldps ) =
(
list_map<x0><y0>(ldps)) where
{
//
#typedef x0 = l3d3p
#typedef y0 = l2t2p
//
#impltmp
map$fopr<x0><y0>(ldp) =
S2LAB
(l0, d3p.styp()) where
{
  val+D3LAB(l0, d3p) = ldp } }
// end of [l2t2plst_of_l3d3plst(ldps)]
//
(* ****** ****** *)
//
#implfun
l2t2plst_of_l3d3elst
( ldes ) =
(
list_map<x0><y0>(ldes)) where
{
//
#typedef x0 = l3d3e
#typedef y0 = l2t2p
//
#impltmp
map$fopr<x0><y0>(lde) =
S2LAB
(l0, d3e.styp()) where
{
  val+D3LAB(l0, d3e) = lde } }
// end of [l2t2plst_of_l3d3elst(ldes)]
//
(* ****** ****** *)

local
//
fun
f0_tqag_tjag
( loc0: loc_t
, tqag: t2qag): t2jag =
let
//
#typedef x0 = s2var
#typedef y0 = s2typ
//
#impltmp
map$fopr
<x0><y0>(s2v) =
let
val s2t = s2v.sort()
in//let
s2typ_xtv
(x2t2p_make_lctn(loc0))
end // end of [map$fopr<x0><y0>]
//
in//let
let
val s2vs = tqag.s2vs()
in
  t2jag_make_t2ps
  (loc0, list_map<x0><y0>( s2vs ))
end
end(*let*)//end-of-[f0-tqag-tjag(...)]
//
fun
f0_make_svts
( t2qs: t2qaglst
, t2js: t2jaglst): s2vts =
(
case+ t2qs of
|
list_nil() =>
list_nil(*void*)
|
list_cons(t2q1, t2qs) =>
(
case+ t2js of
|
list_nil() =>
list_nil(*void*)
|
list_cons(t2j1, t2js) =>
let
val svts =
f0_make_svts(t2qs, t2js)
in//let
f1_make_svts
(t2q1.s2vs(), t2j1.t2ps(), svts)
end
) where
{
//
fun
f1_make_svts
( s2vs
: s2varlst
, t2ps
: s2typlst, svts: s2vts): s2vts =
(
case+ s2vs of
|
list_nil() => svts
|
list_cons(s2v1, s2vs) =>
(
case+ t2ps of
|
list_nil() => svts
|
list_cons(t2p1, t2ps) =>
list_cons
( @(s2v1, t2p1)
, f1_make_svts(s2vs, t2ps, svts))))
//
} (*where*)
) (*case+*)//end-of-[f0_make_svts(...)]
//
in//local

(* ****** ****** *)

#implfun
d2con23_tjagize
( loc0, dcon ) =
( t2js, t2p0 ) where
{
//
val
t2qs =
d2con_get_tqas(dcon)
//
val
t2js = let
#impltmp
map$fopr
<t2qag><t2jag>(tqag) =
f0_tqag_tjag(loc0, tqag)
in//let
list_map<t2qag><t2jag>(t2qs)
end (*let*)//end-of-[val(t2js)]
//
val
t2p0 = d2con_get_styp(dcon)
val
svts = f0_make_svts(t2qs, t2js)
val
t2p0 = s2typ_subst0(t2p0, svts)
//
(*
val () =
prerrln
("d2con23_tjagize: svts: ", svts)
val () =
prerrln
("d2con23_tjagize: t2p0: ", t2p0)
*)
//
} (*where*) // end of [d2con23_tjagize(...)]

(* ****** ****** *)

#implfun
d2con23_tapqize
( loc0, dcon ) =
let
//
val
(t2js, t2p0) =
d2con23_tjagize(loc0, dcon)
//
val
d3e0 =
d3exp_make_node(loc0, D3Econ(dcon))
//
in//let
//
case+ t2js of
|
list_nil _ =>
let
  val () = d3e0.styp(t2p0) in d3e0
end
|
list_cons _ =>
(
  d3exp_make_styp_node
  (loc0, t2p0, D3Etapq(d3e0, t2js)) )
//
end (*let*) // end of [d2con23_tapqize(...)]

(* ****** ****** *)

#implfun
d2cst23_tapqize
( loc0, dcst ) =
let
val t2qs =
d2cst_get_tqas(dcst)
val t2js =
let
#impltmp
map$fopr
<t2qag><t2jag>(tqag) =
f0_tqag_tjag(loc0, tqag)
in//let
list_map<t2qag><t2jag>(t2qs)
end (*let*)//end-of-[val(t2js)]
//
val
t2p0 = d2cst_get_styp(dcst)
val
svts = f0_make_svts(t2qs, t2js)
val
t2p0 = s2typ_subst0(t2p0, svts)
//
(*
val () =
prerrln
("d2cst23_tapqize: svts: ", svts)
val () =
prerrln
("d2cst23_tapqize: t2p0: ", t2p0)
*)
//
val
d3e0 =
d3exp_make_node(loc0, D3Ecst(dcst))
//
in//let
//
case+ t2js of
|
list_nil _ =>
let
  val () = d3e0.styp(t2p0) in d3e0
end
|
list_cons _ =>
(
  d3exp_make_styp_node
  (loc0, t2p0, D3Etapq(d3e0, t2js)) )
//
end (*let*) // end of [d2cst23_tapqize(...)]

(* ****** ****** *)

endloc // end of [local(d2con23/d2cst23_tapqize)]

(* ****** ****** *)

#implfun
unify23_s2typ
(env0, t2p1, t2p2) =
let
//
#vwtpdef e1nv = tr23env
//
#impltmp
s2typ_eval$s2cst
<e1nv>(env0,s2c0) =
s2cst_get_styp(s2c0)
#impltmp
s2typ_eval$s2var
<e1nv>(env0,s2v0) = optn_vt_nil()
//
// (*
val () =
prerrln("unify23_s2typ: t2p1 = ", t2p1)
val () =
prerrln("unify23_s2typ: t2p2 = ", t2p2)
// *)
//
in//let
unify00_s2typ_e1nv<e1nv>(env0, t2p1, t2p2)
end (*let*) // end of [unify23_s2typ(env0,...)]

(* ****** ****** *)

(* end of [ATS3/XATSOPT_srcgen2_trans23_utils0.dats] *)

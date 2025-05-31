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
(* ****** ****** *)
#define
ATS_PACKNAME
"ATS3.XANADU.xatsopt-20220500"
(* ****** ****** *)
(* ****** ****** *)
//
#include
"./../HATS/xatsopt_sats.hats"
(*
#include
"./../HATS/xatsopt_dats.hats"
*)
#include
"./../HATS/xatsopt_dpre.hats"
//
(* ****** ****** *)
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
#symload sort with s2typ_get_sort
#symload node with s2typ_get_node
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
(* ****** ****** *)
//
#implfun
s2typ_fun1_f3arglst
( f3as, tfun, tres ) =
(
  auxmain(f3as, tfun)
) where
{
//
fun
f1_imprq
( s2vs
: s2varlst): bool =
(
case+ s2vs of
|list_nil() => false
|list_cons(s2v1, s2vs) =>
(
if
sort2_imprq
(s2v1.sort((*void*)))
then true else f1_imprq(s2vs))
)
//
fun
auxmain
( f3as
: f3arglst
, tfun:s2typ): s2typ =
(
case+ f3as of
|list_nil() => tres
|list_cons(f3a1, f3as) =>
(
//
case+
f3a1.node() of
//
|F3ARGmets _ =>
(
  auxmain(f3as, tfun))
//
|F3ARGsapp(s2vs, s2ps) =>
(
if
not
(f1_imprq(s2vs))
then
auxmain(f3as, tfun)
else
let
val-
T2Puni0
(s2vs, tfun) = tfun.node()
//
val
s2t0 = tfun.sort()
val
tres = auxmain(f3as, tfun)
//
in//let
s2typ_make_node
(s2t0, T2Puni0(s2vs, tres))
endlet // end-of-[else]
) (* end of [F3ARGsapp(...) *)
//
|
F3ARGdapp(npf1, d3ps) =>
let
val-
T2Pfun1
(f2cl
,npf1
,targ, tfun) = tfun.node()
//
val
s2t0 = tfun.sort()
val
tres = auxmain(f3as, tfun)
//
val
t2ps =
s2typlst_of_d3patlst(d3ps)
//
in//let
//
s2typ_make_node
( s2t0
, T2Pfun1(f2cl,npf1,t2ps,tres))
//
end (*let*) // end of [F3ARGdapp]
//
) (* end of [list_cons(...)] *)
) (*case+*) // end of [auxmain(...)]
} // end of [s2typ_fun1_f3arglst(...)]
//
(* ****** ****** *)
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
map$fopr
<x0><y0>(d3p) = d3p.styp() }//where
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
//
#typedef x0 = d3exp
#typedef y0 = s2typ
//
#impltmp
map$fopr
<x0><y0>(d3e) = d3e.styp() }//where
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
  val+D3LAB(l0, d3p) = ldp }//where
}(*where*)
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
( t2qs
: t2qaglst
, t2js
: t2jaglst
, svts: s2vts): s2vts =
(
case+ t2qs of
|
list_nil() => svts
|
list_cons(t2q1, t2qs) =>
(
case+ t2js of
|
list_nil() => svts
|
list_cons(t2j1, t2js) =>
(
f0_make_svts
(t2qs, t2js, svts))
where {
val svts =
f1_make_svts
(t2q1.s2vs(),t2j1.t2ps(),svts) }
) where {
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
(
f1_make_svts
(s2vs, t2ps, svts)) where
{ val svts =
  list_cons(@(s2v1, t2p1), svts) }
)
) (*case+*) // end of [f1_make_svts]
//
} (*where*)
) (*case+*) // end-of-[f0_make_svts(...)]
//
(* ****** ****** *)
in//local
(* ****** ****** *)
//
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
svts = list_nil((*void*))
val
t2p0 = d2con_get_styp(dcon)
val
svts =
f0_make_svts(t2qs, t2js, svts)
val
t2p0 = s2typ_subst0(t2p0, svts)
//
(*
val () =
prerrsln
("d2con23_tjagize: svts: ", svts)
val () =
prerrsln
("d2con23_tjagize: t2p0: ", t2p0)
*)
//
} (*where*) // end of [d2con23_tjagize(...)]
//
(* ****** ****** *)
//
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
d3exp_make_node(loc0,D3Econ(dcon))
//
in//let
//
case+ t2js of
|list_nil _ =>
let
  val () = d3e0.styp(t2p0) in d3e0
end // let // end of [list_nil(...)]
|list_cons _ =>
(
  d3exp_make_tpnd
  (loc0, t2p0, D3Etapq(d3e0, t2js)) )
//
end (*let*) // end of [d2con23_tapqize(...)]
//
(* ****** ****** *)
//
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
svts = list_nil((*void*))
val
t2p0 = d2cst_get_styp(dcst)
//
(*
val () =
prerrsln("\
d2cst23_tapqize: svts: ", svts)
val () =
prerrsln("\
d2cst23_tapqize: t2p0: ", t2p0)
*)
//
val
svts =
(
f0_make_svts(t2qs, t2js, svts))
val
t2p0 = s2typ_subst0(t2p0, svts)
//
(*
val () =
prerrsln
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
  d3exp_make_tpnd
  (loc0, t2p0, D3Etapq(d3e0, t2js)) )
//
end (*let*) // end of [d2cst23_tapqize(...)]
//
(* ****** ****** *)
//
endloc // end of [local(d2con23/d2cst23_tapqize)]

(* ****** ****** *)
(* ****** ****** *)

local
//
fun
f0_s2vs
( s2vs
: s2varlst): s2typlst =
(
  list_map<x0><y0>(s2vs) ) where
{
//
fun
x2t2p_make() =
x2t2p_make_lctn
(loctn_dummy((*void*)))
//
#typedef x0 = s2var
#typedef y0 = s2typ // S2Extv
//
#impltmp
map$fopr
<x0><y0>
( s2v1 ) = s2typ_xtv(x2t2p_make()) }
//
fun
f0_s2vs_t2ps
( s2vs
: s2varlst
, t2ps
: s2typlst
, svts: s2vts): s2vts =
(
case+ s2vs of
|
list_nil() => svts
|
list_cons
(s2v1, s2vs) =>
( f0_s2vs_t2ps
  (s2vs, t2ps, svts)) where
{
val-
list_cons(t2p1, t2ps) = t2ps
val
svts = list_cons(@(s2v1, t2p1), svts) }
) (*case+*) // end of [f0_s2vs_t2ps(...)]
//
in//local
//
(* ****** ****** *)
//
#implfun
d3pat_sapqize(d3p0) = d3p0
//
(* ****** ****** *)
//
#implfun
d3exp_sapqize
(    d3e0    ) =
let
//
val
loc0 = d3e0.lctn()
//
val
t2p0 = d3e0.styp()
val
t2p0 = s2typ_hnfiz0(t2p0)
//
(*
val () =
prerrsln
("d3exp_sapqize: d3e0 = ", d3e0)
val () =
prerrsln
("d3exp_sapqize: t2p0 = ", t2p0)
*)
//
in//let
//
case+
t2p0.node() of
//
|T2Puni0(s2vs, t2p1) =>
let
//
val svts = list_nil()
val t2ps = f0_s2vs(s2vs)
val svts =
f0_s2vs_t2ps(s2vs, t2ps, svts)
//
val t2p1 = s2typ_subst0(t2p1, svts)
//
in//let
(
d3exp_sapqize
(d3exp(loc0,t2p1,D3Esapq(d3e0,t2ps))))
end (*let*) // end of [ T2Puni0(s2vs,t2p1) ]
//
|_(* non-T2Puni0 *) =>
(
  let val () = d3e0.styp(t2p0) in d3e0 end)
//
end (*let*) // end of [ d3exp_sapqize(d3e0) ]
//
(* ****** ****** *)
//
end (*local*) // end of [d3pat/d3exp_sapqize]

(* ****** ****** *)
(* ****** ****** *)
//
fun
s2cst_get23_styp
( env0:
! tr23env
, s2c0: s2cst): s2typopt_vt =
let
val
opt1 = s2cst_get_styp(s2c0)
in//let
case+ opt1 of
| // keep
optn_vt_cons(t2p1) => ( opt1 )
| ~ // free
optn_vt_nil() =>
(
  tr23env_evstyp_cst(env0,s2c0) )
end//end-of-[s2cst_get23_styp(...)]
//
(* ****** ****** *)
//
#implfun
unify23_s2typ
(env0, t2p1, t2p2) =
let
//
#vwtpdef e1nv = tr23env
//
(*
#impltmp
s2typ_eval$s2cst
<e1nv>(env0,s2c0) =
*)
#impltmp
s2typ_eval$s2cst
<e1nv>(env0,s2c0) =
(
s2cst_get23_styp
(  env0 , s2c0  ) ) where
{
(*
val () =
prerrsln
("\
unify23_s2typ: \
s2typ_eval$s2cst: s2c0 = ", s2c0)
*)
}(*where*)//end-of-[s2typ_eval$s2cst]
//
#impltmp
s2typ_eval$s2var
<e1nv>(env0,s2v0) = optn_vt_nil()
//
(* ****** ****** *)
//
(*
fun
f0_detop
( t2p0
: s2typ): s2typ =
(
case+ t2p0.node() of
|T2Ptop0
( t2p1 ) => f0_detop(t2p1)
|T2Ptop1
( t2p1 ) => f0_detop(t2p1)
|
_(*otherwise*) => ( t2p0 )) // f0_detop
*)
//
#impltmp
unify00_s2typ$hnfz
<e1nv>(e1nv, t2p0) =
(*
HX-2024-01-22:
type modifiers
need to be skipped here!
*)
(
s2typ_hnfiz0_e1nv
<e1nv>(e1nv, t2p0)) where
{
val t2p0 =
s2typ_untopx(s2typ_unargx(t2p0)) }
//where//end-of-[unify00_s2typ$hnfz(...)]
//
(* ****** ****** *)
//
(*
val () =
prerrsln("unify23_s2typ: t2p1 = ", t2p1)
val () =
prerrsln("unify23_s2typ: t2p2 = ", t2p2)
*)
//
in//let
unify00_s2typ_e1nv<e1nv>(env0, t2p1, t2p2)
end (*let*) // end of [unify23_s2typ(env0,...)]
//
(* ****** ****** *)
(* ****** ****** *)

(* end of [ATS3/XATSOPT_srcgen2_DATS_trans23_utils0.dats] *)

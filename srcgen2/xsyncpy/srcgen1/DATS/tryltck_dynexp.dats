(***********************************************************************)
(*                                                                     *)
(*                         Applied Type System                         *)
(*                                                                     *)
(***********************************************************************)

(*
** ATS/Xanadu - Unleashing the Potential of Types!
** Copyright (C) 2025 Hongwei Xi, ATS Trustful Software, Inc.
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
(*
Thu Sep 18 02:05:37 AM EDT 2025
*)
Authoremail: gmhwxiATgmailDOTcom
*)
//
(* ****** ****** *)
(* ****** ****** *)
//
#staload
"./../SATS/statyp2.sats"
#staload
"./../SATS/dynexp3.sats"
#staload
"./../SATS/tryltck.sats"
//
(* ****** ****** *)
(* ****** ****** *)
//
#include
"./../HATS/mytmplib00.hats"
//
(* ****** ****** *)
(* ****** ****** *)
//
#staload
"prelude/SATS/gsyn000.sats"
//
(* ****** ****** *)
(* ****** ****** *)
//
#symload <
with sint_lt$sint of 1099
#symload >
with sint_gt$sint of 1099
#symload =
with sint_eq$sint of 1099
#symload <=
with sint_lte$sint of 1099
#symload >=
with sint_gte$sint of 1099
#symload !=
with sint_neq$sint of 1099
//
#symload +
with sint_add$sint of 1099
#symload -
with sint_sub$sint of 1099
//
(* ****** ****** *)
(* ****** ****** *)
//
#staload
"./../../../SATS/statyp2.sats"
#staload
"./../../../SATS/dynexp3.sats"
//
(* ****** ****** *)
(* ****** ****** *)
//
fun
d3pat1_errck
(lvl0: sint
,d3p0: d3pat1): d3pat1 =
(
let
val loc0 = d3p0.lctn()
val styp = d3p0.styp()
in//let
d3pat1_make_lctn$styp$node
(loc0,styp,D3P1errck(lvl0,d3p0))
end//let
)(*case+*)//end(d3pat1_errck(...))
//
(* ****** ****** *)
//
fun
d3exp1_errck
(lvl0: sint
,d3e0: d3exp1): d3exp1 =
(
let
val loc0 = d3e0.lctn()
val dtyp = d3e0.dtyp()
in//let
d3exp1_make_lctn$dtyp$node
(loc0,dtyp,D3E1errck(lvl0,d3e0))
end//let
)(*case+*)//end(d3exp1_errck(...))
//
(* ****** ****** *)
(* ****** ****** *)
//
fun
d3pat1_errvl
(d3p0: d3pat1): sint =
(
case+ d3p0.node() of
|
D3P1errck
(lvl0, _) => lvl0 | _ => 0)
#symload errvl with d3pat1_errvl
//
fun
d3pat1_errvl_a2
(d3p1: d3pat1
,d3p2: d3pat1): sint =
maxs(errvl(d3p1), errvl(d3p2))
#symload errvl with d3pat1_errvl_a2
//
(* ****** ****** *)
//
fun
d3pat1lst_errvl
(d3ps: d3pat1lst): sint =
(
list_folditm
<x0><r0>(d3ps, 0(*lvl*))
) where
{
//
#typedef r0 = sint
#typedef x0 = d3pat1
#typedef xs = d3pat1lst
//
#impltmp
folditm$fopr
<x0><r0>(r0, x0) =
let
val x0 =
d3pat1_errvl(x0) in//let
(if r0 >= x0 then r0 else x0) end
//
}(*where*)//end-of(d3pat1lst_errvl)
#symload errvl with d3pat1lst_errvl
//
(* ****** ****** *)
(* ****** ****** *)
//
fun
d3exp1_errvl
(d3e0: d3exp1): sint =
(
case+ d3e0.node() of
|
D3E1errck
(lvl0, _) => lvl0 | _ => 0)
#symload errvl with d3exp1_errvl
//
fun
d3exp1_errvl_a2
(d3e1: d3exp1
,d3e2: d3exp1): sint =
maxs(errvl(d3e1), errvl(d3e2))
#symload errvl with d3exp1_errvl_a2
//
(* ****** ****** *)
//
fun
d3exp1lst_errvl
(d3es: d3exp1lst): sint =
(
list_folditm
<x0><r0>(d3es, 0(*lvl*))
) where
{
//
#typedef r0 = sint
#typedef x0 = d3exp1
#typedef xs = d3exp1lst
//
#impltmp
folditm$fopr
<x0><r0>(r0, x0) =
let
val x0 =
d3exp1_errvl(x0) in//let
(if r0 >= x0 then r0 else x0) end
//
}(*where*)//end-of(d3exp1lst_errvl)
#symload errvl with d3exp1lst_errvl
//
(* ****** ****** *)
//
fun
d3exp1opt_errvl
(dopt: d3exp1opt): sint =
(
case+ dopt of
| optn_nil() => 0
| optn_cons(dexp) => errvl(dexp) )
#symload errvl with d3exp1opt_errvl
//
(* ****** ****** *)
(* ****** ****** *)
//
fun
d3pat1_tup0_errck
(loc0: loc_t
,t2q0: s2typ1
,npf1: (sint)
,d3ps: d3pat1lst): d3pat1 =
let
//
val
lvl0 =
errvl(d3ps) in//let
//
d3pat1_errck
( lvl0+1
, d3pat1_make_lctn$styp$node
  (loc0, t2q0, D3P1tup0(npf1, d3ps)))
//
endlet//end-of-[d3pat1_tup0_errck(...)]
//
(* ****** ****** *)
(* ****** ****** *)
//
fun
d3exp1_dapp_errck
(loc0: loc_t
,t3q0: d3typ1
,d3f0: d3exp1
,npf1: (sint)
,d3es: d3exp1lst): d3exp1 =
let
//
val
lvl0 = maxs
(errvl(d3f0), errvl(d3es))
//
in//let
//
d3exp1_errck
(
lvl0+1,
d3exp1(
  loc0,t3q0,D3E1dapp(d3f0,npf1,d3es)))
//
endlet//end-of-[d3exp1_dapp_errck(...)]
//
(* ****** ****** *)
//
fun
d3exp1_proj_errck
(loc0: loc_t
,t3q0: d3typ1
,tknd: token
,lab1: label
,dtup: d3exp1   ): d3exp1 =
let
//
val
lvl0 = errvl(dtup)
//
in//let
//
d3exp1_errck
(
lvl0+1,
d3exp1(
  loc0,t3q0,D3E1proj(tknd,lab1,dtup)))
//
endlet//end-of-[d3exp1_proj_errck(...)]
//
(* ****** ****** *)
//
fun
d3exp1_let1_errck
( loc0
: loc_t
, t3q0: d3typ1
, dcls: d3ecl1lst
, d3e1: d3exp1
, dvts: dvstp1lst): d3exp1 =
let
//
val
lvl0 = errvl(d3e1)
//
in//let
//
d3exp1_errck
(
lvl0+1,
d3exp1(
  loc0,t3q0,D3E1let1(dcls,d3e1,dvts)))
//
endlet//end-of-[d3exp1_let1_errck(...)]
//
(* ****** ****** *)
//
fun
d3exp1_ift0_errck
(loc0: loc_t
,t3q0: d3typ1
,d3e1: d3exp1
,dthn: d3exp1opt
,dels: d3exp1opt): d3exp1 =
let
//
val
lvl0 = maxs
(errvl(d3e1)
,errvl(dthn), errvl(dels))
//
in//let
//
d3exp1_errck
(
lvl0+1,
d3exp1(
  loc0,t3q0,D3E1ift0(d3e1,dthn,dels)))
//
endlet//end-of-[d3exp1_ift0_errck(...)]
//
(* ****** ****** *)
//
fun
d3exp1_seqn_errck
(loc0: loc_t
,t3q0: d3typ1
,d3es: d3exp1lst
,d3e1: d3exp1   ): d3exp1 =
let
//
val
lvl0 = maxs
(errvl(d3es), errvl(d3e1))
//
in//let
//
d3exp1_errck
( lvl0+1
, d3exp1
  (loc0, t3q0, D3E1seqn(d3es, d3e1)))
//
endlet//end-of-[d3exp1_seqn_errck(...)]
//
(* ****** ****** *)
//
fun
d3exp1_tup0_errck
(loc0: loc_t
,t3q0: d3typ1
,npf1: (sint)
,d3es: d3exp1lst): d3exp1 =
let
//
val
lvl0 =
errvl(d3es) in//let
d3exp1_errck
( lvl0+1
, d3exp1
  (loc0, t3q0, D3E1tup0(npf1, d3es)))
//
endlet//end-of-[d3exp1_tup0_errck(...)]
//
(* ****** ****** *)
//
fun
d3exp1_flat_errck
(loc0: loc_t
,t3q0: d3typ1
,d3e1: d3exp1   ): d3exp1 =
let
//
val
lvl0 =
errvl(d3e1) in//let
d3exp1_errck
( lvl0+1
, d3exp1(loc0, t3q0, D3E1flat(d3e1)))
//
endlet//end-of-[d3exp1_flat_errck(...)]
//
(* ****** ****** *)
//
fun
d3exp1_assgn_errck
(loc0: loc_t
,t3q0: d3typ1
,d3el: d3exp1
,d3er: d3exp1   ): d3exp1 =
let
//
val
lvl0 =
errvl
(d3el, d3er) in//let
//
d3exp1_errck
( lvl0+1
, d3exp1_make_lctn$dtyp$node
  (loc0, t3q0, D3E1assgn(d3el,d3er)))
//
endlet//end-of-[d3exp1_assgn_errck(...)]
//
(* ****** ****** *)
//
fun
d3exp1_dvdtp_errck
(loc0: loc_t
,t3q0: d3typ1
,d3e1: d3exp1
,dvts: dvdtp1lst): d3exp1 =
let
//
val
lvl0 =
errvl(d3e1) in//let
//
d3exp1_errck
( lvl0+1
, d3exp1_make_lctn$dtyp$node
  (loc0, t3q0, D3E1dvdtp(d3e1,dvts)))
//
endlet//end-of-[d3exp1_dvdtp_errck(...)]
//
(* ****** ****** *)
//
fun
d3exp1_delin_errck
(loc0: loc_t
,t3q0: d3typ1
,d3e1: d3exp1
,t2q2: s2typ1   ): d3exp1 =
let
//
val
lvl0 =
errvl(d3e1) in//let
//
(
d3exp1_errck
(
lvl0+1,
d3exp1_make_lctn$dtyp$node
( loc0, t3q0, D3E1delin(d3e1, t2q2))))
//
endlet//end-of-[d3exp1_delin_errck(...)]
//
(* ****** ****** *)
//
fun
d3exp1_t2pck_errck
(loc0: loc_t
,t3q0: d3typ1
,d3e1: d3exp1
,t2q1: s2typ1
,t2q2: s2typ1   ): d3exp1 =
let
//
val
lvl0 =
errvl(d3e1) in//let
//
(
d3exp1_errck
(
lvl0+1,
d3exp1_make_lctn$dtyp$node
( loc0
, t3q0, D3E1t2pck(d3e1, t2q1, t2q2))))
//
endlet//end-of-[d3exp1_t2pck_errck(...)]
//
(* ****** ****** *)
//
fun
d3exp1_t2ped_errck
(loc0: loc_t
,t3q0: d3typ1
,d3e1: d3exp1
,t2q1: s2typ1
,t2q2: s2typ1   ): d3exp1 =
let
//
val
lvl0 =
errvl(d3e1) in//let
//
(
d3exp1_errck
(
lvl0+1,
d3exp1_make_lctn$dtyp$node
( loc0
, t3q0, D3E1t2ped(d3e1, t2q1, t2q2))))
//
endlet//end-of-[d3exp1_t2ped_errck(...)]
//
(* ****** ****** *)
(* ****** ****** *)
//
#implfun
d3pat1_tryltck
( dpat, err0 ) =
(
case+
dpat.node() of
//
|D3P1var _ => dpat
//
|D3P1int _ => dpat
|D3P1btf _ => dpat
|D3P1chr _ => dpat
|D3P1flt _ => dpat
|D3P1str _ => dpat
//
|D3P1tup0 _ =>
(
  f0_tup0(dpat, err0))
//
| _(*otherwise*) =>
let
val () = err0 := err0+1 in
(
  d3pat1_errck(1(*lvl*), dpat)) end
//
) where
{
//
(* ****** ****** *)
//
fun
f0_tup0
(d3p0: d3pat1
,err0: &sint >> _): d3pat1 =
let
//
val nerr = err0
//
val t2q0 = d3p0.styp()
//
val-
D3P1tup0
( npf1, d3ps) = d3p0.node()
//
val d3ps =
(
  d3pat1lst_tryltck(d3ps, err0))
//
in//let
if // if
(err0=nerr)
then (d3p0) else
let
val loc0 = d3p0.lctn() in
(
d3pat1_tup0_errck(loc0,t2q0,npf1,d3ps))
end//let
end(*let*)//end-of-[f0_tup0(d3p0,err0)]
//
(* ****** ****** *)
(* ****** ****** *)
//
(*
val loc0 = d3p0.lctn()
val (  ) =
prerrsln("d3pat1_tryltck: loc0 = ", loc0)
val (  ) =
prerrsln("d3pat1_tryltck: dpat = ", dpat)
*)
//
(* ****** ****** *)
(* ****** ****** *)
//
}(*where*)//end-of-[d3pat1_tryltck(dpat,err0)]
//
(* ****** ****** *)
(* ****** ****** *)
//
#implfun
d3exp1_tryltck
( dexp, err0 ) =
(
case+
dexp.node() of
//
(* ****** ****** *)
//
|D3E1var _ => dexp
//
(* ****** ****** *)
//
|D3E1int _ => dexp
|D3E1btf _ => dexp
|D3E1chr _ => dexp
|D3E1flt _ => dexp
|D3E1str _ => dexp
//
(* ****** ****** *)
//
|D3E1tapp _ => dexp
|D3E1tapq _ => dexp
//
(* ****** ****** *)
//
|D3E1dapp _ =>
(
  f0_dapp(dexp, err0))
//
(* ****** ****** *)
//
|D3E1proj _ =>
(
  f0_proj(dexp, err0))
//
(* ****** ****** *)
//
|D3E1let0 _ => (dexp)
|D3E1let1 _ =>
(
  f0_let1(dexp, err0))
//
(* ****** ****** *)
//
|D3E1ift0 _ =>
(
  f0_ift0(dexp, err0))
//
(* ****** ****** *)
//
|D3E1seqn _ =>
(
  f0_seqn(dexp, err0))
//
(* ****** ****** *)
//
|D3E1tup0 _ =>
(
  f0_tup0(dexp, err0))
//
(* ****** ****** *)
//
|D3E1flat _ =>
(
  f0_flat(dexp, err0))
//
(* ****** ****** *)
//
|D3E1assgn _ =>
(
  f0_assgn(dexp, err0))
//
(* ****** ****** *)
//
|D3E1dvdtp _ =>
(
  f0_dvdtp(dexp, err0))
//
(* ****** ****** *)
//
|D3E1delin _ =>
(
  f0_delin(dexp, err0))
//
|D3E1t2pck _ =>
(
  f0_t2pck(dexp, err0))
//
|D3E1t2ped _ =>
(
  f0_t2ped(dexp, err0))
//
(* ****** ****** *)
//
| _(*otherwise*) =>
let
val () = err0 := err0+1 in
(
  d3exp1_errck(1(*lvl*), dexp)) end
//
) where
{
//
(* ****** ****** *)
(* ****** ****** *)
//
fun
f0_dapp
( d3e0: d3exp1
, err0
: &sint >> sint): d3exp1 =
let
//
val nerr = err0
//
val-
D3E1dapp
(d3f0
,npf1, d3es) = d3e0.node()
//
val t3q0 = d3e0.dtyp((*0*))
//
val d3f0 =
(
d3exp1_tryltck(d3f0, err0))
val d3es =
d3exp1lst_tryltck(d3es, err0)
//
in//let
//
if // if
(err0=nerr)
then (d3e0) else
let
val loc0 = d3e0.lctn()
in//let
d3exp1_dapp_errck
(loc0
,t3q0, d3f0(*fun*), npf1, d3es(*arg*))
end//let
//
end(*let*)//end-of-[f0_dapp(d3e0,err0)]
//
(* ****** ****** *)
(* ****** ****** *)
//
fun
f0_proj
( d3e0: d3exp1
, err0
: &sint >> sint): d3exp1 =
let
//
val nerr = err0
//
val-
D3E1proj
(tknd
,lab1, dtup) = d3e0.node()
//
val t3q0 = d3e0.dtyp((*0*))
//
val dtup =
(
d3exp1_tryltck(dtup, err0))
//
in//let
//
if // if
(err0=nerr)
then (d3e0) else
let
val loc0 = d3e0.lctn()
in//let
(
d3exp1_proj_errck
(loc0, t3q0, tknd, lab1, dtup(*tup*)))
end//let
//
end(*let*)//end-of-[f0_proj(d3e0,err0)]
//
(* ****** ****** *)
(* ****** ****** *)
//
fun
f0_let1
( d3e0: d3exp1
, err0
: &sint >> sint): d3exp1 =
let
//
val nerr = err0
//
val-
D3E1let1
(dcls
,d3e1, dvts) = d3e0.node()
//
val t3q0 = d3e0.dtyp((*0*))
//
val dcls =
d3ecl1lst_tryltck(dcls, err0)
//
val d3e1 =
(
  d3exp1_tryltck(d3e1, err0))
//
in//let
//
if // if
(err0=nerr)
then (d3e0) else
(
d3exp1_let1_errck
(d3e0.lctn(), t3q0, dcls, d3e1, dvts))
//
end(*let*)//end-of-[f0_let1(d3e0,err0)]
//
(* ****** ****** *)
//
fun
f0_ift0
( d3e0: d3exp1
, err0
: &sint >> sint): d3exp1 =
let
//
val nerr = err0
//
val-
D3E1ift0
(d3e1
,dthn, dels) = d3e0.node()
//
val t3q0 = d3e0.dtyp((*0*))
//
val d3e1 =
(
d3exp1_tryltck(d3e1, err0))
val dthn =
d3exp1opt_tryltck(dthn, err0)
val dels =
d3exp1opt_tryltck(dels, err0)
//
in//let
//
if // if
(err0=nerr)
then (d3e0) else
let
val loc0 = d3e0.lctn()
in//let
//
d3exp1_ift0_errck
(loc0, t3q0, d3e1(*cond*), dthn, dels)
//
end//let
//
end(*let*)//end-of-[f0_ift0(d3e0,err0)]
//
(* ****** ****** *)
//
fun
f0_seqn
( d3e0: d3exp1
, err0
: &sint >> sint): d3exp1 =
let
//
val nerr = err0
//
val-
D3E1seqn
(d3es, d3e1) = d3e0.node()
//
val t3q0 = d3e0.dtyp()
val d3es =
d3exp1lst_tryltck(d3es, err0)
val d3e1 =
(
  d3exp1_tryltck(d3e1, err0))
//
in//let
//
if // if
(err0=nerr)
then (d3e0) else
(
  d3exp1_seqn_errck
  ( d3e0.lctn(), t3q0, d3es, d3e1 ) )
//
end(*let*)//end-of-[f0_seqn(d3e0,err0)]
//
(* ****** ****** *)
//
fun
f0_tup0
( d3e0: d3exp1
, err0
: &sint >> sint): d3exp1 =
let
//
val nerr = err0
//
val-
D3E1tup0
(npf1, d3es) = d3e0.node()
//
val t3q0 = d3e0.dtyp()
val d3es =
d3exp1lst_tryltck(d3es, err0)
//
in//let
//
if // if
(err0=nerr)
then (d3e0) else
(
  d3exp1_tup0_errck
  ( d3e0.lctn(), t3q0, npf1, d3es ) )
//
end(*let*)//end-of-[f0_tup0(d3e0,err0)]
//
(* ****** ****** *)
//
fun
f0_flat
( d3e0: d3exp1
, err0
: &sint >> sint): d3exp1 =
let
//
val nerr = err0
//
val-
D3E1flat
(   d3e1   ) = d3e0.node()
//
val t3q0 = d3e0.dtyp()
val d3e1 =
(
  d3exp1_tryltck(d3e1, err0))
//
in//let
//
if // if
(err0=nerr)
then (d3e0) else
let
val loc0 = d3e0.lctn()
in//let
(
  d3exp1_flat_errck(loc0, t3q0, d3e1))
end//let
//
end(*let*)//end-of-[f0_flat(d3e0,err0)]
//
(* ****** ****** *)
//
fun
f0_assgn
( d3e0: d3exp1
, err0
: &sint >> sint): d3exp1 =
let
//
val nerr = err0
//
val-
D3E1assgn
(d3el, d3er) = d3e0.node()
//
val t3q0 = d3e0.dtyp()
val d3el =
(
  d3exp1_tryltck(d3el, err0))
val d3er =
(
  d3exp1_tryltck(d3er, err0))
//
in//let
//
if // if
(err0=nerr)
then (d3e0) else
let
val loc0 = d3e0.lctn()
in//let
(
d3exp1_assgn_errck
(loc0, t3q0, d3el(*l-v*), d3er(*r-v*)))
end//let
//
end(*let*)//end-of-[f0_assgn(d3e0,err0)]
//
(* ****** ****** *)
(* ****** ****** *)
//
fun
f0_dvdtp
( d3e0: d3exp1
, err0
: &sint >> sint): d3exp1 =
let
//
val nerr = err0
//
val-
D3E1dvdtp
(d3e1, dvts) = d3e0.node()
//
val t3q0 = d3e0.dtyp((*0*))
//
val d3e1 =
(
  d3exp1_tryltck(d3e1, err0))
//
in//let
//
if // if
(err0=nerr)
then (d3e0) else
let
val loc0 =
d3e0.lctn() in//let
(
  d3exp1_dvdtp_errck
  (loc0, t3q0, d3e1, dvts) ) end//let
//
end(*let*)//end-of-[f0_dvdtp(d3e0,err0)]
//
(* ****** ****** *)
//
fun
f0_delin
( d3e0: d3exp1
, err0
: &sint >> sint): d3exp1 =
let
//
val nerr = err0
//
(*
HX-2025-11-05:
[t2pck] treated as error
*)
val (  ) =
(
  err0 := err0 + 1)
//
val-
D3E1delin
(d3e1, t2q2) = d3e0.node()
//
val t3q0 = d3e0.dtyp((*0*))
//
val d3e1 =
(
  d3exp1_tryltck(d3e1, err0))
//
in//let
//
if // if
(err0=nerr)
then (d3e0) else
let
val loc0 =
d3e0.lctn() in//let
(
  d3exp1_delin_errck
  (loc0, t3q0, d3e1, t2q2) ) end//let
//
end(*let*)//end-of-[f0_delin(d3e0,err0)]
//
(* ****** ****** *)
//
fun
f0_t2pck
( d3e0: d3exp1
, err0
: &sint >> sint): d3exp1 =
let
//
val nerr = err0
//
(*
HX-2025-11-05:
[t2pck] treated as error
*)
val (  ) =
(
  err0 := err0 + 1)
//
val-
D3E1t2pck
(d3e1
,t2q1, t2q2) = d3e0.node()
//
val t3q0 = d3e0.dtyp((*0*))
//
val d3e1 =
(
  d3exp1_tryltck(d3e1, err0))
//
in//let
//
if // if
(err0=nerr)
then (d3e0) else
(
d3exp1_t2pck_errck
(d3e0.lctn(), t3q0, d3e1, t2q1, t2q2))
//
end(*let*)//end-of-[f0_t2pck(d3e0,err0)]
//
(* ****** ****** *)
//
fun
f0_t2ped
( d3e0: d3exp1
, err0
: &sint >> sint): d3exp1 =
let
//
val nerr = err0
//
val-
D3E1t2ped
(d3e1
,t2q1, t2q2) = d3e0.node()
//
val t3q0 = d3e0.dtyp((*0*))
//
val d3e1 =
(
  d3exp1_tryltck(d3e1, err0))
//
in//let
//
if // if
(err0=nerr)
then (d3e0) else
(
d3exp1_t2ped_errck
(d3e0.lctn(), t3q0, d3e1, t2q1, t2q2))
//
end(*let*)//end-of-[f0_t2ped(d3e0,err0)]
//
(* ****** ****** *)
(* ****** ****** *)
//
(*
val loc0 = dexp.lctn()
val (  ) =
prerrsln("d3exp1_tryltck: loc0 = ", loc0)
val (  ) =
prerrsln("d3exp1_tryltck: dexp = ", dexp)
*)
//
(* ****** ****** *)
(* ****** ****** *)
//
}(*where*)//end-of-[d3exp1_tryltck(dexp,err0)]
//
(* ****** ****** *)
(* ****** ****** *)
//
#implfun
d3axp1_tryltck
( daxp, err0 ) =
(
case+
daxp.node() of
//
|D3A1int _ => daxp
|D3A1btf _ => daxp
|D3A1chr _ => daxp
|D3A1flt _ => daxp
|D3A1str _ => daxp
//
|D3A1var _ => daxp
|D3A1lft _ => daxp
//
|D3A1none _ => daxp
//
|
D3A1t2pck _ =>
let
//
val () =
(err0 := err0 + 1)
//
val loc0 = daxp.lctn()
val t2q0 = daxp.styp()
//
in//let
(
d3axp1(loc0, t2q0,
  D3A1errck(1(*lvl*), daxp)))
end//let//end-of-[D3A1t2pck(...)]
//
|
D3A1argtp
(d3a1, t2q2) =>
let
val d3a1 =
d3axp1_tryltck(d3a1, err0) in daxp
end//let//end-of-[D3A1argtp(d2a1,...)]
//
|
D3A1annot
(d3a1
,s1e2
,s2e2, t2q2) =>
let
val d3a1 =
d3axp1_tryltck(d3a1, err0) in daxp
end//let//end-of-[D3A1annot(d2a1,...)]
//
) where
{
//
(*
val loc0 = daxp.lctn()
val (  ) =
prerrsln("d3axp1_tryltck: loc0 = ", loc0)
val (  ) =
prerrsln("d3axp1_tryltck: daxp = ", daxp)
*)
//
}(*where*)//end-of-[d3axp1_tryltck(daxp,err0)]
//
(* ****** ****** *)
(* ****** ****** *)
//
#implfun
f3axp1_tryltck
( faxp, err0 ) =
(
case+
faxp.node() of
|
F3AXP1dapp
(npf1, d3as) =>
let
val nerr = err0
val d3as =
d3axp1lst_tryltck(d3as, err0)
in//let
if
(nerr = err0)
then faxp else
f3axp1_make_lctn$node
(faxp.lctn(), F3AXP1dapp(npf1, d3as))
end//let//end-of-[F3AXP1dapp(npf1,d3as)]
) where
{
//
(*
val loc0 = faxp.lctn()
val (  ) =
prerrsln("f3axp1_tryltck: loc0 = ", loc0)
val () =
prerrsln("f3axp1_tryltck: faxp = ", faxp)
*)
//
}(*where*)//end-of-[f3axp1_tryltck(faxp,err0)]
//
(* ****** ****** *)
(* ****** ****** *)
//
(***********************************************************************)
(* end of [ATS3/XATSOPT_srcgen2_xsyncpy_srcgen1_DATS_tryltck_dynexp.dats] *)
(***********************************************************************)

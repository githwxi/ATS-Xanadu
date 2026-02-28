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
Tue Jul  1 05:34:24 PM EDT 2025
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
"./../SATS/trxltck.sats"
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
#symload =
with sint_eq$sint of 1099
#symload <
with sint_lt$sint of 1099
#symload >
with sint_gt$sint of 1099
//
#symload +
with sint_add$sint of 1099
#symload -
with sint_sub$sint of 1099
//
(* ****** ****** *)
(* ****** ****** *)
//
#include
"./../HATS/libxatsopt.hats"
//
(* ****** ****** *)
(* ****** ****** *)
//
fun
d3pat1_argtp
(d3p0: d3pat1
,styp: s2typ1): d3pat1 =
let
val loc0 = d3p0.lctn()
in//let
d3pat1(
loc0, styp, D3P1argtp(d3p0, styp))
end//let//end-of-[d3pat1_argtp(...)]
//
(* ****** ****** *)
(* ****** ****** *)
//
(*
HX-2026-02-11:
For type-skeleton!
Wed Feb 11 EST 2026
*)
#implfun
d3typ1_mkof_d3pat1
  (  d3p0  ) =
let
//
val
t2q0 = d3p0.styp()
//
in//let
//
case+
d3p0.node() of
//
|D3P1any _ =>
(
d3typ1_styp$make(t2q0))
//
|D3P1var
(   d2v1   ) =>
(
d3typ1_make_styp$node
(t2q0, T3P1dvar(d2v1)))
//
(* ****** ****** *)
//
|D3P1bang
(   d3p1   ) =>
d3typ1_mkof_d3pat1(d3p1)
//
|D3P1flat
(   d3p1   ) =>
d3typ1_mkof_d3pat1(d3p1)
//
|D3P1free
(   d3p1   ) =>
d3typ1_mkof_d3pat1(d3p1)
//
(* ****** ****** *)
//
(*
HX:
The pattern
should not be expanded!
*)
|D3P1dap1 _ =>
(
d3typ1_styp$make(t2q0))
//
|D3P1dapp
(d3f0
,npf1, d3ps) =>
let
//
val dcon =
(
f1_d3f0(d3f0))
where
{
fun
f1_d3f0
(d3f0: d3pat1): d2con =
(
case-
d3f0.node() of
|D3P1con
(  dcon  ) => ( dcon )
|D3P1tapq
(d3f0,tjas) => f1_d3f0(d3f0))
}
//
in//let
//
let
val t3qs = f0_d3ps(d3ps)
in//let
(
  d3typ1_make_styp$node
  (t2q0, T3P1tcon(dcon, t3qs)))
end//let
//
end//let//end-of-[D3P1dapp(...)]
//
|D3P1tup0
(npf1, d3ps) =>
let
val trcd = TRCDflt0((*0*))
val ltqs = f0_id3ps(0, d3ps)
in//let
(
d3typ1_make_styp$node
( t2q0
, T3P1trcd(trcd, npf1, ltqs)))
end//let//end-of-[D3P1tup0(...)]
//
|D3P1argtp
(d3p1, t2q2) =>
let
val dtyp =
d3typ1_mkof_d3pat1(d3p1) in dtyp
end//let//end-of-[D3P1argtp(...)]
|D3P1annot
(d3p1, s1e2
,s2e2, t2q2) =>
let
val dtyp =
d3typ1_mkof_d3pat1(d3p1) in dtyp
end//let//end-of-[D3P1annot(...)]
//
|_(*d3pat1*) => d3typ1_styp$make(t2q0)
//
end where
{
//
fun
f0_d3ps
( d3ps
: d3pat1lst): d3typ1lst =
(
list_map
<x0><y0>(d3ps)
) where
{
//
#typedef x0 = d3pat1
#typedef y0 = d3typ1
//
#impltmp
map$fopr
<x0><y0>(dpat) =
(
  d3typ1_mkof_d3pat1(dpat))
}(*where*)//end-of-[f0_d3ps(d3ps)]
//
fun
f0_id3ps
( i0
: sint
, d3ps
: d3pat1lst): l3t3p1lst =
(
case+ d3ps of
|
list_nil() =>
list_nil((*void*))
|
list_cons(d3p1, d3ps) =>
let
//
val lab1 = LABint(i0)
val t3q1 =
(
  d3typ1_mkof_d3pat1(d3p1))
//
val ltq1 = D3LAB(lab1, t3q1)
//
in
(
  list_cons
  (ltq1, f0_id3ps(i0+1, d3ps)))
end//let//end-of-[list_cons(d3p1,d3ps)]
)(*case+*)//end-of-[f0_id3ps(i0, d3ps)]
//
val (  ) =
(
  prerrsln
  ("d3typ1_mkof_d3pat1: d3p0 = ", d3p0))
//
}(*where*)//end-of-[d3typ1_mkof_d3pat1(d3p0)]
//
(* ****** ****** *)
//
#implfun
d3typ1_mkof_d3pt2q
  (d3p0, styp) =
(
case+
d3p0.node() of
//
|D3P1any _ =>
(
d3typ1_styp$make(styp))
//
|D3P1var
(   d2v1   ) =>
(
d3typ1_make_styp$node
(styp, T3P1dvar(d2v1)))
//
(* ****** ****** *)
//
|D3P1bang
(   d3p1   ) =>
(
f0_dpat( d3p1 , styp ))
//
|D3P1flat
(   d3p1   ) =>
(
f0_dpat( d3p1 , styp ))
//
|D3P1free
(   d3p1   ) =>
(
f0_dpat( d3p1 , styp ))
//
(* ****** ****** *)
//
|D3P1tup0
(npf1, d3ps) =>
(
case+
styp.node() of
|T2P1trcd
(trcd, npf1, ltqs) =>
let
val ltqs =
f0_d3ps$ltqs(d3ps, ltqs)
in//let
d3typ1(styp,
T3P1trcd(trcd, npf1, ltqs))
end//let
|_(*otherwise*) =>
(
  d3typ1_mkof_d3pat1(d3p0)))
//
|D3P1tup1
(trcd
,npf1, d3ps) =>
(
case+
styp.node() of
|T2P1trcd
(trcd, npf2, ltqs) =>
let
val ltqs =
f0_d3ps$ltqs(d3ps, ltqs)
in//let
d3typ1(styp,
T3P1trcd(trcd, npf1, ltqs))
end//let
|_(*otherwise*) =>
(
  d3typ1_mkof_d3pat1(d3p0)))
//
(* ****** ****** *)
//
|_(*otherwise*) =>
(
  d3typ1_mkof_d3pat1(d3p0)))
where
{
//
fun
f0_dpat
( dpat
: d3pat1
, styp
: s2typ1): d3typ1 =
(
d3typ1_mkof_d3pt2q(dpat, styp))
//
fun
f0_d3ps$ltqs
( d3ps
: d3pat1lst
, ltqs
: l2t2p1lst): l3t3p1lst =
(
case+ d3ps of
|list_nil() => list_nil()
|list_cons
(d3p1, d3ps) =>
(
case+ ltqs of
|list_nil() => list_nil()
|list_cons
(ltq1, ltqs) =>
let
val+
S2LAB(lab1, t2q1) = ltq1
val t3q1 =
(
d3typ1_mkof_d3pt2q
(      d3p1 , t2q1      ))
val ltq1 = D3LAB(lab1, t3q1)
in//let
list_cons
(ltq1, f0_d3ps$ltqs(d3ps, ltqs))
end//let
)(*case+*)//end-of-[list_cons(...)]
)(*case+*)//end-of-[f0_d3ps$ltqs(...)]
//
val () =
prerrsln("d3typ1_mkof_d3pt2q: d3p0 = ", d3p0)
val () =
prerrsln("d3typ1_mkof_d3pt2q: styp = ", styp)
//
}(*where*)//end-of-[d3typ1_mkof_d3pt2q(dpat,styp)]
//
(* ****** ****** *)
(* ****** ****** *)
//
#implfun
d3pat1_mkof_d3pt2q
  (d3p0, styp) =
(
case+
d3p0.node() of
//
(* ****** ****** *)
//
|D3P1any _ =>
d3pat1_argtp(d3p0, styp)
//
|D3P1var
(   d2v1   ) =>
d3pat1_argtp(d3p0, styp)
//
(* ****** ****** *)
//
|D3P1bang
(   d3p1   ) =>
let
val loc0 =
d3p0.lctn((*0*))
val d3p1 =
d3pat1_mkof_d3pt2q
(   d3p1, styp   )
in//let
d3pat1
(loc0,styp,D3P1bang(d3p1))
end//let
//
|D3P1flat
(   d3p1   ) =>
let
val loc0 =
d3p0.lctn((*0*))
val d3p1 =
d3pat1_mkof_d3pt2q
(   d3p1, styp   )
in//let
d3pat1
(loc0,styp,D3P1flat(d3p1))
end//let
//
|D3P1free
(   d3p1   ) =>
let
val loc0 =
d3p0.lctn((*0*))
val d3p1 =
d3pat1_mkof_d3pt2q
(   d3p1, styp   )
in//let
d3pat1
(loc0,styp,D3P1free(d3p1))
end//let
//
(* ****** ****** *)
//
|D3P1tup0
(npf1, d3ps) =>
(
case+
styp.node() of
|T2P1trcd
(trcd, npf1, ltqs) =>
let
val loc0 = d3p0.lctn()
val d3ps =
f0_d3ps$ltqs(d3ps, ltqs)
in//let
d3pat1(loc0,
  styp,D3P1tup0(npf1,d3ps))
end//let
|_(*otherwise*) =>
(
  d3pat1_argtp(d3p0, styp)))
//
(* ****** ****** *)
//
|D3P1tup1
(tknd
,npf1, d3ps) =>
(
case+
styp.node() of
|T2P1trcd
(trcd, npf1, ltqs) =>
let
val loc0 = d3p0.lctn()
val d3ps =
f0_d3ps$ltqs(d3ps, ltqs)
in//let
d3pat1(loc0,styp,
  D3P1tup1(tknd,npf1,d3ps))
end//let
|_(*otherwise*) =>
(
  d3pat1_argtp(d3p0, styp)))
//
(* ****** ****** *)
//
|_(*otherwise*) =>
(
  d3pat1_argtp(d3p0, styp)))
where
{
//
fun
f0_d3ps$ltqs
( d3ps
: d3pat1lst
, ltqs
: l2t2p1lst): d3pat1lst =
(
case+ d3ps of
|list_nil() => list_nil()
|list_cons
(d3p1, d3ps) =>
(
case+ ltqs of
|list_nil() => list_nil()
|list_cons
(ltq1, ltqs) =>
let
val+
S2LAB(lab1, t2q1) = (ltq1)
val d3p1 =
(
d3pat1_mkof_d3pt2q
(        d3p1, t2q1        ))
in//let
list_cons
(d3p1, f0_d3ps$ltqs(d3ps, ltqs))
end//let
)(*case+*)//end-of-[list_cons(...)]
)(*case+*)//end-of-[f0_d3ps$ltqs(...)]
//
val (  ) =
prerrsln("d3pat1_mkof_d3pt2q: d3p0 = ", d3p0)
//
}(*where*)//end-of-[d3typ1_mkof_d3pt2q(d3p0,styp)]
//
(* ****** ****** *)
//
#implfun
d3pat1_mkof_d3gt2q
  (dgpt, styp) =
(
case+
dgpt.node() of
|D3GPT1pat
(   dpat   ) =>
(
d3pat1_mkof_d3pt2q(dpat, styp))//D3GPT1pat
|D3GPT1gua
(dpat, d3gs) =>
(
d3pat1_mkof_d3pt2q(dpat, styp))//D3GPT1gua
) where
{
//
val (  ) =
prerrsln("d3pat1_mkof_d3gt2q: dgpt = ", dgpt)
//
}(*where*)//end-of-[d3typ1_mkof_d3gt2q(dgpt,styp)]
//
(* ****** ****** *)
(* ****** ****** *)
//
#implfun
d2varset_union
  (dvs1, dvs2) =
(
case+ dvs1 of
|list_nil
(  (*0*)  ) => (dvs2)
|list_cons _ =>
(
case+ dvs2 of
|list_nil
(  (*0*)  ) => (dvs1)
|list_cons _ =>
(
list_vt2t
(
list_vt_reverse0
(
aux11(dvs1,
  dvs2, list_vt_nil(*0*))))))
) where // d2varset_union(...)
{
//
fun
aux00
(
d2vs:
d2varlst,
res0:
d2varlst_vt): d2varlst_vt =
(
list_rappendx0_vt(d2vs, res0))
//
fun
aux11
(
dvs1: d2varlst,
dvs2: d2varlst,
res0: d2varlst_vt): d2varlst_vt =
(
//
case+ dvs1 of
|list_nil
(  (*0*)  ) =>
(
  aux00(dvs2, res0))
|list_cons
(d2v1, dvs1) =>
(
case+ dvs2 of
|list_nil() =>
(
aux00(dvs1,
  list_vt_cons(d2v1, res0)))
|list_cons(d2v2, dvs2) =>
(
aux22
(d2v1, dvs1, d2v2, dvs2, res0)))
//
)(*case+*)//end-of-[aux11(...,res0)]
//
and
aux22
(
d2v1:
d2var,
dvs1:
d2varlst,
d2v2:
d2var,
dvs2:
d2varlst,
res0:
d2varlst_vt): d2varlst_vt =
let
val sgn = d2v1\cmp(d2v2)
in//let
//
if // if
(sgn = 0)
then//then
aux11
(
dvs1, dvs2,
list_vt_cons(d2v1, res0))
else//else
(
if//if
(sgn < 0)
then//then
let
val res0 =
list_vt_cons(d2v1, res0)
in//let
(
case+ dvs1 of
|list_nil
(  (*0*)  ) =>
aux00
(dvs2
,list_vt_cons(d2v2, res0))
|list_cons
(d2v1, dvs1) =>
aux22
(d2v1, dvs1, d2v2, dvs2, res0)) end
else//else
let
val res0 =
list_vt_cons(d2v2, res0)
in//let
(
case+ dvs2 of
|list_nil
(  (*0*)  ) =>
aux00
(dvs1
,list_vt_cons(d2v1, res0))
|list_cons
(d2v2, dvs2) =>
aux22
(d2v1, dvs1, d2v2, dvs2, res0)) end
)
//
end(*let*)//end-of-[aux22(...,res0)]
//
}(*where*)//end-of-[d2varset_union(dvs1,dvs2)]
//
(* ****** ****** *)
(* ****** ****** *)
//
#implfun
dvdtp1lst_d2vs$inner
  (vts0, dvs0) =
(
list_vt2t(
list_vt_reverse0(
loop0(vts0, dvs0, res0)))
) where
{
//
val res0 = list_vt_nil()
//
fnx
loop0
(vts0
:dvdtp1lst
,dvs0: d2varlst
,res0: dvdtp1lst_vt): dvdtp1lst_vt =
(
case+ dvs0 of
|list_nil() => res0
|list_cons(d2v0, dvs1) =>
(
  loop1(vts0, d2v0, dvs1, res0))
)
//
and
loop1
(vts0
:dvdtp1lst
,d2v0: d2var
,dvs1: d2varlst
,res0: dvdtp1lst_vt): dvdtp1lst_vt =
(
case+ vts0 of
|list_nil
(  (*0*)  ) => res0
|list_cons
(dvtp, vts1) =>
(
let
//
val
sgn =
g_cmp
<d2var>(d2v0, dvtp.0)
//
in//let
//
if // if
(sgn > 0)
then//then
loop1(vts1, d2v0, dvs1, res0)
else//else
loop0
(vts1
,dvs1, list_vt_cons(dvtp, res0))end)
)(*case+*)//end-of-[loop1(vts0,d2v0,dvs1,res0)]
//
}(*where*)//end-of-[dvdtp1lst_d2vs$inner(vts0,dvs0)]
//
(* ****** ****** *)
//
#implfun
dvdtp1lst_d2vs$outer
  (vts0, dvs0) =
(
list_vt2t(
list_vt_reverse0(
loop0(vts0, dvs0, res0)))
) where
{
//
#vwtpdef
res_vt = dvdtp1lst_vt
//
val res0 = list_vt_nil()
//
fnx
loop0
(vts0
:dvdtp1lst
,dvs0: d2varlst
,res0: dvdtp1lst_vt): res_vt =
(
case+ dvs0 of
|list_nil
( (*void*) ) =>
(
  list_rappendx0_vt(vts0, res0))
|list_cons
(d2v0, dvs1) =>
(
  loop1(vts0, d2v0, dvs1, res0))
)(*case+*)//end-of-[loop0(vts0,...)]
//
and
loop1
(vts0
:dvdtp1lst
,d2v0: d2var
,dvs1: d2varlst
,res0: dvdtp1lst_vt): res_vt =
(
case+ vts0 of
|list_nil
( (*void*) ) => (res0)
|list_cons
(dvtp, vts1) =>
(
if
(dvtp.0 >= d2v0)
then
(
(*
HX-2026-02-24:
[res0]
cannot change
from this point on!!!
*)
loop0(vts1, dvs1, res0))
else
let//1
val res0 =
list_vt_cons(dvtp, res0)
in//let
(
  loop1(vts1, d2v0, dvs1, res0))
end(*let*)//end-of-(else)
)
)(*case+*)//end-of-[loop1(vts0,...)]
//
}(*where*)//end-of-[dvdtp1lst_d2vs$outer(vts0,dvs0)]
//
(* ****** ****** *)
(* ****** ****** *)
//
(***********************************************************************)
(* end of [ATS3/XATSOPT_srcgen2_xsyncpy_srcgen1_DATS_trxltck_utils0.dats] *)
(***********************************************************************)

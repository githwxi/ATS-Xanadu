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
#implfun
d3typ1_of$d3pat1
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
|
D3P1any _ =>
(
d3typ1_styp$make(t2q0))
//
|D3P1var
(   d2v1   ) =>
(
d3typ1_make_styp$node
(t2q0, T3P1dvar(d2v1)))
//
|D3P1dapp
(d3f0
,npf1, d3ps) =>
let
//
val dcon =
(
case-
d3f0.node() of
|D3P1con(dcon) => dcon)
//
val t3qs = f0_d3ps(d3ps)
//
in//let
(
d3typ1_make_styp$node
(t2q0, T3P1tcon(dcon, t3qs)))
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
|
_(*otherwise*) => d3typ1_styp$make(t2q0)
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
map$fopr<x0><y0> = d3typ1_of$d3pat1(*nil*)
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
  d3typ1_of$d3pat1(d3p1))
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
}(*where*)//end-of-[d3typ1_of$d3pat1(d3p0)]
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
|list_nil() => res0
|list_cons(dvtp, vts1) =>
(
if
(dvtp.0 < d2v0)
then
loop1(vts1, d2v0, dvs1, res0)
else
loop0
(vts1
,dvs1, list_vt_cons(dvtp, res0)))
)
//
}(*where*)//end-of-[dvdtp1lst_d2vs$inner(...)]
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
loop0(vts1, dvs1, res0)
else
let
val res0 =
list_vt_cons(dvtp, res0)
in//let
(
  loop1(vts1, d2v0, dvs1, res0))
end//let//end-of-(else)
)
)(*case+*)//end-of-[loop1(vts0,...)]
//
}(*where*)//end-of-[dvdtp1lst_d2vs$outer(...)]
//
(* ****** ****** *)
(* ****** ****** *)
//
(***********************************************************************)
(* end of [ATS3/XATSOPT_srcgen2_xsyncpy_srcgen1_DATS_trxltck_utils0.dats] *)
(***********************************************************************)

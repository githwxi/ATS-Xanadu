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
Sun Dec 31 12:44:56 EST 2023
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
#staload "./../SATS/staexp2.sats"
#staload "./../SATS/statyp2.sats"
(* ****** ****** *)
#staload "./../SATS/dynexp4.sats"
(* ****** ****** *)
#staload "./../SATS/trans34.sats"
(* ****** ****** *)
#staload _ = "./statyp2_tmplib.dats"
(* ****** ****** *)
(* ****** ****** *)
#symload boxq with sort2_boxq
(* ****** ****** *)
#symload linq with s2typ_linq
(* ****** ****** *)
#symload sort with s2typ_get_sort
#symload node with s2typ_get_node
(* ****** ****** *)
#symload styp with d4typ_get_styp
(* ****** ****** *)
#symload styp with d4pat_get_styp
#symload node with d4pat_get_node
(* ****** ****** *)
#symload styp with d4exp_get_styp
#symload node with d4exp_get_node
(* ****** ****** *)
#symload s2typ with s2typ_make_node
(* ****** ****** *)
(* ****** ****** *)
//
fun
s2typ_top0
(t2p0: s2typ): s2typ =
let
val s2t0 =
(
if
boxq(s2t0)
then the_sort2_tbox(*0*)
else the_sort2_type(*0*))
: sort2 // end-of-[val]
in
s2typ(s2t0, T2Ptop0(t2p0))
end where
{
  val s2t0 = t2p0.sort((*0*)) }
//
(* ****** ****** *)
//
fun
s2typ_top1
(t2p0: s2typ): s2typ =
let
val s2t0 =
(
if
boxq(s2t0)
then the_sort2_tbox(*0*)
else the_sort2_type(*0*))
: sort2 // end-of-[val]
in
s2typ(s2t0, T2Ptop1(t2p0))
end where
{
  val s2t0 = t2p0.sort((*0*)) }
//
(* ****** ****** *)
(* ****** ****** *)
//
fun
s2typ_topize
(t2p0: s2typ): s2typ =
(
case+
t2p0.node() of
//
|
T2Ptop0(t2p1) =>
(
case+
t2p1.node() of
|
T2Ptop0(t2p2) => f0_top0(t2p2)
|
T2Ptop1(t2p2) => f0_top0(t2p2)
|
_(*otherwise*) => (   t2p0   ))
//
|
T2Ptop1(t2p1) =>
(
case+
t2p1.node() of
|
T2Ptop0(t2p2) => f0_top0(t2p2)
|
T2Ptop1(t2p2) => f0_top1(t2p2)
|
_(*otherwise*) =>
if
linq(t2p1) then t2p0 else t2p1)
//
| _(*otherwise*) => (   t2p0   )
) where
{
//
fun
f0_top0
(t2p0: s2typ): s2typ =
(
case+
t2p0.node() of
|
T2Ptop0(t2p1) => f0_top0(t2p1)
|
T2Ptop1(t2p1) => f0_top0(t2p1)
|
_(*otherwise*) => s2typ_top0(t2p0)
)
//
fun
f0_top1
(t2p0: s2typ): s2typ =
(
case+
t2p0.node() of
|
T2Ptop0(t2p1) => f0_top0(t2p1)
|
T2Ptop1(t2p1) => f0_top1(t2p1)
|
_(*otherwise*) =>
( if
  linq(t2p0)
  then s2typ_top1(t2p0) else t2p0)
)
//
}(*where*)//end-of-[s2typ_topize(t2p0)]
//
(* ****** ****** *)
//
#implfun
d4typ_get_styp
  ( dtp0 ) =
(
case+ dtp0 of
//
|D4TYPstp(t2p0) => t2p0
//
|D4TYPpat(d4p0) =>
(
  s2typ_top1(d4p0.styp()))
//
) where
{
//
val () =
prerrln
("d4typ_get_styp: dtp0 = ", dtp0)
//
}(*where*)//end-of-[d4typ_get_styp]
//
(* ****** ****** *)
(* ****** ****** *)
//
#implfun
s2typlst_of_d4patlst
( d4ps ) =
(
list_map<x0><y0>(d4ps)) where
{
#typedef x0 = d4pat
#typedef y0 = s2typ
#impltmp
map$fopr
<x0><y0>(d4p) = d4p.styp() }//where
// end of [s2typlst_of_d4patlst(d4ps)]
//
(* ****** ****** *)
//
#implfun
s2typlst_of_d4explst
( d4es ) =
(
list_map<x0><y0>(d4es)) where
{
//
#typedef x0 = d4exp
#typedef y0 = s2typ
//
#impltmp
map$fopr
<x0><y0>(d4e) = d4e.styp() }//where
// end of [s2typlst_of_d4explst(d4es)]
//
(* ****** ****** *)
(* ****** ****** *)
//
fun
s2cst_get34_styp
( env0:
! tr34env
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
  tr34env_evstyp_cst(env0,s2c0) )
end//end-of-[s2cst_get34_styp(...)]
//
(* ****** ****** *)
//
#implfun
unify34_s2typ
(env0, t2p1, t2p2) =
let
//
#vwtpdef e1nv = tr34env
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
s2cst_get34_styp
(  env0 , s2c0  ) ) where
{
(*
val () =
prerrln
("\
unify34_s2typ: \
s2typ_eval$s2cst: s2c0 = ", s2c0)
*)
}(*where*)//end-of-[s2typ_eval$s2cst]
//
#impltmp
s2typ_eval$s2var
<e1nv>(env0,s2v0) = optn_vt_nil()
//
#impltmp
unify00_s2typ$hnfz
<e1nv>(e1nv, t2p0) =
(*
HX-2034-01-22:
top modifiers
need to be kept here!!!
*)
s2typ_topize
(
s2typ_hnfiz0_e1nv
<e1nv>(e1nv, t2p0)) where
{
val t2p0 = s2typ_unargx(t2p0)
}(*where*)//end-of-[unify00_s2typ$hnfz]
//
(*
val () =
prerrln
("unify34_s2typ: t2p1 = ", t2p1)
val () =
prerrln
("unify34_s2typ: t2p2 = ", t2p2)
*)
//
in//let
//
let
fun
isTOP0
(t2p0: s2typ): bool =
(case+ t2p0.node() of
|T2Ptop0 _ => true | _ => false)
fun
isTOP1
(t2p0: s2typ): bool =
(case+ t2p0.node() of
|T2Ptop0 _ => true | _ => false)
//
in//let
//
if
isTOP0(t2p2)
then
(
let
val-
T2Ptop0(t2p2) = t2p2.node()
in//let
//
case+
t2p1.node() of
|
T2Ptop0(t2p1) =>
unify00_s2typ_e1nv<e1nv>(env0, t2p1, t2p2)
|
T2Ptop1(t2p1) =>
unify00_s2typ_e1nv<e1nv>(env0, t2p1, t2p2)
|
_(*otherwise*) =>
if
s2typ_linq(t2p1)
then (false) else
unify00_s2typ_e1nv<e1nv>(env0, t2p1, t2p2)
//
end//let
)
else
unify00_s2typ_e1nv<e1nv>(env0, t2p1, t2p2)
//
end//let
//
end (*let*) // end of [unify34_s2typ(env0,...)]
//
(* ****** ****** *)
(* ****** ****** *)
//
#implfun
d2vts_z2merge
(xts1, xts2) =
(
fmrg00(xts1, xts2)) where
{
//
fun
fmrg00
( xts1: d2vts
, xts2: d2vts): d2vts =
(
case+ xts1 of
|
list_nil() => xts2
|
list_cons _ => fmrg10(xts1, xts2)
)(*case+*)//end-of-[loop(xts1,xts2)]
//
and
fmrg01
( xts1: d2vts
, xts2: d2vts): d2vts =
(
case+ xts1 of
|
list_nil() => xts2
|
list_cons _ =>
let
val-
list_cons
(
(d2v1
,t2p1), yts1) = xts1
val-
list_cons
(
(d2v2
,t2p2), yts2) = xts2
val
test = g_cmp(d2v1, d2v2)
in//let
if (test < 0)
then
(
list_cons
((d2v1, t2p1), fmrg01(yts1, xts2)))
else
(
if (test > 0)
then
list_cons
((d2v2, t2p2), fmrg10(xts1, yts2))
else
list_cons
((d2v1, t2p1), fmrg00(yts1, yts2)))
end(*let*)//end-of-[list_cons( ... )]
)
//
and
fmrg10
( xts1: d2vts
, xts2: d2vts): d2vts =
(
case+ xts2 of
|
list_nil() => xts1
|
list_cons _ =>
let
val-
list_cons
(
(d2v1
,t2p1), yts1) = xts1
val-
list_cons
(
(d2v2
,t2p2), yts2) = xts2
val
test = g_cmp(d2v1, d2v2)
in//let
if (test < 0)
then
(
list_cons
((d2v1, t2p1), fmrg01(yts1, xts2)))
else
(
if (test > 0)
then
list_cons
((d2v2, t2p2), fmrg10(xts1, yts2))
else
list_cons
((d2v1, t2p1), fmrg00(yts1, yts2)))
end(*let*)//end-of-[list_cons( ... )]
)
//
}(*where*)//end-of-[d2vts_z2merge(xts1,xts2)]
//
(* ****** ****** *)
(* ****** ****** *)
//
#implfun
d2vts_drop_vars
( dvts , d2vs ) =
list_vt2t
(
list_vt_reverse0
(
loop
(dvts, d2vs, res0))) where
{
//
#vwtpdef
d2vts_vt =
(
  list_vt@(d2var, s2typ))
//
val
res0 = list_vt_nil((*nil*))
//
fun
loop
(
dvts: d2vts,
d2vs: dvars,
res0: d2vts_vt): d2vts_vt =
(
case+ dvts of
|
list_nil() => res0
|
list_cons
((d2v1, stp1), vts2) =>
(
case+ d2vs of
//
|
list_nil((*nil*)) =>
loop
(
vts2, d2vs,
list_vt_cons
((d2v1, stp1), res0))
//
|
list_cons(d2v2, dvs2) =>
let
val sgn0 = d2v1\cmp(d2v2)
in//let
//
if
(sgn0 = 0)
then // HX: dropped
(
  loop(vts2, dvs2, res0))
else
(
if
(sgn0 > 0)
then
(
  loop(dvts, dvs2, res0))
else // sgn0 < 0
(
  loop(vts2, d2vs, res0)) where
{
val res0 = // HX: it is taken!
list_vt_cons((d2v1, stp1), res0)}
)
end//let//end-of-[list_cons(...)]
//
)(*case+*)//end-of-[list_cons(...)]
)(*case+*)//end-of-[loop(dvts,d2vs,res0)]
//
}(*where*)//endof[d2vts_drop_vars(dvts,d2vs)]
//
(* ****** ****** *)
//
#implfun
d2vts_take_vars
( dvts , d2vs ) =
list_vt2t
(
list_vt_reverse0
(
loop
(dvts, d2vs, res0))) where
{
//
#vwtpdef
d2vts_vt =
(
  list_vt@(d2var, s2typ))
//
val
res0 = list_vt_nil((*nil*))
//
fun
loop
(
dvts: d2vts,
d2vs: dvars,
res0: d2vts_vt): d2vts_vt =
(
case+ dvts of
|
list_nil() => res0
|
list_cons
((d2v1, stp1), vts2) =>
(
case+ d2vs of
//
|
list_nil() => res0
//
|
list_cons(d2v2, dvs2) =>
let
val sgn0 = d2v1\cmp(d2v2)
in//let
//
if
(sgn0 < 0)
then // HX: dropped
(
  loop(vts2, dvs2, res0))
else
(
if
(sgn0 > 0)
then
(
  loop(dvts, dvs2, res0))
else // sgn0 = 0
(
  loop(vts2, d2vs, res0)) where
{
val res0 = // HX: it is taken!
list_vt_cons((d2v1, stp1), res0)}
)
end//let//end-of-[list_cons(...)]
//
)(*case+*)//end-of-[list_cons(...)]
)(*case+*)//end-of-[loop(dvts,d2vs,res0)]
//
}(*where*)//endof[d2vts_take_vars(dvts,d2vs)]
//
(* ****** ****** *)
(* ****** ****** *)
//
#implfun
d2vdtplst_d2vtize(dvts) =
let
val
dvts =
loop0(dvts)
in//let
list_vt2t
(list_vt_reverse0(dvts))
end where // end-of-[let]
{
(* ****** ****** *)
//
#typedef x0 = (d2var,d4typ)
//
(* ****** ****** *)
(* ****** ****** *)
//
val dvts = // list_vt(x0)
(
(*
HX: mergesort is stable!!!
*)
list_vt_mergesort0<x0>(dvts)
) where
{
#impltmp
g_cmp<x0>(x1, x2) =
(
  g_cmp<d2var>( x1.0, x2.0 )) }
//
(* ****** ****** *)
(* ****** ****** *)
//
fnx
loop0
( dvts:
~ list_vt(x0)): d2vts_vt =
(
case+ dvts of
| ~
list_vt_nil
( (*void*) ) =>
(
 list_vt_nil((*void*)))
| ~
list_vt_cons
(
( d2v1
, dtp1 ), dvts) =>
let
val
res0 =
(
 list_vt_nil((*void*)))
in//let
loop1
(dvts, d2v1, dtp1, res0) end
)
//
and
loop1
( dvts:
~ list_vt(x0)
, d2v1: d2var
, dtp1: d4typ
, res0: d2vts_vt): d2vts_vt =
(
case+ dvts of
| ~
list_vt_nil() =>
list_vt_cons
((d2v1, stp1), res0) where
{
  val stp1 = dtp1.styp((*0*)) }
| ~
list_vt_cons
(
( d2v2
, dtp2 ), dvts) =>
if
(d2v1=d2v2)
then
loop1
(dvts, d2v2, dtp2, res0)
else
loop1
(dvts, d2v2, dtp2, res0) where
{
  val stp1 = dtp1.styp((*0*))
  val res0 =
  list_vt_cons((d2v1, stp1), res0) }
)
//
(* ****** ****** *)
(* ****** ****** *)
//
} (*where*) // end of [d2vdtplst_d2vtize(dvts)]
//
(* ****** ****** *)
(* ****** ****** *)

(* end of [ATS3/XATSOPT_srcgen2_trans34_utils0.dats] *)

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
#staload "./../SATS/trans34.sats"
(* ****** ****** *)
#staload _ = "./statyp2_tmplib.dats"
(* ****** ****** *)
(* ****** ****** *)
#symload linq with s2typ_linq
(* ****** ****** *)
#symload sort with s2typ_get_sort
#symload node with s2typ_get_node
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
sort2_boxq(s2t0)
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
sort2_boxq(s2t0)
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
|
D4TYPstp(t2p0) => t2p0
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
(*
val () =
prerrln("unify34_s2typ: t2p1 = ", t2p1)
val () =
prerrln("unify34_s2typ: t2p2 = ", t2p2)
*)
//
#impltmp
unify00_s2typ$hnfz
<e1nv>(e1nv, t2p0) =
(*
HX-2034-01-22:
type modifiers
need to be kept here!!!
*)
s2typ_topize
(
s2typ_hnfiz0_e1nv
<e1nv>(e1nv, t2p0)) where
{
(*
val t2p0 = s2typ_unmodx(t2p0)
*)
}(*where*)//end-of-[unify00_s2typ$hnfz]
//
fun
isTOP0
(t2p0: s2typ): bool =
(
case+ t2p0.node() of
|
T2Ptop0 _ => true | _ => false)
fun
isTOP1
(t2p0: s2typ): bool =
(
case+ t2p0.node() of
|
T2Ptop0 _ => true | _ => false)
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
end (*let*) // end of [unify34_s2typ(env0,...)]
//
(* ****** ****** *)
(* ****** ****** *)

(* end of [ATS3/XATSOPT_srcgen2_trans34_utils0.dats] *)

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
Wed 28 Dec 2022 04:16:43 PM EST
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
#staload "./../SATS/xlabel0.sats"
#staload "./../SATS/xsymbol.sats"
(* ****** ****** *)
#staload "./../SATS/staexp2.sats"
#staload "./../SATS/statyp2.sats"
(* ****** ****** *)

#implfun
< e1nv >
s2typ_hnfiz0_e1nv
(e1nv, t2p0) =
let
var flag: sint = 0 in
s2typ_hnfizx_e1nv<e1nv>(e1nv,t2p0,flag)
end (*let*) // end of [s2typ_hnfiz0_e1nv]

(* ****** ****** *)

#impltmp
< e1nv >
s2typ_hnfizx_e1nv
(e1nv, t2p0, flag) =
s2typ_hnfizx
(e1nv, t2p0, flag) where
{
//
fun
s2typ_hnfizx
( e1nv: !e1nv
, t2p0: s2typ
, flag: &sint >> _): s2typ =
(
case+
t2p0.node() of
//
|T2Pbas _ => t2p0
//
|T2Pcst _ =>
f0_cst(e1nv, t2p0, flag)
|T2Pvar _ =>
f0_var(e1nv, t2p0, flag)
//
|T2Pxtv _ =>
f0_xtv(e1nv, t2p0, flag)
//
|T2Plam0 _ => t2p0
//
|T2Papps _ =>
f0_apps(e1nv, t2p0, flag)
//
|T2Pnone0 _ => t2p0
|T2Pnone1 _ => t2p0
//
|_(*otherwise*) => s2typ_none1(t2p0)
//
) where
{
//
(* ****** ****** *)
//
fun
f0_cst
( e1nv: !e1nv
, t2p0: s2typ
, flag: &sint >> _): s2typ =
(
case+ opt1 of
| ~
optn_vt_nil() => t2p0
| ~
optn_vt_cons(t2p1) =>
let
val () = (flag := flag+1)
in//let
s2typ_hnfizx(e1nv, t2p1, flag)
endlet
) where
{
//
val-T2Pcst(s2c1) = t2p0.node()
//
val opt1 =
s2typ_eval$s2cst<e1nv>(e1nv, s2c1)
//
} (*where*) // end of [f0_cst(e1nv,...)]
//
(* ****** ****** *)
//
fun
f0_var
( e1nv: !e1nv
, t2p0: s2typ
, flag: &sint >> _): s2typ =
(
case+ opt1 of
| ~
optn_vt_nil() => t2p0
| ~
optn_vt_cons(t2p1) =>
let
val () = (flag := flag+1)
in//let
s2typ_hnfizx(e1nv, t2p1, flag)
endlet
) where
{
//
val-T2Pvar(s2v1) = t2p0.node()
//
val opt1 =
s2typ_eval$s2var<e1nv>(e1nv, s2v1)
//
} (*where*) // end of [f0_cst(e1nv,...)]
//
(* ****** ****** *)
//
fun
f0_xtv
( e1nv: !e1nv
, t2p0: s2typ
, flag: &sint >> _): s2typ =
let
val t2p1 = xtp1.styp()
in//let
case+
t2p1.node() of
|
T2Pnone0() => t2p0
|
_(*T2Pnone0*) =>
let
val () = (flag := flag+1)
val t2p1 =
s2typ_hnfizx(e1nv, t2p1, flag)
in//let
let
val () = xtp1.styp(t2p1) in t2p1
end//let
end//let
end where
{
  val-T2Pxtv(xtp1) = t2p0.node() }
//(*where*) // end of [f0_xtv(e1nv,...)]
//
(* ****** ****** *)
//
fun
f0_apps
( e1nv: !e1nv
, t2p0: s2typ
, flag: &sint >> _): s2typ =
let
//
val fval = flag
//
val t2f0 =
s2typ_hnfizx(e1nv, t2f0, flag)
val t2ps =
s2typlst_hnfizx(e1nv, t2ps, flag)
//
in//let
//
case+
t2f0.node() of
|
T2Plam0
(s2vs, t2p1) =>
let
val
() = (flag := flag+1)
val
svts = s2vts(s2vs, t2ps)
val tres =
s2typ_substx
(e1nv, svts, t2p1, flag)
in//let
s2typ_hnfizx(e1nv, tres, flag)
end (*let*) // end of [T2Plam0]
|_(*non-T2Plam0*) =>
if
(flag <= fval)
then t2p0 else
s2typ_make_node
(t2p0.sort(), T2Papps(t2f0, t2ps))
//
end where
{
val-T2Papps(t2f0, t2ps) = t2p0.node()
}
//(*where*) // end of [f0_apps(e1nv,...)]
//
(* ****** ****** *)
//
} (*where*) // end of [s2typ_hnfizx(e1nv,...)]
//
(* ****** ****** *)
//
and
s2typlst_hnfizx
( e1nv: !e1nv
, t2ps: s2typlst
, flag: &sint >> _): s2typlst  =
(
//
case+ t2ps of
|
list_nil() =>
list_nil((*void*))
|
list_cons(t2p1, tps2) =>
let
//
val fval = flag
//
val
t2p1 =
s2typ_hnfizx(e1nv, t2p1, flag)
val
tps2 =
s2typlst_hnfizx(e1nv, tps2, flag)
//
in//let
if // if
(flag <= fval)
then t2ps else list_cons(t2p1, tps2)
end (*let*) // end of [list_cons(...)]
//
) (*case+*) // end of [s2typlst_hnfizx(...)]
//
(* ****** ****** *)
and
s2typ_substx
( e1nv: !e1nv
, svts: s2vts
, t2p0: s2typ
, flag: &sint >> _): s2typ = t2p0
(* ****** ****** *)
and
s2typlst_substx
( e1nv: !e1nv
, svts: s2vts
, t2ps: s2typlst
, flag: &sint >> _): s2typlst = t2ps
(* ****** ****** *)
//
} (*where*) // end of [s2typ_hnfizx_e1nv(e1nv,...)]

(* ****** ****** *)

#impltmp
<e1nv:vwtp>
unify00_s2typ_e1nv
(e1nv, t2p1, t2p2) = false
#impltmp
<e1nv:vwtp>
match00_s2typ_e1nv
(e1nv, t2p1, t2p2) = false

(* ****** ****** *)

#impltmp
<e1nv:vwtp>
unify00_s2typ_e1nv
(e1nv, t2p1, t2p2) =
unify00_s2typ
(e1nv, t2p1, t2p2) where
{
//
(* ****** ****** *)
//
fun
s2typ_hnfiz0
( e1nv: !e1nv
, t2p0: s2typ): s2typ =
s2typ_hnfiz0_e1nv<e1nv>(e1nv, t2p0)
//
(* ****** ****** *)
//
fun
unify00_s2typ
( e1nv: !e1nv
, t2p1: s2typ
, t2p2: s2typ): (bool) =
(
case+
t2p1.node() of
|
T2Pbas(tbs1) =>
(
case+
t2p2.node() of
|
T2Pbas(tbs2) =>
(tbs1 = tbs2) | _ => false)
//
) where
{
//
val t2p1 = s2typ_hnfiz0(e1nv, t2p1)
val t2p2 = s2typ_hnfiz0(e1nv, t2p2)
//
val (  ) =
prerrln("unify00_s2typ: t2p1 = ", t2p1)
val (  ) =
prerrln("unify00_s2typ: t2p2 = ", t2p2)
//
} (*where*) // end of [unify00_s2typ(e1nv,...)]
//
(* ****** ****** *)
//
} (*where*) // end of [unify00_s2typ_e1nv(e1nv,...)]

(* ****** ****** *)

(* end of [ATS3/XATSOPT_srcgen2_statyp2_tmplib.dats] *)

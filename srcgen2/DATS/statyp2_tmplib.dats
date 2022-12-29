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

#impltmp
< e1nv >
s2typ_hnfizx_e1nv
(e1nv, t2p0, flag) =
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
) where
{
//
(*
val () =
prerrln("s2typ_hnfizx_e1nv: t2p0 = ", t2p0)
*)
//
(* ****** ****** *)
//
fun
f0_cst
( e1nv: !e1nv
, t2p0: s2typ
, flag: &sint >> _): s2typ =
let
val-T2Pcst(s2c1) = t2p0.node()
val tval =
s2typ_eval$s2cst<e1nv>(e1nv, s2c1, flag)
in//let
case+
tval.node() of
|T2Pnone0() => t2p0 |_(*T2Pnone0*) => tval
end (*let*) // end of [f0_cst(e1nv,t2p0,flag)]
//
fun
f0_var
( e1nv: !e1nv
, t2p0: s2typ
, flag: &sint >> _): s2typ =
let
val-T2Pvar(s2v1) = t2p0.node()
val tval =
s2typ_eval$s2var<e1nv>(e1nv, s2v1, flag)
in//let
case+
tval.node() of
|T2Pnone0() => t2p0 |_(*T2Pnone0*) => tval
end (*let*) // end of [f0_cst(e1nv,t2p0,flag)]
//
(* ****** ****** *)
//
} (*where*) // end of [s2typ_hnfizx_e1nv(...)]

(* ****** ****** *)

#impltmp
< e1nv >
l2t2p_hnfizx_e1nv
(e1nv, lt2p, flag) =
(
//
case+ lt2p of
|
S2LAB(l0, t2p1) =>
let
val fval = flag
val t2p1 =
s2typ_hnfizx_e1nv(e1nv, t2p1, flag)
in//let
if // if
flag > fval then S2LAB(l0, t2p1) else lt2p
end (*let*) // end of [S2LAB(...)]
//
) (*case+*) // end-of-[l2t2p_hnfizx_e1nv(...)]

(* ****** ****** *)

#impltmp
< e1nv >
s2typlst_hnfizx_e1nv
( e1nv, t2ps, flag ) =
(
//
case+ t2ps of
|
list_nil() => list_nil()
|
list_cons
(t2p1, tps2) =>
let
//
val fval = flag
//
val t2p1 =
s2typ_hnfizx_e1nv(e1nv, t2p1, flag)
val tps2 =
s2typlst_hnfizx_e1nv(e1nv, tps2, flag)
//
in//let
if // if
flag > fval then list_cons(t2p1, tps2) else t2ps
end (*let*) // end of [list_cons(...)]
//
) (*case+*) // end of [s2typlst_hnfizx_e1nv(...)]

(* ****** ****** *)

#impltmp
< e1nv >
l2t2plst_hnfizx_e1nv
( e1nv, ltps, flag ) =
(
//
case+ ltps of
|
list_nil() => list_nil()
|
list_cons
(ltp1, lts2) =>
let
//
val fval = flag
//
val ltp1 =
l2t2p_hnfizx_e1nv(e1nv, ltp1, flag)
val lts2 =
l2t2plst_hnfizx_e1nv(e1nv, lts2, flag)
//
in//let
if // if
flag > fval then list_cons(ltp1, lts2) else ltps
end (*let*) // end of [list_cons(...)]
//
) (*case+*) // end of [l2t2plst_hnfizx_e1nv(...)]

(* ****** ****** *)

(* end of [ATS3/XATSOPT_srcgen2_statyp2_tmplib.dats] *)

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

#implfun
< e1nv >
s2typlst_hnfiz0_e1nv
(e1nv, t2ps) =
let
var flag: sint = 0 in
s2typlst_hnfizx_e1nv<e1nv>(e1nv,t2ps,flag)
end (*let*) // end of [s2typlst_hnfiz0_e1nv]

(* ****** ****** *)

#implfun
< e1nv >
l2t2plst_hnfiz0_e1nv
(e1nv, ltps) =
let
var flag: sint = 0 in
l2t2plst_hnfizx_e1nv<e1nv>(e1nv,ltps,flag)
end (*let*) // end of [l2t2plst_hnfiz0_e1nv]

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
|T2Pnone0 _ => t2p0
|T2Pnone1 _ => t2p0
//
|_(*otherwise*) => s2typ_none1(t2p0)
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
(
case+ opt1 of
| ~
optn_vt_nil() => t2p0
| ~
optn_vt_cons(t2p1) => t2p1)
where
{
//
val-T2Pcst(s2c1) = t2p0.node()
//
val opt1 =
s2typ_eval$s2cst<e1nv>(e1nv, s2c1)
//
} (*where*) // end of [f0_cst(e1nv,t2p0,flag)]
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
optn_vt_cons(t2p1) => t2p1)
where
{
val-T2Pvar(s2v1) = t2p0.node()
val opt1 =
s2typ_eval$s2var<e1nv>(e1nv, s2v1)
} (*where*) // end of [f0_cst(e1nv,t2p0,flag)]
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
f0_t2ps
(e1nv, t2ps, flag) where
{
//
fun
f0_t2ps
( e1nv
: !e1nv
, t2ps
: s2typlst
, flag
: &sint >> _): s2typlst  =
(
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
val t2p1 =
s2typ_hnfizx_e1nv
<e1nv>(e1nv, t2p1, flag)
//
val tps2 = f0_t2ps(e1nv, tps2, flag)
//
in//let
if // if
flag > fval then list_cons(t2p1, tps2) else t2ps
end (*let*) // end of [list_cons(...)]
)
} (*where*) // end of [s2typlst_hnfizx_e1nv(...)]

(* ****** ****** *)

#impltmp
< e1nv >
l2t2plst_hnfizx_e1nv
( e1nv, ltps, flag ) =
( f0_ltps
  (e1nv, ltps, flag)) where
{
//
fun
f0_ltps
( e1nv
: !e1nv
, ltps
: l2t2plst
, flag
: &sint >> _): l2t2plst  =
(
case+ ltps of
|
list_nil() =>
list_nil((*void*))
|
list_cons(ltp1, lts2) =>
let
//
val fval = flag
//
val ltp1 =
l2t2p_hnfizx_e1nv
<e1nv>(e1nv, ltp1, flag)
//
val tps2 = f0_ltps(e1nv, lts2, flag)
//
in//let
if // if
flag > fval then list_cons(ltp1, lts2) else ltps
end (*let*) // end of [list_cons(...)]
)
} (*where*) // end of [l2t2plst_hnfizx_e1nv(...)]

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
, t2p2: s2typ): bool =
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

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
#staload UN =
"prelude/SATS/unsafex.sats"
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
#staload "./../SATS/locinfo.sats"
(* ****** ****** *)
#staload "./../SATS/staexp2.sats"
#staload "./../SATS/statyp2.sats"
(* ****** ****** *)

#implfun
< e1nv >
s2typ_hnfiz0_e1nv
(e1nv, t2p0) =
let
var flag: sint = 0
in//let
s2typ_hnfizx_e1nv
<e1nv>(e1nv, t2p0, flag)
end (*let*) // end of [s2typ_hnfiz0_e1nv]

(* ****** ****** *)

#implfun
< e1nv >
s2typ_subst0_e1nv
(e1nv, t2p0, svts) =
let
var flag: sint = 0
in//let
s2typ_substx_e1nv
<e1nv>(e1nv, t2p0, svts, flag)
end (*let*) // end of [s2typ_subst0_e1nv]

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
|T2Pf2cl _ => t2p0
//
|T2Plam1 _ => t2p0
//
|T2Pnone0 _ => t2p0
|T2Pnone1 _ => t2p0
|T2Ps2exp _ => t2p0
//
|T2Pcst _ =>
f0_cst(e1nv, t2p0, flag)
|T2Pvar _ =>
f0_var(e1nv, t2p0, flag)
//
|
T2Plft _ =>
f0_lft(e1nv, t2p0, flag)
//
|
T2Pxtv _ =>
f0_xtv(e1nv, t2p0, flag)
//
|
T2Parg1 _ =>
f0_arg1(e1nv, t2p0, flag)
//
|
T2Papps _ =>
f0_apps(e1nv, t2p0, flag)
//
|
T2Plam1 _ =>
f0_lam1(e1nv, t2p0, flag)
//
|
T2Pfun1 _ =>
f0_fun1(e1nv, t2p0, flag)
//
|
T2Ptrcd _ =>
f0_trcd(e1nv, t2p0, flag)
//
|
T2Ptext _ =>
f0_text(e1nv, t2p0, flag)
//
|
T2Pexi0 _ =>
f0_exi0(e1nv, t2p0, flag)
|
T2Puni0 _ =>
f0_uni0(e1nv, t2p0, flag)
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
f0_lft
( e1nv: !e1nv
, t2p0: s2typ
, flag: &sint >> _): s2typ =
let
//
val fval = flag
//
val t2p1 =
s2typ_hnfizx(e1nv, t2p1, flag)
//
in//let
//
if
(flag <= fval)
then t2p0 else
s2typ(t2p0.sort(), T2Plft(t2p1))
//
end where
{
  val-T2Plft(t2p1) = t2p0.node() }
//(*where*) // end of [f0_lft(e1nv,...)]
//
(* ****** ****** *)
//
fun
f0_xtv
( e1nv: !e1nv
, t2p0: s2typ
, flag: &sint >> _): s2typ =
let
//
(*
val fval = flag
*)
//
val t2p1 = xtp1.styp()
//
in//let
//
case+
t2p1.node() of
| T2Pnone0() => ( t2p0 )
| _(*T2Pnone0*) =>
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
f0_arg1
( e1nv: !e1nv
, t2p0: s2typ
, flag: &sint >> _): s2typ =
let
//
val fval = flag
//
val t2p1 =
s2typ_hnfizx(e1nv, t2p1, flag)
//
in//let
//
if
(flag <= fval)
then t2p0 else
s2typ_make_node
(t2p0.sort(), T2Parg1( knd0, t2p1 ))
//
end where
{
val-T2Parg1(knd0, t2p1) = t2p0.node() }
//(*where*) // end of [f0_arg1(e1nv,...)]
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
T2Plam1
(s2vs, t2p1) =>
let
val
() = (flag := flag+1)
val
svts = s2vts(s2vs, t2ps)
val tres =
s2typ_substx
(e1nv, t2p1, svts, flag)
in//let
s2typ_hnfizx(e1nv, tres, flag)
end (*let*) // end of [T2Plam1]
|_(*non-T2Plam1*) =>
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
fun
f0_lam1
( e1nv: !e1nv
, t2p0: s2typ
, flag: &sint >> _): s2typ =
let
//
val fval = flag
//
val t2p1 =
s2typ_hnfizx(e1nv, t2p1, flag)
//
in//let
//
if
(flag <= fval)
then t2p0 else
s2typ_make_node
(t2p0.sort(), T2Plam1( s2vs, t2p1 ))
//
end where
{
val-T2Plam1(s2vs, t2p1) = t2p0.node() }
//(*where*) // end of [f0_lam1(e1nv,...)]
//
(* ****** ****** *)
//
fun
f0_fun1
( e1nv: !e1nv
, t2p0: s2typ
, flag: &sint >> _): s2typ =
let
//
val fval = flag
//
val f2cl =
s2typ_hnfizx(e1nv, f2cl, flag)
val tres =
s2typ_hnfizx(e1nv, tres, flag)
val targ =
s2typlst_hnfizx(e1nv, targ, flag)
//
in//let
if
(flag <= fval)
then t2p0 else
s2typ_make_node
( t2p0.sort()
, T2Pfun1(f2cl, npf1, targ, tres))
end where
{
val-
T2Pfun1
(f2cl,npf1,targ,tres) = t2p0.node()
}
//(*where*) // end of [f0_fun1(e1nv,...)]
//
(* ****** ****** *)
//
fun
f0_trcd
( e1nv: !e1nv
, t2p0: s2typ
, flag: &sint >> _): s2typ =
let
//
val fval = flag
//
val ltps =
l2t2plst_hnfizx(e1nv, ltps, flag)
//
in//let
if
(flag <= fval)
then t2p0 else
s2typ_make_node
(t2p0.sort(),T2Ptrcd(tknd,npf1,ltps))
end where
{
val-
T2Ptrcd(tknd, npf1, ltps) = t2p0.node()
}
//(*where*) // end of [f0_trcd(e1nv,...)]
//
(* ****** ****** *)
//
fun
f0_text
( e1nv: !e1nv
, t2p0: s2typ
, flag: &sint >> _): s2typ =
let
//
val fval = flag
//
val t2ps =
s2typlst_hnfizx(e1nv, t2ps, flag)
//
in//let
if
(flag <= fval)
then t2p0 else
s2typ_make_node
(t2p0.sort(), T2Ptext(tnm1, t2ps))
end where
{
val-T2Ptext(tnm1, t2ps) = t2p0.node()
}
//(*where*) // end of [f0_text(e1nv,...)]
//
(* ****** ****** *)
//
fun
f0_exi0
( e1nv: !e1nv
, t2p0: s2typ
, flag: &sint >> _): s2typ =
let
//
val fval = flag
//
val t2p1 =
s2typ_hnfizx(e1nv, t2p1, flag)
//
in//let
if
(flag <= fval)
then t2p0 else
s2typ_make_node
(t2p0.sort(), T2Pexi0(s2vs, t2p1))
end where
{
val-T2Pexi0(s2vs, t2p1) = t2p0.node()
}
//(*where*) // end of [f0_exi0(e1nv,...)]
//
(* ****** ****** *)
//
fun
f0_uni0
( e1nv: !e1nv
, t2p0: s2typ
, flag: &sint >> _): s2typ =
let
//
val fval = flag
//
val t2p1 =
s2typ_hnfizx(e1nv, t2p1, flag)
//
in//let
if
(flag <= fval)
then t2p0 else
s2typ_make_node
(t2p0.sort(), T2Puni0(s2vs, t2p1))
end where
{
val-T2Puni0(s2vs, t2p1) = t2p0.node()
}
//(*where*) // end of [f0_uni0(e1nv,...)]
//
(* ****** ****** *)
//
} (*where*) // end of [s2typ_hnfizx(e1nv,...)]
//
(* ****** ****** *)
//
and
l2t2p_hnfizx
( e1nv: !e1nv
, ltp0: l2t2p
, flag: &sint >> _): l2t2p  =
let
//
val fval = flag
val+S2LAB(l0, t2p0) = ltp0
val t2p0 = 
s2typ_hnfizx(e1nv, t2p0, flag)
//
in//let
if
flag <= fval then ltp0 else S2LAB(l0, t2p0)
end (*let*) // end of [l2t2p_hnfizx(e1nv,...)]
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
//
and
l2t2plst_hnfizx
( e1nv: !e1nv
, ltps: l2t2plst
, flag: &sint >> _): l2t2plst  =
(
//
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
val
ltp1 =
l2t2p_hnfizx(e1nv, ltp1, flag)
val
lts2 =
l2t2plst_hnfizx(e1nv, lts2, flag)
//
in//let
if // if
(flag <= fval)
then ltps else list_cons(ltp1, lts2)
end (*let*) // end of [list_cons(...)]
//
) (*case+*) // end of [l2t2plst_hnfizx(...)]
//
(* ****** ****** *)
//
} where {
//
fun
s2typ_substx
( e1nv: !e1nv
, t2p0: s2typ
, svts: s2vts
, flag: &sint >> _): s2typ =
s2typ_substx_e1nv<e1nv>(e1nv, t2p0, svts, flag)
//
} (*where*) // end of [s2typ_hnfizx_e1nv(e1nv,...)]

(* ****** ****** *)

#impltmp
< e1nv >
s2typ_substx_e1nv
( e1nv
, t2p0, s2vtx, flag) =
s2typ_substx
( e1nv
, t2p0, s2vtx, flag) where
{
//
(* ****** ****** *)
//
fun
s2typ_substx
( e1nv: !e1nv
, t2p0: s2typ
, svts: s2vts
, flag: &sint >> _): s2typ =
(
case+
t2p0.node() of
//
|T2Pbas _ => t2p0
//
|T2Pcst _ => t2p0
//
|
T2Pvar _ =>
f0_var(e1nv, t2p0, svts, flag)
//
|
T2Parg1 _ =>
f0_arg1(e1nv, t2p0, svts, flag)
//
|
T2Papps _ =>
f0_apps(e1nv, t2p0, svts, flag)
//
|
T2Pfun1 _ =>
f0_fun1(e1nv, t2p0, svts, flag)
//
|
T2Plam1 _ =>
f0_lam1(e1nv, t2p0, svts, flag)
//
|
T2Ptext _ =>
f0_text(e1nv, t2p0, svts, flag)
//
|
T2Puni0 _ =>
f0_uni0(e1nv, t2p0, svts, flag)
//
|
T2Ptrcd _ =>
f0_trcd(e1nv, t2p0, svts, flag)
//
|T2Pnone0 _ => t2p0
|T2Pnone1 _ => t2p0|T2Ps2exp _ => t2p0
//
| _(* otherwise *) => s2typ_none1(t2p0)
//
) where
{
//
(* ****** ****** *)
//
fun
f0_var
( e1nv: !e1nv
, t2p0: s2typ
, svts: s2vts
, flag: &sint >> _): s2typ =
let
//
val-
T2Pvar(s2v1) = t2p0.node()
//
val
opt1 = s2vts_search_opt(svts, s2v1)
//
in//let
case+ opt1 of
| ~
optn_vt_nil() => t2p0
| ~
optn_vt_cons(t2p1) => (flag := flag+1; t2p1)
end (*let*) // end of [f0_var(e1nv,...)]
//
(* ****** ****** *)
//
fun
f0_arg1
( e1nv: !e1nv
, t2p0: s2typ
, svts: s2vts
, flag: &sint >> _): s2typ =
let
//
val fval = flag
//
val-
T2Parg1
( knd0, t2p1) = t2p0.node()
//
val t2p1 =
s2typ_substx(e1nv, t2p1, svts, flag)
//
in//let
if
flag <= fval
then t2p0 else
s2typ(t2p0.sort(), T2Parg1(knd0, t2p1))
end (*let*) // end of [f0_arg1(e1nv,...)]
//
(* ****** ****** *)
//
fun
f0_apps
( e1nv: !e1nv
, t2p0: s2typ
, svts: s2vts
, flag: &sint >> _): s2typ =
let
//
val fval = flag
//
val-
T2Papps
( t2f0, t2ps) = t2p0.node()
//
val t2f0 =
s2typ_substx(e1nv,t2f0,svts,flag)
val t2ps =
s2typlst_substx(e1nv,t2ps,svts,flag)
//
in//let
if
flag <= fval
then t2p0 else
s2typ(t2p0.sort(), T2Papps(t2f0, t2ps))
end (*let*) // end of [f0_apps(e1nv,...)]
//
(* ****** ****** *)
//
fun
f0_lam1
( e1nv: !e1nv
, t2p0: s2typ
, svts: s2vts
, flag: &sint >> _): s2typ =
let
//
val fval = flag
//
val-
T2Plam1(s2vs, t2p1) = t2p0.node()
//
val t2p1 = // HX: capturing?!!!
s2typ_substx(e1nv, t2p1, svts, flag)
//
if
flag <= fval
then t2p0 else
s2typ(t2p0.sort(), T2Plam1(s2vs, t2p1))
end (*let*) // end of [f0_lam1(e1nv,...)]
//
(* ****** ****** *)
//
fun
f0_fun1
( e1nv: !e1nv
, t2p0: s2typ
, svts: s2vts
, flag: &sint >> _): s2typ =
let
//
val fval = flag
//
val-
T2Pfun1
( f2cl, npf1
, t2ps, tres) = t2p0.node()
val t2ps =
s2typlst_substx(e1nv,t2ps,svts,flag)
val tres =
s2typ_substx(e1nv, tres, svts, flag)
//
in//let
if
flag <= fval
then t2p0 else
let
val s2t0 = t2p0.sort() in
s2typ(s2t0, T2Pfun1(f2cl,npf1,t2ps,tres))
end (*let*) // end-of-[else]
end (*let*) // end of [f0_fun1(e1nv,...)]
//
(* ****** ****** *)
//
fun
f0_text
( e1nv: !e1nv
, t2p0: s2typ
, svts: s2vts
, flag: &sint >> _): s2typ =
let
//
val fval = flag
//
val-
T2Ptext
( name, t2ps) = t2p0.node()
//
val t2ps =
s2typlst_substx(e1nv,t2ps,svts,flag)
//
in//let
if
flag <= fval
then t2p0 else
s2typ(t2p0.sort(), T2Ptext(name, t2ps))
end (*let*) // end of [f0_text(e1nv,...)]
//
(* ****** ****** *)
//
fun
f0_uni0
( e1nv: !e1nv
, t2p0: s2typ
, svts: s2vts
, flag: &sint >> _): s2typ =
let
//
val fval = flag
//
val-
T2Puni0(s2vs, t2p1) = t2p0.node()
//
val t2p1 = // HX: capturing?!!!
s2typ_substx(e1nv, t2p1, svts, flag)
//
if
flag <= fval
then t2p0 else
s2typ(t2p0.sort(), T2Puni0(s2vs, t2p1))
end (*let*) // end of [f0_uni0(e1nv,...)]
//
(* ****** ****** *)
//
fun
f0_trcd
( e1nv: !e1nv
, t2p0: s2typ
, svts: s2vts
, flag: &sint >> _): s2typ =
let
//
val fval = flag
//
val-
T2Ptrcd
( knd0
, npf1, ltps) = t2p0.node()
//
val ltps =
l2t2plst_substx(e1nv,ltps,svts,flag)
//
if
flag <= fval
then t2p0 else
s2typ_make_node
(t2p0.sort(),T2Ptrcd(knd0, npf1, ltps))
end (*let*) // end of [f0_uni0(e1nv,...)]
//
(* ****** ****** *)
//
} (*where*) // end of [s2typ_substx(e1nv,...)]
//
(* ****** ****** *)
//
and
s2typlst_substx
( e1nv:
! e1nv
, t2ps: s2typlst
, svts: ( s2vts )
, flag: &sint >> _): s2typlst =
(
case+ t2ps of
|list_nil() =>
list_nil((*void*))
|list_cons(t2p1, tps2) =>
let
//
val fval = flag
//
val t2p1 =
s2typ_substx(e1nv, t2p1, svts, flag)
val tps2 =
s2typlst_substx(e1nv, tps2, svts, flag)
//
in//let
if // if
flag <= fval then t2ps else list_cons(t2p1,tps2)
end (*let*)
) (*case+*) // end of [s2typlst_substx(e1nv,...)]
//
(* ****** ****** *)
//
and
l2t2plst_substx
( e1nv:
! e1nv
, ltps: l2t2plst
, svts: ( s2vts )
, flag: &sint >> _): l2t2plst =
(
case+ ltps of
|list_nil() =>
list_nil((*void*))
|list_cons(ltp1, lts2) =>
let
//
val fval = flag
//
val ltp1 =
let
val+
S2LAB(lab1, t2p1) = ltp1
//
val t2p1 =
s2typ_substx
(e1nv, t2p1, svts, flag)
in
  if
  (flag <= fval)
  then ltp1 else S2LAB(lab1, t2p1)
endlet // end of [ val(ltp1) ]
//
val lts2 =
l2t2plst_substx(e1nv, lts2, svts, flag)
//
in//let
if // if
flag <= fval then ltps else list_cons(ltp1,lts2)
end (*let*)
) (*case+*) // end of [l2t2plst_substx(e1nv,...)]
//
(* ****** ****** *)
//
} (*where*) // end of [s2typ_subst_e1nv(e1nv,...)]

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
//
#impltmp
<(*void*)>
unify00_s2typ$xset
  (xtp1, t2p2) =
(
x2t2p_set_styp(xtp1,t2p2))
//
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
isXTV
(t2p0: s2typ): bool =
(
case+ t2p0.node() of
| T2Pxtv _ => true | _ => false)
//
(* ****** ****** *)
//
fun
s2typ_hnfiz0
( e1nv: !e1nv
, t2p0: s2typ): s2typ =
s2typ_hnfiz0_e1nv<e1nv>(e1nv, t2p0)
//
fun
s2typ_subst0
( e1nv: !e1nv
, t2p0: s2typ
, svts: s2vts): s2typ =
s2typ_subst0_e1nv<e1nv>(e1nv,t2p0,svts)
//
(* ****** ****** *)
fun
s2typ_exi0_abst
( e1nv: !e1nv
, t2p0: s2typ): s2typ = t2p0
fun
s2typ_uni0_abst
( e1nv: !e1nv
, t2p0: s2typ): s2typ = t2p0
(* ****** ****** *)
//
local
//
fun
f0_inst_s2vs
( s2vs
: s2varlst): s2vts =
(
list_maprev
< x0 >< y0 >(s2vs)) where
{
//
#typedef x0 = s2var
#typedef y0 = (s2var, s2typ)
//
fun
x2t2p_make() =
x2t2p_make_lctn(loctn_dummy())
//
#impltmp
map$fopr
<x0><y0>(s2v1) =
@(s2v1, s2typ_xtv(x2t2p_make()))
//
}(*where*)//end of [f0_inst_s2vs]
//
in//local
//
fun
s2typ_exi0_inst
( e1nv: !e1nv
, t2p0: s2typ): s2typ =
(
case+
t2p0.node() of
|
T2Pexi0
(s2vs, t2p1) =>
let
val svts =
f0_inst_s2vs(s2vs) in//let
s2typ_exi0_inst//recursive
(
e1nv,
s2typ_subst0(e1nv,t2p1,svts) )
endlet // end of [T2Pexi0(...)]
| _(* non-T2Pexi0 *) => (  t2p0  )
)(*case+*)//end-of-[s2typ_exi0_inst]
//
fun
s2typ_uni0_inst
( e1nv: !e1nv
, t2p0: s2typ): s2typ =
(
case+
t2p0.node() of
|
T2Puni0
(s2vs, t2p1) =>
let
val svts =
f0_inst_s2vs(s2vs) in//let
s2typ_uni0_inst//recursive
(
e1nv,
s2typ_subst0(e1nv,t2p1,svts) )
endlet // end of [T2Puni0(...)]
| _(* non-T2Puni0 *) => (  t2p0  )
)(*case+*)//end-of-[s2typ_uni0_inst]
//
endloc // end-of-[s2typ_exi0/uni0_inst]
//
(* ****** ****** *)
//
fun
unify00_s2typ
( e1nv: !e1nv
, t2p1: s2typ
, t2p2: s2typ): (bool) =
(
if
isXTV(t2p1)
then
f0_xtv1(e1nv, t2p1, t2p2)
else
(
if
isXTV(t2p2)
then
f0_xtv2(e1nv, t2p1, t2p2)
else
(
case+
t2p1.node() of
//
|
T2Pbas(tbs1) =>
(
case+
t2p2.node() of
|
T2Pbas(tbs2) =>
(tbs1 = tbs2) | _ => false)
//
|
T2Pf2cl(fcl1) =>
(
case+
t2p2.node() of
|
T2Pf2cl(fcl2) =>
f2clknd_equal
(fcl1 , fcl2) | _ => false)
//
|
T2Pcst(s2c1) =>
(
case+
t2p2.node() of
|
T2Pcst(s2c2) =>
(s2c1 = s2c2) | _ => false)
//
|
T2Pvar(s2v1) =>
(
case+
t2p2.node() of
|
T2Pvar(s2v2) =>
(s2v1 = s2v2) | _ => false)
//
|
T2Papps _ =>
(
  f0_apps(e1nv, t2p1, t2p2))
//
|
T2Pfun1 _ =>
(
  f0_fun1(e1nv, t2p1, t2p2))
//
|
T2Ptext _ =>
(
  f0_text(e1nv, t2p1, t2p2))
//
|
T2Ptrcd _ =>
(
  f0_trcd(e1nv, t2p1, t2p2))
//
|T2Pnone0 _ =>
(
case+
t2p2.node() of
|T2Pnone0 _ => true
|T2Ps2exp _ => true | _ => false)
|T2Ps2exp _ =>
(
case+
t2p2.node() of
|T2Pnone0 _ => true
|T2Ps2exp _ => true | _ => false)
//
) // case+ t2p1.node of
) // if // end-of-(if2-then-else)
) where // end-of-(if1-then-else)
{
//
(* ****** ****** *)
//
fun
f1_xset
( xtp1: x2t2p
, t2p2: s2typ): void =
let
(*
val () =
prerrln
("f1_xset: xtp1 = ", xtp1)
val () =
prerrln
("f1_xset: t2p2 = ", t2p2)
*)
in//let
unify00_s2typ$xset<>(xtp1, t2p2)
end (*let*) // end of [f1_xset(...)]
//
(* ****** ****** *)
//
fun
f0_xtv1
( e1nv: !e1nv
, t2p1: s2typ
, t2p2: s2typ): (bool) =
let
val-
T2Pxtv(xtp1) = t2p1.node()
in//let
case+
t2p2.node() of
|T2Pxtv(xtp2) =>
if
(xtp1 = xtp2)
then true else
(f1_xset(xtp1, t2p2); true)
|_(*non-T2Pxtv*) =>
if
s2typ_xtpck0
( t2p2, xtp1 )
then false else
(f1_xset(xtp1, t2p2); true)
end (*let*) // end of [f0_xtv1(e1nv,...)]
//
(* ****** ****** *)
//
fun
f0_xtv2
( e1nv: !e1nv
, t2p1: s2typ
, t2p2: s2typ): (bool) =
let
val-
T2Pxtv(xtp2) = t2p2.node()
in//let
if
s2typ_xtpck0
( t2p1, xtp2 )
then false else
(f1_xset(xtp2, t2p1); true)
end (*let*) // end of [f0_xtv2(e1nv,...)]
//
(* ****** ****** *)
//
fun
f0_apps
( e1nv: !e1nv
, t2p1: s2typ
, t2p2: s2typ): (bool) =
let
val-
T2Papps
( t2f1, tps1) = t2p1.node()
in//let
//
case+
t2p2.node() of
|
T2Papps(t2f2, tps2) =>
let
val
btf1 =
unify00_s2typ
(e1nv, t2f1, t2f2)
in//let
if btf1
then
unify00_s2typlst
(e1nv, tps1, tps2) else false
end (*let*) // end of [T2Papps(...)]
| _ (* non-T2Papps *) => (  false  )
//
end (*let*) // end of [f0_apps(e1nv,...)]
//
(* ****** ****** *)
//
fun
f0_fun1
( e1nv: !e1nv
, t2p1: s2typ
, t2p2: s2typ): (bool) =
let
val-T2Pfun1
( fcl1, npf1
, tps1, trs1) = t2p1.node()
in//let
//
case+
t2p2.node() of
|
T2Pfun1
( fcl2, npf2
, tps2, trs2) =>
let
val btf1 =
unify00_s2typ(e1nv, fcl1, fcl2)
val btf2 =
unify00_s2typ(e1nv, trs1, trs2)
val btf3 =
unify00_s2typlst(e1nv, tps2, tps1)
in//let
if btf1 then
(if btf2 then btf3 else false) else false
end (*let*) // end of [T2Pfun1(...)]
| _ (* non-T2Pfun1 *) => (  false  )
//
end (*let*) // end of [f0_fun1(e1nv,...)]
//
(* ****** ****** *)
//
fun
f0_text
( e1nv: !e1nv
, t2p1: s2typ
, t2p2: s2typ): (bool) =
let
val-
T2Ptext
(tnm1, tps1) = t2p1.node()
in//let
//
case+
t2p2.node() of
|
T2Ptext
(tnm2, tps2) =>
(
if
(tnm1 = tnm2)
then
unify00_s2typlst
(e1nv, tps1, tps2) else false)
| _ (* non-T2Ptext *) => (  false  )
//
end (*let*) // end of [f0_text(e1nv,...)]
//
(* ****** ****** *)
//
fun
f0_trcd
( e1nv: !e1nv
, t2p1: s2typ
, t2p2: s2typ): (bool) =
let
val-
T2Ptrcd
( knd1
, npf1, lts1) = t2p1.node()
in//let
case+
t2p2.node() of
|
T2Ptrcd
( knd2
, npf2, lts2) =>
(
if
trcdknd_equal
(knd1 , knd2)
*
(npf1 = npf2)
then
unify00_l2t2plst
(e1nv, lts1, lts2) else false)
| _ (* non-T2Ptrcd *) => (  false  )
end (*let*) // end of [f0_trcd(e1nv,...)]
//
(* ****** ****** *)
//
val
t2p1 = s2typ_unarg1(t2p1)
val
t2p2 = s2typ_unarg1(t2p2)
//
val
t2p1 = s2typ_hnfiz0(e1nv, t2p1)
val
t2p2 = s2typ_hnfiz0(e1nv, t2p2)
//
val
t2p1 = s2typ_uni0_inst(e1nv, t2p1)
val
t2p2 = s2typ_exi0_inst(e1nv, t2p2)
//
(*
val (  ) =
prerrln("unify00_s2typ: t2p1 = ", t2p1)
val (  ) =
prerrln("unify00_s2typ: t2p2 = ", t2p2)
*)
//
} (*where*) // end of [unify00_s2typ(e1nv,...)]
//
(* ****** ****** *)
//
and
unify00_s2typlst
( e1nv: !e1nv
, tps1: s2typlst
, tps2: s2typlst): (bool) =
(
case+ tps1 of
|
list_nil() =>
(
case+ tps2 of
|list_nil() => true
|list_cons _ => false)
|
list_cons(t2p1, tps1) =>
(
case+ tps2 of
|list_nil() => false
|list_cons(t2p2, tps2) =>
(
if btf1
then btf2 else false) where
{
val btf1 =
unify00_s2typ(e1nv, t2p1, t2p2)
val btf2 =
unify00_s2typlst(e1nv, tps1, tps2) }
)
) (*case+*) // end of [unify00_s2typlst(e1nv,...)]
//
(* ****** ****** *)
//
and
unify00_l2t2plst
( e1nv: !e1nv
, lts1: l2t2plst
, lts2: l2t2plst): (bool) =
let
//
fun
f1_labck
( lts1: l2t2plst
, lts2: l2t2plst): (bool) =
(
case+ lts1 of
|list_nil() =>
(
case+ lts2 of
|list_nil _ => true
|list_cons _ => false)
|list_cons(ltp1, lts1) =>
(
case+ lts2 of
|
list_nil() => false
|
list_cons(ltp2, lts2) =>
let
val+S2LAB(l1, t2p1) = ltp1
val+S2LAB(l2, t2p2) = ltp2
in//let
if
(l1 != l2)
then false
else f1_labck(lts1, lts2) endlet
)
) (*case+*) // end of [f1_labck(...)]
//
fun
f1_unify
( e1nv: !e1nv
, lts1: l2t2plst
, lts2: l2t2plst): (bool) =
(
case+ lts1 of
|
list_nil() =>
(
case+ lts2 of
|list_nil() => true
|list_cons(_, _) => false
)
|
list_cons
(ltp1, lts1) =>
(
case+ lts2 of
|list_nil() => false
|list_cons(ltp2, lts2) =>
(
if btf1
then btf2 else false) where
{
val+S2LAB(l1, t2p1) = ltp1
val+S2LAB(l2, t2p2) = ltp2
val
btf1 =
(
if
l1 != l2 then false else
unify00_s2typ(e1nv,t2p1,t2p2))
val
btf2 = f1_unify(e1nv,lts1,lts2) }
)
) (*case+*) // end of [f1_unify(...)]
//
in//let
if
f1_labck(lts1, lts2)
then f1_unify(e1nv,lts1,lts2) else false
end//let//end-of-[unify00_l2t2plst( ... )]
//
(* ****** ****** *)
//
} (*where*) // end of [unify00_s2typ_e1nv(e1nv,...)]

(* ****** ****** *)

local
//
datatype x2stk =
X2STK of list(x2t2p)
datavwtp x2stk_vt =
X2STK_vt of list_vt(x2t2p)
//
in//local

#impltmp
<e1nv:vwtp>
match00_s2typ_e1nv
(e1nv, t2p1, t2p2) =
let
//
val
xstk = X2STK(list_nil)
//
#impltmp
<(*void*)>
unify00_s2typ$xset
  (xtp1, t2p2) =
let
val () =
x2stk_push(xstk, xtp1)
in//let
x2t2p_set_styp(xtp1, t2p2) end
//
in//let
//
(
x2stk_free_all(xstk); ans) where
{
val ans =
unify00_s2typ_e1nv<e1nv>(e1nv, t2p1, t2p2)
}
//
end where
{
//
(* ****** ****** *)
//
fun
x2stk_push
( xstk: x2stk
, xtp0: x2t2p): void =
let
val xstk =
$UN.castlin10
{x2stk_vt}(xstk)
val+
@X2STK_vt(!xref) = (xstk)
in//let
xref := list_vt_cons(xtp0, xref)
end (*let*) // end of [x2stk_push]
//
(* ****** ****** *)
//
fun
x2stk_free_all
( xstk: x2stk ): void =
let
val xstk =
$UN.castlin10
{x2stk_vt}(xstk)
val+
@X2STK_vt(!xref) = (xstk)
in//let
(
  auxfree(xtps)) where
{
val xtps = xref
val (  ) = (xref := list_vt_nil)}
end where
{
fun
auxfree
(xtps: list_vt(x2t2p)): void =
(
case+ xtps of
| ~
list_vt_nil() => ()
| ~
list_vt_cons(xtp1, xtps) =>
let
val t2p0 =
s2typ_none0() in
xtp1.styp(t2p0); auxfree(xtps) end) }
// (*where*) // end of [x2stk_free_all]
//
(* ****** ****** *)
//
} (*where*) // end of [match00_s2typ_e1nv]

end (*local*) // end of [match00_s2typ_e1nv]

(* ****** ****** *)

(* end of [ATS3/XATSOPT_srcgen2_statyp2_tmplib.dats] *)

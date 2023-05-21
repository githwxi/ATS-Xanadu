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
Sat 24 Dec 2022 12:26:37 PM EST
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
#staload _ = "./statyp2_tmplib.dats"
(* ****** ****** *)
//
#implfun
s2vts_search_opt
  (svts, s2v0) =
(
  auxmain(svts) ) where
{
fun
auxmain
(svts: s2vts): s2typopt_vt =
(
case+ svts of
|
list_nil() => optn_vt_nil()
|
list_cons(svt1, svts) =>
if
(s2v0 = svt1.0)
then
optn_vt_cons(svt1.1) else auxmain(svts)
)
} (*where*) // end of [s2vts_search_opt]
//
(* ****** ****** *)
//
#implfun
s2vts_make_s2vs_t2ps
( s2vs, t2ps ) =
(
auxmain(s2vs, t2ps)) where
{
//
fun
auxmain
( s2vs: s2varlst
, t2ps: s2typlst): s2vts =
(
case+ s2vs of
|
list_nil() =>
list_nil()
|
list_cons(s2v1, s2vs) =>
let
val-
list_cons(t2p1, t2ps) = t2ps
in
list_cons
((s2v1, t2p1), auxmain(s2vs, t2ps))
end (*let*)
) (*case+*)//end-[auxmain(s2vs,t2ps)]
//
} (*where*)//end-[s2vts_make_s2vs_t2ps]
//
(* ****** ****** *)

#implfun
s2typ_xtpck0
(t2p0, xtp0) =
(
case+ t2p0 of
//
|
T2Pbas _ => false
|
T2Pnone0 _ => false
|
T2Pnone1 _ => false
|
T2Ps2exp _ => false
//
|
T2Pxtv(xtp1) =>
if
xtp0 = xtp1
then true else
let
val t2p1 = xtp1.styp()
in//let
s2typ_xtpck0(t2p1, xtp0)
endlet // end-of-(T2Pxtv)
//
|
T2Plam0
(s2vs, t2p1) =>
s2typ_xtpck0(t2p1, xtp0)
|
T2Papps
(t2f0, t2ps) =>
if
s2typ_xtpck0(t2f0, xtp0)
then true else
s2typlst_xtpck0(t2ps, xtp0)
//
|
T2Ptrcd
(tknd,npf1,ltps) =>
l2t2plst_xtpck0(ltps, xtp0)
//
|
T2Ptext(tnm1, t2ps) =>
s2typlst_xtpck0(t2ps, xtp0)
//
| _(*otherwise*) => (  false  )
//
) where
{
(*
val () =
prerrln("s2typ_xtpck0: t2p0 = ", t2p0)
val () =
prerrln("s2typ_xtpck0: xtp0 = ", xtp0)
*)
} (*where*)//end-of-[s2typ_xtpck0(...)]

(* ****** ****** *)
//
#implfun
s2typlst_xtpck0
( t2ps , xtp0 ) =
list_forall<x0>(t2ps) where
{
#typedef x0 = s2typ
#impltmp
forall$test
< x0 >(t2p0) = s2typ_xtpck0(t2p0, xtp0)
} (*where*) // end-[s2typlst_xtpck0(...)]
//
(* ****** ****** *)
//
#implfun
l2t2plst_xtpck0
( ltps , xtp0 ) =
list_forall<x0>(ltps) where
{
#typedef x0 = l2t2p
#impltmp
forall$test
< x0 >( lx ) =
case+ lx of
S2LAB(l0, x0) => s2typ_xtpck0(x0, xtp0)
} (*where*) // end-[l2t2plst_xtpck0(...)]
//
(* ****** ****** *)
//
local
//
(* ****** ****** *)
//
fun
f0_s2vs
( s2vs
: s2varlst
)
: s2varlst =
let
#typedef x0 = s2var
#impltmp
filter$test
< x0 >(s2v) =
sort2_imprq(s2v.sort())
in
  list_filter<x0>(s2vs) end
// (*let*) // end of [f0_s2vs(s2vs)]
//
(* ****** ****** *)
//
fun
f0_impr
(s2e0: s2exp): s2typ =
let
val s2t0 = s2e0.sort()
in//let
case+
s2e0.node() of
//
|S2Ecst(s2c1) =>
s2typ_make_node
(s2t0, T2Pcst(s2c1))
|S2Evar(s2v1) =>
s2typ_make_node
(s2t0, T2Pvar(s2v1))
//
|S2Etop0(s2e1) => f0_impr(s2e1)
|S2Etopz(s2e1) => f0_impr(s2e1)
//
|
S2Eapps
(s2f0, s2es) =>
s2typ_make_node
( s2t0
, T2Papps(s2f0, t2ps)) where
{
val s2f0 = f0_impr(s2f0)
val t2ps = s2explst_stpize(s2es) }
//
|
S2Elam0
(s2vs, s2e1) =>
s2typ_make_node
( s2t0
, T2Plam0(s2vs, f0_impr(s2e1)))
//
|
S2Efun1
( f2cl, npf1
, s2es, sres) =>
s2typ_make_node
(s2t0
,T2Pfun1
 ( f2cl
 , npf1, t2ps, tres)) where
{
//
  val
  f2cl = s2typ_f2cl(f2cl)
  val
  t2ps = s2explst_stpize(s2es)
//
  val tres = s2exp_stpize(sres) }
//
|
S2Eexi0
( s2vs
, s2ps, s2e1) =>
let
val
t2p1 = f0_impr(s2e1)
val
s2vs = f0_s2vs(s2vs)
in//let
case+ s2vs of
|
list_nil() => t2p1
|
list_cons _ =>
s2typ_make_node
(s2t0, T2Pexi0(s2vs, t2p1))
end (*let*) // end of [S2Eexi0(...)]
|
S2Euni0
( s2vs
, s2ps, s2e1) =>
let
val
t2p1 = f0_impr(s2e1)
val
s2vs = f0_s2vs(s2vs)
in//let
case+ s2vs of
|
list_nil() => t2p1
|
list_cons _ =>
s2typ_make_node
(s2t0, T2Puni0(s2vs, t2p1))
end (*let*) // end of [S2Euni0(...)]
//
(*
| S2Etype(t2p1) => t2p1
*)
//
|
S2Etext(name, s2es) =>
s2typ_make_node
( s2t0
, T2Ptext(name, t2ps)) where
{
val t2ps = s2explst_stpize(s2es)
}
//
|
S2Etrcd
( tknd
, npf1, lses) =>
s2typ_make_node
(s2t0
,T2Ptrcd(tknd,npf1,ltps)) where
{
val ltps = l2s2elst_stpize(lses) }
//
|
_(*otherwise*) =>
s2typ_make_node(s2t0, T2Ps2exp(s2e0))
//
end (*let*) // end of [f0_impr(s2e0)]
//
(* ****** ****** *)
in//local
(* ****** ****** *)
//
#implfun
s2exp_stpize(s2e0) =
let
val s2t0 = s2e0.sort()
in//let
if
sort2_imprq(s2t0)
then f0_impr(s2e0) else
s2typ_make_node(s2t0, T2Ps2exp(s2e0))
endlet where
{
(*
val () =
prerrln("s2exp_stpize: s2e0 = ", s2e0)
*)
} (*where*) // end of [s2exp_stpize(s2e0)]
//
end (*local*) // end of [local(s2exp_stpize)]
//
(* ****** ****** *)

#implfun
s2explst_stpize(s2es) =
list_map<x0><y0>(s2es) where
{
#typedef x0 = s2exp
#typedef y0 = s2typ
#impltmp map$fopr<x0><y0> = s2exp_stpize
} (*where*) // end of [s2explst_stpize(s2es)]

(* ****** ****** *)

#implfun
l2s2elst_stpize(lses) =
list_map<lx><ly>(lses) where
{
//
#typedef lx = l2s2e
#typedef ly = l2t2p
//
#impltmp
map$fopr<lx><ly>(lx) =
let
val+
S2LAB(l0,x0) = lx in S2LAB(l0,stpize(x0))
end (*let*)
//
} (*where*) // end of [l2s2elst_stpize(lses)]

(* ****** ****** *)

(* end of [ATS3/XATSOPT_srcgen2_statyp2_utils1.dats] *)

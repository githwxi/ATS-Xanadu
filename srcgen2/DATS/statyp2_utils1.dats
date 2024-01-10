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
#symload name with s2cst_get_name
(* ****** ****** *)
#symload node with s2typ_get_node
(* ****** ****** *)
//
#implfun
s2typ_cbrfq(t2p0) =
(
case+
t2p0.node() of
|T2Parg1
(knd0, _) => (knd0 < 0)
|T2Patx2
(t2p1, _) => s2typ_cbrfq(t2p1)
|_(* otherwise *) => ( false ))
//
(* ****** ****** *)
//
#implfun
s2typ_dataq
  (t2p0) =
(
case+
t2p0.node() of
|T2Pcst
(  s2c1  ) =>
s2cst_dataq(s2c1)
|T2Papps
(tfun, t2ps) =>
s2typ_dataq(tfun) | _ => false)
//
(* ****** ****** *)
//
#implfun
s2vts_stleq
  ( svts ) =
(
list_forall<s2vt>(svts)
) where
{
#typedef
s2vt =
(s2var, s2typ)
#impltmp
forall$test
< s2vt >( s2vt ) =
let
//
val
(s2v1, t2p2) = s2vt
//
val s2t1 = s2v1.sort((*0*))
val s2t2 = t2p2.sort((*0*))
//
(*
val () = prerrln
(
"s2vts_stleq: s2v1 = ", s2v1)
val () = prerrln
(
"s2vts_stleq: t2p2 = ", t2p2)
val () = prerrln
(
"s2vts_stleq: s2t1 = ", s2t1)
val () = prerrln
(
"s2vts_stleq: s2t2 = ", s2t2)
//
val () = prerrln
( "s2vts_stleq: test = "
, lte_sort2_sort2(s2t2, s2t1) )
*)
//
in//let
  lte_sort2_sort2(s2t2, s2t1) end
} (*where*)//end-of-[s2vts_stleq(...)]
//
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
s2typ_prjout_opt
  (t2p0, lab0) =
(
case+
t2p0.node() of
|
T2Ptrcd
(knd0
,npf1,ltps) => auxloop(ltps)
|
_(*non-T2Ptrcd*) => optn_vt_nil()
) where
{
//
fun
auxloop
( ltps
: l2t2plst): s2typopt_vt =
(
case+ ltps of
|
list_nil() =>
optn_vt_nil((*void*))
|
list_cons(ltp1, ltps) =>
let
  val+
  S2LAB
  (lab1, t2p1) = ltp1
in//let
if // if
label_cmp
(lab0,lab1) = 0
then
optn_vt_cons(t2p1) else auxloop(ltps)
end // end-of-[  list_cons(...)  ]
)(*case+*)//end-of-[  auxloop(ltps)  ]
//
}(*where*)//end-of-[s2typ_search_opt(...)]

(* ****** ****** *)
//
local
//
fun
isP1TR
(s2c0: s2cst): bool =
(s2c0.name() = P1TR_TBOX_symbl)
fun
isP2TR
(s2c0: s2cst): bool =
(s2c0.name() = P2TR_TBOX_symbl)
//
in//local
//
#implfun
s2typ_p1tr0q(t2p0) =
(
case+
t2p0.node() of
|
T2Pcst(s2c0) =>
isP1TR(s2c0) | _(*else*) => false)
//
#implfun
s2typ_p2tr0q(t2p0) =
(
case+
t2p0.node() of
|
T2Pcst(s2c0) =>
isP2TR(s2c0) | _(*else*) => false)
//
end//end of [local(s2typ_p1tr0q/p2tr0q]
//
(* ****** ****** *)
//
#implfun
s2typ_p2tr1q(t2p0) =
(
case+
t2p0.node() of
|
T2Papps
(t2f0, _) =>
s2typ_p2tr0q(t2f0) | _(*else*) => false)
//
(* ****** ****** *)
//
local
//
fun
isL0AZY
(s2c0: s2cst): bool =
(s2c0.name() = L0AZY_TBOX_symbl)
fun
isL1AZY
(s2c0: s2cst): bool =
(s2c0.name() = L1AZY_VTBX_symbl)
//
in//local
//
#implfun
s2typ_l0azy0q(t2p0) =
(
case+
t2p0.node() of
|
T2Pcst(s2c0) =>
isL0AZY(s2c0) | _(*else*) => false)
//
#implfun
s2typ_l1azy0q(t2p0) =
(
case+
t2p0.node() of
|
T2Pcst(s2c0) =>
isL1AZY(s2c0) | _(*else*) => false)
//
end//end of [local(s2typ_l0azy0q/l1azy0q]
//
(* ****** ****** *)
//
#implfun
s2typ_l0azy1q(t2p0) =
(
case+
t2p0.node() of
|
T2Papps
(t2f0, _) =>
s2typ_l0azy0q(t2f0) | _(*else*) => false)
//
#implfun
s2typ_l1azy1q(t2p0) =
(
case+
t2p0.node() of
|
T2Papps
(t2f0, _) =>
s2typ_l1azy0q(t2f0) | _(*else*) => false)
//
(* ****** ****** *)

#implfun
s2typ_xtpck0
(t2p0, xtp0) =
(
case+
t2p0.node() of
//
(*
|T2Pbas _ => false
*)
//
|T2Pcst _ => false
|T2Pvar _ => false
//
(*
|T2Pnone0 _ => false
|T2Pnone1 _ => false
|T2Ps2exp _ => false
*)
//
|T2Pxtv(xtp1) =>
if
xtp0 = xtp1
then true else
let
val t2p1 = xtp1.styp()
in//let
s2typ_xtpck0(t2p1, xtp0)
endlet // end-of-(T2Pxtv)
//
|T2Plam1
(s2vs, t2p1) =>
(
 s2typ_xtpck0(t2p1, xtp0) )
//
|T2Papps
(t2f0, t2ps) =>
(
if
s2typ_xtpck0(t2f0, xtp0)
then true else
s2typlst_xtpck0(t2ps, xtp0) )
//
|T2Ptrcd
(tknd,npf1,ltps) =>
(
 l2t2plst_xtpck0(ltps, xtp0) )
//
|T2Ptext(tnm1, t2ps) =>
(
 s2typlst_xtpck0(t2ps, xtp0) )
//
| _(*otherwise*) => (   false   )
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
(
list_exists
<s2typ>(t2ps) ) where
{
#impltmp
exists$test
<s2typ>(t2p1) = s2typ_xtpck0(t2p1, xtp0)
} (*where*) // end-[s2typlst_xtpck0(...)]
//
(* ****** ****** *)
//
#implfun
l2t2plst_xtpck0
( ltps , xtp0 ) =
(
list_exists
<l2t2p>(ltps) ) where
{
#impltmp
exists$test
<l2t2p>(lt2p) =
case+ lt2p of
S2LAB(l0, x0) => s2typ_xtpck0(x0, xtp0)
}(*where*)//end-of[l2t2plst_xtpck0(...)]
//
(* ****** ****** *)
//
#implfun
s2varlst_imprq(s2vs) =
(
list_filter<x0>(s2vs)) where
{
//
#typedef x0 = s2var
//
#impltmp
filter$test<x0>(s2v) =
let
val s2t = s2v.sort() in sort2_imprq(s2t)
end//let
}(*where*)//end-of-[s2varlst_imprq(...)]
//
(* ****** ****** *)
//
local
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
(* ****** ****** *)
//
|S2Etop0
(  s2e1  ) =>
let
val t2p1 = f0_impr(s2e1)
val s2t1 = t2p1.sort((*0*))
in//let
(
  s2typ(s2t1,T2Ptop0(t2p1)) )
end (*let*) // end of [S2Etop0]
//
|S2Etop1
(  s2e1  ) =>
let
val t2p1 = f0_impr(s2e1)
val s2t1 = t2p1.sort((*0*))
in//let
(
  s2typ(s2t1,T2Ptop1(t2p1)) )
end (*let*) // end of [S2Etop1]
//
(* ****** ****** *)
//
|
S2Earg1
(knd0, s2e1) =>
let
val t2p1 = f0_impr(s2e1)
val s2t1 = t2p1.sort((*0*))
in//let
(
  s2typ_make_node
  (s2t1,T2Parg1(knd0,t2p1)) )
end (*let*) // end of [S2Earg1]
//
|
S2Eatx2
(s2e1, s2e2) =>
let
val t2p1 = f0_impr(s2e1)
val t2p2 = f0_impr(s2e2)
val s2t1 = t2p1.sort((*0*))
in//let
(
  s2typ_make_node
  (s2t1,T2Patx2(t2p1,t2p2)) )
end (*let*) // end of [S2Eatx2]
//
(* ****** ****** *)
//
|
S2Eapps
(s2f0, s2es) =>
let
val
t2f0 = f0_impr(s2f0)
val
t2ps = s2explst_stpize(s2es)
in//let
(
  s2typ_make_node
  (s2t0, T2Papps(t2f0, t2ps)) )
end (*let*) // end of [S2Eapps(...)]
//
|
S2Elam1
(s2vs, s2e1) =>
let
val t2p1 = f0_impr(s2e1)
in//let
(
  s2typ_make_node
  (s2t0, T2Plam1(s2vs, t2p1)) )
end (*let*) // end of [S2Elam1(...)]
//
(* ****** ****** *)
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
//(*where*) // end of [S2Efun1(...)]
//
(* ****** ****** *)
//
|
S2Eexi0
( s2vs
, s2ps, s2e1) =>
let
val
t2p1 = f0_impr(s2e1)
val
s2vs = s2varlst_imprq(s2vs)
in//let
case+ s2vs of
|
list_nil() => t2p1
|
list_cons _ =>
s2typ_make_node
(s2t0, T2Pexi0(s2vs, t2p1))
end (*let*) // end of [S2Eexi0(...)]
//
|
S2Euni0
( s2vs
, s2ps, s2e1) =>
let
val
t2p1 = f0_impr(s2e1)
val
s2vs = s2varlst_imprq(s2vs)
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
(* ****** ****** *)
//
(*
|
S2Etype(t2p1) => t2p1
*)
//
|
S2Etext
( name, s2es) =>
s2typ_make_node
( s2t0
, T2Ptext(name, t2ps)) where
{
val t2ps = s2explst_stpize(s2es) }
//
(* ****** ****** *)
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
if // if
sort2_imprq(s2t0)
then f0_impr(s2e0) else
s2typ_make_node(s2t0, T2Ps2exp(s2e0))
endlet where // end of [let]
{
(*
val () =
prerrln("s2exp_stpize: s2e0 = ", s2e0)
*)
} (*where*) // end of [s2exp_stpize(s2e0)]
//
(* ****** ****** *)
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
  #impltmp
  map$fopr<x0><y0> = s2exp_stpize }
//(*where*) // end of [s2explst_stpize(s2es)]

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

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
Start Time: June 08th, 2022
Authoremail: gmhwxiATgmailDOTcom
*)
//
(* ****** ****** *)
#include
"./../HATS/xatsopt_sats.hats"
(* ****** ****** *)
#define
ATS_PACKNAME
"ATS3.XANADU.xatsopt-20220500"
(* ****** ****** *)
#staload "./../SATS/xbasics.sats"
(* ****** ****** *)
#staload "./../SATS/xstamp0.sats"
#staload "./../SATS/xsymbol.sats"
#staload "./../SATS/xlabel0.sats"
#staload "./../SATS/xsymmap.sats"
(* ****** ****** *)
#staload "./../SATS/filpath.sats"
#staload "./../SATS/locinfo.sats"
(* ****** ****** *)
#staload "./../SATS/lexing0.sats"
(* ****** ****** *)
#staload "./../SATS/staexp0.sats"
#staload "./../SATS/dynexp0.sats"
(* ****** ****** *)
#staload "./../SATS/xfixity.sats"
(* ****** ****** *)
#staload "./../SATS/staexp1.sats"
#staload "./../SATS/dynexp1.sats"
#staload "./../SATS/gmacro1.sats"
(* ****** ****** *)
#staload "./../SATS/staexp2.sats"
#staload "./../SATS/statyp2.sats"
#staload "./../SATS/dynexp2.sats"
(* ****** ****** *)
#symload stmp with s2cst_get_stmp
#symload stmp with s2var_get_stmp
(* ****** ****** *)
#symload stmp with x2t2p_get_stmp
(* ****** ****** *)
#symload stmp with d2var_get_stmp
(* ****** ****** *)
//
#impltmp
g_print
<dctkind>(dck) =
dctkind_fprint
(g_print$out<>(), dck) // xbasics
//
#impltmp
g_print
<valkind>(vlk) =
valkind_fprint
(g_print$out<>(), vlk) // xbasics
#impltmp
g_print
<varkind>(vlk) =
varkind_fprint
(g_print$out<>(), vlk) // xbasics
//
#impltmp
g_print
<funkind>(fnk) =
funkind_fprint
(g_print$out<>(), fnk) // xbasics
//
#impltmp
g_print
<caskind>(csk) =
caskind_fprint
(g_print$out<>(), csk) // xbasics
//
#impltmp
g_print
<implknd>(knd) =
implknd_fprint
(g_print$out<>(), knd) // xbasics
//
(* ****** ****** *)
//
#impltmp
g_print
<f2clknd>(knd) =
f2clknd_fprint
(g_print$out<>(), knd) // xbasics
//
(* ****** ****** *)
//
#impltmp
g_print
<trcdknd>(knd) =
trcdknd_fprint
(g_print$out<>(), knd) // xbasics
//
(* ****** ****** *)
#impltmp
g_0<stamp>
((*void*)) =
the_stamp_nil
#impltmp
g_cmp<stamp> = stamp_cmp
#impltmp
g_print<stamp>(sym) =
stamp_fprint(g_print$out<>(), sym)
(* ****** ****** *)
#impltmp
g_0<symbl>
((*void*)) =
the_symbl_nil
#impltmp
g_cmp<symbl> = symbl_cmp
#impltmp
g_print<symbl>(sym) =
symbl_fprint(g_print$out<>(), sym)
(* ****** ****** *)
#impltmp
g_print<label>(lab) =
label_fprint(g_print$out<>(), lab)
(* ****** ****** *)
#impltmp
g_print<drpth>(dpx) =
drpth_fprint(g_print$out<>(), dpx)
#impltmp
g_print<fpath>(fpx) =
fpath_fprint(g_print$out<>(), fpx)
(* ****** ****** *)
#impltmp
g_cmp<postn> = postn_cmp
#impltmp
g_cmp<loctn> = loctn_cmp
#impltmp
g_print<lcsrc>(lcs) =
lcsrc_fprint(g_print$out<>(), lcs)
#impltmp
g_print<postn>(pos) =
postn_fprint(g_print$out<>(), pos)
#impltmp
g_print<loctn>(loc) =
loctn_fprint(g_print$out<>(), loc)
(* ****** ****** *)
#impltmp
g_print<tnode>(tnd) =
tnode_fprint(g_print$out<>(), tnd)
#impltmp
g_print<token>(tok) =
token_fprint(g_print$out<>(), tok)
(* ****** ****** *)
#impltmp
g_print<t0int>(tok) =
t0int_fprint(g_print$out<>(), tok)
#impltmp
g_print<t0chr>(tok) =
t0chr_fprint(g_print$out<>(), tok)
#impltmp
g_print<t0flt>(tok) =
t0flt_fprint(g_print$out<>(), tok)
#impltmp
g_print<t0str>(tok) =
t0str_fprint(g_print$out<>(), tok)
(* ****** ****** *)
#impltmp
g_print<i0dnt>(id0) =
i0dnt_fprint(g_print$out<>(), id0)
#impltmp
g_print<l0abl>(lab) =
l0abl_fprint(g_print$out<>(), lab)
#impltmp
g_print<s0ymb>(sym) =
s0ymb_fprint(g_print$out<>(), sym)
(* ****** ****** *)
//
(*
HX-2022-10-23:
xsymmap: topmap, stkmap
*)
#impltmp
{x0:t0}
g_print
<topmap(x0)>(map) =
topmap_fprint<x0>
( g_print$out<>( (*void*) ), map )
//
#impltmp
{x0:t0}
gl_print1
<stkmap(x0)>(map) =
stkmap_fprint1<x0>
( gl_print$out<>( (*void*) ), map )
//
(* ****** ****** *)

(*
HX: for level-0 syntax
*)

(* ****** ****** *)
(*
fun
<x0:t0>
s0lab_get_itm
(slab: s0lab(x0)): x0
*)
#impltmp
<x0>
s0lab_get_itm(slab) =
(
case+
slab of
S0LAB(l0,tk,x0) => (x0))
(* ****** ****** *)
//
(*
fun
<x0:type>
s0lab_fprint
(out: FILR, lab: s0lab(x0)): void
*)
//
#impltmp
<x0>
s0lab_fprint
  (out, lab) = let
//
#impltmp
g_print$out<>() = out
//
in//let
case+ lab of
|
S0LAB(l01,t02,x03) =>
print("S0LAB(",l01,";",x03,")")
end(*let*)//end-of-[s0lab_fprint]
//
#impltmp
{x0:t0}
g_print<s0lab(x0)>(lab) =
s0lab_fprint(g_print$out<>(), lab)
//
(* ****** ****** *)
(*
fun
<x0:t0>
d0lab_get_itm
(dlab: d0lab(x0)): x0
*)
#impltmp
<x0>
d0lab_get_itm(dlab) =
(
case+
dlab of
D0LAB(l0,tk,x0) => (x0))
(* ****** ****** *)
//
(*
fun
<x0:type>
d0lab_fprint
(out: FILR, lab: d0lab(x0)): void
*)
//
#impltmp
<x0>
d0lab_fprint
  (out, lab) = let
//
#impltmp
g_print$out<>() = out
//
in//let
case+ lab of
|
D0LAB(l01,t02,x03) =>
print("D0LAB(",l01,";",x03,")")
end(*let*)//end-of-[d0lab_fprint]
//
#impltmp
{x0:t0}
g_print<d0lab(x0)>(lab) =
d0lab_fprint(g_print$out<>(), lab)
//
(* ****** ****** *)
//
#impltmp
g_print<s0qid>(qid) =
s0qid_fprint(g_print$out<>(), qid)
#impltmp
g_print<d0qid>(qid) =
d0qid_fprint(g_print$out<>(), qid)
//
(* ****** ****** *)
//
#impltmp
g_print<g0nam>(gnm) =
g0nam_fprint(g_print$out<>(), gnm)
#impltmp
g_print<g0exp>(g0e) =
g0exp_fprint(g_print$out<>(), g0e)
#impltmp
g_print<g0mag>(gma) =
g0mag_fprint(g_print$out<>(), gma)
//
(* ****** ****** *)
#impltmp
g_print<g0exp_THEN>(gthn) =
g0exp_THEN_fprint(g_print$out<>(), gthn)
#impltmp
g_print<g0exp_ELSE>(gels) =
g0exp_ELSE_fprint(g_print$out<>(), gels)
(* ****** ****** *)
//
#impltmp
g_print<sort0>(s0t) =
sort0_fprint(g_print$out<>(), s0t)
//
(* ****** ****** *)
#impltmp
g_print<s0tcn>(tcn) =
s0tcn_fprint(g_print$out<>(), tcn)
#impltmp
g_print<d0tst>(dst) =
d0tst_fprint(g_print$out<>(), dst)
#impltmp
g_print<s0tdf>(tdf) =
s0tdf_fprint(g_print$out<>(), tdf)
(* ****** ****** *)
#impltmp
g_print<s0arg>(sag) =
s0arg_fprint(g_print$out<>(), sag)
#impltmp
g_print<s0mag>(smg) =
s0mag_fprint(g_print$out<>(), smg)
(* ****** ****** *)
#impltmp
g_print<t0arg>(tag) =
t0arg_fprint(g_print$out<>(), tag)
#impltmp
g_print<t0mag>(tmg) =
t0mag_fprint(g_print$out<>(), tmg)
(* ****** ****** *)
#impltmp
g_print<s0qua>(s0q) =
s0qua_fprint(g_print$out<>(), s0q)
(* ****** ****** *)
//
#impltmp
g_print<s0exp>(s0e) =
s0exp_fprint(g_print$out<>(), s0e)
#impltmp
g_print<s0exp_RPAREN>(srp0) =
s0exp_RPAREN_fprint(g_print$out<>(), srp0)
#impltmp
g_print<l0s0e_RBRACE>(lsrb) =
l0s0e_RBRACE_fprint(g_print$out<>(), lsrb)
//
(* ****** ****** *)
#impltmp
g_print<s0uni>(s0u) =
s0uni_fprint(g_print$out<>(), s0u)
(* ****** ****** *)
#impltmp
g_print<d0tcn>(dtc) =
d0tcn_fprint(g_print$out<>(), dtc)
#impltmp
g_print<d0typ>(dtp) =
d0typ_fprint(g_print$out<>(), dtp)
(* ****** ****** *)
//
#impltmp
g_print<d0pat>(d0p) =
d0pat_fprint(g_print$out<>(), d0p)
//
(* ****** ****** *)
//
#impltmp
g_print<f0arg>(f0a) =
f0arg_fprint(g_print$out<>(), f0a)
//
(* ****** ****** *)
//
#impltmp
g_print<d0cls>(d0c) =
d0cls_fprint(g_print$out<>(), d0c)
#impltmp
g_print<d0gua>(d0g) =
d0gua_fprint(g_print$out<>(), d0g)
#impltmp
g_print<d0gpt>(dgt) =
d0gpt_fprint(g_print$out<>(), dgt)
//
(* ****** ****** *)
//
#impltmp
g_print<d0exp>(d0e) =
d0exp_fprint(g_print$out<>(), d0e)
//
#impltmp
g_print<d0ecl>(dcl) =
d0ecl_fprint(g_print$out<>(), dcl)
//
(* ****** ****** *)
#impltmp
g_print<s0eff>(seff) =
s0eff_fprint(g_print$out<>(), seff)
#impltmp
g_print<s0res>(sres) =
s0res_fprint(g_print$out<>(), sres)
(* ****** ****** *)
#impltmp
g_print<t0qua>(tqua) =
t0qua_fprint(g_print$out<>(), tqua)
#impltmp
g_print<t0inv>(tinv) =
t0inv_fprint(g_print$out<>(), tinv)
(* ****** ****** *)
#impltmp
g_print<f0unarrw>(arrw) =
f0unarrw_fprint(g_print$out<>(), arrw)
(* ****** ****** *)
//
#impltmp
g_print<q0arg>(qarg) =
q0arg_fprint(g_print$out<>(), qarg)
//
#impltmp
g_print<s0qag>(sqag) =
s0qag_fprint(g_print$out<>(), sqag)
#impltmp
g_print<t0qag>(tqag) =
t0qag_fprint(g_print$out<>(), tqag)
//
#impltmp
g_print<t0iag>(tiag) =
t0iag_fprint(g_print$out<>(), tiag)
//
(* ****** ****** *)
#impltmp
g_print<a0typ>(a0tp) =
a0typ_fprint(g_print$out<>(), a0tp)
#impltmp
g_print<d0arg>(d0ag) =
d0arg_fprint(g_print$out<>(), d0ag)
(* ****** ****** *)
//
#impltmp
g_print<g0edf>(gedf) =
g0edf_fprint(g_print$out<>(), gedf)
#impltmp
g_print<d0edf>(dedf) =
d0edf_fprint(g_print$out<>(), dedf)
#impltmp
g_print<a0tdf>(atdf) =
a0tdf_fprint(g_print$out<>(), atdf)
//
(* ****** ****** *)
#impltmp
g_print<d0res>(dres) =
d0res_fprint(g_print$out<>(), dres)
(* ****** ****** *)
//
#impltmp
g_print<precopt>(opt) =
precopt_fprint(g_print$out<>(), opt)
#impltmp
g_print<precmod>(pmd) =
precmod_fprint(g_print$out<>(), pmd)
#impltmp
g_print<precint>(int) =
precint_fprint(g_print$out<>(), int)
//
(* ****** ****** *)
#impltmp
g_print<d0cstdcl>(dcst) =
d0cstdcl_fprint(g_print$out<>(), dcst)
(* ****** ****** *)
#impltmp
g_print<d0valdcl>(d0cl) =
d0valdcl_fprint(g_print$out<>(), d0cl)
#impltmp
g_print<d0vardcl>(d0cl) =
d0vardcl_fprint(g_print$out<>(), d0cl)
#impltmp
g_print<d0fundcl>(d0cl) =
d0fundcl_fprint(g_print$out<>(), d0cl)
(* ****** ****** *)
#impltmp
g_print<d0parsed>(dpar) =
d0parsed_fprint(g_print$out<>(), dpar)
(* ****** ****** *)
#impltmp
g_print<wd0eclseq>(wdcs) =
wd0eclseq_fprint(g_print$out<>(), wdcs)
(* ****** ****** *)
//
#impltmp
g_print<d0exp_THEN>(dthn) =
d0exp_THEN_fprint(g_print$out<>(), dthn)
#impltmp
g_print<d0exp_ELSE>(dels) =
d0exp_ELSE_fprint(g_print$out<>(), dels)
//
(* ****** ****** *)
#impltmp
g_print<tkend_WHERE>(tend) =
tkend_WHERE_fprint(g_print$out<>(), tend)
(* ****** ****** *)
//
#impltmp
g_print<d0pat_RPAREN>(drp0) =
d0pat_RPAREN_fprint(g_print$out<>(), drp0)
#impltmp
g_print<l0d0p_RBRACE>(ldrb) =
l0d0p_RBRACE_fprint(g_print$out<>(), ldrb)
//
(* ****** ****** *)
//
#impltmp
g_print<d0exp_RPAREN>(drp0) =
d0exp_RPAREN_fprint(g_print$out<>(), drp0)
#impltmp
g_print<l0d0e_RBRACE>(ldrb) =
l0d0e_RBRACE_fprint(g_print$out<>(), ldrb)
//
(* ****** ****** *)
#impltmp
g_print<d0eclseq_WHERE>(dcls) =
d0eclseq_WHERE_fprint(g_print$out<>(), dcls)
(* ****** ****** *)
//
#impltmp
g_print
<teqd0exp>(tdxp) =
(
case+ tdxp of
|
TEQD0EXPnone() =>
print("TEQD0EXPnone(", ")")
|
TEQD0EXPsome(tok, d0e) =>
print("TEQD0EXPsome(", tok, ";", d0e, ")"))
//
#impltmp
g_print
<wths0exp>(wsxp) =
(
case+ wsxp of
|
WTHS0EXPnone() =>
print("WTHS0EXPnone(", ")")
|
WTHS0EXPsome(tok, s0e) =>
print("WTHS0EXPsome(", tok, ";", s0e, ")"))
//
(* ****** ****** *)

(*
HX: for level-1 syntax
*)

(* ****** ****** *)
(*
fun
<x0:t0>
s1lab_get_itm
(slab: s1lab(x0)): x0
*)
#impltmp
<x0>
s1lab_get_itm(slab) =
(
case+
slab of S1LAB(l0, x0) => (x0))
(* ****** ****** *)
//
(*
fun
<x0:type>
s1lab_fprint
(out: FILR, lab: s1lab(x0)): void
*)
//
#impltmp
<x0>
s1lab_fprint
  (out, lab) = let
//
#impltmp
g_print$out<>() = out
//
in//let
case+ lab of
|
S1LAB(l01, x02) =>
print("S1LAB(",l01,";",x02,")")
end(*let*)//end-of-[s1lab_fprint]
//
#impltmp
{x0:t0}
g_print<s1lab(x0)>(lab) =
s1lab_fprint(g_print$out<>(), lab)
//
(* ****** ****** *)
(*
fun
<x0:t0>
d0lab_get_itm
(dlab: d0lab(x0)): x0
*)
#impltmp
<x0>
d1lab_get_itm(dlab) =
(
case+
dlab of
D1LAB(l0, x0) => (x0))
(* ****** ****** *)
//
(*
fun
<x0:type>
d1lab_fprint
(out: FILR, lab: d1lab(x0)): void
*)
//
#impltmp
<x0>
d1lab_fprint
  (out, lab) = let
//
#impltmp
g_print$out<>() = out
//
in//let
case+ lab of
|
D1LAB(l01, x02) =>
print("D1LAB(",l01,";",x02,")")
end(*let*)//end-of-[d1lab_fprint]
//
#impltmp
{x0:t0}
g_print<d1lab(x0)>(lab) =
d1lab_fprint(g_print$out<>(), lab)
//
(* ****** ****** *)
//
#impltmp
g_print<assoc>(asc) =
assoc_fprint(g_print$out<>(), asc)
//
(* ****** ****** *)
//
#impltmp
g_cmp<prcdv> = cmp_prcdv_prcdv
#impltmp
g_print<prcdv>(cdv) =
prcdv_fprint(g_print$out<>(), cdv)
//
(* ****** ****** *)
//
#impltmp
g_print<fixty>(fxt) =
fixty_fprint(g_print$out<>(), fxt)
//
#impltmp
{a:t0}
g_print<fxitm(a)>(fxi) =
fxitm_fprint<a>(g_print$out<>(), fxi)
//
(* ****** ****** *)
//
#impltmp
g_print<s1qid>(qid) =
s1qid_fprint(g_print$out<>(), qid)
#impltmp
g_print<d1qid>(qid) =
d1qid_fprint(g_print$out<>(), qid)
//
(* ****** ****** *)
//
#impltmp
g_print<g1nam>(gnm) =
g1nam_fprint(g_print$out<>(), gnm)
#impltmp
g_print<g1exp>(g1e) =
g1exp_fprint(g_print$out<>(), g1e)
//
#impltmp
g_print<g1arg>(g1a) =
g1arg_fprint(g_print$out<>(), g1a)
#impltmp
g_print<g1mag>(gma) =
g1mag_fprint(g_print$out<>(), gma)
//
(* ****** ****** *)
//
#impltmp
g_print<sort1>(s1t) =
sort1_fprint(g_print$out<>(), s1t)
//
(* ****** ****** *)
#impltmp
g_print<s1tcn>(tcn) =
s1tcn_fprint(g_print$out<>(), tcn)
#impltmp
g_print<d1tst>(dst) =
d1tst_fprint(g_print$out<>(), dst)
#impltmp
g_print<s1tdf>(tdf) =
s1tdf_fprint(g_print$out<>(), tdf)
(* ****** ****** *)
#impltmp
g_print<s1arg>(s1a) =
s1arg_fprint(g_print$out<>(), s1a)
#impltmp
g_print<s1mag>(s1m) =
s1mag_fprint(g_print$out<>(), s1m)
(* ****** ****** *)
#impltmp
g_print<t1arg>(t1a) =
t1arg_fprint(g_print$out<>(), t1a)
#impltmp
g_print<t1mag>(t1m) =
t1mag_fprint(g_print$out<>(), t1m)
(* ****** ****** *)
//
#impltmp
g_print<s1qua>(s1q) =
s1qua_fprint(g_print$out<>(), s1q)
//
(* ****** ****** *)
#impltmp
g_print<s1uni>(s1u) =
s1uni_fprint(g_print$out<>(), s1u)
#impltmp
g_print<d1tcn>(dtc) =
d1tcn_fprint(g_print$out<>(), dtc)
#impltmp
g_print<d1typ>(dtp) =
d1typ_fprint(g_print$out<>(), dtp)
(* ****** ****** *)
//
#impltmp
g_print<s1exp>(s1e) =
s1exp_fprint(g_print$out<>(), s1e)
//
(* ****** ****** *)
//
#impltmp
g_print<d1pat>(d1p) =
d1pat_fprint(g_print$out<>(), d1p)
(* ****** ****** *)
//
#impltmp
g_print<d1gua>(d1g) =
d1gua_fprint(g_print$out<>(), d1g)
#impltmp
g_print<d1gpt>(d1g) =
d1gpt_fprint(g_print$out<>(), d1g)
//
#impltmp
g_print<d1cls>(dcl) =
d1cls_fprint(g_print$out<>(), dcl)
//
(* ****** ****** *)
//
#impltmp
g_print<d1exp>(d1e) =
d1exp_fprint(g_print$out<>(), d1e)
//
(* ****** ****** *)
//
#impltmp
g_print<d1ecl>(dcl) =
d1ecl_fprint(g_print$out<>(), dcl)
//
(* ****** ****** *)
//
#impltmp
g_print<f1arg>(f1a) =
f1arg_fprint(g_print$out<>(), f1a)
//
(* ****** ****** *)
//
#impltmp
g_print<d1gua>(d1g) =
d1gua_fprint(g_print$out<>(), d1g)
#impltmp
g_print<d1gpt>(dgt) =
d1gpt_fprint(g_print$out<>(), dgt)
#impltmp
g_print<d1cls>(d1c) =
d1cls_fprint(g_print$out<>(), d1c)
//
(* ****** ****** *)
#impltmp
g_print<s1eff>(seff) =
s1eff_fprint(g_print$out<>(), seff)
#impltmp
g_print<s1res>(sres) =
s1res_fprint(g_print$out<>(), sres)
(* ****** ****** *)
#impltmp
g_print<t1qua>(tqua) =
t1qua_fprint(g_print$out<>(), tqua)
#impltmp
g_print<t1inv>(tinv) =
t1inv_fprint(g_print$out<>(), tinv)
(* ****** ****** *)
#impltmp
g_print<f1unarrw>(arrw) =
f1unarrw_fprint(g_print$out<>(), arrw)
(* ****** ****** *)
//
#impltmp
g_print<q1arg>(qarg) =
q1arg_fprint(g_print$out<>(), qarg)
//
#impltmp
g_print<s1qag>(sqag) =
s1qag_fprint(g_print$out<>(), sqag)
#impltmp
g_print<t1qag>(tqag) =
t1qag_fprint(g_print$out<>(), tqag)
//
(* ****** ****** *)
//
#impltmp
g_print<t1iag>(tiag) =
t1iag_fprint(g_print$out<>(), tiag)
//
(* ****** ****** *)
#impltmp
g_print<a1typ>(a1tp) =
a1typ_fprint(g_print$out<>(), a1tp)
#impltmp
g_print<d1arg>(d1ag) =
d1arg_fprint(g_print$out<>(), d1ag)
(* ****** ****** *)
//
#impltmp
g_print<a1tdf>(atdf) =
a1tdf_fprint(g_print$out<>(), atdf)
//
(* ****** ****** *)
#impltmp
g_print<d1cstdcl>(dcst) =
d1cstdcl_fprint(g_print$out<>(), dcst)
(* ****** ****** *)
#impltmp
g_print<d1valdcl>(dval) =
d1valdcl_fprint(g_print$out<>(), dval)
#impltmp
g_print<d1vardcl>(dvar) =
d1vardcl_fprint(g_print$out<>(), dvar)
#impltmp
g_print<d1fundcl>(dfun) =
d1fundcl_fprint(g_print$out<>(), dfun)
(* ****** ****** *)
//
#impltmp
g_print
<d1topenv>(tenv) =
(
case+ tenv of
| D1TOPENV(tmap) => g_print(tmap))
//
(* ****** ****** *)
#impltmp
g_print<d1parsed>(dpar) =
d1parsed_fprint(g_print$out<>(), dpar)
(* ****** ****** *)
#impltmp
g_print<wd1eclseq>(wdcs) =
wd1eclseq_fprint(g_print$out<>(), wdcs)
(* ****** ****** *)
//
#impltmp
g_print
<teqd1exp>(tdxp) =
(
case+ tdxp of
|
TEQD1EXPnone() =>
print("TEQD1EXPnone(", ")")
|
TEQD1EXPsome(tok1, d1e2) =>
print("TEQD1EXPsome(", tok1, ";", d1e2, ")"))
//
#impltmp
g_print
<wths1exp>(wsxp) =
(
case+ wsxp of
|
WTHS1EXPnone() =>
print("WTHS1EXPnone(", ")")
|
WTHS1EXPsome(tok1, s1e2) =>
print("WTHS1EXPsome(", tok1, ";", s1e2, ")"))
//
(* ****** ****** *)
(*
HX-2022-12-04:
for gmacro1: it is
between level-1 and level-2
*)
(* ****** ****** *)
//
#impltmp
g_print
<g1mac>(g1m0) =
let
val out =
g_print$out<>()
in//let
  g1mac_fprint(out, g1m0) end
#impltmp
g_print
<g1env>(genv) =
let
val out =
g_print$out<>()
in//let
  g1env_fprint(out, genv) end
//
(* ****** ****** *)

(*
HX: for level-2 syntax
*)

(* ****** ****** *)
//
#impltmp
g_cmp<s2cst>
(s2c1, s2c2) =
(
s2c1.stmp() \cmp s2c2.stmp())
//
#impltmp
g_cmp<s2var>
(s2v1, s2v2) =
(
s2v1.stmp() \cmp s2v2.stmp())
//
(* ****** ****** *)
#impltmp
g_cmp<d2var>
(d2v1, d2v2) =
(
d2v1.stmp() \cmp d2v2.stmp())
//
(* ****** ****** *)
(*
fun
<x0:t0>
s2lab_get_itm
(slab: s2lab(x0)): x0
*)
#impltmp
<x0>
s2lab_get_itm(slab) =
(
case+
slab of S2LAB(l0, x0) => (x0))
(* ****** ****** *)
//
(*
fun
<x0:type>
s2lab_fprint
(out: FILR, lab: s2lab(x0)): void
*)
//
#impltmp
<x0>
s2lab_fprint
  (out, lab) = let
//
#impltmp
g_print$out<>() = out
//
in//let
case+ lab of
|
S2LAB(l01, x02) =>
print("S2LAB(",l01,";",x02,")")
end(*let*)//end-of-[s2lab_fprint]
//
#impltmp
{x0:t0}
g_print<s2lab(x0)>(lab) =
s2lab_fprint(g_print$out<>(), lab)
//
(* ****** ****** *)
(*
fun
<x0:t0>
d2lab_get_itm
(dlab: d2lab(x0)): x0
*)
#impltmp
<x0>
d2lab_get_itm(dlab) =
(
case+
dlab of D2LAB(l0, x0) => (x0))
(* ****** ****** *)
//
(*
fun
<x0:type>
d2lab_fprint
(out: FILR, lab: d2lab(x0)): void
*)
//
#impltmp
<x0>
d2lab_fprint
  (out, lab) = let
//
#impltmp
g_print$out<>() = out
//
in//let
case+ lab of
|
D2LAB(l01, x02) =>
print("D2LAB(",l01,";",x02,")")
end(*let*)//end-of-[d2lab_fprint]
//
#impltmp
{x0:t0}
g_print<d2lab(x0)>(lab) =
d2lab_fprint(g_print$out<>(), lab)
//
(* ****** ****** *)
//
#impltmp
g_print<t2abs>(t2a) =
t2abs_fprint(g_print$out<>(), t2a)
//
#impltmp
g_print<t2bas>(t2b) =
t2bas_fprint(g_print$out<>(), t2b)
//
#impltmp
g_print<t2dat>(t2d) =
t2dat_fprint(g_print$out<>(), t2d)
//
(* ****** ****** *)
//
#impltmp
g_print<sort2>(s2t) =
sort2_fprint(g_print$out<>(), s2t)
//
(* ****** ****** *)
//
#impltmp
g_print<s2cst>(s2c) =
s2cst_fprint(g_print$out<>(), s2c)
#impltmp
g_print<s2var>(s2v) =
s2var_fprint(g_print$out<>(), s2v)
//
(* ****** ****** *)
//
#impltmp
g_print<s2exp>(s2e) =
s2exp_fprint(g_print$out<>(), s2e)
#impltmp
g_print<s2typ>(stp) =
s2typ_fprint(g_print$out<>(), stp)
#impltmp
g_print<x2t2p>(xtp) =
x2t2p_fprint(g_print$out<>(), xtp)
//
(* ****** ****** *)
#impltmp
g_print<s2tex>(stx) =
s2tex_fprint(g_print$out<>(), stx)
(* ****** ****** *)
#impltmp
g_print<s2itm>(s2i) =
s2itm_fprint(g_print$out<>(), s2i)
(* ****** ****** *)
//
#impltmp
g_print<d2con>(d2c) =
d2con_fprint(g_print$out<>(), d2c)
#impltmp
g_print<d2cst>(d2c) =
d2cst_fprint(g_print$out<>(), d2c)
//
#impltmp
g_print<d2var>(d2v) =
d2var_fprint(g_print$out<>(), d2v)
//
(* ****** ****** *)
//
#impltmp
g_print<d2itm>(d2i) =
d2itm_fprint(g_print$out<>(), d2i)
#impltmp
g_print<d2ptm>(dpi) =
d2ptm_fprint(g_print$out<>(), dpi)
//
(* ****** ****** *)
//
#impltmp
g_print<d2pat>(d2p) =
d2pat_fprint(g_print$out<>(), d2p)
//
(* ****** ****** *)
#impltmp
g_print<f2arg>(f2a) =
f2arg_fprint(g_print$out<>(), f2a)
(* ****** ****** *)
//
#impltmp
g_print<d2gua>(d2g) =
d2gua_fprint(g_print$out<>(), d2g)
#impltmp
g_print<d2gpt>(d2g) =
d2gpt_fprint(g_print$out<>(), d2g)
//
#impltmp
g_print<d2cls>(dcl) =
d2cls_fprint(g_print$out<>(), dcl)
//
(* ****** ****** *)
//
#impltmp
g_print<d2exp>(d2e) =
d2exp_fprint(g_print$out<>(), d2e)
//
(* ****** ****** *)
//
#impltmp
g_print<d2ecl>(dcl) =
d2ecl_fprint(g_print$out<>(), dcl)
//
(* ****** ****** *)
#impltmp
g_print<s2eff>(seff) =
s2eff_fprint(g_print$out<>(), seff)
#impltmp
g_print<s2res>(sres) =
s2res_fprint(g_print$out<>(), sres)
(* ****** ****** *)
//
#impltmp
g_print<s2qag>(sqag) =
s2qag_fprint(g_print$out<>(), sqag)
#impltmp
g_print<t2qag>(tqag) =
t2qag_fprint(g_print$out<>(), tqag)
#impltmp
g_print<t2iag>(tiag) =
t2iag_fprint(g_print$out<>(), tiag)
//
(* ****** ****** *)
#impltmp
g_print<a2tdf>(atdf) =
a2tdf_fprint(g_print$out<>(), atdf)
(* ****** ****** *)
#impltmp
g_print<simpl>(s2i0) =
simpl_fprint(g_print$out<>(), s2i0)
#impltmp
g_print<dimpl>(d2i0) =
dimpl_fprint(g_print$out<>(), d2i0)
(* ****** ****** *)
#impltmp
g_print<d2arg>(darg) =
d2arg_fprint(g_print$out<>(), darg)
(* ****** ****** *)
//
#impltmp
g_print<d2valdcl>(dval) =
d2valdcl_fprint(g_print$out<>(), dval)
#impltmp
g_print<d2vardcl>(dvar) =
d2vardcl_fprint(g_print$out<>(), dvar)
//
(* ****** ****** *)
//
#impltmp
g_print<d2fundcl>(dfun) =
d2fundcl_fprint(g_print$out<>(), dfun)
//
(* ****** ****** *)
//
#impltmp
g_print<d2cstdcl>(dcst) =
d2cstdcl_fprint(g_print$out<>(), dcst)
//
(* ****** ****** *)
#impltmp
g_print<d2parsed>(dpar) =
d2parsed_fprint(g_print$out<>(), dpar)
(* ****** ****** *)
//
#impltmp
g_print
<teqd2exp>(tdxp) =
(
case+ tdxp of
|
TEQD2EXPnone() =>
print("TEQD2EXPnone(", ")")
|
TEQD2EXPsome(tok0, d2e1) =>
print("TEQD2EXPsome(", tok0, ";", d2e1, ")"))
//
#impltmp
g_print
<wths2exp>(wsxp) =
(
case+ wsxp of
|
WTHS2EXPnone() =>
print("WTHS2EXPnone(", ")")
|
WTHS2EXPsome(tok0, s2e1) =>
print("WTHS2EXPsome(", tok0, ";", s2e1, ")"))
//
(* ****** ****** *)
(*
HX-2022-12-28: For debugging purpose
*)
(* ****** ****** *)
//
(*
#impltmp
g_print<s2cst>(s2c0) =
let
val out = g_print$out<>()
in//let
  strn_fprint(out, "("); s2cst_fprint(out, s2c0)
; strn_fprint(out, ":"); sort2_fprint(out, s2c0.sort()); strn_fprint(out, ")")
end (*let*) // end of [g_print<s2cst>(s2c0)]
*)
//
(*
#impltmp
g_print<s2var>(s2v0) =
let
val out = g_print$out<>()
in//let
  strn_fprint(out, "("); s2var_fprint(out, s2v0)
; strn_fprint(out, ":"); sort2_fprint(out, s2v0.sort()); strn_fprint(out, ")")
end (*let*) // end of [g_print<s2var>(s2v0)]
*)
//
(* ****** ****** *)
//
(*
#impltmp
g_print<s2exp>(s2e0) =
let
val out = g_print$out<>()
in//let
  strn_fprint(out, "("); s2exp_fprint(out, s2e0)
; strn_fprint(out, ":"); sort2_fprint(out, s2e0.sort()); strn_fprint(out, ")")
end (*let*) // end of [g_print<s2exp>(s2e0)]
*)
//
(*
#impltmp
g_print<s2typ>(t2p0) =
let
val out = g_print$out<>()
in//let
  strn_fprint(out, "("); s2typ_fprint(out, t2p0)
; strn_fprint(out, ":"); sort2_fprint(out, t2p0.sort()); strn_fprint(out, ")")
end (*let*) // end of [g_print<s2typ>(t2p0)]
*)
//
(* ****** ****** *)
//
#impltmp
g_print<d2pat>(d2p0) =
let
val out = g_print$out<>()
in//let
  strn_fprint(out, "("); d2pat_fprint(out, d2p0)
; strn_fprint(out, ":"); s2typ_fprint(out, d2p0.styp()); strn_fprint(out, ")")
end (*let*) // end of [g_print<d2pat>(d2p0)]
//
#impltmp
g_print<d2exp>(d2e0) =
let
val out = g_print$out<>()
in//let
  strn_fprint(out, "("); d2exp_fprint(out, d2e0)
; strn_fprint(out, ":"); s2typ_fprint(out, d2e0.styp()); strn_fprint(out, ")")
end (*let*) // end of [g_print<d2exp>(d2e0)]
//
(* ****** ****** *)

(* end of [ATS3/XATSOPT_srcgen2_xatsopt_tmplib.dats] *)

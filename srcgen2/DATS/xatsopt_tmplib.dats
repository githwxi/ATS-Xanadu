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
#staload "./../SATS/dynexp3.sats"
(* ****** ****** *)
(* ****** ****** *)
#symload stmp with s2cst_get_stmp
#symload stmp with s2var_get_stmp
(* ****** ****** *)
#symload stmp with x2t2p_get_stmp
(* ****** ****** *)
#symload stmp with d2con_get_stmp
#symload stmp with d2cst_get_stmp
#symload stmp with d2var_get_stmp
(* ****** ****** *)
(* ****** ****** *)
//
#impltmp
g_print
<dctkind>(dck) =
dctkind_fprint
(dck, g_print$out<>()) // xbasics
//
#impltmp
g_print
<valkind>(vlk) =
valkind_fprint
(vlk, g_print$out<>()) // xbasics
#impltmp
g_print
<varkind>(vlk) =
varkind_fprint
(vlk, g_print$out<>()) // xbasics
//
#impltmp
g_print
<funkind>(fnk) =
funkind_fprint
(fnk, g_print$out<>()) // xbasics
//
#impltmp
g_print
<caskind>(csk) =
caskind_fprint
(csk, g_print$out<>()) // xbasics
//
#impltmp
g_print
<implknd>(knd) =
implknd_fprint
(knd, g_print$out<>()) // xbasics
//
(* ****** ****** *)
//
#impltmp
g_equal
<f2clknd>(k1, k2) =
f2clknd_equal(k1, k2)
//
#impltmp
g_print
<f2clknd>(knd) =
f2clknd_fprint
(knd, g_print$out<>()) // xbasics
//
(* ****** ****** *)
//
#impltmp
g_equal
<trcdknd>(k1, k2) =
trcdknd_equal(k1, k2)
//
#impltmp
g_print
<trcdknd>(knd) =
trcdknd_fprint
(knd, g_print$out<>()) // xbasics
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
stamp_fprint(sym, g_print$out<>())
(* ****** ****** *)
#impltmp
g_0<symbl>
((*void*)) =
the_symbl_nil
#impltmp
g_cmp<symbl> = symbl_cmp
#impltmp
g_print<symbl>(sym) =
symbl_fprint(sym, g_print$out<>())
(* ****** ****** *)
#impltmp
g_cmp<label> = label_cmp
#impltmp
g_print<label>(lab) =
label_fprint(lab, g_print$out<>())
(* ****** ****** *)
#impltmp
g_print<drpth>(dpx) =
drpth_fprint(dpx, g_print$out<>())
#impltmp
g_print<fpath>(fpx) =
fpath_fprint(fpx, g_print$out<>())
(* ****** ****** *)
#impltmp
g_print<fname>(fnm) =
fname_fprint(fnm, g_print$out<>())
(* ****** ****** *)
#impltmp
g_cmp<postn> = postn_cmp
#impltmp
g_cmp<loctn> = loctn_cmp
#impltmp
g_print<lcsrc>(lcs) =
lcsrc_fprint(lcs, g_print$out<>())
#impltmp
g_print<postn>(pos) =
postn_fprint(pos, g_print$out<>())
#impltmp
g_print<loctn>(loc) =
loctn_fprint(loc, g_print$out<>())
(* ****** ****** *)
#impltmp
g_print<tnode>(tnd) =
tnode_fprint(tnd, g_print$out<>())
#impltmp
g_print<token>(tok) =
token_fprint(tok, g_print$out<>())
(* ****** ****** *)
#impltmp
g_print<t0int>(tok) =
t0int_fprint(tok, g_print$out<>())
#impltmp
g_print<t0chr>(tok) =
t0chr_fprint(tok, g_print$out<>())
#impltmp
g_print<t0flt>(tok) =
t0flt_fprint(tok, g_print$out<>())
#impltmp
g_print<t0str>(tok) =
t0str_fprint(tok, g_print$out<>())
(* ****** ****** *)
#impltmp
g_print<i0dnt>(id0) =
i0dnt_fprint(id0, g_print$out<>())
#impltmp
g_print<l0abl>(lab) =
l0abl_fprint(lab, g_print$out<>())
#impltmp
g_print<s0ymb>(sym) =
s0ymb_fprint(sym, g_print$out<>())
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
( map, g_print$out<>( (*void*) ) )
//
#impltmp
{x0:t0}
g_print1
<stkmap(x0)>(map) =
stkmap_fprint1<x0>
( map, g_print$out<>( (*void*) ) )
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
(lab: s0lab(x0), out: FILR): void
*)
//
#impltmp
<x0>
s0lab_fprint
  (lab, out) = let
//
#impltmp
g_print$out<>() = out
//
in//let
case+ lab of
|
S0LAB(l01,t02,x03) =>
prints("S0LAB(",l01,";",x03,")")
end(*let*)//end-of-[s0lab_fprint]
//
#impltmp
{x0:t0}
g_print<s0lab(x0)>(lab) =
s0lab_fprint(lab, g_print$out<>())
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
(lab: d0lab(x0), out: FILR): void
*)
//
#impltmp
<x0>
d0lab_fprint
  (lab, out) = let
//
#impltmp
g_print$out<>() = out
//
in//let
case+ lab of
|
D0LAB(l01,t02,x03) =>
prints("D0LAB(",l01,";",x03,")")
end(*let*)//end-of-[d0lab_fprint]
//
#impltmp
{x0:t0}
g_print<d0lab(x0)>(lab) =
d0lab_fprint(lab, g_print$out<>())
//
(* ****** ****** *)
//
#impltmp
g_print<s0qid>(qid) =
s0qid_fprint(qid, g_print$out<>())
#impltmp
g_print<d0qid>(qid) =
d0qid_fprint(qid, g_print$out<>())
//
(* ****** ****** *)
//
#impltmp
g_print<g0nam>(gnm) =
g0nam_fprint(gnm, g_print$out<>())
#impltmp
g_print<g0exp>(g0e) =
g0exp_fprint(g0e, g_print$out<>())
#impltmp
g_print<g0mag>(gma) =
g0mag_fprint(gma, g_print$out<>())
//
(* ****** ****** *)
//
#impltmp
g_print<g0exp_THEN>(gthn) =
g0exp_THEN_fprint(gthn, g_print$out<>())
#impltmp
g_print<g0exp_ELSE>(gels) =
g0exp_ELSE_fprint(gels, g_print$out<>())
//
(* ****** ****** *)
(* ****** ****** *)
//
#impltmp
g_print<sort0>(s0t) =
sort0_fprint(s0t, g_print$out<>())
//
(* ****** ****** *)
#impltmp
g_print<s0tcn>(tcn) =
s0tcn_fprint(tcn, g_print$out<>())
#impltmp
g_print<d0tst>(dst) =
d0tst_fprint(dst, g_print$out<>())
#impltmp
g_print<s0tdf>(tdf) =
s0tdf_fprint(tdf, g_print$out<>())
(* ****** ****** *)
#impltmp
g_print<s0arg>(sag) =
s0arg_fprint(sag, g_print$out<>())
#impltmp
g_print<s0mag>(smg) =
s0mag_fprint(smg, g_print$out<>())
(* ****** ****** *)
#impltmp
g_print<t0arg>(tag) =
t0arg_fprint(tag, g_print$out<>())
#impltmp
g_print<t0mag>(tmg) =
t0mag_fprint(tmg, g_print$out<>())
(* ****** ****** *)
#impltmp
g_print<s0qua>(s0q) =
s0qua_fprint(s0q, g_print$out<>())
(* ****** ****** *)
(* ****** ****** *)
//
#impltmp
g_print<s0exp>(s0e) =
s0exp_fprint(s0e, g_print$out<>())
#impltmp
g_print<s0exp_RPAREN>(srp0) =
s0exp_RPAREN_fprint(srp0, g_print$out<>())
#impltmp
g_print<l0s0e_RBRACE>(lsrb) =
l0s0e_RBRACE_fprint(lsrb, g_print$out<>())
//
(* ****** ****** *)
#impltmp
g_print<s0uni>(s0u) =
s0uni_fprint(s0u, g_print$out<>())
(* ****** ****** *)
#impltmp
g_print<d0tcn>(dtc) =
d0tcn_fprint(dtc, g_print$out<>())
#impltmp
g_print<d0typ>(dtp) =
d0typ_fprint(dtp, g_print$out<>())
(* ****** ****** *)
//
#impltmp
g_print<d0pat>(d0p) =
d0pat_fprint(d0p, g_print$out<>())
//
(* ****** ****** *)
//
#impltmp
g_print<f0arg>(f0a) =
f0arg_fprint(f0a, g_print$out<>())
//
(* ****** ****** *)
//
#impltmp
g_print<d0gua>(d0g) =
d0gua_fprint(d0g, g_print$out<>())
#impltmp
g_print<d0gpt>(dgt) =
d0gpt_fprint(dgt, g_print$out<>())
#impltmp
g_print<d0cls>(d0c) =
d0cls_fprint(d0c, g_print$out<>())
//
(* ****** ****** *)
//
#impltmp
g_print<d0exp>(d0e) =
d0exp_fprint(d0e, g_print$out<>())
//
#impltmp
g_print<d0ecl>(dcl) =
d0ecl_fprint(dcl, g_print$out<>())
//
(* ****** ****** *)
#impltmp
g_print<s0eff>(seff) =
s0eff_fprint(seff, g_print$out<>())
#impltmp
g_print<s0res>(sres) =
s0res_fprint(sres, g_print$out<>())
(* ****** ****** *)
#impltmp
g_print<t0qua>(tqua) =
t0qua_fprint(tqua, g_print$out<>())
#impltmp
g_print<t0inv>(tinv) =
t0inv_fprint(tinv, g_print$out<>())
(* ****** ****** *)
#impltmp
g_print<f0unarrw>(arrw) =
f0unarrw_fprint(arrw, g_print$out<>())
(* ****** ****** *)
//
#impltmp
g_print<q0arg>(qarg) =
q0arg_fprint(qarg, g_print$out<>())
//
#impltmp
g_print<s0qag>(sqag) =
s0qag_fprint(sqag, g_print$out<>())
#impltmp
g_print<t0qag>(tqag) =
t0qag_fprint(tqag, g_print$out<>())
//
#impltmp
g_print<t0iag>(tiag) =
t0iag_fprint(tiag, g_print$out<>())
//
(* ****** ****** *)
#impltmp
g_print<a0typ>(a0tp) =
a0typ_fprint(a0tp, g_print$out<>())
#impltmp
g_print<d0arg>(d0ag) =
d0arg_fprint(d0ag, g_print$out<>())
(* ****** ****** *)
//
#impltmp
g_print<g0edf>(gedf) =
g0edf_fprint(gedf, g_print$out<>())
#impltmp
g_print<d0edf>(dedf) =
d0edf_fprint(dedf, g_print$out<>())
#impltmp
g_print<a0tdf>(atdf) =
a0tdf_fprint(atdf, g_print$out<>())
//
(* ****** ****** *)
#impltmp
g_print<d0res>(dres) =
d0res_fprint(dres, g_print$out<>())
(* ****** ****** *)
//
#impltmp
g_print<precopt>(opt) =
precopt_fprint(opt, g_print$out<>())
#impltmp
g_print<precmod>(pmd) =
precmod_fprint(pmd, g_print$out<>())
#impltmp
g_print<precint>(int) =
precint_fprint(int, g_print$out<>())
//
(* ****** ****** *)
#impltmp
g_print<d0cstdcl>(dcst) =
d0cstdcl_fprint(dcst, g_print$out<>())
(* ****** ****** *)
#impltmp
g_print<d0valdcl>(dval) =
d0valdcl_fprint(dval, g_print$out<>())
#impltmp
g_print<d0vardcl>(dvar) =
d0vardcl_fprint(dvar, g_print$out<>())
#impltmp
g_print<d0fundcl>(dfun) =
d0fundcl_fprint(dfun, g_print$out<>())
(* ****** ****** *)
#impltmp
g_print<d0parsed>(dpar) =
d0parsed_fprint(dpar, g_print$out<>())
(* ****** ****** *)
#impltmp
g_print<wd0eclseq>(wdcls) =
wd0eclseq_fprint(wdcls, g_print$out<>())
(* ****** ****** *)
//
#impltmp
g_print<d0exp_THEN>(dthn) =
d0exp_THEN_fprint(dthn, g_print$out<>())
#impltmp
g_print<d0exp_ELSE>(dels) =
d0exp_ELSE_fprint(dels, g_print$out<>())
//
(* ****** ****** *)
#impltmp
g_print<tkend_WHERE>(tend) =
tkend_WHERE_fprint(tend, g_print$out<>())
(* ****** ****** *)
//
#impltmp
g_print<d0pat_RPAREN>(drp0) =
d0pat_RPAREN_fprint(drp0, g_print$out<>())
#impltmp
g_print<l0d0p_RBRACE>(ldrb) =
l0d0p_RBRACE_fprint(ldrb, g_print$out<>())
//
(* ****** ****** *)
//
#impltmp
g_print<d0exp_RPAREN>(drp0) =
d0exp_RPAREN_fprint(drp0, g_print$out<>())
#impltmp
g_print<l0d0e_RBRACE>(ldrb) =
l0d0e_RBRACE_fprint(ldrb, g_print$out<>())
//
(* ****** ****** *)
#impltmp
g_print<d0eclseq_WHERE>(dcls) =
d0eclseq_WHERE_fprint(dcls, g_print$out<>())
(* ****** ****** *)
//
#impltmp
g_print
<teqd0exp>(tdxp) =
(
case+ tdxp of
|
TEQD0EXPnone() =>
prints("TEQD0EXPnone(", ")")
|
TEQD0EXPsome(tok, d0e) =>
prints
("TEQD0EXPsome(", tok, ";", d0e, ")"))
//
#impltmp
g_print
<wths0exp>(wsxp) =
(
case+ wsxp of
|
WTHS0EXPnone() =>
prints("WTHS0EXPnone(", ")")
|
WTHS0EXPsome(tok, s0e) =>
prints("WTHS0EXPsome(", tok, ";", s0e, ")"))
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
(lab: s1lab(x0), out: FILR): void
*)
//
#impltmp
<x0>
s1lab_fprint
  (lab, out) = let
//
#impltmp
g_print$out<>() = out
//
in//let
case+ lab of
|
S1LAB(l01, x02) =>
prints("S1LAB(",l01,";",x02,")")
end(*let*)//end-of-[s1lab_fprint]
//
#impltmp
{x0:t0}
g_print<s1lab(x0)>(lab) =
s1lab_fprint(lab, g_print$out<>())
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
(lab: d1lab(x0), out: FILR): void
*)
//
#impltmp
<x0>
d1lab_fprint
  (lab, out) = let
//
#impltmp
g_print$out<>() = out
//
in//let
case+ lab of
|
D1LAB(l01, x02) =>
prints("D1LAB(",l01,";",x02,")")
end(*let*)//end-of-[d1lab_fprint]
//
#impltmp
{x0:t0}
g_print<d1lab(x0)>(lab) =
d1lab_fprint(lab, g_print$out<>())
//
(* ****** ****** *)
//
#impltmp
g_print<assoc>(asc) =
assoc_fprint(asc, g_print$out<>())
//
(* ****** ****** *)
//
#impltmp
g_cmp<prcdv> = cmp_prcdv_prcdv
#impltmp
g_print<prcdv>(cdv) =
prcdv_fprint(cdv, g_print$out<>())
//
(* ****** ****** *)
//
#impltmp
g_print<fixty>(fxt) =
fixty_fprint(fxt, g_print$out<>())
//
#impltmp
{a:t0}
g_print<fxitm(a)>(fxi) =
fxitm_fprint<a>(fxi, g_print$out<>())
//
(* ****** ****** *)
//
#impltmp
g_print<s1qid>(sqid) =
s1qid_fprint(sqid, g_print$out<>())
#impltmp
g_print<d1qid>(dqid) =
d1qid_fprint(dqid, g_print$out<>())
//
(* ****** ****** *)
//
#impltmp
g_print<g1nam>(gnm) =
g1nam_fprint(gnm, g_print$out<>())
#impltmp
g_print<g1exp>(g1e) =
g1exp_fprint(g1e, g_print$out<>())
//
#impltmp
g_print<g1arg>(g1a) =
g1arg_fprint(g1a, g_print$out<>())
#impltmp
g_print<g1mag>(gma) =
g1mag_fprint(gma, g_print$out<>())
//
(* ****** ****** *)
//
#impltmp
g_print<sort1>(s1t) =
sort1_fprint(s1t, g_print$out<>())
//
(* ****** ****** *)
#impltmp
g_print<s1tcn>(tcn) =
s1tcn_fprint(tcn, g_print$out<>())
#impltmp
g_print<d1tst>(dst) =
d1tst_fprint(dst, g_print$out<>())
#impltmp
g_print<s1tdf>(tdf) =
s1tdf_fprint(tdf, g_print$out<>())
(* ****** ****** *)
#impltmp
g_print<s1arg>(s1a) =
s1arg_fprint(s1a, g_print$out<>())
#impltmp
g_print<s1mag>(s1m) =
s1mag_fprint(s1m, g_print$out<>())
(* ****** ****** *)
#impltmp
g_print<t1arg>(t1a) =
t1arg_fprint(t1a, g_print$out<>())
#impltmp
g_print<t1mag>(t1m) =
t1mag_fprint(t1m, g_print$out<>())
(* ****** ****** *)
//
#impltmp
g_print<s1qua>(s1q) =
s1qua_fprint(s1q, g_print$out<>())
//
(* ****** ****** *)
#impltmp
g_print<s1uni>(s1u) =
s1uni_fprint(s1u, g_print$out<>())
#impltmp
g_print<d1tcn>(dtc) =
d1tcn_fprint(dtc, g_print$out<>())
#impltmp
g_print<d1typ>(dtp) =
d1typ_fprint(dtp, g_print$out<>())
(* ****** ****** *)
//
#impltmp
g_print<s1exp>(s1e) =
s1exp_fprint(s1e, g_print$out<>())
//
(* ****** ****** *)
//
#impltmp
g_print<d1pat>(d1p) =
d1pat_fprint(d1p, g_print$out<>())
(* ****** ****** *)
//
#impltmp
g_print<d1gua>(d1g) =
d1gua_fprint(d1g, g_print$out<>())
#impltmp
g_print<d1gpt>(d1g) =
d1gpt_fprint(d1g, g_print$out<>())
#impltmp
g_print<d1cls>(dcl) =
d1cls_fprint(dcl, g_print$out<>())
//
(* ****** ****** *)
//
#impltmp
g_print<d1exp>(d1e) =
d1exp_fprint(d1e, g_print$out<>())
//
(* ****** ****** *)
//
#impltmp
g_print<d1ecl>(dcl) =
d1ecl_fprint(dcl, g_print$out<>())
//
(* ****** ****** *)
//
#impltmp
g_print<f1arg>(f1a) =
f1arg_fprint(f1a, g_print$out<>())
//
(* ****** ****** *)
//
#impltmp
g_print<d1gua>(d1g) =
d1gua_fprint(d1g, g_print$out<>())
#impltmp
g_print<d1gpt>(dgt) =
d1gpt_fprint(dgt, g_print$out<>())
#impltmp
g_print<d1cls>(d1c) =
d1cls_fprint(d1c, g_print$out<>())
//
(* ****** ****** *)
#impltmp
g_print<s1eff>(seff) =
s1eff_fprint(seff, g_print$out<>())
#impltmp
g_print<s1res>(sres) =
s1res_fprint(sres, g_print$out<>())
(* ****** ****** *)
#impltmp
g_print<t1qua>(tqua) =
t1qua_fprint(tqua, g_print$out<>())
#impltmp
g_print<t1inv>(tinv) =
t1inv_fprint(tinv, g_print$out<>())
(* ****** ****** *)
#impltmp
g_print<f1unarrw>(arrw) =
f1unarrw_fprint(arrw, g_print$out<>())
(* ****** ****** *)
//
#impltmp
g_print<q1arg>(qarg) =
q1arg_fprint(qarg, g_print$out<>())
//
#impltmp
g_print<s1qag>(sqag) =
s1qag_fprint(sqag, g_print$out<>())
#impltmp
g_print<t1qag>(tqag) =
t1qag_fprint(tqag, g_print$out<>())
//
(* ****** ****** *)
//
#impltmp
g_print<t1iag>(tiag) =
t1iag_fprint(tiag, g_print$out<>())
//
(* ****** ****** *)
#impltmp
g_print<a1typ>(a1tp) =
a1typ_fprint(a1tp, g_print$out<>())
#impltmp
g_print<d1arg>(d1ag) =
d1arg_fprint(d1ag, g_print$out<>())
(* ****** ****** *)
//
#impltmp
g_print<a1tdf>(atdf) =
a1tdf_fprint(atdf, g_print$out<>())
//
(* ****** ****** *)
#impltmp
g_print<d1cstdcl>(dcst) =
d1cstdcl_fprint(dcst, g_print$out<>())
(* ****** ****** *)
#impltmp
g_print<d1valdcl>(dval) =
d1valdcl_fprint(dval, g_print$out<>())
#impltmp
g_print<d1vardcl>(dvar) =
d1vardcl_fprint(dvar, g_print$out<>())
#impltmp
g_print<d1fundcl>(dfun) =
d1fundcl_fprint(dfun, g_print$out<>())
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
d1parsed_fprint(dpar, g_print$out<>())
(* ****** ****** *)
#impltmp
g_print<wd1eclseq>(wdcs) =
wd1eclseq_fprint(wdcs, g_print$out<>())
(* ****** ****** *)
//
#impltmp
g_print
<teqd1exp>(tdxp) =
(
case+ tdxp of
|
TEQD1EXPnone() =>
prints("TEQD1EXPnone(", ")")
|
TEQD1EXPsome(tok1, d1e2) =>
prints
("TEQD1EXPsome(", tok1, ";", d1e2, ")"))
//
#impltmp
g_print
<wths1exp>(wsxp) =
(
case+ wsxp of
|
WTHS1EXPnone() =>
prints("WTHS1EXPnone(", ")")
|
WTHS1EXPsome(tok1, s1e2) =>
prints("WTHS1EXPsome(", tok1, ";", s1e2, ")"))
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
  g1mac_fprint(g1m0, out) end
#impltmp
g_print
<g1env>(genv) =
let
val out =
g_print$out<>()
in//let
  g1env_fprint(genv, out) end
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
#impltmp
g_cmp<x2t2p>
(xtp1, xtp2) =
(
xtp1.stmp() \cmp xtp2.stmp())
//
(* ****** ****** *)
//
#impltmp
g_cmp<d2con>
(d2c1, d2c2) =
(
d2c1.stmp() \cmp d2c2.stmp())
//
#impltmp
g_cmp<d2cst>
(d2c1, d2c2) =
(
d2c1.stmp() \cmp d2c2.stmp())
//
#impltmp
g_cmp<d2var>
(d2v1, d2v2) =
(
d2v1.stmp() \cmp d2v2.stmp())
//
(* ****** ****** *)
//
#impltmp
{x0:t0}
g_cmp<s2lab(x0)>
(  slx1, slx2  ) =
(
g_cmp<label>(l1, l2) where
{
val+S2LAB(l1, itm1) = slx1
val+S2LAB(l2, itm2) = slx2} )
//
(* ****** ****** *)
//
#impltmp
g_equal<s2var>
( s2v1, s2v2 ) = (s2v1 = s2v2)
#impltmp
g_equal<s2cst>
( s2c1, s2c2 ) = (s2c1 = s2c2)
//
#impltmp
g_equal<d2con>
( d2c1, d2c2 ) = (d2c1 = d2c2)
#impltmp
g_equal<d2cst>
( d2c1, d2c2 ) = (d2c1 = d2c2)
#impltmp
g_equal<d2var>
( d2v1, d2v2 ) = (d2v1 = d2v2)
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
(lab: s2lab(x0), out: FILR): void
*)
//
#impltmp
<x0>
s2lab_fprint
  (lab, out) = let
//
#impltmp
g_print$out<>() = out
//
in//let
case+ lab of
|
S2LAB(l01, x02) =>
prints("S2LAB(",l01,";",x02,")")
end(*let*)//end-of-[s2lab_fprint]
//
#impltmp
{x0:t0}
g_print<s2lab(x0)>(lab) =
s2lab_fprint(lab, g_print$out<>())
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
  (lab, out) = let
//
#impltmp
g_print$out<>() = out
//
in//let
case+ lab of
|
D2LAB(l01, x02) =>
prints("D2LAB(",l01,";",x02,")")
end(*let*)//end-of-[d2lab_fprint]
//
#impltmp
{x0:t0}
g_print<d2lab(x0)>(lab) =
d2lab_fprint(lab, g_print$out<>())
//
(* ****** ****** *)
//
#impltmp
g_print<t2abs>(t2a) =
t2abs_fprint(t2a, g_print$out<>())
//
#impltmp
g_print<t2bas>(t2b) =
t2bas_fprint(t2b, g_print$out<>())
//
#impltmp
g_print<t2dat>(t2d) =
t2dat_fprint(t2d, g_print$out<>())
//
(* ****** ****** *)
//
#impltmp
g_print<sort2>(s2t) =
sort2_fprint(s2t, g_print$out<>())
//
(* ****** ****** *)
//
#impltmp
g_print<s2cst>(s2c) =
s2cst_fprint(s2c, g_print$out<>())
#impltmp
g_print<s2var>(s2v) =
s2var_fprint(s2v, g_print$out<>())
//
(* ****** ****** *)
//
#impltmp
g_print<s2arg>(s2a) =
s2arg_fprint(s2a, g_print$out<>())
//
(* ****** ****** *)
//
#impltmp
g_print<s2exp>(s2e) =
s2exp_fprint(s2e, g_print$out<>())
#impltmp
g_print<s2typ>(stp) =
s2typ_fprint(stp, g_print$out<>())
#impltmp
g_print<x2t2p>(xtp) =
x2t2p_fprint(xtp, g_print$out<>())
//
(* ****** ****** *)
#impltmp
g_print<s2tex>(stx) =
s2tex_fprint(stx, g_print$out<>())
(* ****** ****** *)
#impltmp
g_print<s2itm>(s2i) =
s2itm_fprint(s2i, g_print$out<>())
(* ****** ****** *)
//
#impltmp
g_print<d2con>(d2c) =
d2con_fprint(d2c, g_print$out<>())
#impltmp
g_print<d2cst>(d2c) =
d2cst_fprint(d2c, g_print$out<>())
//
#impltmp
g_print<d2var>(d2v) =
d2var_fprint(d2v, g_print$out<>())
//
(* ****** ****** *)
//
#impltmp
g_print<d2itm>(d2i) =
d2itm_fprint(d2i, g_print$out<>())
#impltmp
g_print<d2ptm>(dpi) =
d2ptm_fprint(dpi, g_print$out<>())
//
(* ****** ****** *)
//
#impltmp
g_print<d2pat>(d2p) =
d2pat_fprint(d2p, g_print$out<>())
#impltmp
g_print<d2rpt>(drf) =
d2rpt_fprint(drf, g_print$out<>())
//
(* ****** ****** *)
//
#impltmp
g_print<d2exp>(d2e) =
d2exp_fprint(d2e, g_print$out<>())
#impltmp
g_print<d2rxp>(drf) =
d2rxp_fprint(drf, g_print$out<>())
//
(* ****** ****** *)
//
#impltmp
g_print<f2arg>(f2a) =
f2arg_fprint(f2a, g_print$out<>())
//
(* ****** ****** *)
//
#impltmp
g_print<d2gua>(d2g) =
d2gua_fprint(d2g, g_print$out<>())
#impltmp
g_print<d2gpt>(d2g) =
d2gpt_fprint(d2g, g_print$out<>())
#impltmp
g_print<d2cls>(dcl) =
d2cls_fprint(dcl, g_print$out<>())
//
(* ****** ****** *)
//
#impltmp
g_print<d2ecl>(dcl) =
d2ecl_fprint(dcl, g_print$out<>())
//
(* ****** ****** *)
#impltmp
g_print<s2eff>(seff) =
s2eff_fprint(seff, g_print$out<>())
#impltmp
g_print<s2res>(sres) =
s2res_fprint(sres, g_print$out<>())
(* ****** ****** *)
//
#impltmp
g_print<s2qag>(sqag) =
s2qag_fprint(sqag, g_print$out<>())
#impltmp
g_print<t2qag>(tqag) =
t2qag_fprint(tqag, g_print$out<>())
#impltmp
g_print<t2iag>(tiag) =
t2iag_fprint(tiag, g_print$out<>())
//
#impltmp
g_print<t2jag>(tjag) =
t2jag_fprint(tjag, g_print$out<>())
//
(* ****** ****** *)
#impltmp
g_print<a2tdf>(atdf) =
a2tdf_fprint(atdf, g_print$out<>())
(* ****** ****** *)
#impltmp
g_print<simpl>(simp) =
simpl_fprint(simp, g_print$out<>())
#impltmp
g_print<dimpl>(dimp) =
dimpl_fprint(dimp, g_print$out<>())
(* ****** ****** *)
#impltmp
g_print<d2arg>(darg) =
d2arg_fprint(darg, g_print$out<>())
(* ****** ****** *)
//
#impltmp
g_print<d2valdcl>(dval) =
d2valdcl_fprint(dval, g_print$out<>())
#impltmp
g_print<d2vardcl>(dvar) =
d2vardcl_fprint(dvar, g_print$out<>())
//
(* ****** ****** *)
//
#impltmp
g_print<d2fundcl>(dfun) =
d2fundcl_fprint(dfun, g_print$out<>())
//
(* ****** ****** *)
//
#impltmp
g_print<d2cstdcl>(dcst) =
d2cstdcl_fprint(dcst, g_print$out<>())
//
(* ****** ****** *)
#impltmp
g_print<d2parsed>(dpar) =
d2parsed_fprint(dpar, g_print$out<>())
(* ****** ****** *)
//
#impltmp
g_print
<teqd2exp>(tdxp) =
(
case+ tdxp of
|
TEQD2EXPnone() =>
prints("TEQD2EXPnone(", ")")
|
TEQD2EXPsome(tok0, d2e1) =>
prints("TEQD2EXPsome(", tok0, ";", d2e1, ")"))
//
#impltmp
g_print
<wths2exp>(wsxp) =
(
case+ wsxp of
|
WTHS2EXPnone() =>
prints("WTHS2EXPnone(", ")")
|
WTHS2EXPsome(tok0, s2e1) =>
prints("WTHS2EXPsome(", tok0, ";", s2e1, ")"))
//
(* ****** ****** *)
//
#impltmp
g_print
<f2env>(fenv) = print("<f2env>")
//
(* ****** ****** *)
//
#impltmp
g_print
<s2taloadopt>(dopt) =
(
case+ dopt of
|S2TALOADnone() =>
(
 prints("S2TALOADnone(", ")"))
|S2TALOADfenv(fenv) =>
(
 prints("S2TALOADfenv(", fenv, ")"))
|S2TALOADdpar(knd0, dpar) =>
(
 prints("S2TALOADdpar(", knd0, ";", dpar, ")")))
//
(* ****** ****** *)
(*
HX: for level-3 syntax
*)
(* ****** ****** *)
//
(*
fun
<x0:t0>
d3lab_get_itm
(dlab: d3lab(x0)): x0
*)
#impltmp
<x0>
d3lab_get_itm(dlab) =
(
case+
dlab of D3LAB(l0, x0) => (x0))
//
(* ****** ****** *)
//
(*
fun
<x0:type>
d3lab_fprint
(out: FILR, lab: d3lab(x0)): void
*)
//
#impltmp
<x0>
d3lab_fprint
  (lab, out) = let
//
#impltmp
g_print$out<>() = out
//
in//let
case+ lab of
|
D3LAB(l01, x02) =>
prints("D3LAB(",l01,";",x02,")")
end(*let*)//end-of-[d3lab_fprint]
//
#impltmp
{x0:t0}
g_print<d3lab(x0)>(dlab) =
d3lab_fprint(dlab, g_print$out<>())
//
(* ****** ****** *)
//
#impltmp
g_print<d3pat>(dpat) =
d3pat_fprint(dpat, g_print$out<>())
//
(* ****** ****** *)
//
#impltmp
g_print<d3exp>(dexp) =
d3exp_fprint(dexp, g_print$out<>())
//
(* ****** ****** *)
//
#impltmp
g_print<f3arg>(farg) =
f3arg_fprint(farg, g_print$out<>())
//
(* ****** ****** *)
//
#impltmp
g_print<d3gua>(dgua) =
d3gua_fprint(dgua, g_print$out<>())
#impltmp
g_print<d3gpt>(dgpt) =
d3gpt_fprint(dgpt, g_print$out<>())
#impltmp
g_print<d3cls>(dcls) =
d3cls_fprint(dcls, g_print$out<>())
//
(* ****** ****** *)
//
#impltmp
g_print<timpl>(timp) =
timpl_fprint(timp, g_print$out<>())
//
(* ****** ****** *)
//
#impltmp
g_print<d3ecl>(d3cl) =
d3ecl_fprint(d3cl, g_print$out<>())
//
(* ****** ****** *)
//
#impltmp
g_print<d3valdcl>(dval) =
d3valdcl_fprint(dval, g_print$out<>())
#impltmp
g_print<d3vardcl>(dvar) =
d3vardcl_fprint(dvar, g_print$out<>())
#impltmp
g_print<d3fundcl>(dfun) =
d3fundcl_fprint(dfun, g_print$out<>())
//
(* ****** ****** *)
//
#impltmp
g_print
<d3topenv>(tenv) =
let
(*
#impltmp
g_print$out<>() = out
*)
in//let
(
case+ tenv of
|
D3TOPENVnone() =>
prints("D3TOPENVnone(", ")")
|
D3TOPENVsome(tmap) =>
prints("D3TOPENVsome(", tmap, ")"))end
//
(* ****** ****** *)
//
#impltmp
g_print<d3parsed>(dpar) =
d3parsed_fprint(dpar, g_print$out<>())
//
(* ****** ****** *)
//
#impltmp
g_print
<teqd3exp>(tdxp) =
let
(*
#impltmp
g_print$out<>() = out
*)
in//let
(
case+ tdxp of
|
TEQD3EXPnone() =>
prints("TEQD3EXPnone(", ")")
|
TEQD3EXPsome(tok0, d3e1) =>
prints("TEQD3EXPsome(",tok0,";",d3e1,")"))
endlet // end-of-[g_print<teqd3exp>(tdxp)]
//
(* ****** ****** *)
//
#impltmp
g_print
<s3taloadopt>(dopt) =
(
case+ dopt of
|S3TALOADnone(dopt) =>
(
 prints("S3TALOADnone(", dopt, ")"))
|S3TALOADdpar(knd0, dpar) =>
(
 prints("S3TALOADdpar(", knd0, ";", dpar, ")")))
//
(* ****** ****** *)
(* ****** ****** *)
(*
HX-2022-12-28: For debugging purpose
*)
(* ****** ****** *)
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
(* ****** ****** *)
//
(*
#impltmp
g_print<d2var>(d2v0) =
let
//
val out = g_print$out<>()
//
#symload styp with d2var_get_styp
//
in//let
  strn_fprint(out, "("); d2var_fprint(out, d2v0)
; strn_fprint(out, ":"); s2typ_fprint(out, d2v0.styp()); strn_fprint(out, ")")
end (*let*) // end of [g_print<d2var>(d2v0)]
*)
//
(* ****** ****** *)
(* ****** ****** *)
//
(*
#impltmp
g_print<d2pat>(d2p0) =
let
val out = g_print$out<>()
in//let
  strn_fprint(out, "("); d2pat_fprint(out, d2p0)
; strn_fprint(out, ":"); s2typ_fprint(out, d2p0.styp()); strn_fprint(out, ")")
end (*let*) // end of [g_print<d2pat>(d2p0)]
*)
//
(* ****** ****** *)
(* ****** ****** *)
//
(*
#impltmp
g_print<d2exp>(d2e0) =
let
val out = g_print$out<>()
in//let
  strn_fprint(out, "("); d2exp_fprint(out, d2e0)
; strn_fprint(out, ":"); s2typ_fprint(out, d2e0.styp()); strn_fprint(out, ")")
end (*let*) // end of [g_print<d2exp>(d2e0)]
*)
//
(* ****** ****** *)
(* ****** ****** *)
//
(***********************************************************************)
(* end of [ATS3/XATSOPT_srcgen2_DATS_xatsopt_tmplib.dats] *)
(***********************************************************************)

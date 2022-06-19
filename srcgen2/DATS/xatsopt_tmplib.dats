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
(* ****** ****** *)
#staload "./../SATS/filpath.sats"
(* ****** ****** *)
#staload "./../SATS/locinfo.sats"
(* ****** ****** *)
#staload "./../SATS/lexing0.sats"
(* ****** ****** *)
#staload "./../SATS/staexp0.sats"
#staload "./../SATS/dynexp0.sats"
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
S0LAB(l01, t02, x03) =>
print("S0LAB(",l01,";",x03,")")
end(*let*)//end-of-[s0lab_fprint]
//
#impltmp
{x0:t0}
g_print<s0lab(x0)>(lab) =
s0lab_fprint(g_print$out<>(), lab)
//
(* ****** ****** *)
//
#impltmp
g_print<s0qid>(qid) =
s0qid_fprint(g_print$out<>(), qid)
#impltmp
g_print
<d0qid>(qid) =
d0qid_fprint(g_print$out<>(), qid)
//
(* ****** ****** *)
//
#impltmp
g_print<g0nam>(nam) =
g0nam_fprint(g_print$out<>(), nam)
#impltmp
g_print<g0exp>(exp) =
g0exp_fprint(g_print$out<>(), exp)
#impltmp
g_print<g0mag>(mag) =
g0mag_fprint(g_print$out<>(), mag)
//
(* ****** ****** *)
//
#impltmp
g_print<s0tcn>(tcn) =
s0tcn_fprint(g_print$out<>(), tcn)
#impltmp
g_print<d0tst>(dst) =
d0tst_fprint(g_print$out<>(), dst)
#impltmp
g_print<s0tdf>(tdf) =
s0tdf_fprint(g_print$out<>(), tdf)
//
#impltmp
g_print<sort0>(s0t) =
sort0_fprint(g_print$out<>(), s0t)
//
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
//
#impltmp
g_print<s0exp_RPAREN>(srp) =
s0exp_RPAREN_fprint(g_print$out<>(), srp)
#impltmp
g_print<l0s0e_RBRACE>(lsrb) =
l0s0e_RBRACE_fprint(g_print$out<>(), lsrb)
//
(* ****** ****** *)
//
#impltmp
g_print<d0pat>(d0p) =
d0pat_fprint(g_print$out<>(), d0p)
#impltmp
g_print<d0exp>(d0e) =
d0exp_fprint(g_print$out<>(), d0e)
#impltmp
g_print<d0ecl>(dcl) =
d0ecl_fprint(g_print$out<>(), dcl)
//
(* ****** ****** *)

(* end of [ATS3/XATSOPT_xatsopt_libtmp.dats] *)

(***********************************************************************)
(*                                                                     *)
(*                         Applied Type System                         *)
(*                                                                     *)
(***********************************************************************)

(*
** ATS/Xanadu - Unleashing the Potential of Types!
** Copyright (C) 2026 Hongwei Xi, ATS Trustful Software, Inc.
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
(* ****** ****** *)
//
(*
Author: Hongwei Xi
//
Sat Mar  7 09:25:22 AM EST 2026
//
Authoremail: gmhwxiATgmailDOTcom
*)
//
(* ****** ****** *)
(* ****** ****** *)
#include
"./../../..\
/HATS/xatsopt_sats.hats"
(* ****** ****** *)
(* ****** ****** *)
//
#staload "./intrep0.sats"
//
(* ****** ****** *)
(* ****** ****** *)
#absvtbx envd3i0_vtbx // p0tr
#vwtpdef envd3i0 = envd3i0_vtbx
(* ****** ****** *)
(* ****** ****** *)
//
fun
envd3i0_make_nil
  ( (*void*) ): envd3i0
fun
envd3i0_free_top
  ( env0: !envd3i0 ): void
//
(* ****** ****** *)
(* ****** ****** *)
//
fun
<x0:t0>
<y0:t0>
list_trxd3i0_fnp
(
xs: list(x0),
e1: !envd3i0,
fopr: (x0, !envd3i0)->y0): list(y0)
fun
<x0:t0>
<y0:t0>
optn_trxd3i0_fnp
(
xs: optn(x0),
e1: !envd3i0,
fopr: (x0, !envd3i0)->y0): optn(y0)
//
(* ****** ****** *)
(* ****** ****** *)
//
fun
s2typ_trxd3i0
(s2t0: s2typ, env0: !envd3i0): i0typ
//
(* ****** ****** *)
//
fun
t2jag_trxd3i0
(tjag: t2jag, env0: !envd3i0): i0jag
//
(* ****** ****** *)
(* ****** ****** *)
//
fun
d3pat_trxd3i0
(d3p0: d3pat, env0: !envd3i0): i0pat
fun
l3d3p_trxd3i0
(ld3p: l3d3p, env0: !envd3i0): l0i0p
//
(* ****** ****** *)
//
fun
d3exp_trxd3i0
(d3e0: d3exp, env0: !envd3i0): i0exp
fun
l3d3e_trxd3i0
(ld3e: l3d3e, env0: !envd3i0): l0i0e
//
(* ****** ****** *)
(* ****** ****** *)
//
fun
d3gua_trxd3i0
(dgua: d3gua, env0: !envd3i0): i0gua
fun
d3gpt_trxd3i0
(dgpt: d3gpt, env0: !envd3i0): i0gpt
fun
d3cls_trxd3i0
(dcls: d3cls, env0: !envd3i0): i0cls
//
(* ****** ****** *)
(* ****** ****** *)
//
fun
d3ecl_trxd3i0
(d3cl: d3ecl, env0: !envd3i0): i0dcl
//
(* ****** ****** *)
(* ****** ****** *)
//
fun
s2typlst_trxd3i0
(t2ps: s2typlst, env0: !envd3i0): i0typlst
//
(* ****** ****** *)
//
fun
t2jaglst_trxd3i0
(tjgs: t2jaglst, env0: !envd3i0): i0jaglst
//
(* ****** ****** *)
(* ****** ****** *)
//
fun
d3patlst_trxd3i0
(d3ps: d3patlst, env0: !envd3i0): i0patlst
fun
l3d3plst_trxd3i0
(ldps: l3d3plst, env0: !envd3i0): l0i0plst
//
(* ****** ****** *)
//
fun
d3explst_trxd3i0
(d3es: d3explst, env0: !envd3i0): i0explst
fun
d3expopt_trxd3i0
(dopt: d3expopt, env0: !envd3i0): i0expopt
fun
l3d3elst_trxd3i0
(ldes: l3d3elst, env0: !envd3i0): l0i0elst
//
(* ****** ****** *)
(* ****** ****** *)
//
fun
d3gualst_trxd3i0
(d3gs: d3gualst, env0: !envd3i0): i0gualst
fun
d3clslst_trxd3i0
(dcls: d3clslst, env0: !envd3i0): i0clslst
//
(* ****** ****** *)
(* ****** ****** *)
//
fun
d3eclist_trxd3i0
(dcls: d3eclist, env0: !envd3i0): i0dclist
//
(* ****** ****** *)
(* ****** ****** *)
//
fun
d3valdcl_trxd3i0
(dval: d3valdcl, env0: !envd3i0): i0valdcl
fun
d3vardcl_trxd3i0
(dval: d3vardcl, env0: !envd3i0): i0vardcl
//
fun
d3fundcl_trxd3i0
(dfun: d3fundcl, env0: !envd3i0): i0fundcl
//
(* ****** ****** *)
(* ****** ****** *)
//
fun
d3valdclist_trxd3i0
(d3vs: d3valdclist, env0: !envd3i0): i0valdclist
fun
d3vardclist_trxd3i0
(d3vs: d3vardclist, env0: !envd3i0): i0vardclist
//
fun
d3fundclist_trxd3i0
(d3fs: d3fundclist, env0: !envd3i0): i0fundclist
//
(* ****** ****** *)
//
fun
d3eclistopt_trxd3i0
(dcls: d3eclistopt, env0: !envd3i0): i0dclistopt
//
(* ****** ****** *)
(* ****** ****** *)
//
(***********************************************************************)
(* end of [ATS3/XANADU_srcgen2_xats2cc_srcgen1_SATS_trxd3i0.sats] *)
(***********************************************************************)

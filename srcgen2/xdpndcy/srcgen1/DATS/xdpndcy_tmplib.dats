(***********************************************************************)
(*                                                                     *)
(*                         Applied Type System                         *)
(*                                                                     *)
(***********************************************************************)

(*
** ATS/Xanadu - Unleashing the Potential of Types!
** Copyright (C) 2024 Hongwei Xi, ATS Trustful Software, Inc.
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
(*
Sun Apr  6 03:06:28 PM EDT 2025
*)
Authoremail: gmhwxiATgmailDOTcom
*)
//
(* ****** ****** *)
(* ****** ****** *)
//
#staload
"./../SATS/xdpndcy.sats"
//
(* ****** ****** *)
(* ****** ****** *)
#include
"./../HATS/libxatsopt.hats"
(* ****** ****** *)
(* ****** ****** *)
//
#symload
  node with token_get_node
#symload
  node with g1exp_get_node
#symload
  node with d2ecl_get_node
//
(* ****** ****** *)
(* ****** ****** *)
//
#include
"prelude/HATS/prelude_dats.hats"
//
#include
"xatslib\
/libcats/HATS/libcats_dats.hats"
#include
"xatslib\
/libcats/HATS/libcats_NODE_dats.hats"
//
(* ****** ****** *)
(* ****** ****** *)
//
#extern
fun
g1exp_fprint
(gexp: g1exp, out0: FILR): void
#extern
fun
d2ecl_fprint
(d2cl: d2ecl, out0: FILR): void
//
(* ****** ****** *)
(* ****** ****** *)
//
#symload prints with gs_print_a0
#symload prints with gs_print_a1
#symload prints with gs_print_a2
#symload prints with gs_print_a3
#symload prints with gs_print_a4
#symload prints with gs_print_a5
#symload prints with gs_print_a6
#symload prints with gs_print_a7
#symload prints with gs_print_a8
#symload prints with gs_print_a9
#symload prints with gs_print_a10
#symload prints with gs_print_a11
#symload prints with gs_print_a12
//
(* ****** ****** *)
(* ****** ****** *)
//
#impltmp
g_print<strn>(x0) =
strn_fprint<>(x0, g_stderr<>())
//
#impltmp
g_prerr
<g1exp>(gexp) =
g1exp_fprint(gexp, g_stderr<>())
#impltmp
g_prerr
<d2ecl>(d2cl) =
d2ecl_fprint(d2cl, g_stderr<>())
//
(* ****** ****** *)
//
#impltmp
g_print<strn>(x0) =
strn_fprint<>(x0, g_print$out<>())
//
#impltmp
g_print
<g1exp>(gexp) =
g1exp_fprint(gexp, g_print$out<>())
#impltmp
g_print
<d2ecl>(d2cl) =
d2ecl_fprint(d2cl, g_print$out<>())
//
(* ****** ****** *)
(* ****** ****** *)
//
#implfun
g1exp_fprint
(gexp, out0) =
(
case+
gexp.node() of
//
|
G1Estr(tokn) =>
(
case+
tokn.node() of
|
T_STRN1_clsd
(str1, len2) =>
prints("G1Estr(", str1, ")")
|
T_STRN2_ncls
(str1, len2) =>
prints("G1Estr(", str1, ")")
| _(*otherwise*) =>
prints("G1Estr(", "...", ")")
)
//
|
G1Eid0(sym1) =>
let
val name = sym1.name()
in//let
prints("G1Eid0(", name, ")")
end//let//end-of-[G1Eid0(...)]
//
|
G1Ea1pp
(g1e1, g1e2) =>
prints
("G1Ea1pp(", g1e1, ",", g1e2, ")")
|
G1Ea2pp
(g1e1, g1e2, g1e3) =>
prints
("G1Ea2pp(",g1e1,",",g1e2,",",g1e3,")")
//
| _(*otherwise*) =>
(
  prints("g1exp_fprint(otherwise)"))
//
) where
{
  #impltmp g_print$out<>() = (   out0   )
}(*where*)//end-of-[g1exp_fprint(gexp,out0)]
//
(* ****** ****** *)
(* ****** ****** *)
//
#implfun
d2ecl_fprint
(d2cl, out0) =
(
case+
d2cl.node() of
//
| D2Cinclude
( stdy, tokn
, gsrc, fopt, dopt) =>
(
  prints("D2Cinclude(",gsrc,")"))
//
| D2Cstaload
( stdy, tokn
, gsrc, fopt, sopt) =>
(
  prints("D2Cstaload(",gsrc,")"))
//
| _(*otherwise*) =>
(
  prints("d2ecl_fprint(otherwise)"))
) where
{
  #impltmp g_print$out<>() = (   out0   )
}(*where*)//end-of-[d2ecl_fprint(d2cl,out0)
//
(* ****** ****** *)
(* ****** ****** *)
//
(* ****** ****** *)(* ****** ****** *)(* ****** ****** *)
(* ****** ****** *)(* ****** ****** *)(* ****** ****** *)

(* end of [ATS3/XATSOPT_srcgen2_xdpndcy_srcgen1_xdpndcy_tmplib.dats] *)

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
#impltmp
g_print
<d2ecl>(d2cl) =
d2ecl_fprint(d2cl, g_stdout())
#impltmp
g_prerr
<d2ecl>(d2cl) =
d2ecl_fprint(d2cl, g_stderr())
(* ****** ****** *)
#impltmp
g_fprint<g1exp> = g1exp_fprint(*0*)
#impltmp
g_fprint<d2ecl> = d2ecl_fprint(*0*)
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
| G1Estr(tokn) =>
(
case+
tokn.node() of
|
T_STRN1_clsd
(str1, len2) =>
(
  strn_fprint(str1, out0))
|
T_STRN2_ncls
(str1, len2) =>
(
  strn_fprint(str1, out0))
| _(*otherwise*) => ((*void*))
)
//
| _(*otherwise*) => (   (*void*)   )
//
)(* end-of-[g1exp_fprint(gexp,out0)] *)
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
  g1exp_fprint(gsrc, out0))
//
| D2Cstaload
( stdy, tokn
, gsrc, fopt, sopt) =>
(
  g1exp_fprint(gsrc, out0))
//
| _(*otherwise*) => (   (*void*)   )
)
//
(* ****** ****** *)
(* ****** ****** *)
//
(* ****** ****** *)(* ****** ****** *)(* ****** ****** *)
(* ****** ****** *)(* ****** ****** *)(* ****** ****** *)

(* end of [ATS3/XATSOPT_srcgen2_xdpndcy_srcgen1_xdpndcy_tmplib.dats] *)

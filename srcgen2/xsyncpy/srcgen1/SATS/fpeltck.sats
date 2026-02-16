(***********************************************************************)
(*                                                                     *)
(*                         Applied Type System                         *)
(*                                                                     *)
(***********************************************************************)

(*
** ATS/Xanadu - Unleashing the Potential of Types!
** Copyright (C) 2025 Hongwei Xi, ATS Trustful Software, Inc.
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
Sat Nov  1 10:34:34 PM EDT 2025
*)
Authoremail: gmhwxiATgmailDOTcom
*)
//
(* ****** ****** *)
(* ****** ****** *)
//
#include
"xatslib\
/libcats\
/HATS/libcats_dats.hats"
//
(* ****** ****** *)
(* ****** ****** *)
//
#staload
"./../SATS/statyp2.sats"
#staload
"./../SATS/dynexp3.sats"
//
(* ****** ****** *)
(* ****** ****** *)
#typedef
fpeltck_t
(syn:tbox) = (FILR, syn)->void
(* ****** ****** *)
//
fun
list_fpeltck_fnp
{ syn:tbox }
( out: FILR,
  list(syn), fpeltck_t(syn)): void
fun
optn_fpeltck_fnp
{ syn:tbox }
( out: FILR,
  optn(syn), fpeltck_t(syn)): void
//
(* ****** ****** *)
(*
HX: fpeltck for statics
*)
(* ****** ****** *)
fun
fpeltck_s2typ1(FILR, s2typ1): void
(* ****** ****** *)
(*
HX: fpeltck for dynamics
*)
(* ****** ****** *)
fun
fpeltck_d3pat1(FILR, d3pat1): void
fun
fpeltck_d3axp1(FILR, d3axp1): void
fun
fpeltck_d3exp1(FILR, d3exp1): void
(* ****** ****** *)
fun
fpeltck_f3arg1(FILR, f3arg1): void
fun
fpeltck_f3axp1(FILR, f3axp1): void
(* ****** ****** *)
fun
fpeltck_d3gpt1(FILR, d3gpt1): void
fun
fpeltck_d3cls1(FILR, d3cls1): void
(* ****** ****** *)
fun
fpeltck_d3ecl1(FILR, d3ecl1): void
(* ****** ****** *)
fun
fpeltck_s2typ1lst(FILR, s2typ1lst): void
(* ****** ****** *)
//
fun
fpeltck_d3pat1lst(FILR, d3pat1lst): void
fun
fpeltck_d3axp1lst(FILR, d3axp1lst): void
fun
fpeltck_d3exp1lst(FILR, d3exp1lst): void
//
fun
fpeltck_d3pat1opt(FILR, d3pat1opt): void
fun
fpeltck_d3exp1opt(FILR, d3exp1opt): void
//
(* ****** ****** *)
fun
fpeltck_l3d3p1lst(FILR, l3d3p1lst): void
fun
fpeltck_l3d3e1lst(FILR, l3d3e1lst): void
(* ****** ****** *)
fun
fpeltck_f3arg1lst(FILR, f3arg1lst): void
fun
fpeltck_f3axp1lst(FILR, f3axp1lst): void
(* ****** ****** *)
fun
fpeltck_d3cls1lst(FILR, d3cls1lst): void
(* ****** ****** *)
fun
fpeltck_teqd3exp1(FILR, teqd3exp1): void
(* ****** ****** *)
fun
fpeltck_d3ecl1lst(FILR, d3ecl1lst): void
fun
fpeltck_d3ecl1opt(FILR, d3ecl1opt): void
(* ****** ****** *)
fun
fpeltck_d3valdcl1(FILR, d3valdcl1): void
fun
fpeltck_d3vardcl1(FILR, d3vardcl1): void
fun
fpeltck_d3fundcl1(FILR, d3fundcl1): void
(* ****** ****** *)
fun
fpeltck_d3valdcl1lst(FILR, d3valdcl1lst): void
(* ****** ****** *)
fun
fpeltck_d3vardcl1lst(FILR, d3vardcl1lst): void
(* ****** ****** *)
fun
fpeltck_d3fundcl1lst(FILR, d3fundcl1lst): void
(* ****** ****** *)
(* ****** ****** *)
//
fun
fpeltck_d3parsed1
(out0 : FILR, dpar : d3parsed1): void//end-fun
//
(* ****** ****** *)
//
fun
fpeltck_d3exp1lstopt(FILR, d3exp1lstopt): void
fun
fpeltck_d3ecl1lstopt(FILR, d3ecl1lstopt): void
//
(* ****** ****** *)
(* ****** ****** *)
//
(***********************************************************************)
(* end of [ATS3/XATSOPT_srcgen2_xsyncpy_srcgen1_SATS_fpeltck.sats] *)
(***********************************************************************)

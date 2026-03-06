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
(*
Sun Feb 22 09:23:05 PM EST 2026
*)
Authoremail: gmhwxiATgmailDOTcom
*)
//
(* ****** ****** *)
(* ****** ****** *)
//
(*
HX: for [FILR]
*)
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
#staload
"./../SATS/intrep0.sats"
//
(* ****** ****** *)
(* ****** ****** *)
//
#absvtbx envd3i0_vtbx // p0tr
#vwtpdef envd3i0 = envd3i0_vtbx
//
(* ****** ****** *)
(* ****** ****** *)
//
fun
s2typ1_trxd3i0
(t2q0: s2typ1, env0: !envd3i0): i0typ1
//
(* ****** ****** *)
(* ****** ****** *)
//
fun
d3pat1_trxd3i0
(d3p0: d3pat1, env0: !envd3i0): i0pat1
//
(* ****** ****** *)
//
fun
d3exp1_trxd3i0
(d3e0: d3exp1, env0: !envd3i0): i0exp1
//
(* ****** ****** *)
//
fun
d3ecl1_trxd3i0
(d3cl: d3ecl1, env0: !envd3i0): i0dcl1
//
(* ****** ****** *)
(* ****** ****** *)
//
fun
d3pat1lst_trxd3i0
(d3ps: d3pat1lst, env0: !envd3i0): i0pat1lst
//
fun
d3exp1lst_trxd3i0
(d3es: d3exp1lst, env0: !envd3i0): i0exp1lst
//
(* ****** ****** *)
(* ****** ****** *)
//
fun
d3ecl1lst_trxd3i0
(d3cs: d3ecl1lst, env0: !envd3i0): i0dcl1lst
//
(* ****** ****** *)
(* ****** ****** *)
//
fun
d3valdcl1_trxd3i0
(dval: d3valdcl1, env0: !envd3i0): i0valdcl1
fun
d3vardcl1_trxd3i0
(dvar: d3vardcl1, env0: !envd3i0): i0vardcl1
//
fun
d3fundcl1_trxd3i0
(dfun: d3fundcl1, env0: !envd3i0): i0fundcl1
//
(* ****** ****** *)
(* ****** ****** *)
//
fun
d3valdcl1lst_trxd3i0
(d3vs: d3valdcl1lst, env0: !envd3i0): i0valdcl1lst
fun
d3vardcl1lst_trxd3i0
(d3vs: d3vardcl1lst, env0: !envd3i0): i0vardcl1lst
//
fun
d3fundcl1lst_trxd3i0
(d3fs: d3fundcl1lst, env0: !envd3i0): i0fundcl1lst
//
(* ****** ****** *)
(* ****** ****** *)
//
fun
d3ecl1lstopt_trxd3i0
(dopt: d3ecl1lstopt, env0: !envd3i0): i0dcl1lstopt
//
(* ****** ****** *)
(* ****** ****** *)
//
(***********************************************************************)
(* end of [ATS3/XATSOPT_srcgen2_xsyncpy_srcgen1_SATS_trxd3i0.sats] *)
(***********************************************************************)

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
Sat May 31 11:40:09 AM EDT 2025
Authoremail: gmhwxiATgmailDOTcom
*)
//
(* ****** ****** *)
(* ****** ****** *)
#include
"xatslib\
/libcats\
/HATS/libcats_dats.hats"
(* ****** ****** *)
(* ****** ****** *)
#staload
"./../SATS/dynexp2.sats"
#staload
"./../SATS/dynexp3.sats"
(* ****** ****** *)
(* ****** ****** *)
//
#include
"./../HATS/libxatsopt.hats"
//
(* ****** ****** *)
(* ****** ****** *)
//
#extern
fcast
castxy{ax:t0}{ay:t0}(ax:ax):(ay)
//
(* ****** ****** *)
(* ****** ****** *)
//
#impltmp
g_print<stamp>(stmp) =
stamp_fprint(stmp, castxy(g_print$out<>()))
//
#impltmp
g_print<symbl>(sym0) =
symbl_fprint(sym0, castxy(g_print$out<>()))
//
(* ****** ****** *)
//
#impltmp
g_print<token>(tok0) =
token_fprint(tok0, castxy(g_print$out<>()))
//
(* ****** ****** *)
//
#impltmp
g_print<d0pat>(d0p0) =
d0pat_fprint(d0p0, castxy(g_print$out<>()))
//
#impltmp
g_print<d0exp>(d0e0) =
d0exp_fprint(d0e0, castxy(g_print$out<>()))
//
#impltmp
g_print<d3exp>(d3e0) =
d3exp_fprint(d3e0, castxy(g_print$out<>()))
//
(* ****** ****** *)
//
#impltmp
g_print<d1pat>(d1p0) =
d1pat_fprint(d1p0, castxy(g_print$out<>()))
//
#impltmp
g_print<d1exp>(d1e0) =
d1exp_fprint(d1e0, castxy(g_print$out<>()))
//
#impltmp
g_print<d1ecl>(d1cl) =
d1ecl_fprint(d1cl, castxy(g_print$out<>()))
//
(* ****** ****** *)
//
#impltmp
g_print<d2pat>(d2p0) =
d2pat_fprint(d2p0, castxy(g_print$out<>()))
//
#impltmp
g_print<d2exp>(d2e0) =
d2exp_fprint(d2e0, castxy(g_print$out<>()))
//
#impltmp
g_print<d2ecl>(d2cl) =
d2ecl_fprint(d2cl, castxy(g_print$out<>()))
//
(* ****** ****** *)
//
#impltmp
g_print<d3pat>(d3p0) =
d3pat_fprint(d3p0, castxy(g_print$out<>()))
//
#impltmp
g_print<d3exp>(d3e0) =
d3exp_fprint(d3e0, castxy(g_print$out<>()))
//
#impltmp
g_print<d3ecl>(d3cl) =
d3ecl_fprint(d3cl, castxy(g_print$out<>()))
//
(* ****** ****** *)
(* ****** ****** *)
//
#impltmp
g_print<d3pat1>(dpat) =
(
  d3pat1_fprint(dpat, g_print$out<>((*0*))))
//
#impltmp
g_print<d3exp1>(dexp) =
(
  d3exp1_fprint(dexp, g_print$out<>((*0*))))
//
#impltmp
g_print<d3ecl1>(d3cl) =
(
  d3ecl1_fprint(d3cl, g_print$out<>((*0*))))
//
(* ****** ****** *)
(* ****** ****** *)
//
(***********************************************************************)
(* end of [ATS3/XATSOPT_srcgen2_xsyncpy_srcgen1_DATS_xsyncpy_tmplib.dats] *)
(***********************************************************************)

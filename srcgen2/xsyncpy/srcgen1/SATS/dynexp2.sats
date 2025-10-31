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
Sun May 18 10:44:59 AM EDT 2025
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
//
(* ****** ****** *)
(* ****** ****** *)
//
#staload
LOC = "./\
../../../SATS/locinfo.sats"
//
(* ****** ****** *)
//
#staload
D2E = "./\
../../../SATS/dynexp2.sats"
//
(* ****** ****** *)
(* ****** ****** *)
#typedef lcsrc = $LOC.lcsrc
#typedef loc_t = $LOC.loc_t
#typedef loctn = $LOC.loctn
(* ****** ****** *)
(* ****** ****** *)
//
#typedef s2qag = $D2E.s2qag
#typedef t2qag = $D2E.t2qag
#typedef t2iag = $D2E.t2iag
#typedef t2jag = $D2E.t2jag
//
#typedef t2iaglst = list(t2iag)
#typedef t2jaglst = list(t2jag)
//
(* ****** ****** *)
(* ****** ****** *)
//
#typedef simpl = $D2E.simpl
#typedef dimpl = $D2E.dimpl
//
(* ****** ****** *)
(* ****** ****** *)
//
#typedef d2var = $D2E.d2var
#typedef d2pat = $D2E.d2pat
#typedef d2exp = $D2E.d2exp
#typedef d2ecl = $D2E.d2ecl
//
(* ****** ****** *)
//
#typedef d2varlst = list(d2var)
#typedef d2patlst = list(d2pat)
#typedef d2explst = list(d2exp)
#typedef d2eclist = list(d2ecl)
//
(* ****** ****** *)
(* ****** ****** *)
//
#symload
lctn with $D2E.d2var_get_lctn
#symload
name with $D2E.d2var_get_name
#symload
stmp with $D2E.d2var_get_stmp
//
(* ****** ****** *)
(* ****** ****** *)
//
#symload
lctn with $D2E.d2pat_get_lctn
#symload
node with $D2E.d2pat_get_node
//
#symload
lctn with $D2E.d2exp_get_lctn
#symload
node with $D2E.d2exp_get_node
//
#symload
lctn with $D2E.d2ecl_get_lctn
#symload
node with $D2E.d2ecl_get_node
//
(* ****** ****** *)
(* ****** ****** *)
//
fun
s2qag_fprint
(sqag: s2qag, out0: FILR): void
fun
t2qag_fprint
(tqag: t2qag, out0: FILR): void
fun
t2iag_fprint
(tiag: t2iag, out0: FILR): void
fun
t2jag_fprint
(tjag: t2jag, out0: FILR): void
//
#symload
fprint with s2qag_fprint of 1000
#symload
fprint with t2qag_fprint of 1000
#symload
fprint with t2iag_fprint of 1000
#symload
fprint with t2jag_fprint of 1000
//
(* ****** ****** *)
(* ****** ****** *)
//
fun
d2var_fprint
(dvar: d2var, out0: FILR): void
#symload
fprint with d2var_fprint of 1000
//
(* ****** ****** *)
(* ****** ****** *)
//
fun
d2pat_fprint
(dpat: d2pat, out0: FILR): void
fun
d2exp_fprint
(dexp: d2exp, out0: FILR): void
fun
d2ecl_fprint
(d2cl: d2ecl, out0: FILR): void
//
#symload
fprint with d2pat_fprint of 1000
#symload
fprint with d2exp_fprint of 1000
#symload
fprint with d2ecl_fprint of 1000
//
(* ****** ****** *)
(* ****** ****** *)
//
#abstbox t2iag1_tbox // ptr
#typedef t2iag1 = t2iag1_tbox
#abstbox t2jag1_tbox // ptr
#typedef t2jag1 = t2jag1_tbox
//
#typedef t2iag1lst = list(t2iag1)
#typedef t2jag1lst = list(t2jag1)
//
(* ****** ****** *)
//
fun
t2iag1_fprint
(tiag: t2iag1, out0: FILR): void
fun
t2jag1_fprint
(tjag: t2jag1, out0: FILR): void
//
(* ****** ****** *)
//
fun
t2iag1_lctn$get
(   tiag: t2iag1   ): loc_t
fun
t2jag1_lctn$get
(   tjag: t2jag1   ): loc_t
//
fun
t2iag1_t2qs$get
(   tiag: t2iag1   ): s2typ1lst
fun
t2jag1_t2qs$get
(   tjag: t2jag1   ): s2typ1lst
//
#symload lctn with t2iag1_lctn$get
#symload lctn with t2jag1_lctn$get
#symload t2qs with t2iag1_t2qs$get
#symload t2qs with t2jag1_t2qs$get
//
(* ****** ****** *)
//
fun
t2iag1_make_t2qs(
loc0: loc_t, t2qs: s2typ1lst):t2iag1
#symload t2iag1 with t2iag1_make_t2qs
//
fun
t2jag1_make_t2qs(
loc0: loc_t, t2qs: s2typ1lst):t2jag1
#symload t2jag1 with t2jag1_make_t2qs
//
(* ****** ****** *)
(* ****** ****** *)
//
(***********************************************************************)
(* end of [ATS3/XATSOPT_srcgen2_xsyncpy_srcgen1_SATS_dynexp2.sats] *)
(***********************************************************************)

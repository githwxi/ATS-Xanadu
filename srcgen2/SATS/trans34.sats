(***********************************************************************)
(*                                                                     *)
(*                         Applied Type System                         *)
(*                                                                     *)
(***********************************************************************)

(*
** ATS/Xanadu - Unleashing the Potential of Types!
** Copyright (C) 2023 Hongwei Xi, ATS Trustful Software, Inc.
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
(*
Wed Dec 27 11:25:36 EST 2023
*)
Authoremail: gmhwxiATgmailDOTcom
*)
//
(* ****** ****** *)
#include
"./../HATS/xatsopt_sats.hats"
(* ****** ****** *)
#define
ATS_PACKNAME // namespace
"ATS3.XANADU.xatsopt-20220500"
(* ****** ****** *)
#absvtbx
tr34env_vtbx
#vwtpdef
tr34env = tr34env_vtbx
(* ****** ****** *)
//
#staload
SYM = "./xsymbol.sats"
//
(*
#staload
MAP = "./xsymmap.sats"
*)
//
(* ****** ****** *)
#staload
S2E = "./staexp2.sats"
#staload
D2E = "./dynexp2.sats"
(* ****** ****** *)
#staload
D3E = "./dynexp3.sats"
#staload
D4E = "./dynexp4.sats"
(* ****** ****** *)
(* ****** ****** *)
#typedef sym_t = $SYM.sym_t
(* ****** ****** *)
#typedef s2typ = $S2E.s2typ
(* ****** ****** *)
#typedef d2var = $D2E.d2var
(* ****** ****** *)
(* ****** ****** *)
#typedef d3pat = $D3E.d3pat
#typedef l3d3p = $D3E.l3d3p
(* ****** ****** *)
#typedef d3exp = $D3E.d3exp
#typedef l3d3e = $D3E.l3d3e
(* ****** ****** *)
#typedef d3ecl = $D3E.d3ecl
(* ****** ****** *)
(* ****** ****** *)
#typedef d4pat = $D4E.d4pat
#typedef l4d4p = $D4E.l4d4p
(* ****** ****** *)
#typedef d4exp = $D4E.d4exp
#typedef l4d4e = $D4E.l4d4e
(* ****** ****** *)
#typedef d4ecl = $D4E.d4ecl
(* ****** ****** *)
#typedef d2varlst = $D2E.d2varlst
(* ****** ****** *)
#typedef d3patlst = $D3E.d3patlst
#typedef l3d3plst = $D3E.l3d3plst
(* ****** ****** *)
#typedef d3explst = $D3E.d3explst
#typedef d3expopt = $D3E.d3expopt
#typedef l3d3elst = $D3E.l3d3elst
(* ****** ****** *)
#typedef d3eclist = $D3E.d3eclist
(* ****** ****** *)
#typedef d4patlst = $D4E.d4patlst
#typedef l4d4plst = $D4E.l4d4plst
(* ****** ****** *)
#typedef d4explst = $D4E.d4explst
#typedef d4expopt = $D4E.d4expopt
#typedef l4d4elst = $D4E.l4d4elst
(* ****** ****** *)
#typedef d4eclist = $D4E.d4eclist
(* ****** ****** *)
#typedef d3parsed = $D3E.d3parsed
#typedef d4parsed = $D4E.d4parsed
(* ****** ****** *)
#typedef d3explstopt = $D3E.d3explstopt
#typedef d4explstopt = $D4E.d4explstopt
(* ****** ****** *)
#typedef d3eclistopt = $D3E.d3eclistopt
#typedef d4eclistopt = $D4E.d4eclistopt
(* ****** ****** *)
(* ****** ****** *)
//
fun
d4parsed_of_trans34
( dpar : d3parsed ): (d4parsed)
//
(* ****** ****** *)
(* ****** ****** *)
//
datatype
d4lft =
//
|D4LFTval of s2typ
|D4LFTvar of s2typ
//
(* ****** ****** *)
//
fun
d4lft_fprint
(out: FILR, lft0: d4lft): void
//
(* ****** ****** *)
(* ****** ****** *)
//
#absvtbx linstk_vtbx // ptr
#vwtpdef linstk = linstk_vtbx
//
(* ****** ****** *)
//
fun
linstk_lamvars
  ( stk: !linstk ): d2varlst
fun
linstk_letvars
  ( stk: !linstk ): d2varlst
//
fun
linstk_poplam0
  ( stk: &linstk >> _ ): sint
fun
linstk_poplet0
  ( stk: &linstk >> _ ): sint
//
fun
linstk_pshlam0
  ( stk: &linstk >> _ ): void
fun
linstk_pshlet0
  ( stk: &linstk >> _ ): void
//
(* ****** ****** *)
//
fun
linstk_insert_dtyp
( stk:
& linstk >> _, d2var, s2typ):void
fun
linstk_insert_dlft
( stk:
& linstk >> _, d2var, d4lft):void
//
(* ****** ****** *)
(* ****** ****** *)
//
fun
tr34env_make_nil((*nil*)):tr34env
fun
tr34env_free_top(tr34env):d2varlst
//
(* ****** ****** *)
//
fun
tr34env_insert_dtyp
( env0:
! tr34env, d2var, s2typ):( void )
fun
tr34env_insert_dlft
( env0:
! tr34env, d2var, d4lft):( void )
//
(* ****** ****** *)
(* ****** ****** *)
//
fun
<x0:t0>
<y0:t0>
list_trans34_fnp
( e1:
! tr34env
, xs: list(x0)
, (!tr34env, x0) -> y0): list(y0)
fun
<x0:t0>
<y0:t0>
optn_trans34_fnp
( e1:
! tr34env
, xs: optn(x0)
, (!tr34env, x0) -> y0): optn(y0)
//
(* ****** ****** *)
(* ****** ****** *)
//
fun
trans34_d3pat
(env0: !tr34env, d3p0: d3pat): d4pat
fun
trans34_l3d3e
(env0: !tr34env, ld3p: l3d3p): l4d4p
//
(* ****** ****** *)
//
fun
trans34_d3exp
(env0: !tr34env, d3e0: d3exp): d4exp
fun
trans34_l3d3e
(env0: !tr34env, ld3e: l3d3e): l4d4e
//
(* ****** ****** *)
//
fun
trans34_d3ecl
(env0: !tr34env, d3cl: d3ecl): d4ecl
//
(* ****** ****** *)
//
fun
trans34_d3explst
(env0: !tr34env, d3es: d3explst): d4explst
fun
trans34_d3expopt
(env0: !tr34env, dopt: d3expopt): d4expopt
//
fun
trans34_l3d3elst
(env0: !tr34env, ldes: l3d3elst): l4d4elst
//
(* ****** ****** *)
//
fun
trans34_d3eclist
(env0: !tr34env, dcls: d3eclist): d4eclist
//
(* ****** ****** *)
//
fun
trans34_d3explstopt
( env0:
! tr34env, dopt: d3explstopt): d4explstopt
//
fun
trans34_d3eclistopt
( env0:
! tr34env, dopt: d3eclistopt): d4eclistopt
//
(* ****** ****** *)
(* ****** ****** *)

(* end of [ATS3/XATSOPT_srcgen2_trans34.sats] *)

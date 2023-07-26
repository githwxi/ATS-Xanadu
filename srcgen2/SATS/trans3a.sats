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
Mon 24 Jul 2023 01:32:53 PM EDT
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
tr3aenv_vtbx
#vwtpdef
tr3aenv = tr3aenv_vtbx
(* ****** ****** *)
#staload
BAS = "./xbasics.sats"
#typedef
f2clknd = $BAS.f2clknd
//
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
#typedef sym_t = $SYM.sym_t
(* ****** ****** *)
#staload S2E = "./staexp2.sats"
(* ****** ****** *)
#staload D2E = "./dynexp2.sats"
#staload D3E = "./dynexp3.sats"
(* ****** ****** *)
#typedef s2cst = $S2E.s2cst
#typedef s2exp = $S2E.s2exp
#typedef s2typ = $S2E.s2typ
(* ****** ****** *)
#typedef d2var = $D2E.d2var
#typedef d2con = $D2E.d2con
#typedef d2cst = $D2E.d2cst
(* ****** ****** *)
#typedef d3pat = $D3E.d3pat
#typedef d3exp = $D3E.d3exp
(* ****** ****** *)
#typedef l3d3p = $D3E.l3d3p
#typedef l3d3e = $D3E.l3d3e
(* ****** ****** *)
#typedef d3ecl = $D3E.d3ecl
(* ****** ****** *)
#typedef
 d3patlst  =  $D3E.d3patlst
#typedef
 d3explst  =  $D3E.d3explst
#typedef
 d3expopt  =  $D3E.d3expopt
(* ****** ****** *)
#typedef
 l3d3plst  =  $D3E.l3d3plst
#typedef
 l3d3elst  =  $D3E.l3d3elst
(* ****** ****** *)
#typedef
 d3eclist  =  $D3E.d3eclist
(* ****** ****** *)
#typedef
 d3parsed  =  $D3E.d3parsed
(* ****** ****** *)
#typedef
d3explstopt = $D3E.d3explstopt
#typedef
d3eclistopt = $D3E.d3eclistopt
(* ****** ****** *)
//
fun
d3parsed_of_trans3a
( dpar : d3parsed ): (d3parsed)
//
(* ****** ****** *)
//
fun
tr3aenv_make_nil((*0*)):tr3aenv
//
fun
tr3aenv_free_top(tr3aenv):(void)
//
(* ****** ****** *)
//
fun
tr3aenv_poplet0
(env0: !tr3aenv): void//end-fun
fun
tr3aenv_pshlet0
(env0: !tr3aenv): void//end-fun
fun
tr3aenv_pshloc1
(env0: !tr3aenv): void//end-fun
fun
tr3aenv_pshloc2
(env0: !tr3aenv): void//end-fun
//
fun
tr3aenv_locjoin
(env0: !tr3aenv): void//end-fun
//
(* ****** ****** *)
//
fun
tr3aenv_poplam0
(env0: !tr3aenv): void//end-fun
fun
tr3aenv_pshlam0
(env0: !tr3aenv): void//end-fun
//
(* ****** ****** *)
//
fun
<x0:t0>
<y0:t0>
list_trans3a_fnp
( e1:
! tr3aenv
, xs
: list(x0)
, fopr:
  (!tr3aenv,x0)->y0): list(y0)
fun
<x0:t0>
<y0:t0>
optn_trans3a_fnp
( e1:
! tr3aenv
, xs: optn(x0)
, fopr:
  (!tr3aenv,x0)->y0): optn(y0)
//
(* ****** ****** *)
//
fun
trans3a_s2exp
( env0:
! tr3aenv,s2e0:s2exp):s2exp//fun
fun
trans3a_s2typ
( env0:
! tr3aenv,t2p0:s2typ):s2typ//fun
//
(* ****** ****** *)
//
fun
trans3a_d3pat
( env0:
! tr3aenv,d3p0:d3pat):d3pat//fun
//
fun
trans3a_d3exp
( env0:
! tr3aenv,d3e0:d3exp):d3exp//fun
//
(* ****** ****** *)
//
fun
trans3a_l3d3p
( env0:
! tr3aenv,ld3p:l3d3p):l3d3p//fun
//
fun
trans3a_l3d3e
( env0:
! tr3aenv,ld3e:l3d3e):l3d3e//fun
//
(* ****** ****** *)
//
fun
trans3a_d3patlst
( env0:
! tr3aenv,d3ps:d3patlst):d3patlst
//
(* ****** ****** *)
//
fun
trans3a_d3expopt
( env0:
! tr3aenv,dopt:d3expopt):d3expopt
//
fun
trans3a_d3explst
( env0:
! tr3aenv,d3es:d3explst):d3explst
//
(* ****** ****** *)
//
fun
trans3a_l3d3plst
( env0:
! tr3aenv,ldps:l3d3plst):l3d3plst
//
fun
trans3a_l3d3elst
( env0:
! tr3aenv,ldes:l3d3elst):l3d3elst
//
(* ****** ****** *)
//
fun
trans3a_d3ecl
( env0:
! tr3aenv,d3cl:d3ecl):d3ecl//fun
//
(* ****** ****** *)
//
fun
trans3a_d3eclist
( env0:
! tr3aenv,dcls:d3eclist):d3eclist
//
(* ****** ****** *)

(* end of [ATS3/XATSOPT_srcgen2_trans3a.sats] *)

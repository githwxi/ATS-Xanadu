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
//
#typedef s2cst = $S2E.s2cst
#typedef s2var = $S2E.s2var
//
(* ****** ****** *)
//
(*
#typedef s2exp = $S2E.s2exp
*)
#typedef s2typ = $S2E.s2typ
#typedef l2t2p = $S2E.l2t2p
//
(* ****** ****** *)
#typedef s2qag = $D2E.s2qag
#typedef t2qag = $D2E.t2qag
(* ****** ****** *)
#typedef t2jag = $D2E.t2jag
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
#typedef f3arg = $D3E.f3arg
(* ****** ****** *)
#typedef d3gua = $D3E.d3gua
#typedef d3gpt = $D3E.d3gpt
#typedef d3cls = $D3E.d3cls
(* ****** ****** *)
#typedef d3ecl = $D3E.d3ecl
(* ****** ****** *)
#typedef
 s2varlst  =  $S2E.s2varlst
(* ****** ****** *)
#typedef
 s2typlst  =  $S2E.s2typlst
#typedef
 l2t2plst  =  $S2E.l2t2plst
(* ****** ****** *)
#typedef
 s2qaglst  =  $D2E.s2qaglst
#typedef
 t2qaglst  =  $D2E.t2qaglst
(* ****** ****** *)
#typedef
 t2jaglst  =  $D2E.t2jaglst
(* ****** ****** *)
#typedef
 teqd3exp  =  $D3E.teqd3exp
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
 f3arglst  =  $D3E.f3arglst
(* ****** ****** *)
#typedef
 d3gualst  =  $D3E.d3gualst
#typedef
 d3clslst  =  $D3E.d3clslst
(* ****** ****** *)
#typedef
 d3eclist  =  $D3E.d3eclist
(* ****** ****** *)
#typedef
 d3valdcl  =  $D3E.d3valdcl
#typedef
 d3vardcl  =  $D3E.d3vardcl
#typedef
 d3fundcl  =  $D3E.d3fundcl
(* ****** ****** *)
#typedef
 d3parsed  =  $D3E.d3parsed
#typedef
 d3topenv  =  $D3E.d3topenv
(* ****** ****** *)
#typedef
d3valdclist = $D3E.d3valdclist
#typedef
d3vardclist = $D3E.d3vardclist
#typedef
d3fundclist = $D3E.d3fundclist
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
tr3aenv_make_nil
( (*void*) ): tr3aenv
//
fun
tr3aenv_free_top
( env0 : tr3aenv ) : (d3topenv)
//
(* ****** ****** *)
//
(*
fun
tr3aenv_poplam0
(env0: !tr3aenv): void//end-fun
fun
tr3aenv_pshlam0
(env0: !tr3aenv): void//end-fun
*)
//
(* ****** ****** *)
//
fun
tr3aenv_poplet0
(env0: !tr3aenv): void//end-fun
fun
tr3aenv_pshlet0
(env0: !tr3aenv): void//end-fun
//
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
tr3aenv_d2crch_opt
( env0:
! tr3aenv
, d2c0 : d2cst) : d3eclist
fun
tr3aenv_d2cins_any
( env0:
! tr3aenv
, d2c0:d2cst,d3cl:d3ecl): void
//
(* ****** ****** *)
//
fun
tr3aenv_insert_d3ecl
( env0:
! tr3aenv, d3cl : d3ecl): void
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
  (!tr3aenv, x0)->y0): list(y0)
fun
<x0:t0>
<y0:t0>
optn_trans3a_fnp
( e1:
! tr3aenv
, xs: optn(x0)
, fopr:
  (!tr3aenv, x0)->y0): optn(y0)
//
(* ****** ****** *)
//
(*
fun
trans3a_s2exp
( env0:
! tr3aenv,s2e0:s2exp):s2exp//fun
*)
fun
trans3a_s2typ
( env0:
! tr3aenv,t2p0:s2typ):s2typ//fun
//
fun
trans3a_l2t2p
( env0:
! tr3aenv,lt2p:l2t2p):l2t2p//fun
//
(* ****** ****** *)
//
fun
trans3a_t2jag
( env0:
! tr3aenv,tjag:t2jag):t2jag//fun
//
(* ****** ****** *)
//
(*
fun
trans3a_d2var
( env0:
! tr3aenv,dvar:d2var):d2var//fun
*)
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
trans3a_f3arg
( env0:
! tr3aenv,f3a0:f3arg):f3arg//fun
//
(* ****** ****** *)
//
fun
trans3a_d3gua
( env0:
! tr3aenv,dgua:d3gua):d3gua//fun
//
fun
trans3a_d3gpt
( env0:
! tr3aenv,dgpt:d3gpt):d3gpt//fun
//
fun
trans3a_d3cls
( env0:
! tr3aenv,dcls:d3cls):d3cls//fun
//
(* ****** ****** *)
//
fun
trans3a_s2typlst
( env0:
! tr3aenv,t2ps:s2typlst):s2typlst
//
fun
trans3a_l2t2plst
( env0:
! tr3aenv,ltps:l2t2plst):l2t2plst
//
(* ****** ****** *)
//
fun
trans3a_t2jaglst
( env0:
! tr3aenv,t2js:t2jaglst):t2jaglst
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
trans3a_f3arglst
( env0:
! tr3aenv,f3as:f3arglst):f3arglst
//
(* ****** ****** *)
//
fun
trans3a_d3gualst
( env0:
! tr3aenv,d3gs:d3gualst):d3gualst
//
fun
trans3a_d3clslst
( env0:
! tr3aenv,d3cs:d3clslst):d3clslst
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
trans3a_tmplocal
( env0:
! tr3aenv,
  head: d3eclist
, body: d3eclist): d3eclist//fun
//
(* ****** ****** *)
//
fun
trans3a_teqd3exp
( env0:
! tr3aenv,tdxp:teqd3exp):teqd3exp
//
(* ****** ****** *)
//
fun
trans3a_d3eclist
( env0:
! tr3aenv,dcls:d3eclist):d3eclist
//
(* ****** ****** *)
//
fun
trans3a_d3valdcl
( env0:
! tr3aenv,dval:d3valdcl):d3valdcl
fun
trans3a_d3vardcl
( env0:
! tr3aenv,dvar:d3vardcl):d3vardcl
//
(* ****** ****** *)
//
fun
trans3a_d3fundcl
( env0:
! tr3aenv,dfun:d3fundcl):d3fundcl
//
(* ****** ****** *)
//
fun
trans3a_d3valdclist
( env0:
! tr3aenv,d3vs:d3valdclist):d3valdclist
fun
trans3a_d3vardclist
( env0:
! tr3aenv,d3vs:d3vardclist):d3vardclist
//
(* ****** ****** *)
//
fun
trans3a_d3fundclist
( env0:
! tr3aenv,d3fs:d3fundclist):d3fundclist
//
(* ****** ****** *)
//
fun
trans3a_d3eclistopt
( env0:
! tr3aenv,dopt:d3eclistopt):d3eclistopt
//
(* ****** ****** *)

(* end of [ATS3/XATSOPT_srcgen2_trans3a.sats] *)

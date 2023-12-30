(***********************************************************************)
(*                                                                     *)
(*                         Applied Type System                         *)
(*                                                                     *)
(***********************************************************************)

(*
** ATS/Xanadu - Unleashing the Potential of Types!
** Copyright (C) 2018 Hongwei Xi, ATS Trustful Software, Inc.
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
Mon Nov 27 13:06:24 EST 2023
*)
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
#staload
"./../../../SATS/lexing0.sats"
//
(* ****** ****** *)
//
#staload D2E =
"./../../../SATS/dynexp2.sats"
//
(* ****** ****** *)
//
#staload IR0 = "./intrep0.sats"
//
(* ****** ****** *)
//
#abstbox irenv_tbox//p0tr
#typedef irenv = irenv_tbox
//
(* ****** ****** *)
//
#typedef d2var = $D2E.d2var
#typedef d2con = $D2E.d2con
#typedef d2cst = $D2E.d2cst
//
(* ****** ****** *)
//
#typedef irpat = $IR0.irpat
#typedef irexp = $IR0.irexp
#typedef fiarg = $IR0.fiarg
//
#typedef irgua = $IR0.irgua
#typedef irgpt = $IR0.irgpt
#typedef ircls = $IR0.ircls
//
#typedef irdcl = $IR0.irdcl
//
(* ****** ****** *)
//
#typedef d2cstlst = $D2E.d2cstlst
//
(* ****** ****** *)
//
#typedef irpatlst = $IR0.irpatlst
//
#typedef irexplst = $IR0.irexplst
#typedef irexpopt = $IR0.irexpopt
//
(* ****** ****** *)
#typedef fiarglst = $IR0.fiarglst
(* ****** ****** *)
#typedef irclslst = $IR0.irclslst
(* ****** ****** *)
#typedef irdclist = $IR0.irdclist
(* ****** ****** *)
#typedef irparsed = $IR0.irparsed
(* ****** ****** *)
//
#typedef irvaldcl = $IR0.irvaldcl
#typedef irvardcl = $IR0.irvardcl
#typedef irfundcl = $IR0.irfundcl
//
#typedef irvaldclist = $IR0.irvaldclist
#typedef irvardclist = $IR0.irvardclist
#typedef irfundclist = $IR0.irfundclist
(* ****** ****** *)
//
datatype
irval =
//
|IRVnil of ()
//
|IRVint of sint
|IRVptr of p0tr
//
|IRVbtf of (bool)
|IRVchr of (char)
|IRVflt of double
|IRVstr of string
//
(*
|IRVcst of (d2cst)
*)
//
|IRVcon of (d2con)
//
|IRVfun of (irfun)
//
|IRVlft of (irlft)
//
(*
HX-2023-12-23:
I could have used
irvalist here. But
Using [irvalarr] for
testing is exciting!
*)
|
IRVcapp of
( d2con , irvalarr )
//
|IRVtup0 of irvalarr
|IRVtup1 of
(token(*knd*), irvalarr)
//
|IRVlam0 of
(fiarg, irexp, irenv)
|IRVfix0 of
(d2var,fiarg,irexp,irenv)
(*
(*
HX-2023-12-25:
This one seems not needed!
*)
|
IRVfixs of
(d2var(*fun*)
,fiarglst,irexp,irexplst,irenv)
*)
//
|IRVnone0 of () |IRVnone1 of (irexp)
//
and irlft =
|
IRLFTref0 of a0ref(irvalopt)
//
where
{
//
#typedef irvalist = list(irval)
#typedef irvalopt = optn(irval)
//
#typedef
irfun = (irvalist) -<cfr> irval
//
#typedef irvalarr = a1rsz(irval)
//
} (*where*) // end of [datatype(irval)]
//
(* ****** ****** *)
//
fun
irval_fprint
(FILR, irval): (void)
fun
irlft_fprint
(FILR, irlft): (void)
//
(* ****** ****** *)
//
fun
irlft_deget
(lval: irlft): irval
fun
irlft_deset
(irlft, irval): (void)
//
(* ****** ****** *)
//
fun
irpat_valck
( irpat, irval ): (bool)
fun
irpatlst_valck_arr
(irpatlst,irvalarr): (bool)
fun
irpatlst_valck_lst
(irpatlst,irvalist): (bool)
//
(* ****** ****** *)
//
fun
the_ircst_search
( d2c: d2cst ): irval
fun
the_irvar_search
( d2v: d2var ): irval
fun
the_ircst_insval
(d2c:d2cst,irv:irval): void
//
(* ****** ****** *)
(* ****** ****** *)
fun
xinterp_irparsed
( dpar: irparsed ) : ( void )
(* ****** ****** *)
(* ****** ****** *)
//
#absvwtp xintenv_vtbx // p0tr
#vwtpdef xintenv = xintenv_vtbx
//
(* ****** ****** *)
//
fun
xintenv_irsnap
(env0: !xintenv): (irenv)
//
(* ****** ****** *)
//
fun
xintenv_make_nil
(    (*nil*)    ): xintenv
fun
xintenv_free_top
( env0: ~xintenv ): void//fun
(* ****** ****** *)
//
fun
xintenv_pshlet0
( env0: !xintenv ): void//fun
fun
xintenv_poplet0
( env0: !xintenv ): void//fun
//
(* ****** ****** *)
//
fun
xintenv_make_dapp
( env0:
! xintenv
, fenv: irenv ): xintenv
fun
xintenv_free_dapp
( env1: ~xintenv ): void//fun
//
(* ****** ****** *)
//
fun
xintenv_d2crch_opt
( env0:
! xintenv
, d2c0: d2cst ) : optn_vt(irval)
fun
xintenv_d2vrch_opt
( env0:
! xintenv
, d2v0: d2var ) : optn_vt(irval)
//
fun
xintenv_d2cins_any
( env0:
! xintenv
, d2c0: d2cst, irv1: irval): void
fun
xintenv_d2vins_any
( env0:
! xintenv
, d2v0: d2var, irv1: irval): void
//
(* ****** ****** *)
(* ****** ****** *)
//
fun
<x0:t0>
<y0:t0>
list_xinterp_fnp
( e1:
! xintenv
, xs: list(x0)
, (!xintenv, x0) -> y0): list(y0)
fun
<x0:t0>
<y0:t0>
optn_xinterp_fnp
( e1:
! xintenv
, xs: optn(x0)
, (!xintenv, x0) -> y0): optn(y0)
//
(* ****** ****** *)
(* ****** ****** *)
//
fun
irpat_match
( env0:
! xintenv
, irp0:irpat, irv0:irval): void
fun
irvar_match
( env0:
! xintenv
, d2v0:d2var, irv0:irval): void
fun
ircst_match
( env0:
! xintenv
, d2c0:d2cst, irv0:irval): void
//
fun
fiarg_match
(env0:
!xintenv
,farg:fiarg,irvs:irvalist): void
//
fun
irpatlst_match_arr
(env0:
!xintenv
,irps:irpatlst,irvs:irvalarr): void
fun
irpatlst_match_lst
(env0:
!xintenv
,irps:irpatlst,irvs:irvalist): void
//
(* ****** ****** *)
//
fun
xinterp_irexp
(env0: !xintenv, ire0: irexp): irval
//
(* ****** ****** *)
//
fun
xinterp_irdcl
(env0: !xintenv, ird0: irdcl): (void)
//
(* ****** ****** *)
fun
xinterp_irexplst
( env0:
! xintenv, ires: irexplst): irvalist
fun
xinterp_irexpopt
( env0:
! xintenv, iopt: irexpopt): irvalopt
//
(* ****** ****** *)
//
fun
irgpt_valck
( env0:
! xintenv
, dgpt: irgpt, irv0: irval): (bool)
fun
ircls_valck
( env0:
! xintenv
, ircl: ircls, irv0: irval): (bool)
//
fun
irgpt_match
( env0:
! xintenv
, dgpt: irgpt, irv0: irval): (void)
fun
ircls_match
( env0:
! xintenv
, ircl: ircls, irv0: irval): (void)
//
fun
xinterp_ircls
(
env0: !xintenv, ircl: ircls): irvalopt
//
fun
xinterp_irclslst
(
env0: !xintenv,
dcls: irclslst, irv0: irval): irvalopt
//
(* ****** ****** *)
//
fun
xinterp_irdclist
(env0: !xintenv, irds: irdclist): (void)
//
(* ****** ****** *)
//
fun
xinterp_irvaldcl
(env0: !xintenv, irv0: irvaldcl): (void)
fun
xinterp_irvardcl
(env0: !xintenv, irv0: irvardcl): (void)
//
fun
xinterp_irvaldclist
(env0: !xintenv, irvs: irvaldclist): (void)
fun
xinterp_irvardclist
(env0: !xintenv, irvs: irvardclist): (void)
//
(* ****** ****** *)
//
(*
fun
xinterp_irfundcl
(env0: !xintenv, irf0: irfundcl): (void)
fun
xinterp_irfundclist
( env0:
! xintenv
, d2cs: d2cstlst, irfs: irfundclist): (void)
*)
//
(* ****** ****** *)
//
fun
xinterp_irdclistopt
(env0: !xintenv, dopt: optn(irdclist)): void
//
(* ****** ****** *)

(* end of [ATS3/XANADU_srcgen1_xinterp_srcgen1_SATS_xintrep.sats] *)

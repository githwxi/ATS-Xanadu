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

#typedef d2var = $D2E.d2var
#typedef d2con = $D2E.d2con
#typedef d2cst = $D2E.d2cst

(* ****** ****** *)

#typedef irpat = $IR0.irpat
#typedef irexp = $IR0.irexp
#typedef fiarg = $IR0.fiarg
#typedef irdcl = $IR0.irdcl

(* ****** ****** *)
//
#typedef irpatlst = $IR0.irpatlst
//
#typedef irexplst = $IR0.irexplst
#typedef irexpopt = $IR0.irexpopt
//
#typedef fiarglst = $IR0.fiarglst
//
(* ****** ****** *)
#typedef irdclist = $IR0.irdclist
(* ****** ****** *)

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
|IRVlam1 of
(fiarglst,irexp,irenv)
|IRVfix1 of
(d2var,fiarglst,irexp,irenv)
|
IRVfixs of
(d2var(*fun*)
,fiarglst,irexp,irexplst,irenv)
//
|IRVnone0 of () |IRVnone1 of (irexp)
//
where
{
//
#typedef irvalist = list(irval)
#typedef irvalopt = optn(irval)
//
} (*where*) // end of [datatype(irval)]

(* ****** ****** *)
//
fun
irval_fprint
(out: FILR, irv0: irval): void
//
(* ****** ****** *)
//
fun
irpat_valck
( irp0
: irpat, irv0: irval): bool
fun
irpatlst_valck
( irps
: irpatlst, irvs: irvalist): bool
//
(* ****** ****** *)

#absvwtp xintenv_vtbx // p0tr
#vwtpdef xintenv = xintenv_vtbx

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
//
fun
xinterp_irexp
( env0:
! xintenv, ire0: irexp): irval
//
(* ****** ****** *)
//
fun
xinterp_irdcl
( env0:
! xintenv, ird0: irdcl): void
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
xinterp_irdclist
(env0: !xintenv, irds: irdclist): void
//
(* ****** ****** *)
//
fun
xinterp_irdclistopt
(env0: !xintenv, dopt: optn(irdclist)): void
//
(* ****** ****** *)

(* end of [ATS3/XANADU_srcgen1_xinterp_srcgen1_SATS_xintrep.sats] *)

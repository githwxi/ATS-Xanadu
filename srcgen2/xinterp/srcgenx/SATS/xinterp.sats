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
//
#staload D2E =
"./../../../SATS/dynexp2.sats"
//
(* ****** ****** *)
//
#staload IR0 = "./intrep0.sats"
//
(* ****** ****** *)
(* ****** ****** *)

#typedef d2var = $D2E.d2var
#typedef d2con = $D2E.d2con
#typedef d2cst = $D2E.d2cst

(* ****** ****** *)

#typedef irpat = $IR0.irpat
#typedef irexp = $IR0.irexp
#typedef irdcl = $IR0.irdcl

(* ****** ****** *)
//
#abstbox irenv_tbox // p0tr
#typedef irenv = irenv_tbox
//
(* ****** ****** *)

datatype
irval =
//
| IRVnil of ()
//
| IRVint of sint
| IRVptr of p0tr
//
| IRVbtf of (bool)
| IRVchr of (char)
| IRVflt of double
| IRVstr of string
//
where
{
//
#typedef irvalist = List0(irval)
#typedef irvalopt = Option(irval)
//
} (*where*) // end of [datatype(irval)]

(* ****** ****** *)

(* end of [ATS3/XANADU_srcgen1_xinterp_srcgen1_xintrep.sats] *)

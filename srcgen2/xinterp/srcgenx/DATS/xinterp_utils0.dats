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
Sat Dec  9 11:14:33 EST 2023
*)
Authoremail: gmhwxiATgmailDOTcom
*)
//
(* ****** ****** *)
#include
"./../../..\
/HATS/xatsopt_sats.hats"
#include
"./../../..\
/HATS/xatsopt_dats.hats"
(* ****** ****** *)
//
#include
"./../HATS/xinterp_dats.hats"
//
(* ****** ****** *)
#staload "./../SATS/intrep0.sats"
(* ****** ****** *)
#staload "./../SATS/xinterp.sats"
(* ****** ****** *)
#staload
_(*DATS*)="./../DATS/xinterp.dats"
(* ****** ****** *)
#symload lctn with irpat_get_lctn
#symload node with irpat_get_node
(* ****** ****** *)
#symload lctn with irexp_get_lctn
#symload node with irexp_get_node
(* ****** ****** *)
#symload lctn with irdcl_get_lctn
#symload node with irdcl_get_node
(* ****** ****** *)
(* ****** ****** *)
//
#implfun
irpat_valck
(irp0 , irv0) =
(
case+
irp0.node() of
//
|IRPany _ => true
|IRPvar _ => true
//
|IRPint(int1) =>
(
case+ irv0 of
|IRVint(int2) =>
(int1 = int2) | _ => false)
//
|IRPbtf(btf1) =>
(
case+ irv0 of
|IRVbtf(btf2) =>
(btf1 = btf2) | _ => false)
//
|_(*otherwise*) => (   false   )
//
)(*case+*)//end-of-[irpat_valck(irp0,irv0)]
//
(* ****** ****** *)
//
#implfun
irpatlst_valck
( irps , irvs ) =
(
case+ irps of
|
list_nil() => true
|
list_cons(irp1, irps) =>
(
case+ irvs of
|
list_nil() => false
|
list_cons(irv1, irvs) =>
if
irpat_valck(irp1, irv1)
then irpatlst_valck(irps, irvs) else false)
)(*case+*)//end-of-[irpatlst_valck(irps, irvs)]
//
(* ****** ****** *)
(* ****** ****** *)
//
#implfun
irpat_match
( env0
, irp0, irv0) =
(
case+
irp0.node() of
|IRPvar(d2v1) =>
(
xintenv_d2vins_any
(env0, d2v1, irv0) )
//
|IRPint(int) => ((*void*))
|IRPbtf(btf) => ((*void*))
|IRPchr(chr) => ((*void*))
|IRPflt(flt) => ((*void*))
|IRPstr(str) => ((*void*))
//
| _(*otherwise*) => ((*void*))
//
) where
{
//
val () =
prerrln("irpat_match: irp0 = ", irp0)
val () =
prerrln("irpat_match: irv0 = ", irv0)
//
}(*where*)//end-of-[irpat_match(env0,irp0,irv0)]
//
(* ****** ****** *)
//
#implfun
ircst_match
( env0
, d2c0, irv0) =
(
xintenv_d2cins_any(env0, d2c0, irv0)
) where
{
//
val () =
prerrln("ircst_match: d2c0 = ", d2c0)
val () =
prerrln("ircst_match: irv0 = ", irv0)
//
}(*where*)//end-of-[ircst_match(env0,irps,irvs)]
//
(* ****** ****** *)
//
#implfun
ircstlst_match
( env0
, d2cs, irvs) =
(
case+ d2cs of
|
list_nil() => ((*0*))
|
list_cons(d2c1, d2cs) =>
let
  val-
  list_cons(irv1, irvs) = irvs
in//let
  ircst_match( env0, d2c1, irv1 )
; ircstlst_match( env0, d2cs, irvs ) end
)(*case+*)//end-of-[ircstlst_match(env0,irps,irvs)]
//
(* ****** ****** *)

(* end of [ATS3/XANADU_srcgen2_xinterp_srcgen1_DATS_xintrep_utils0.dats] *)

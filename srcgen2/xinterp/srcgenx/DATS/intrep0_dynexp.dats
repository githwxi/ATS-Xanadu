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
//
Sat Nov 25 12:26:57 EST 2023
//
Authoremail: gmhwxiATgmailDOTcom
*)
//
(* ****** ****** *)
(*
#define
XATSOPT "./../../.."
*)
(* ****** ****** *)
#include
"./../../..\
/HATS/xatsopt_sats.hats"
#include
"./../../..\
/HATS/xatsopt_dats.hats"
(* ****** ****** *)
//
#staload
"./../../../SATS/staexp2.sats"
#staload
"./../../../SATS/statyp2.sats"
//
(* ****** ****** *)
//
#staload
"./../../../SATS/dynexp3.sats"
//
(* ****** ****** *)
//
#staload "./../SATS/intrep0.sats"
//
(* ****** ****** *)
//
#staload
_(*DATS*)="./../DATS/intrep0.dats"
//
(* ****** ****** *)
#symload lctn with d3pat_get_lctn
#symload node with d3pat_get_node
(* ****** ****** *)
#symload lctn with d3exp_get_lctn
#symload node with d3exp_get_node
(* ****** ****** *)

#implfun
trxd3ir_d3pat
(env0 , d3p0) =
(
case+
d3p0.node() of
|_(*otherwise*) => irpat_none1(d3p0)
) where
{
val () =
prerrln("trxd3ir_d3exp: d3p0 = ", d3p0)
}(*where*) // end of [trxd3ir_d3pat(...)]

(* ****** ****** *)

#implfun
trxd3ir_d3exp
(env0 , d3e0) =
(
case+
d3e0.node() of
|_(*otherwise*) => irexp_none1(d3e0)
) where
{
val () =
prerrln("trxd3ir_d3exp: d3e0 = ", d3e0)
}(*where*) // end of [trxd3ir_d3exp(...)]

(* ****** ****** *)
(* ****** ****** *)
//
#implfun
trxd3ir_d3patlst
( env0, d3ps ) =
(
  list_trxd3ir_fnp(env0, d3ps, trxd3ir_d3pat))
//
(* ****** ****** *)
//
#implfun
trxd3ir_d3explst
( env0, d3es ) =
(
  list_trxd3ir_fnp(env0, d3es, trxd3ir_d3exp))
//
(* ****** ****** *)
(* ****** ****** *)

(* end of [ATS3/XANADU_srcgen2_xinterp_srcgen1_intrep0_dynexp.dats] *)

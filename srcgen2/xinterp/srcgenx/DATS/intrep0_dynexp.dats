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
//
#implfun
trxd3ir_d3pat
(env0 , d3p0) =
(
case+
d3p0.node() of
//
|D3Pint(tok) =>
irpat(loc0, IRPint(tok))
|D3Pbtf(sym) =>
irpat(loc0, IRPbtf(sym))
|D3Pchr(tok) =>
irpat(loc0, IRPchr(tok))
(*
|D3Pflt(tok) =>
irpat(loc0, IRPflt(tok))
*)
|D3Pstr(tok) =>
irpat(loc0, IRPstr(tok))
//
|_(*otherwise*) => irpat_none1(d3p0)
//
) where
{
//
val loc0 = d3p0.lctn()
//
val () =
prerrln("trxd3ir_d3pat: d3p0 = ", d3p0)
//
}(*where*) // end of [trxd3ir_d3pat(...)]
//
(* ****** ****** *)

#implfun
trxd3ir_d3exp
(env0 , d3e0) =
(
case+
d3e0.node() of
//
|D3Eint
( tok ) =>
irexp(loc0, IREint(tok))
|D3Ebtf
( sym ) =>
irexp(loc0, IREbtf(sym))
|D3Echr
( tok ) =>
irexp(loc0, IREchr(tok))
|D3Eflt
( tok ) =>
irexp(loc0, IREflt(tok))
|D3Estr
( tok ) =>
irexp(loc0, IREstr(tok))
//
|D3Eift0 _ => f0_ift0(env0, d3e0)
//
|_(* otherwise *) => irexp_none1(d3e0)
) where
{
//
val loc0 = d3e0.lctn()
//
fun
f0_ift0
( env0:
! trdienv
, d3e0: d3exp): irexp =
let
//
val-
D3Eift0
( d3e1
, dthn, dels) = d3e0.node()
//
val ire1 =
trxd3ir_d3exp(env0, d3e1)
val ithn =
trxd3ir_d3expopt(env0, dthn)
val iels =
trxd3ir_d3expopt(env0, dels)
//
in//let
irexp_make_node
(loc0, IREift0(ire1, ithn, iels))
end(*let*)//end-of-[f0_ift0(env0,d3e0)]
//
val (  ) =
prerrln("trxd3ir_d3exp: d3e0 = ", d3e0)
//
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
#implfun
trxd3ir_d3expopt
( env0, dopt ) =
(
  optn_trxd3ir_fnp(env0, dopt, trxd3ir_d3exp))
//
(* ****** ****** *)
(* ****** ****** *)

(* end of [ATS3/XANADU_srcgen2_xinterp_srcgen1_intrep0_dynexp.dats] *)

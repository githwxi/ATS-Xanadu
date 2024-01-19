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
Wed Dec 27 18:03:19 EST 2023
*)
Authoremail: gmhwxiATgmailDOTcom
*)
//
(* ****** ****** *)
#include
"./../HATS/xatsopt_sats.hats"
#include
"./../HATS/xatsopt_dats.hats"
(* ****** ****** *)
#define
ATS_PACKNAME
"ATS3.XANADU.xatsopt-20220500"
(* ****** ****** *)
#staload
_(*TRANS34*) = "./trans34.dats"
(* ****** ****** *)
#staload "./../SATS/dynexp3.sats"
(* ****** ****** *)
#staload "./../SATS/dynexp4.sats"
(* ****** ****** *)
#staload "./../SATS/trans34.sats"
(* ****** ****** *)
(* ****** ****** *)
#symload lctn with d3ecl_get_lctn
#symload node with d3ecl_get_node
(* ****** ****** *)
(* ****** ****** *)
//
#implfun
trans34_d3ecl
  (env0, d3cl) =
(
case+
d3cl.node() of
//
|
D3Cvaldclst _ => f0_valdclst(env0, d3cl)
|
D3Cvardclst _ => f0_vardclst(env0, d3cl)
//
(*
|
D3Cfundclst _ => f0_fundclst(env0, d3cl)
*)
//
| _(*otherwise*) =>
let
  val loc0 = d3cl.lctn()
in//let
  d4ecl_make_node(loc0, D4Cnone1( d3cl ))
end (*let*) // end of [_(*otherwise*)] // temp
//
) where
{
//
(* ****** ****** *)
//
fun
f0_valdclst
( env0:
! tr34env
, d3cl: d3ecl): d4ecl =
let
//
val-
D3Cvaldclst
(tknd, d3vs) = d3cl.node()
//
val
d4vs =
trans34_d3valdclist(env0, d3vs)
//
in//let
  d4ecl(loc0, D4Cvaldclst(tknd, d4vs))
end where
{
//
val loc0 = d3cl.lctn()
(*
val (  ) =
prerrln("f0_valdclst(34): d3cl = ", d3cl)
*)
//
}(*where*) // end of [f0_valdclst(env0,d3cl)]
//
(* ****** ****** *)
//
fun
f0_vardclst
( env0:
! tr34env
, d3cl: d3ecl): d4ecl =
let
//
val-
D3Cvardclst
(tknd, d3vs) = d3cl.node()
//
val
d4vs =
trans34_d3vardclist(env0, d3vs)
//
in//let
  d4ecl(loc0, D4Cvardclst(tknd, d4vs))
end where
{
//
val loc0 = d3cl.lctn()
(*
val (  ) =
prerrln("f0_vardclst(34): d3cl = ", d3cl)
*)
//
}(*where*) // end of [f0_vardclst(env0,d3cl)]
//
(* ****** ****** *)
//
val () =
(
  prerrln("trans34_d3ecl: d3cl = ", d3cl) )
//
} (*where*) // end of [trans34_d3ecl(env0,d3cl)]
//
(* ****** ****** *)
(* ****** ****** *)
//
#implfun
trans34_d3valdcl
  (env0, dval) = let
//
val loc0 =
d3valdcl_get_lctn(dval)
val dpat =
d3valdcl_get_dpat(dval)
val tdxp =
d3valdcl_get_tdxp(dval)
val wsxp =
d3valdcl_get_wsxp(dval)
//
val dpat =
trans34_d3pat(env0, dpat)
//
val tdxp =
(
case tdxp of
|
TEQD3EXPnone() =>
TEQD4EXPnone(*void*)
|
TEQD3EXPsome(teq1, dexp) =>
TEQD4EXPsome(teq1, dexp) where
{
val
dexp = trans34_d3exp(env0, dexp)}
)
//
in//let
d4valdcl_make_args(loc0,dpat,tdxp,wsxp)
end//let
(*let*)//end-of-[trans34_d3valdcl(env0,dval)]
//
(* ****** ****** *)
(* ****** ****** *)
//
#implfun
trans34_d3eclist
  (env0, dcls) =
(
  list_trans34_fnp(env0, dcls, trans34_d3ecl))
//
(* ****** ****** *)
//
#implfun
trans34_d3valdclist
  (env0, d3vs) =
(
list_trans34_fnp(env0, d3vs, trans34_d3valdcl))
//
#implfun
trans34_d3vardclist
  (env0, d3vs) =
(
list_trans34_fnp(env0, d3vs, trans34_d3vardcl))
//
(* ****** ****** *)
//
#implfun
trans34_d3fundclist
  (env0, d3fs) =
(
list_trans34_fnp(env0, d3fs, trans34_d3fundcl))
//
(* ****** ****** *)
//
#implfun
trans34_d3eclistopt
  (  env0,dopt  ) =
(
optn_trans34_fnp(env0, dopt, trans34_d3eclist))
//
(* ****** ****** *)
(* ****** ****** *)

(* end of [ATS3/XATSOPT_srcgen2_trans34_decl00.dats] *)

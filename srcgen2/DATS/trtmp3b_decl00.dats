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
Wed Aug 23 16:53:52 EDT 2023
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
_(*Trtmp3b*) = "./trtmp3b.dats"
(* ****** ****** *)
#staload "./../SATS/xstamp0.sats"
(* ****** ****** *)
#staload "./../SATS/dynexp3.sats"
(* ****** ****** *)
#staload "./../SATS/trtmp3b.sats"
(* ****** ****** *)
#symload lctn with d3ecl_get_lctn
#symload node with d3ecl_get_node
(* ****** ****** *)
//
fun
d3ecl_get_stamp
  (d3cl: d3ecl): stamp =
(
case-
d3cl.node() of
|
D3Cfundclst _ =>
(
  the_stamp_nil )
|
D3Cimplmnt0
( tok0
, stmp
, sqas, tqas
, dimp, t2is
, f3as, sres, body) => stmp
) where
{
(*
val () =
prerrln
("d3ecl_get_stamp: d3cl = ", d3cl)
*)
}(*where*)//end-of-[d3ecl_get_stamp(...)]
//
(* ****** ****** *)
//
#implfun
trtmp3b_d3ecl
( env0, d3cl ) = let
//
// (*
val
loc0 = d3cl.lctn()
val () =
prerrln
("trtmp3b_d3ecl: loc0 = ", loc0)
val () =
prerrln
("trtmp3b_d3ecl: d3cl = ", d3cl)
// *)
//
in//let
//
case+
d3cl.node() of
//
|
D3Cvaldclst _ => f0_valdclst(env0, d3cl)
|
D3Cvardclst _ => f0_vardclst(env0, d3cl)
//
| _(*otherwise*) =>
let
  val loc0 = d3cl.lctn()
in//let
  d3ecl_make_node(loc0, D3Cnone2( d3cl ))
end (*let*) // end of [_(*otherwise*)] // temp
//
endlet where
{
//
(* ****** ****** *)
//
fun
f0_valdclst
( env0:
! tr3benv
, d3cl: d3ecl): d3ecl =
let
//
val
loc0 = d3cl.lctn()
val-
D3Cvaldclst
(tknd, d3vs) = d3cl.node()
//
(*
val () =
prerrln
("f0_valdclst: loc0 = ", loc0)
val () =
prerrln
("f0_valdclst: d3cl = ", d3cl)
*)
//
val
d3vs =
trtmp3b_d3valdclist(env0, d3vs)
//
in//let
  d3ecl(loc0, D3Cvaldclst(tknd, d3vs))
end(*let*)//end-of-[f0_valdclst(env0,d3cl)]
//
(* ****** ****** *)
//
fun
f0_vardclst
( env0:
! tr3benv
, d3cl: d3ecl): d3ecl =
let
//
val
loc0 = d3cl.lctn()
val-
D3Cvardclst
(tknd, d3vs) = d3cl.node()
//
(*
val () =
prerrln
("f0_vardclst: loc0 = ", loc0)
val () =
prerrln
("f0_vardclst: d3cl = ", d3cl)
*)
//
val
d3vs =
trtmp3b_d3vardclist(env0, d3vs)
//
in//let
  d3ecl(loc0, D3Cvardclst(tknd, d3vs))
end(*let*)//end-of-[f0_vardclst(env0,d3cl)]
//
(* ****** ****** *)
//
} (*where*)//end-of-[trtmp3b_d3ecl(env0,d3cl)]
//
(* ****** ****** *)
//
#implfun
trtmp3b_d3valdcl
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
val tdxp =
trtmp3b_teqd3exp(env0, tdxp)
//
in//let
d3valdcl_make_args(loc0,dpat,tdxp,wsxp)
end//let
//(*let*)//end-of[trtmp3b_d3valdcl(env0,dval)]
//
(* ****** ****** *)
//
#implfun
trtmp3b_d3vardcl
  (env0, dvar) =
let
//
val loc0 =
d3vardcl_get_lctn(dvar)
//
val dpid =
d3vardcl_get_dpid(dvar)
val vpid =
d3vardcl_get_vpid(dvar)
//
val sres =
d3vardcl_get_sres(dvar)
//
val dini =
d3vardcl_get_dini(dvar)
val dini =
trtmp3b_teqd3exp(env0, dini)
//
in//let
d3vardcl_make_args(loc0,dpid,vpid,sres,dini)
end//let
(*let*)//end-of-[trtmp3b_d3vardcl(env0,dvar)]
//
(* ****** ****** *)
//
#implfun
trtmp3b_d3eclist
( env0, dcls ) =
(
  list_trtmp3b_fnp(env0, dcls, trtmp3b_d3ecl))
//
(* ****** ****** *)
//
#implfun
trtmp3b_d3valdclist
( env0, d3vs ) =
(
  list_trtmp3b_fnp(env0, d3vs, trtmp3b_d3valdcl))
//
#implfun
trtmp3b_d3vardclist
( env0, d3vs ) =
(
  list_trtmp3b_fnp(env0, d3vs, trtmp3b_d3vardcl))
//
(* ****** ****** *)
//
#implfun
trtmp3b_d3fundclist
( env0, d3fs ) =
(
  list_trtmp3b_fnp(env0, d3fs, trtmp3b_d3fundcl))
//
(* ****** ****** *)
//
#implfun
trtmp3b_d3explstopt
  (env0, dopt) =
(
  optn_trtmp3b_fnp(env0, dopt, trtmp3b_d3explst))
//
(* ****** ****** *)
//
#implfun
trtmp3b_d3eclistopt
  (env0, dopt) =
(
  optn_trtmp3b_fnp(env0, dopt, trtmp3b_d3eclist))
//
(* ****** ****** *)

(* end of [ATS3/XATSOPT_srcgen2_trtmp3b_decl00.dats] *)

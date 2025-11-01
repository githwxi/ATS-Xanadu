(***********************************************************************)
(*                                                                     *)
(*                         Applied Type System                         *)
(*                                                                     *)
(***********************************************************************)

(*
** ATS/Xanadu - Unleashing the Potential of Types!
** Copyright (C) 2025 Hongwei Xi, ATS Trustful Software, Inc.
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
(* ****** ****** *)
//
(*
Author: Hongwei Xi
(*
Thu Sep 18 02:05:37 AM EDT 2025
*)
Authoremail: gmhwxiATgmailDOTcom
*)
//
(* ****** ****** *)
(* ****** ****** *)
//
#staload
"./../SATS/statyp2.sats"
#staload
"./../SATS/dynexp3.sats"
#staload
"./../SATS/tryltck.sats"
//
(* ****** ****** *)
(* ****** ****** *)
//
#include
"./../HATS/mytmplib00.hats"
//
(* ****** ****** *)
(* ****** ****** *)
//
#staload
"prelude/SATS/gsyn000.sats"
//
(* ****** ****** *)
(* ****** ****** *)
//
#staload
"./../../../SATS/statyp2.sats"
#staload
"./../../../SATS/dynexp3.sats"
//
(* ****** ****** *)
(* ****** ****** *)
//
fun
d3pat1_errck
(lvl0: sint
,d3p0: d3pat1): d3pat1 =
(
let
val loc0 = d3p0.lctn()
val styp = d3p0.styp()
in//let
d3pat1_make_lctn$styp$node
(loc0,styp,D3P1errck(lvl0,d3p0))
end//let
)(*case+*)//end(d3pat1_errck(...))
//
(* ****** ****** *)
//
fun
d3exp1_errck
(lvl0: sint
,d3e0: d3exp1): d3exp1 =
(
let
val loc0 = d3e0.lctn()
val dtyp = d3e0.dtyp()
in//let
d3exp1_make_lctn$dtyp$node
(loc0,dtyp,D3E1errck(lvl0,d3e0))
end//let
)(*case+*)//end(d3exp1_errck(...))
//
(* ****** ****** *)
(* ****** ****** *)
//
#implfun
d3pat1_tryltck
( dpat, err0 ) =
(
case+
dpat.node() of
//
| _(*otherwise*) =>
(
  d3pat1_errck(0(*lvl*), dpat))
//
) where
{
val (  ) =
(
prerrsln("d3pat1_tryltck: dpat = ", dpat))
val (  ) =
(
prerrsln("d3pat1_tryltck: dpat = ", dpat))
}(*where*)//end-of-[d3pat1_tryltck(dpat,err0)]
//
(* ****** ****** *)
(* ****** ****** *)
//
#implfun
d3exp1_tryltck
( dexp, err0 ) =
(
case+
dexp.node() of
//
| _(*otherwise*) =>
(
  d3exp1_errck(0(*lvl*), dexp))
//
) where
{
val (  ) =
(
prerrsln("d3exp1_tryltck: dexp = ", dexp))
val (  ) =
(
prerrsln("d3exp1_tryltck: dexp = ", dexp))
}(*where*)//end-of-[d3exp1_tryltck(dexp,err0)]
//
(* ****** ****** *)
(* ****** ****** *)
//
(***********************************************************************)
(* end of [ATS3/XATSOPT_srcgen2_xsyncpy_srcgen1_DATS_tryltck_dynexp.dats] *)
(***********************************************************************)

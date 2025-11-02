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
Thu Sep 18 02:06:27 AM EDT 2025
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
//
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
#symload +
with sint_add$sint of 1099
#symload -
with sint_sub$sint of 1099
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
d3ecl1_errck
(lvl0: sint
,d3cl: d3ecl1): d3ecl1 =
(
let
val loc0 = d3cl.lctn()
in//let
(
d3ecl1_make_lctn$node
(loc0, D3C1errck(lvl0, d3cl)))
end//let
)(*case+*)//end(d3ecl1_errck(...))
//
(* ****** ****** *)
(* ****** ****** *)
//
#implfun
d3ecl1_tryltck
( d3cl, err0 ) =
(
case+
d3cl.node() of
//
|
_(*otherwise*) =>
let
val lvl0 = 1
in//let
(
err0:=(err0+1); d3ecl1_errck(lvl0,d3cl))
endlet//end of [_(______otherwise______)]
//
) where
{
val (  ) =
(
prerrsln("d3ecl1_tryltck: d3cl = ", d3cl))
val (  ) =
(
prerrsln("d3ecl1_tryltck: d3cl = ", d3cl))
}(*where*)//end-of-[d3ecl1_tryltck(d3cl,err0)]
//
(* ****** ****** *)
(* ****** ****** *)
//
(***********************************************************************)
(* end of [ATS3/XATSOPT_srcgen2_xsyncpy_srcgen1_DATS_tryltck_decl00.dats] *)
(***********************************************************************)

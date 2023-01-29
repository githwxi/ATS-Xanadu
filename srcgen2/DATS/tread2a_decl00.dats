(***********************************************************************)
(*                                                                     *)
(*                         Applied Type System                         *)
(*                                                                     *)
(***********************************************************************)

(*
** ATS/Xanadu - Unleashing the Potential of Types!
** Copyright (C) 2022 Hongwei Xi, ATS Trustful Software, Inc.
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
Sat 28 Jan 2023 04:13:53 PM EST
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
#staload "./../SATS/locinfo.sats"
(* ****** ****** *)
#staload "./../SATS/lexing0.sats"
(* ****** ****** *)
#staload "./../SATS/staexp1.sats"
#staload "./../SATS/dynexp1.sats"
(* ****** ****** *)
#staload "./../SATS/staexp2.sats"
#staload "./../SATS/dynexp2.sats"
(* ****** ****** *)
#staload "./../SATS/tread2a.sats"
(* ****** ****** *)
#symload lctn with token_get_lctn
#symload node with token_get_node
(* ****** ****** *)
#symload lctn with d2ecl_get_lctn
#symload node with d2ecl_get_node
(* ****** ****** *)
#symload lctn with d2valdcl_get_lctn
#symload lctn with d2vardcl_get_lctn
#symload lctn with d2fundcl_get_lctn
#symload lctn with d2cstdcl_get_lctn
(* ****** ****** *)
//
fun
d2ecl_static_errck
( loc0: loc_t
, tknd: token
, dcl1: d2ecl): d2ecl =
let
val lvl = 0
in//let
d2ecl_errck
( lvl+1
, d2ecl(loc0, D2Cstatic(tknd, dcl1)) )
end (*let*)//end-of-[d2ecl_static_errck]
//
fun
d2ecl_extern_errck
( loc0: loc_t
, tknd: token
, dcl1: d2ecl): d2ecl =
let
val lvl = 0
in//let
d2ecl_errck
( lvl+1
, d2ecl(loc0, D2Cextern(tknd, dcl1)) )
end (*let*)//end-of-[d2ecl_extern_errck]
//
(* ****** ****** *)

#implfun
tread2a_d2ecl
  (d2cl, err) =
(
case+
d2cl.node() of
//
|
D2Cd1ecl _ => d2cl
//
|
D2Cstatic _ => f0_static(d2cl, err)
|
D2Cextern _ => f0_extern(d2cl, err)
//
|
_(*otherwise*) =>
let
val lvl0 = 1
in//let
(
err := err+1; d2ecl_errck(lvl0, d2cl))
endlet // end of [ _ (* otherwise *) ]
//
) where // end of [case+(d2cl.node())]
{
(* ****** ****** *)
(*
val (  ) =
prerrln("tread2a_d2ecl: d2cl = ", d2cl)
*)
(* ****** ****** *)
//
//
fun
f0_static
( dcl: d2ecl
, err: &sint >> _): d2ecl =
let
//
val e00 = err
//
val-
D2Cstatic
( tknd, dcl1) = dcl.node()
//
val dcl1 = tread2a_d2ecl(dcl1, err)
//
in
if
(e00=err)
then dcl else
d2ecl_static_errck(dcl.lctn(),tknd,dcl1)
end (*let*) // end of [ f0_static(dcl,err) ]
//
fun
f0_extern
( dcl: d2ecl
, err: &sint >> _): d2ecl =
let
//
val e00 = err
//
val-
D2Cextern
( tknd, dcl1) = dcl.node()
//
val dcl1 = tread2a_d2ecl(dcl1, err)
//
in
if
(e00=err)
then dcl else
d2ecl_extern_errck(dcl.lctn(),tknd,dcl1)
end (*let*) // end of [ f0_extern(dcl,err) ]
//
(* ****** ****** *)
//
} (*where*) // end of [tread2a_d2ecl(d2cl,err)]

(* ****** ****** *)
//
#implfun
tread2a_d2eclist
  (  dcls, err  ) =
list_tread2a_fnp(dcls, err, tread2a_d2ecl)
//
(* ****** ****** *)

(* end of [ATS3/XATSOPT_srcgen2_tread2a_decl00.dats] *)

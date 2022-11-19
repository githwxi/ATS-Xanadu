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
Sat 12 Nov 2022 09:06:44 AM EST
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
#staload "./../SATS/tread12.sats"
(* ****** ****** *)
#symload lctn with token_get_lctn
#symload node with token_get_node
(* ****** ****** *)
#symload lctn with d2ecl_get_lctn
#symload node with d2ecl_get_node
(* ****** ****** *)
//
fun
d2ecl_errck
(lvl0: sint
,d2cl: d2ecl): d2ecl =
(
d2ecl
(d2cl.lctn(), D2Cerrck(lvl0, d2cl)))
//
(* ****** ****** *)

#implfun
tread12_d2ecl
  (d2cl, err) =
(
case+
d2cl.node() of
//
|
D2Cd1ecl _ => d2cl
//
|
_(*otherwise*) =>
let
val lvl0 = 1
in//let
(
err := err+1; d2ecl_errck(lvl0,d2cl))
endlet // end of [ _(* otherwise *) ]
//
) where // end of [case+(d2cl.node())]
{
//
//
} (*where*) // end of [tread12_d2ecl(d2cl,err)]

(* ****** ****** *)
//
#implfun
tread12_d2eclist
  (  dcls, err  ) =
list_tread12_fnp(dcls, err, tread12_d2ecl)
//
(* ****** ****** *)

(* end of [ATS3/XATSOPT_srcgen2_tread12_decl00.dats] *)

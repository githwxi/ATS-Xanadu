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
Tue Jul 26 12:37:25 EDT 2022
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
#staload "./../SATS/staexp0.sats"
#staload "./../SATS/dynexp0.sats"
(* ****** ****** *)
#staload "./../SATS/staexp1.sats"
#staload "./../SATS/dynexp1.sats"
(* ****** ****** *)
#staload "./../SATS/trans01.sats"
(* ****** ****** *)

#symload lctn with d0pat_get_lctn
#symload node with d0pat_get_node
#symload lctn with d0exp_get_lctn
#symload node with d0exp_get_node

(* ****** ****** *)
//
fun
d1pat_none1
(d0p1: d0pat): d1pat =
d1pat(d0p1.lctn(), D1Pnone1(d0p1))
//
(* ****** ****** *)
//
fun
d1exp_none1
(d0e1: d0exp): d1exp =
d1exp(d0e1.lctn(), D1Enone1(d0e1))
//
(* ****** ****** *)

#implfun
trans01_d0pat(d0p0) =
let
//
val loc0 = d0p0.lctn()
//
val () =
prerrln
("trans01_d0pat: loc0 = ", loc0)
val () =
prerrln
("trans01_d0pat: d0p0 = ", d0p0)
//
in//let
case+
d0p0.node() of
| _(*otherwise*) => d1pat_none1(d0p0)
end (*let*) // end of [trans01_d0pat(d0p0)]

(* ****** ****** *)

#implfun
trans01_d0exp(d0e0) =
let
//
val loc0 = d0e0.lctn()
//
val () =
prerrln
("trans01_d0exp: loc0 = ", loc0)
val () =
prerrln
("trans01_d0exp: d0e0 = ", d0e0)
//
in//let
case+
d0e0.node() of
| _(*otherwise*) => d1exp_none1(d0e0)
end (*let*) // end of [trans01_d0exp(d0e0)]

(* ****** ****** *)

(* end of [ATS3/XATSOPT_trans01_dynexp.dats] *)

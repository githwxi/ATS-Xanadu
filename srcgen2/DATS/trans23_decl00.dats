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
Sun 19 Feb 2023 09:40:11 AM EST
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
_(*TRANS23*) = "./trans23.dats"
(* ****** ****** *)
#staload "./../SATS/xbasics.sats"
(* ****** ****** *)
#staload "./../SATS/xsymbol.sats"
(* ****** ****** *)
#staload "./../SATS/locinfo.sats"
(* ****** ****** *)
#staload "./../SATS/lexing0.sats"
(* ****** ****** *)
#staload "./../SATS/staexp2.sats"
#staload "./../SATS/statyp2.sats"
#staload "./../SATS/dynexp2.sats"
(* ****** ****** *)
#staload "./../SATS/dynexp3.sats"
(* ****** ****** *)
#staload "./../SATS/trans23.sats"
(* ****** ****** *)
#symload lctn with token_get_lctn
#symload node with token_get_node
(* ****** ****** *)
#symload lctn with d2ecl_get_lctn
#symload node with d2ecl_get_node
(* ****** ****** *)
//
#implfun
trans23_d2ecl
( env0, d2cl ) = let
//
// (*
val
loc0 = d2cl.lctn()
val () =
prerrln
("trans23_d2ecl: d2cl = ", d2cl)
// *)
//
in//let
//
case+
d2cl.node() of
//
|
D2Cfundclst _ => f0_fundclst(env0, d2cl)
//
| _(*otherwise*) =>
let
  val loc0 = d2cl.lctn()
in//let
  d3ecl_make_node(loc0, D3Cnone1( d2cl ))
end (*let*) // end of [_(*otherwise*)] // temp
//
end where {
//
(* ****** ****** *)
//
fun
f0_fundclst
( env0:
! tr23env
, d2cl: d2ecl): d3ecl =
let
//
val
loc0 = d2cl.lctn()
val-
D2Cfundclst
(tknd
,tqas, d2fs) = d2cl.node()
//
val () =
prerrln
("f0_fundclst: d2cl = ", d2cl)
//
val
d3fs =
trans23_d2fundclist(env0, d2fs)
//
in//let
d3ecl(loc0, D3Cfundclst(tknd, tqas, d3fs))
end (*let*) // end of [f0_fundclst(env0,d2cl)]
//
(* ****** ****** *)
//
} (*where*) // end of [trans23_d2ecl(env0,d2cl)]

(* ****** ****** *)

#implfun
trans23_d2eclist
  (env0, dcls) =
(
list_trans23_fnp(env0, dcls, trans23_d2ecl))

(* ****** ****** *)
//
#implfun
trans23_d2valdclist
  (env0, d2vs) =
(
list_trans23_fnp(env0, d2vs, trans23_d2valdcl))
//
#implfun
trans23_d2vardclist
  (env0, d2vs) =
(
list_trans23_fnp(env0, d2vs, trans23_d2vardcl))
//
(* ****** ****** *)
//
#implfun
trans23_d2fundclist
  (env0, d2fs) =
(
list_trans23_fnp(env0, d2fs, trans23_d2fundcl))
//
(* ****** ****** *)
//
#implfun
trans23_d2eclistopt
  (  env0,dopt  ) =
(
optn_trans23_fnp(env0, dopt, trans23_d2eclist))
//
(* ****** ****** *)

(* end of [ATS3/XATSOPT_srcgen2_trans23_decl00.dats] *)

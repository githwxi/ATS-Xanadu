(***********************************************************************)
(*                                                                     *)
(*                         Applied Type System                         *)
(*                                                                     *)
(***********************************************************************)

(*
** ATS/Xanadu - Unleashing the Potential of Types!
** Copyright (C) 2024 Hongwei Xi, ATS Trustful Software, Inc.
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
Sat 06 Jul 2024 10:45:01 AM EDT
*)
Authoremail: gmhwxiATgmailDOTcom
*)
//
(* ****** ****** *)
(* ****** ****** *)
#include
"./../HATS/xatsopt_sats.hats"
#include
"./../HATS/xatsopt_dats.hats"
(* ****** ****** *)
(* ****** ****** *)
#define
ATS_PACKNAME
"ATS3.XANADU.xatsopt-20220500"
(* ****** ****** *)
(* ****** ****** *)
#staload
_(*XDEPEND*) = "./xdepend.dats"
(* ****** ****** *)
#staload "./../SATS/dynexp2.sats"
(* ****** ****** *)
#staload "./../SATS/xdepend.sats"
(* ****** ****** *)
(* ****** ****** *)
#symload lctn with d2ecl_get_lctn
#symload node with d2ecl_get_node
(* ****** ****** *)
(* ****** ****** *)
//
#implfun
xd2penv_d2ecl
( env0,d2cl ) =
(
case+
d2cl.node() of
|
D2Clocal0 _ =>
f0_local0(env0, d2cl)
//
|D2Cinclude _ =>
f0_include(env0, d2cl)
|D2Cstaload _ =>
f0_staload(env0, d2cl)
//
| _(*otherwise*) => ( (*void*) )
//
) where
{
//
fun
f0_local0
( env0:
! xd2penv
, d2cl: d2ecl): void =
let
//
val-
D2Clocal0
(head, body) = d2cl.node()
//
val () =
xd2penv_d2eclist(env0, head)
val () =
xd2penv_d2eclist(env0, body)
//
end//let//end-of-[f0_local0(env0,d2cl)]
//
(* ****** ****** *)
//
fun
f0_include
( env0:
! xd2penv
, d2cl: d2ecl): void =
let
//
val-
D2Einclude _ = d2cl.node()
//
val () =
prerrln
("f0_include(dp): d2cl = ", d2cl)
//
end//let//end-of-[f0_include(env0,d2cl)]
//
fun
f0_staload
( env0:
! xd2penv
, d2cl: d2ecl): void =
let
//
val-
D2Estaload _ = d2cl.node()
//
val () =
prerrln
("f0_staload(dp): d2cl = ", d2cl)
//
end//let//end-of-[f0_staload(env0,d2cl)]
//
(* ****** ****** *)
//
(*
val () =
(
  prerrln("xd2penv_d2ecl: d2cl = ", d2cl))
*)
//
(* ****** ****** *)
//
}(*where*)//end-of-[xd2penv_d2ecl(env0,d2cl)]
//
(* ****** ****** *)
//
#implfun
xd2penv_d2eclist(env0, dcls) =
(
  list_xd2penv_fnp(env0, dcls, xd2penv_d2ecl))
//
(* ****** ****** *)
//
#implfun
xd2penv_d2eclistopt(env0, dopt) =
(
case+ dopt of
| optn_nil((*0*)) => ( (*void*) )
| optn_cons(dcls) => xd2penv_d2eclist(env0, dcls))
//
(* ****** ****** *)

(* end of [ATS3/XATSOPT_srcgen2_DATS_xdepend_decl00.dats] *)

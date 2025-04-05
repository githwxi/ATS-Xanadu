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
(* ****** ****** *)
//
(*
Author: Hongwei Xi
(*
Sat 06 Jul 2024 10:43:02 AM EDT
*)
Authoremail: gmhwxiATgmailDOTcom
*)
//
(* ****** ****** *)
(* ****** ****** *)
//
#staload
"./../SATS/xdepend.sats"
//
(* ****** ****** *)
(* ****** ****** *)
#include
"./../HATS/libxatsopt.hats"
(* ****** ****** *)
(* ****** ****** *)
#staload
_(*XDEPEND*) = "./xdepend.dats"
(* ****** ****** *)
(* ****** ****** *)
//
#implfun
xd2penv_d2exp(env0, dexp) =
(
case+
dexp.node() of
//
| D2Elet0 _ =>
  f0_let0(env0, dexp)
//
| _(*otherwise*) => ( (*void*) )
//
) where
{
(*
val () = printsln
("xd2penv_d2exp: dexp = ", dexp)
*)
//
fun
f0_let0
( env0:
! xd2penv
, dexp: d2exp): void =
let
//
val-
D2Elet0
(dcls, d2e1) = dexp.node()
//
in//let
//
(
  xd2penv_d2exp(env0, d2e1)
) where
{ val () =
  xd2penv_d2eclist(env0, dcls) }
//
end//let
//
}(*where*)//end-of-[xd2penv_d2exp(...)]
//
(* ****** ****** *)

#implfun
xd2penv_d2explst(env0, d2es) =
list_xd2penv_fnp(env0, d2es, xd2penv_d2exp)

(* ****** ****** *)
(* ****** ****** *)

(* end of [ATS3/XATSOPT_srcgen2_DATS_xdepend_dynexp.dats] *)

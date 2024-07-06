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
Sat 06 Jul 2024 08:59:03 AM EDT
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
#staload "./../SATS/xdepend.sats"
(* ****** ****** *)
(* ****** ****** *)
//
#implfun
<x0>(*tmp*)
list_xd2penv_fnp
( e1, xs, work ) =
(
  loop(e1, xs) ) where
{
fun
loop
( e1:
! xd2penv
, xs: list(x0)): void =
(
case+ xs of
| list_nil() => ()
| list_cons(x1, xs) =>
  (work(e1, x1); loop(e1, xs)))
}(*where*)//end(list_xd2penv_fnp(e1,xs,work))
//
(* ****** ****** *)
//
#implfun
<x0>(*tmp*)
optn_xd2penv_fnp
( e1, xs, work ) =
(
case+ xs of
| optn_nil() => ()
| optn_cons(x1) => work(e1, x1)
)(*case+*)//end(optn_xd2penv_fnp(e1,xs,work))
//
(* ****** ****** *)
(* ****** ****** *)

(* end of [ATS3/XATSOPT_srcgen2_DATS_xdepend.dats] *)

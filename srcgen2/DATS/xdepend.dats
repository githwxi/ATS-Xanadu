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
#staload "./../SATS/dynexp2.sats"
(* ****** ****** *)
#staload "./../SATS/xdepend.sats"
(* ****** ****** *)
(* ****** ****** *)
//
#implfun
xdepend_d2parsed
  (  dpar  ) = let
//
(*
val stadyn =
d2parsed_get_stadyn(dpar)
val nerror =
d2parsed_get_nerror(dpar)
val source =
d2parsed_get_source(dpar)
val t1penv =
d2parsed_get_t1penv(dpar)
val t2penv =
d2parsed_get_t2penv(dpar)
*)
//
val parsed =
d2parsed_get_parsed(dpar)
//
in//let
//
(
  xd2penv_free_top(env0)) where
{
  val env0 =
  xd2penv_make_nil((*void*))
  val (  ) =
  xd2penv_d2eclistopt(env0, parsed) }
//
end (*let*) // end of [xdepend_d2parsed(dpar)]
//
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
}(*where*)//end-of-(list_xd2penv_fnp(e1,xs,work))
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
)(*case+*)//end-of[(optn_xd2penv_fnp(e1,xs,work))
//
(* ****** ****** *)
(* ****** ****** *)

(* end of [ATS3/XATSOPT_srcgen2_DATS_xdepend.dats] *)

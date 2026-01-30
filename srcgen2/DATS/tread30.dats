(***********************************************************************)
(*                                                                     *)
(*                         Applied Type System                         *)
(*                                                                     *)
(***********************************************************************)

(*
** ATS/Xanadu - Unleashing the Potential of Types!
** Copyright (C) 2026 Hongwei Xi, ATS Trustful Software, Inc.
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
Fri Jan 30 11:37:39 AM EST 2026
*)
Authoremail: gmhwxiATgmailDOTcom
*)
//
(* ****** ****** *)
(* ****** ****** *)
#define
ATS_PACKNAME
"ATS3.XANADU.xatsopt-20220500"
(* ****** ****** *)
(* ****** ****** *)
//
#include
"./../HATS/xatsopt_sats.hats"
(*
#include
"./../HATS/xatsopt_dats.hats"
*)
#include
"./../HATS/xatsopt_dpre.hats"
//
(* ****** ****** *)
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
#staload "./../SATS/dynexp3.sats"
(* ****** ****** *)
#staload "./../SATS/tread30.sats"
(* ****** ****** *)
#symload lctn with token_get_lctn
#symload node with token_get_node
(* ****** ****** *)
(* ****** ****** *)
//
#implfun
optn_tread30_fnp
{x0:tx}
( e1
, xs, nerr, fopr) =
(
auxopt(e1,xs,nerr))
where
{
//
fun
auxopt
( e1:
! envrd30
, xs: optn(x0)
, nerr: &sint >> _): optn(x0) =
(
case+ xs of
|
optn_nil() =>
optn_nil(*void*)
|
optn_cons(x1) =>
let
val n0 = nerr
val x1 = fopr(e1, x1, nerr)
in//let
(
if // if
(n0 = nerr)
then (xs) else optn_cons(x1))
end(*end*)//end-of-[optn_cons(x1)]
)(*case+*)//end-of-[auxopt(e1,xs,nerr)]
//
}(*where*)//end-of-[optn_tread30_fnp(e1,xs,...)]
//
(* ****** ****** *)
//
#implfun
list_tread30_fnp
{x0:tx}
( e1
, xs, nerr, fopr) =
(
auxlst(e1,xs,nerr))
where
{
//
fun
auxlst
( e1:
! envrd30
, xs: list(x0)
, nerr: &sint >> _): list(x0) =
(
case+ xs of
|
list_nil() =>
list_nil(*void*)
|
list_cons(x1, rs) =>
let
val n0 = nerr
val x1 = fopr(e1, x1, nerr)
val rs = auxlst(e1, rs, nerr)
in//let
(
if // if
(n0 = nerr)
then (xs) else list_cons(x1, rs))
end(*end*)//end-of-[list_cons(x1,rs)]
)(*case+*)//end-of-[auxlst(e1,xs,nerr)]
//
}(*where*)//end-of-[list_tread30_fnp(e1,xs,...)]
//
(* ****** ****** *)
(* ****** ****** *)
//
#implfun
tread30_d3patlst
( env0, d3ps, nerr ) =
list_tread30_fnp(env0, d3ps, nerr, tread30_d3pat)
//
(* ****** ****** *)
(* ****** ****** *)
//
#implfun
tread30_d3explst
( env0, d3es, nerr ) =
list_tread30_fnp(env0, d3es, nerr, tread30_d3exp)
//
(* ****** ****** *)
(* ****** ****** *)
//
#implfun
tread30_d3eclist
( env0, d3cs, nerr ) =
list_tread30_fnp(env0, d3cs, nerr, tread30_d3ecl)
//
(* ****** ****** *)
(* ****** ****** *)
//
#implfun
tread30_d3explstopt
( env0, dopt, nerr ) =
optn_tread30_fnp(env0, dopt, nerr, tread30_d3explst)
//
(* ****** ****** *)
//
#implfun
tread30_d3eclistopt
( env0, dopt, nerr ) =
optn_tread30_fnp(env0, dopt, nerr, tread30_d3eclist)
//
(* ****** ****** *)
(* ****** ****** *)
//
(***********************************************************************)
(* end of [ATS3/XATSOPT_srcgen2_DATS_tread30.dats] *)
(***********************************************************************)

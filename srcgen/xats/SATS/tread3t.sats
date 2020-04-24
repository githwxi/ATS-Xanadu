(***********************************************************************)
(*                                                                     *)
(*                         Applied Type System                         *)
(*                                                                     *)
(***********************************************************************)

(*
** ATS/Xanadu - Unleashing the Potential of Types!
** Copyright (C) 2018 Hongwei Xi, ATS Trustful Software, Inc.
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
// Author: Hongwei Xi
// Start Time: September, 2019
// Authoremail: gmhwxiATgmailDOTcom
//
(* ****** ****** *)

#staload "./staexp1.sats"
#staload "./dynexp1.sats"

(* ****** ****** *)

#staload "./staexp2.sats"
#staload "./statyp2.sats"
#staload "./dynexp2.sats"
#staload "./dynexp3.sats"

(* ****** ****** *)
//
typedef
treader3t
(a:t@ype) = (a) -> void
//
(* ****** ****** *)
//
datatype trerr3t =
//
| TRERR3Td3pat of (d3pat)
| TRERR3Td3exp of (d3exp)
//
| TRERR3Tf3arg of (f3arg)
| TRERR3Td3ecl of (d3ecl)
//
| TRERR3Td3exp_timp2f of (d3exp, f3undecl)
//
typedef
trerr3tlst = List0(trerr3t)
//
(* ****** ****** *)
//
fun//{}
trerr3t_add(trerr3t): void
//
(* ****** ****** *)
//
fun
tread3t_main(d3eclist): void
//
(* ****** ****** *)
//
fun//{}
tread3t_d3pat: treader3t(d3pat)
fun//{}
tread3t_d3patlst: treader3t(d3patlst)
//
(* ****** ****** *)
//
fun//{}
tread3t_d3exp: treader3t(d3exp)
fun//{}
tread3t_d3explst: treader3t(d3explst)
fun//{}
tread3t_d3expopt: treader3t(d3expopt)
//
(* ****** ****** *)
//
fun//{}
tread3t_d3ecl: treader3t(d3ecl)
fun//{}
tread3t_d3eclist: treader3t(d3eclist)
//
(* ****** ****** *)

fun//{}
tread3t_v3aldecl: treader3t(v3aldecl)
fun//{}
tread3t_v3aldeclist: treader3t(v3aldeclist)

(* ****** ****** *)

fun//{}
tread3t_v3ardecl: treader3t(v3ardecl)
fun//{}
tread3t_v3ardeclist: treader3t(v3ardeclist)

(* ****** ****** *)

fun//{}
tread3t_f3undecl: treader3t(f3undecl)
fun//{}
tread3t_f3undeclist: treader3t(f3undeclist)

(* ****** ****** *)

(* end of [xats_tread3t.sats] *)

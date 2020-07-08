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
treader3x
(a:t@ype) = (a) -> void
//
(* ****** ****** *)
//
datatype trerr3x =
//
| TRERR3Xd3pat of (d3pat)
| TRERR3Xd3exp of (d3exp)
//
| TRERR3Xf3arg of (f3arg)
| TRERR3Xd3ecl of (d3ecl)
//
| TRERR3Xd3exp_tcst of (d3exp)
| TRERR3Xd3exp_tnfd of (d3exp)
| TRERR3Xd3exp_trec of (d3exp)
//
| TRERR3Xd3exp_tapp of (d3exp)
| TRERR3Xd3exp_timp2f of (d3exp, f3undecl)
//
typedef
trerr3xlst = List0(trerr3x)
//
(* ****** ****** *)
//
fun//{}
trerr3x_add(trerr3x): void
//
(* ****** ****** *)
//
fun
tread3x_program
  (prog: d3eclist): void
//
(* ****** ****** *)
//
fun//{}
tread3x_d3pat: treader3x(d3pat)
fun//{}
tread3x_d3patlst: treader3x(d3patlst)
//
(* ****** ****** *)
//
fun//{}
tread3x_d3exp: treader3x(d3exp)
fun//{}
tread3x_d3explst: treader3x(d3explst)
fun//{}
tread3x_d3expopt: treader3x(d3expopt)
//
(* ****** ****** *)
//
fun//{}
tread3x_d3gua: treader3x(d3gua)
fun//{}
tread3x_d3gpat: treader3x(d3gpat)
fun//{}
tread3x_d3clau: treader3x(d3clau)
fun//{}
tread3x_d3gualst: treader3x(d3gualst)
fun//{}
tread3x_d3claulst: treader3x(d3claulst)
//
(* ****** ****** *)
//
fun//{}
tread3x_d3ecl: treader3x(d3ecl)
fun//{}
tread3x_d3eclist: treader3x(d3eclist)
//
(* ****** ****** *)

fun//{}
tread3x_v3aldecl: treader3x(v3aldecl)
fun//{}
tread3x_v3aldeclist: treader3x(v3aldeclist)

(* ****** ****** *)

fun//{}
tread3x_v3ardecl: treader3x(v3ardecl)
fun//{}
tread3x_v3ardeclist: treader3x(v3ardeclist)

(* ****** ****** *)

fun//{}
tread3x_f3undecl: treader3x(f3undecl)
fun//{}
tread3x_f3undeclist: treader3x(f3undeclist)

(* ****** ****** *)

(* end of [xats_tread3x.sats] *)

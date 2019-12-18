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
treader23
(a:t@ype) = (a) -> void
//
(* ****** ****** *)
//
datatype t3xerr =
//
| T3XERRd3pat of (d3pat)
| T3XERRd3exp of (d3exp)
//
| T3XERRf3arg of (f3arg)
| T3XERRd3ecl of (d3ecl)
//
typedef
t3xerrlst = List0(t3xerr)
//
(* ****** ****** *)
//
fun{}
t3xerr_add(t3xerr): void
//
(* ****** ****** *)
//
fun
tread23_main(d3eclist): void
//
(* ****** ****** *)
//
fun{}
tread23_d3pat: treader23(d3pat)
fun{}
tread23_d3patopt: treader23(d3patopt)
fun{}
tread23_d3patlst: treader23(d3patlst)
//
(* ****** ****** *)
//
fun{}
tread23_d3exp: treader23(d3exp)
fun{}
tread23_d3expopt: treader23(d3expopt)
fun{}
tread23_d3explst: treader23(d3explst)
//
(* ****** ****** *)

fun{}
tread23_d3gua: treader23(d3gua)
fun{}
tread23_d3clau: treader23(d3clau)
fun{}
tread23_d3gpat: treader23(d3gpat)
fun{}
tread23_d3gualst: treader23(d3gualst)
fun{}
tread23_d3claulst: treader23(d3claulst)

(* ****** ****** *)
//
fun{}
tread23_d3ecl: treader23(d3ecl)
fun{}
tread23_d3eclist: treader23(d3eclist)
//
(* ****** ****** *)

fun{}
tread23_f3arg: treader23(f3arg)
fun{}
tread23_f3arglst: treader23(f3arglst)
fun{}
tread23_f3arglstopt: treader23(f3arglstopt)

(* ****** ****** *)

fun{}
tread23_v3aldecl: treader23(v3aldecl)
fun{}
tread23_v3aldeclist: treader23(v3aldeclist)

(* ****** ****** *)

fun{}
tread23_v3ardecl: treader23(v3ardecl)
fun{}
tread23_v3ardeclist: treader23(v3ardeclist)

(* ****** ****** *)

fun{}
tread23_f3undecl: treader23(f3undecl)
fun{}
tread23_f3undeclist: treader23(f3undeclist)

(* ****** ****** *)

(* end of [xats_tread23.sats] *)

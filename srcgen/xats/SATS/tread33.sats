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
treader33
(a:t@ype) = (a) -> void
//
(* ****** ****** *)
//
datatype trerr33 =
//
| TRERR33d3pat of (d3pat)
| TRERR33d3exp of (d3exp)
//
| TRERR33f3arg of (f3arg)
| TRERR33d3ecl of (d3ecl)
//
| TRERR33ti2arg of (ti2arg)
//
typedef
trerr33lst = List0(trerr33)
//
(* ****** ****** *)
//
fun//{}
trerr33_add(trerr33): void
//
(* ****** ****** *)
//
fun
tread33_program
  (prog: d3eclist): void
//
(* ****** ****** *)
//
fun//{}
tread33_d3pat: treader33(d3pat)
fun//{}
tread33_d3patopt: treader33(d3patopt)
fun//{}
tread33_d3patlst: treader33(d3patlst)
//
(* ****** ****** *)
//
fun//{}
tread33_d3exp: treader33(d3exp)
fun//{}
tread33_d3expopt: treader33(d3expopt)
fun//{}
tread33_d3explst: treader33(d3explst)
//
(* ****** ****** *)

fun//{}
tread33_d3gua: treader33(d3gua)
fun//{}
tread33_d3clau: treader33(d3clau)
fun//{}
tread33_d3gpat: treader33(d3gpat)
fun//{}
tread33_d3gualst: treader33(d3gualst)
fun//{}
tread33_d3claulst: treader33(d3claulst)

(* ****** ****** *)
//
fun//{}
tread33_d3ecl: treader33(d3ecl)
fun//{}
tread33_d3eclist: treader33(d3eclist)
//
(* ****** ****** *)

fun//{}
tread33_ti3arg: treader33(ti3arg)
fun//{}
tread33_ti2arg: treader33(ti2arg)
fun//{}
tread33_ti2arglst: treader33(ti2arglst)

(* ****** ****** *)

fun//{}
tread33_f3arg: treader33(f3arg)
fun//{}
tread33_f3arglst: treader33(f3arglst)
fun//{}
tread33_f3arglstopt: treader33(f3arglstopt)

(* ****** ****** *)

fun//{}
tread33_v3aldecl: treader33(v3aldecl)
fun//{}
tread33_v3aldeclist: treader33(v3aldeclist)

(* ****** ****** *)

fun//{}
tread33_v3ardecl: treader33(v3ardecl)
fun//{}
tread33_v3ardeclist: treader33(v3ardeclist)

(* ****** ****** *)

fun//{}
tread33_f3undecl: treader33(f3undecl)
fun//{}
tread33_f3undeclist: treader33(f3undeclist)

(* ****** ****** *)
//
// HX-2020-07-02:
// The following functions is expected
// to be CONTRIBUTED.
//
(* ****** ****** *)
//
fun//{}
tread33_d3exp_D3Elcast: treader33(d3exp)
//
fun//{}
tread33_d3exp_D3Etcast: treader33(d3exp)
//
(* ****** ****** *)

(* end of [xats_tread33.sats] *)

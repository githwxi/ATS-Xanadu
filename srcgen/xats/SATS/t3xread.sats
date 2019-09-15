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
t3xreader
(a:t@ype) = (a) -> void
//
(* ****** ****** *)
//
datatype t3xerr =
//
| T3XERRd3pat of (d3pat)
| T3XERRd3exp of (d3exp)
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
t3xread_main(d3eclist): void
//
(* ****** ****** *)
//
fun{}
t3xread_d3pat: t3xreader(d3pat)
fun{}
t3xread_d3patopt: t3xreader(d3patopt)
fun{}
t3xread_d3patlst: t3xreader(d3patlst)
//
(* ****** ****** *)
//
fun{}
t3xread_d3exp: t3xreader(d3exp)
fun{}
t3xread_d3expopt: t3xreader(d3expopt)
fun{}
t3xread_d3explst: t3xreader(d3explst)
//
(* ****** ****** *)
//
fun{}
t3xread_d3ecl: t3xreader(d3ecl)
fun{}
t3xread_d3eclist: t3xreader(d3eclist)
//
(* ****** ****** *)

fun{}
t3xread_f3arg: t3xreader(f3arg)
fun{}
t3xread_f3arglst: t3xreader(f3arglst)
fun{}
t3xread_f3arglstopt: t3xreader(f3arglstopt)

(* ****** ****** *)

fun{}
t3xread_v3aldecl: t3xreader(v3aldecl)
fun{}
t3xread_v3aldeclist: t3xreader(v3aldeclist)

(* ****** ****** *)

fun{}
t3xread_f3undecl: t3xreader(f3undecl)
fun{}
t3xread_f3undeclist: t3xreader(f3undeclist)

(* ****** ****** *)

(* end of [xats_t3xread.sats] *)

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
// Start Time: June, 2019
// Authoremail: gmhwxiATgmailDOTcom
//
(* ****** ****** *)

#staload "./staexp1.sats"
#staload "./dynexp1.sats"

(* ****** ****** *)

#staload "./staexp2.sats"
#staload "./dynexp2.sats"

(* ****** ****** *)
//
typedef
treader12
(a:t@ype) = (a) -> void
//
(* ****** ****** *)
//
datatype t2xerr =
//
| T2XERRsort2 of (sort2)
//
| T2XERRs2txt of (s2txt)
| T2XERRs2exp of (s2exp)
| T2XERRd2pat of (d2pat)
| T2XERRd2exp of (d2exp)
| T2XERRd2ecl of (d2ecl)
//
typedef
t2xerrlst = List0(t2xerr)
//
(* ****** ****** *)
//
fun{}
t2xerr_add(t2xerr): void
//
(* ****** ****** *)
//
fun
tread12_main(d2eclist): void
//
(* ****** ****** *)
//
fun{}
tread12_sort2: treader12(sort2)
fun{}
tread12_s2txt: treader12(s2txt)
//
(* ****** ****** *)
//
fun{}
tread12_s2cst: treader12(s2cst)
fun{}
tread12_s2cstlst: treader12(s2cstlst)
//
fun{}
tread12_s2var: treader12(s2var)
fun{}
tread12_s2varlst: treader12(s2varlst)
//
fun{}
tread12_s2exp: treader12(s2exp)
fun{}
tread12_s2expopt: treader12(s2expopt)
fun{}
tread12_s2explst: treader12(s2explst)
//
fun{}
tread12_labs2exp: treader12(labs2exp)
fun{}
tread12_labs2explst: treader12(labs2explst)
//
(* ****** ****** *)

fun{}
tread12_abstdf2: treader12(abstdf2)

(* ****** ****** *)

fun{}
tread12_effs2expopt: treader12(effs2expopt)

(* ****** ****** *)
//
fun{}
tread12_d2cst: treader12(d2cst)
fun{}
tread12_d2cstlst: treader12(d2cstlst)
//
(* ****** ****** *)
//
fun{}
tread12_d2pat: treader12(d2pat)
fun{}
tread12_d2patopt: treader12(d2patopt)
fun{}
tread12_d2patlst: treader12(d2patlst)
//
(* ****** ****** *)
//
fun{}
tread12_d2exp: treader12(d2exp)
fun{}
tread12_d2expopt: treader12(d2expopt)
fun{}
tread12_d2explst: treader12(d2explst)
//
(* ****** ****** *)

fun{}
tread12_dsapparg: treader12(s2explst)
fun{}
tread12_dtapparg: treader12(s2explst)

(* ****** ****** *)
//
fun{}
tread12_d2ecl: treader12(d2ecl)
fun{}
tread12_d2eclist: treader12(d2eclist)
//
(* ****** ****** *)

fun{}
tread12_f2arg: treader12(f2arg)
fun{}
tread12_f2arglst: treader12(f2arglst)

(* ****** ****** *)

fun{}
tread12_tq2arg: treader12(tq2arg)
fun{}
tread12_tq2arglst: treader12(tq2arglst)

(* ****** ****** *)

fun{}
tread12_f2undecl: treader12(f2undecl)
fun{}
tread12_f2undeclist: treader12(f2undeclist)

(* ****** ****** *)

(* end of [xats_tread12.sats] *)

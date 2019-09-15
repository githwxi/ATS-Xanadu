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
t2xreader
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
t2xread_main(d2eclist): void
//
(* ****** ****** *)
//
fun{}
t2xread_sort2: t2xreader(sort2)
fun{}
t2xread_s2txt: t2xreader(s2txt)
//
(* ****** ****** *)
//
fun{}
t2xread_s2cst: t2xreader(s2cst)
fun{}
t2xread_s2cstlst: t2xreader(s2cstlst)
//
fun{}
t2xread_s2var: t2xreader(s2var)
fun{}
t2xread_s2varlst: t2xreader(s2varlst)
//
fun{}
t2xread_s2exp: t2xreader(s2exp)
fun{}
t2xread_s2expopt: t2xreader(s2expopt)
fun{}
t2xread_s2explst: t2xreader(s2explst)
//
fun{}
t2xread_labs2exp: t2xreader(labs2exp)
fun{}
t2xread_labs2explst: t2xreader(labs2explst)
//
(* ****** ****** *)

fun{}
t2xread_abstdf2: t2xreader(abstdf2)

(* ****** ****** *)

fun{}
t2xread_effs2expopt: t2xreader(effs2expopt)

(* ****** ****** *)
//
fun{}
t2xread_d2cst: t2xreader(d2cst)
fun{}
t2xread_d2cstlst: t2xreader(d2cstlst)
//
(* ****** ****** *)
//
fun{}
t2xread_d2pat: t2xreader(d2pat)
fun{}
t2xread_d2patopt: t2xreader(d2patopt)
fun{}
t2xread_d2patlst: t2xreader(d2patlst)
//
(* ****** ****** *)
//
fun{}
t2xread_d2exp: t2xreader(d2exp)
fun{}
t2xread_d2expopt: t2xreader(d2expopt)
fun{}
t2xread_d2explst: t2xreader(d2explst)
//
(* ****** ****** *)
//
fun{}
t2xread_d2ecl: t2xreader(d2ecl)
fun{}
t2xread_d2eclist: t2xreader(d2eclist)
//
(* ****** ****** *)

fun{}
t2xread_f2arg: t2xreader(f2arg)
fun{}
t2xread_f2arglst: t2xreader(f2arglst)

(* ****** ****** *)

fun{}
t2xread_tq2arg: t2xreader(tq2arg)
fun{}
t2xread_tq2arglst: t2xreader(tq2arglst)

(* ****** ****** *)

fun{}
t2xread_f2undecl: t2xreader(f2undecl)
fun{}
t2xread_f2undeclist: t2xreader(f2undeclist)

(* ****** ****** *)

(* end of [xats_t2xread.sats] *)

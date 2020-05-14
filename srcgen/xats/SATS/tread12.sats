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
datatype trerr12 =
//
| TRERR12sort2 of (sort2)
//
| TRERR12s2txt of (s2txt)
| TRERR12s2exp of (s2exp)
| TRERR12d2pat of (d2pat)
| TRERR12d2exp of (d2exp)
| TRERR12d2ecl of (d2ecl)
//
typedef
trerr12lst = List0(trerr12)
//
(* ****** ****** *)
//
fun//{}
trerr12_add(trerr12): void
//
(* ****** ****** *)
//
fun
tread12_program
  (prog: d2eclist): void
//
(* ****** ****** *)
//
fun//{}
tread12_sort2: treader12(sort2)
fun//{}
tread12_s2txt: treader12(s2txt)
//
(* ****** ****** *)
//
fun//{}
tread12_s2cst: treader12(s2cst)
fun//{}
tread12_s2cstlst: treader12(s2cstlst)
//
fun//{}
tread12_s2var: treader12(s2var)
fun//{}
tread12_s2varlst: treader12(s2varlst)
//
fun//{}
tread12_s2exp: treader12(s2exp)
fun//{}
tread12_s2expopt: treader12(s2expopt)
fun//{}
tread12_s2explst: treader12(s2explst)
//
fun//{}
tread12_labs2exp: treader12(labs2exp)
fun//{}
tread12_labs2explst: treader12(labs2explst)
//
(* ****** ****** *)

fun//{}
tread12_t2ype: treader12(t2ype)

(* ****** ****** *)

fun//{}
tread12_abstdf2: treader12(abstdf2)

(* ****** ****** *)

fun//{}
tread12_effs2expopt: treader12(effs2expopt)

(* ****** ****** *)
//
fun//{}
tread12_d2cst: treader12(d2cst)
fun//{}
tread12_d2cstlst: treader12(d2cstlst)
//
(* ****** ****** *)
//
fun//{}
tread12_d2pat: treader12(d2pat)
fun//{}
tread12_d2patopt: treader12(d2patopt)
fun//{}
tread12_d2patlst: treader12(d2patlst)
//
(* ****** ****** *)
//
fun//{}
tread12_d2exp: treader12(d2exp)
fun//{}
tread12_d2expopt: treader12(d2expopt)
fun//{}
tread12_d2explst: treader12(d2explst)
//
(* ****** ****** *)

fun//{}
tread12_dsapparg: treader12(s2explst)
fun//{}
tread12_dtapparg: treader12(s2explst)

(* ****** ****** *)
//
fun//{}
tread12_d2ecl: treader12(d2ecl)
fun//{}
tread12_d2eclist: treader12(d2eclist)
//
(* ****** ****** *)

fun//{}
tread12_f2arg: treader12(f2arg)
fun//{}
tread12_f2arglst: treader12(f2arglst)

(* ****** ****** *)

fun//{}
tread12_tq2arg: treader12(tq2arg)
fun//{}
tread12_tq2arglst: treader12(tq2arglst)

(* ****** ****** *)

fun//{}
tread12_v2aldecl: treader12(v2aldecl)
fun//{}
tread12_v2aldeclist: treader12(v2aldeclist)

(* ****** ****** *)

fun//{}
tread12_v2ardecl: treader12(v2ardecl)
fun//{}
tread12_v2ardeclist: treader12(v2ardeclist)

(* ****** ****** *)

fun//{}
tread12_f2undecl: treader12(f2undecl)
fun//{}
tread12_f2undeclist: treader12(f2undeclist)

(* ****** ****** *)

(* end of [xats_tread12.sats] *)

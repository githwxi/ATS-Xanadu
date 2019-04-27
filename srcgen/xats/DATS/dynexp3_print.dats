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
// Start Time: October, 2018
// Authoremail: gmhwxiATgmailDOTcom
//
(* ****** ****** *)
//
#include
"share/atspre_staload.hats"
#staload
UN = "prelude/SATS/unsafe.sats"
//
(* ****** ****** *)
//
#staload "./../SATS/staexp2.sats"
#staload "./../SATS/dynexp2.sats"
//
(* ****** ****** *)
//
#staload "./../SATS/dynexp3.sats"
//
(* ****** ****** *)
//
#staload
_(*TMP*) = "./../DATS/staexp2_print.dats"
#staload
_(*TMP*) = "./../DATS/dynexp2_print.dats"
//
(* ****** ****** *)
//
implement
fprint_val<t2ype> = fprint_t2ype
//
(* ****** ****** *)
//
implement
fprint_val<d3exp> = fprint_d3exp
//
(* ****** ****** *)
//
implement
print_t2ype(x0) =
fprint_t2ype(stdout_ref, x0) 
implement
prerr_t2ype(x0) =
fprint_t2ype(stdout_ref, x0) 
//
implement
fprint_t2ype
  (out, x0) =
(
case-
x0.node() of
| T2Pcst(s2c) =>
  fprint!(out, "T2Pcst(", s2c, ")")
| T2Pvar(s2v) =>
  fprint!(out, "T2Pvar(", s2v, ")")
)
//
(* ****** ****** *)
//
implement
print_d3exp(x0) =
fprint_d3exp(stdout_ref, x0) 
implement
prerr_d3exp(x0) =
fprint_d3exp(stdout_ref, x0) 
//
implement
fprint_d3exp
  (out, x0) =
(
case-
x0.node() of
| D3Enone0() =>
  fprint!(out, "D3Enone0(", ")")
| D3Enone1(d2e) =>
  fprint!(out, "D3Enone1(", d2e, ")")
)
//
(* ****** ****** *)

(* end of [xats_dynexp3_print.dats] *)

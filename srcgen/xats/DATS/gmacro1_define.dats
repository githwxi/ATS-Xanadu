(***********************************************************************)
(*                                                                     *)
(*                         Applied Type System                         *)
(*                                                                     *)
(***********************************************************************)

(*
** ATS/Xanadu - Unleashing the Potential of Types!
** Copyright (C) 2020 Hongwei Xi, ATS Trustful Software, Inc.
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
// Start Time: October, 2020
// Authoremail: gmhwxiATgmailDOTcom
//
(* ****** ****** *)
//
// HX-2020-10-04:
// For macros that may potentially
// result in capturing of variables.
//
(* ****** ****** *)
//
#include
"share/atspre_staload.hats"
#staload
UN = "prelude/SATS/unsafe.sats"
//
(* ****** ****** *)
#staload "./../SATS/symbol.sats"
(* ****** ****** *)
#staload "./../SATS/staexp1.sats"
(* ****** ****** *)
#staload "./../SATS/trans12.sats"
(* ****** ****** *)
implement
fprint_val<sym_t> = fprint_symbol
(* ****** ****** *)
(*
//
datatype
g1exp_node =
//
| G1Eid0 of (sym_t)
//
| G1Eint of (token)
| G1Estr of (token)
//
| G1Eapp of ((*void*))
//
| G1Eapp1 of
  (g1exp(*fun*), g1exp)
| G1Eapp2 of
  (g1exp(*fun*), g1exp, g1exp)
//
| G1Elist of g1explst (*temp*)
//
| G1Enone0 of () // HX: EMPTY
| G1Enone1 of (g0exp) // HX: ERROR!
//
*)
//
(* ****** ****** *)
abstype g1mid_tbox = ptr
(* ****** ****** *)
typedef g1mid = g1mid_tbox
typedef g1mas = List0(g1mid)
(* ****** ****** *)
//
datatype g1mac =
//
| G1Mid of g1mid
//
| G1Mint of int
| G1Mbtf of bool
| G1Mstr of string
//
| G1Mlam of
  (g1mas, g1mac(*body*))
| G1Mapp of
  (g1mac(*fun*), g1maclst)
//
| G1Mnone0 of () // HX: EMPTY
| G1Mnone1 of (g1exp) // ERROR!
//
where g1maclst = List0(g1mac) // lists
//
(* ****** ****** *)
absimpl g1mid_tbox = sym_t
(* ****** ****** *)
absimpl g1mac_tbox = g1mac
(* ****** ****** *)
//
implement
print_g1mac
(g1m) =
fprint_g1mac(stdout_ref, g1m)
//
(* ****** ****** *)
//
implement
fprint_g1mac(out, g1m0) =
let
implement
fprint_val<g1mac> = fprint_g1mac
in
case+ g1m0 of
|
G1Mid(x0) =>
fprint!(out, "G1Mid(", x0, ")")
//
|
G1Mint(i0) =>
fprint!(out, "G1Mint(", i0, ")")
|
G1Mbtf(i0) =>
fprint!(out, "G1Mbtf(", i0, ")")
|
G1Mstr(cs) =>
fprint!(out, "G1Mstr(", cs, ")")
//
|
G1Mlam(gmas, g1m1) =>
fprint!
( out
, "G1Mlam(", gmas, "; ", g1m1, ")")
|
G1Mapp(g1f0, g1ms) =>
fprint!
( out
, "G1Mapp(", g1f0, "; ", g1ms, ")")
//
| G1Mnone0() =>
  fprint!(out, "G1Mnone0()")
| G1Mnone1(g1e1) =>
  fprint!(out, "G1Mnone1(", g1e1, ")")
//
end (*let*) // end of [fprint_g1mac]

(* ****** ****** *)

implement
trans11_g1mac(gmas, def1) = G1Mnone0()

(* ****** ****** *)

(* end of [xats_gmacro1_define.dats] *)

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
#staload "./../SATS/label0.sats"
#staload "./../SATS/lexing.sats"
//
#staload "./../SATS/staexp0.sats"
#staload "./../SATS/dynexp0.sats"
//
#staload "./../SATS/staexp1.sats"
#staload "./../SATS/dynexp1.sats"
//
#staload "./../SATS/staexp2.sats"
#staload "./../SATS/dynexp2.sats"
//
(* ****** ****** *)
//
#staload
_(*TMP*) = "./../DATS/staexp0_print.dats"
#staload
_(*TMP*) = "./../DATS/staexp1_print.dats"
#staload
_(*TMP*) = "./../DATS/staexp2_print.dats"
//
(* ****** ****** *)
//
implement
fprint_val<s2exp> = fprint_s2exp
//
(* ****** ****** *)
//
(*
implement
fprint_val<d2exp> = fprint_d2exp
*)
//
(* ****** ****** *)
//
implement
fprint_val<d2ecl> = fprint_d2ecl
//
(* ****** ****** *)

implement
print_d2ecl(x0) =
fprint_d2ecl(stdout_ref, x0)
implement
prerr_d2ecl(x0) =
fprint_d2ecl(stderr_ref, x0)

local

in (* in-of-local *)

implement
fprint_d2ecl
  (out, x0) =
(
case- x0.node() of
//
| D2Cnone0() =>
  fprint!(out, "D2Cnone0(", ")")
| D2Cnone1(d1c) =>
  fprint!(out, "D2Cnone1(", d1c, ")")
//
| D2Clocal(d2cs1, d2cs2) =>
  fprint!
  ( out
  , "D2Clocal(", d2cs1, "; ", d2cs2, ")")
//
| D2Cabssort(d1c) =>
  fprint!(out, "D2Cabssort(", d1c, ")")
| D2Cstacst0(d1c) =>
  fprint!(out, "D2Cstacst0(", d1c, ")")
| D2Csortdef(d1c) =>
  fprint!(out, "D2Csortdef(", d1c, ")")
| D2Csexpdef(d1c) =>
  fprint!(out, "D2Csexpdef(", d1c, ")")
| D2Cabstype(d1c) =>
  fprint!(out, "D2Cabstype(", d1c, ")")
| D2Cabsimpl(d1c) =>
  fprint!(out, "D2Cabsimpl(", d1c, ")")
//
| D2Cdatasort(d1c) =>
  fprint!(out, "D2Cdatasort(", d1c, ")")
//
) (* end of [fprint_d2ecl] *)

end // end of [local]

(* ****** ****** *)

(* end of [xats_dynexp2_print.dats] *)

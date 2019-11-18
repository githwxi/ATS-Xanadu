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
// Start Time: November, 2019
// Authoremail: gmhwxiATgmailDOTcom
//
(* ****** ****** *)
//
// HX-2019-11-02:
// level-1 interpreter for syncheck!
//
(* ****** ****** *)
//
#include
"share/atspre_staload.hats"
#staload
UN = "prelude/SATS/unsafe.sats"
//
(* ****** ****** *)

#include
"./../HATS/libxatsopt.hats"

(* ****** ****** *)
//
overload
fprint with $D2E.fprint_d2var
overload
fprint with $D2E.fprint_d2con
overload
fprint with $D2E.fprint_d2cst
//
overload
fprint with $IR0.fprint_ir0exp
//
(* ****** ****** *)
//
#staload "./../SATS/interp0.sats"
//
(* ****** ****** *)
//
implement
fprint_val<ir0val> = fprint_ir0val
//
(* ****** ****** *)
//
implement
print_ir0val(x0) = 
fprint_ir0val(stdout_ref, x0)
implement
prerr_ir0val(x0) = 
fprint_ir0val(stderr_ref, x0)
//
implement
fprint_ir0val
  (out, x0) =
(
case+ x0 of
//
| IR0Vnil() =>
  fprintln!(out, "IR0Vnil()")
//
| IR0Vint(i0) =>
  fprintln!(out, "IR0Vint(", i0, ")")
| IR0Vbtf(b0) =>
  fprintln!(out, "IR0Vbtf(", b0, ")")
| IR0Vchr(c0) =>
  fprintln!(out, "IR0Vchr(", c0, ")")
| IR0Vflt(f0) =>
  fprintln!(out, "IR0Vflt(", f0, ")")
| IR0Vstr(s0) =>
  fprintln!(out, "IR0Vstr(", s0, ")")
//
| IR0Vcst(d2c) =>
  fprintln!(out, "IR0Vcst(", d2c, ")")
//
| IR0Vcon(d2c, xs) =>
  fprintln!
  (out, "IR0Vcon(", d2c, "; ", xs, ")")
//
| IR0Vfun(firv) =>
  fprintln!(out, "IR0Vfun(", "...", ")")
| IR0Vfc2(ire, env) =>
  fprintln!(out, "IR0Vfc2(", "...", ")")
//
| IR0Vnone0() =>
  fprintln!(out, "IR0Vnone0(", ")")
| IR0Vnone1(ire1) =>
  fprintln!(out, "IR0Vnone1(", ire1, ")")
//
) (* end of [fprint_ir0val] *)
//
(* ****** ****** *)

(* end of [xint_interp0_print.dats] *)

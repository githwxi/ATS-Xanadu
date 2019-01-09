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
#staload
STM = "./../SATS/stamp0.sats"
#staload
SYM = "./../SATS/symbol.sats"
overload
fprint with $STM.fprint_stamp
overload
fprint with $SYM.fprint_symbol
//
(* ****** ****** *)
//
#staload
LAB = "./../SATS/label0.sats"
overload
fprint with $LAB.fprint_label
//
(* ****** ****** *)
//
#staload "./../SATS/basics.sats"
//
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
implement
fprint_val<d2con> = fprint_d2con
implement
fprint_val<d2cst> = fprint_d2cst
implement
fprint_val<d2var> = fprint_d2var
//
(* ****** ****** *)
//
implement
fprint_val<d2ecl> = fprint_d2ecl
//
(* ****** ****** *)

implement
fprint_val<tq2arg> = fprint_tq2arg

(* ****** ****** *)
//
implement
print_d2con(x0) =
fprint_d2con(stdout_ref, x0) 
implement
prerr_d2con(x0) =
fprint_d2con(stdout_ref, x0) 
//
implement
fprint_d2con
  (out, x0) =
(
fprint!
(out, sym, "(", stamp, ")");
// (*
fprint!(out, ": ", x0.type())
// *)
) where
{
  val sym = x0.sym() and stamp = x0.stamp()
} (* end of [fprint_d2con] *)
//
(* ****** ****** *)
//
implement
print_d2cst(x0) =
fprint_d2cst(stdout_ref, x0) 
implement
prerr_d2cst(x0) =
fprint_d2cst(stdout_ref, x0) 
//
implement
fprint_d2cst
  (out, x0) =
(
fprint!
(out, sym, "(", stamp, ")");
// (*
fprint!(out, ": ", x0.type())
// *)
) where
{
  val sym = x0.sym() and stamp = x0.stamp()
} (* end of [fprint_d2cst] *)
//
(* ****** ****** *)
//
implement
print_d2var(x0) =
fprint_d2var(stdout_ref, x0) 
implement
prerr_d2var(x0) =
fprint_d2var(stdout_ref, x0) 
//
implement
fprint_d2var
  (out, x0) =
(
  fprint!
  (out, sym, "(", stamp, ")")
) where
{
  val sym = x0.sym() and stamp = x0.stamp()
} (* end of [fprint_d2var] *)
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
| D2Cdatatype(d1c) =>
  fprint!(out, "D2Cdatatype(", d1c, ")")
//
| D2Cdynconst(knd, tqas, d2cs) =>
  fprint!(out, "D2Cdcstdecl(", knd, "; ", tqas, "; ", d2cs)
//
) (* end of [fprint_d2ecl] *)

end // end of [local]

(* ****** ****** *)
//
implement
print_d2itm(x0) =
fprint_d2itm(stdout_ref, x0) 
implement
prerr_d2itm(x0) =
fprint_d2itm(stdout_ref, x0) 
//
implement
fprint_d2itm
  (out, x0) =
(
case+ x0 of
//
| D2ITMcon(d2cs) =>
  fprint!(out, "D2ITMcon(", d2cs, ")")
//
| D2ITMcst(d2cs) =>
  fprint!(out, "D2ITMcst(", d2cs, ")")
//
| D2ITMvar(d2v0) =>
  fprint!(out, "D2ITMvar(", d2v0, ")")
//
)
(* ****** ****** *)
//
implement
print_tq2arg(x0) =
fprint_tq2arg(stdout_ref, x0) 
implement
prerr_tq2arg(x0) =
fprint_tq2arg(stdout_ref, x0) 
//
implement
fprint_tq2arg
  (out, x0) =
(
list_foreach<s2varlst>(x0.svss())
) where
{
implement
list_foreach$fwork<s2varlst><void>
  (s2vs, env) = fprint!(out, "<", s2vs, ">")
} (* end of [fprint_tq2arg] *)
//
(* ****** ****** *)

(* end of [xats_dynexp2_print.dats] *)

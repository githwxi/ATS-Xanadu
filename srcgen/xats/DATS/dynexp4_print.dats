(***********************************************************************)
(*                                                                     *)
(*                         Applied Type System                         *)
(*                                                                     *)
(***********************************************************************)

(*
** ATS/Xanadu - Unleashing the Potential of Types!
** Copyright (C) 2021 Hongwei Xi, ATS Trustful Software, Inc.
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
// Start Time: January, 2021
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
SYM = "./../SATS/xsymbol.sats"
#staload
LOC = "./../SATS/locinfo.sats"
//
  typedef sym_t = $SYM.sym_t
  typedef loc_t = $LOC.loc_t
//
(* ****** ****** *)
//
#staload "./../SATS/xstamp0.sats"
overload fprint with fprint_stamp
//
(* ****** ****** *)
//
#staload "./../SATS/xlabel0.sats"
//
#staload "./../SATS/lexing0.sats"
//
(* ****** ****** *)
//
#staload "./../SATS/staexp2.sats"
#staload "./../SATS/statyp2.sats"
//
#staload "./../SATS/dynexp2.sats"
//
(* ****** ****** *)
//
#staload "./../SATS/dynexp3.sats"
//
(* ****** ****** *)
//
#staload "./../SATS/dynexp4.sats"
//
(* ****** ****** *)
//
(*
implement
fprint_val<filpath> =
$FP0.fprint_filpath_full1
*)
implement
fprint_val<filpath> =
$FP0.fprint_filpath_full2
//
(* ****** ****** *)
//
implement
fprint_val<s2cst> = fprint_s2cst
implement
fprint_val<s2var> = fprint_s2var
implement
fprint_val<s2exp> = fprint_s2exp
//
implement
fprint_val<t2ype> = fprint_t2ype
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
fprint_val<d4pat> = fprint_d4pat
//
(* ****** ****** *)
//
implement
fprint_val<d4exp> = fprint_d4exp
//
(* ****** ****** *)

implement
fprint_val<d4ecl> = fprint_d4ecl

(* ****** ****** *)
//
implement
print_d4pat(x0) =
fprint_d4pat(stdout_ref, x0)
implement
prerr_d4pat(x0) =
fprint_d4pat(stderr_ref, x0)
//
implement
fprint_d4pat
  (out, x0) =
(
case+ x0.node() of
//
| D4Pnil() =>
  fprint!(out, "D4Pnil()")
| D4Pany() =>
  fprint!(out, "D4Pany()")
//
| D4Pvar(d2v) =>
  fprint!
  (out, "D4Pvar(", d2v, ")")
//
| _(* rest-of-d4pat *) => fprint!(out, "D4P...(...)")
//
) (* end of [fprint_d4pat] *)
//
(* ****** ****** *)
//
implement
print_d4exp(x0) =
fprint_d4exp(stdout_ref, x0)
implement
prerr_d4exp(x0) =
fprint_d4exp(stderr_ref, x0)
//
implement
fprint_d4exp
  (out, x0) =
(
case+ x0.node() of
//
| D4Ei00(int) =>
  fprint!(out, "D4Ei00(", int, ")")
| D4Eb00(btf) =>
  fprint!(out, "D4Eb00(", btf, ")")
| D4Es00(str) =>
  fprint!(out, "D4Es00(", str, ")")
//
| D4Eint(tok) =>
  fprint!(out, "D4Eint(", tok, ")")
| D4Ebtf(tok) =>
  fprint!(out, "D4Ebtf(", tok, ")")
| D4Echr(tok) =>
  fprint!(out, "D4Echr(", tok, ")")
| D4Eflt(tok) =>
  fprint!(out, "D4Eflt(", tok, ")")
| D4Estr(tok) =>
  fprint!(out, "D4Estr(", tok, ")")
//
| D4Etop(tok) =>
  fprint!(out, "D4Etop(", tok, ")")
//
| D4Evar(d2v) =>
  fprint!(out, "D4Evar(", d2v, ")")
//
| D4Enone0() =>
  fprint!(out, "D4Enone0(", ")")
| D4Enone1(d3esrc) =>
  fprint!(out, "D4Enone1(", d3esrc, ")")
//
(*
| _(* rest-of-d4exp *) => fprint!(out, "D4E...(...)")
*)
//
) (* end of [fprint_d4exp] *)
//
(* ****** ****** *)

(* end of [xats_dynexp4_print.dats] *)

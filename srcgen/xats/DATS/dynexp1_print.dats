(***********************************************************************)
(*                                                                     *)
(*                         Applied Type System                         *)
(*                                                                     *)
(***********************************************************************)

(*
** ATS/Postiats - Unleashing the Potential of Types!
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
// Start Time: August, 2018
// Authoremail: gmhwxiATgmailDOTcom
//
(* ****** ****** *)
//
#staload
UN =
"prelude/SATS/unsafe.sats"
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
(* ****** ****** *)
//
implement
fprint_val<token> = fprint_token
//
implement
fprint_val<d1exp> = fprint_d1exp
//
(* ****** ****** *)
//
implement
fprint_val<d1ecl> = fprint_d1ecl
//
implement
(a)//tmp
fprint_val<dl0abeled(a)> = fprint_dl0abeled<a>
//
(* ****** ****** *)

implement
print_d1ecl(x0) =
fprint_d1ecl(stdout_ref, x0)
implement
prerr_d1ecl(x0) =
fprint_d1ecl(stderr_ref, x0)

local

implement
fprint_val<d1ecl> = fprint_d1ecl

in (* in-of-local *)

implement
fprint_d1ecl
  (out, x0) =
(
case+ x0.node() of
//
| D1Cnone(d0c) =>
  fprint!(out, "D1Cnone(", d0c, ")")
//
| D1Csortdef
  (knd, tok, def) =>
  fprint!
  ( out, "D1Csortdef("
  , knd, "; ", tok, "; ", def, ")")
//
| D1Csexpdef
  ( knd, tok
  , arg, res, def) =>
  fprint!
  ( out, "D1Csexpdef("
  , knd, "; ", tok, "; ", arg, "; ", res, "; ", def, ")")
//
| D1Cabstype
  (knd, tok, arg, def) =>
  fprint!
  ( out, "D1Cabstype("
  , knd, "; ", tok, "; ", arg, "; ", def, ")")
//
| D1Cdatasort
  ( knd, d1tsrts ) =>
  fprint!
  (out, "D1Cdatasort(", knd, "; ", d1tsrts, ")")
//
| _(*rest-of-d1ecl*) =>
  fprint!(out, "fprint_d1ecl: not-yet-implemented")
//
) (* end of [fprint_d1ecl] *)

end // end of [local]

(* ****** ****** *)

implement
print_abstdf1(x0) =
fprint_abstdf1(stdout_ref, x0)
implement
prerr_abstdf1(x0) =
fprint_abstdf1(stderr_ref, x0)

implement
fprint_abstdf1
  (out, x0) =
(
case+ x0 of
| ABSTDF1nil() =>
  fprint(out, "ABSTDF1nil()")
| ABSTDF1lteq(s0e) =>
  fprint!(out, "ABSTDF1lteq(", s0e, ")")
| ABSTDF1eqeq(s0e) =>
  fprint!(out, "ABSTDF1eqeq(", s0e, ")")
) (* end of [fprint_abstdf1] *)

(* ****** ****** *)

implement
print_wd1eclseq(x0) =
fprint_wd1eclseq(stdout_ref, x0)
implement
prerr_wd1eclseq(x0) =
fprint_wd1eclseq(stderr_ref, x0)

implement
fprint_wd1eclseq
  (out, x0) =
(
case+ x0 of
| WD1CSnone() =>
  fprint!(out, "WD1CSnone()")
| WD1CSsome(d1cs) =>
  fprint!( out, "WD1CSsome(", d1cs, ")")
) (* end of [fprint_wd1eclseq] *)

(* ****** ****** *)

(* end of [xats_dynexp1_print.dats] *)

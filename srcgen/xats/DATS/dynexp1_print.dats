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
(* ****** ****** *)
//
implement
fprint_val<d1exp> = fprint_d1exp
//
implement
fprint_val<q1arg> = fprint_q1arg
//
implement
fprint_val<a1typ> = fprint_a1typ
implement
fprint_val<d1arg> = fprint_d1arg
//
implement
fprint_val<tq1arg> = fprint_tq1arg
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
fprint_q1arg
  (out, x0) =
(
//
case+ x0.node() of
| Q1ARGsome(ids, s1t) =>
  fprint!
  (out, "Q1ARGsome(", ids, "; ", s1t, ")")
//
) (* end of [fprint_q1arg] *)

(* ****** ****** *)

implement
fprint_a1typ
  (out, x0) =
(
//
case+ x0.node() of
| A1TYPsome(s1e, opt) =>
  fprint!(out, "A1TYPsome(", s1e, "; ", opt, ")")
//
) (* end of [fprint_a1typ] *)

(* ****** ****** *)

local
//
fun
fprint_a1typlstopt
( out: FILEref
, opt: a1typlstopt): void =
(
case+ opt of
| None() => fprint!(out, "None()")
| Some(a1ts) => fprint!(out, "Some(", a1ts, ")")
)
//
overload fprint with fprint_a1typlstopt of 100
//
in (* in-of-local *)

implement
fprint_d1arg
  (out, x0) =
(
//
case+ x0.node() of
//
| D1ARGsome_sta(s1qs) =>
  fprint!
  (out, "D1ARGsome_sta(", s1qs, ")")
//
| D1ARGsome_dyn1(tok) =>
  fprint!
  (out, "D1ARGsome_dyn1(", tok, ")")
| D1ARGsome_dyn2(arg0, opt1) =>
  fprint!
  (out, "D1ARGsome_dyn2(", arg0, "; ", opt1, ")")
//
) (* end of [fprint_d1arg] *)

end // end of [local]

(* ****** ****** *)

implement
fprint_f1arg
  (out, x0) =
(
//
case+
x0.node() of
(*
| F1ARGnone(tok) =>
  fprint!(out, "F1ARGnone(", tok, ")")
*)
| F1ARGsome_dyn(d1p) =>
  fprint!(out, "F1ARGsome_dyn(", d1p, ")")
| F1ARGsome_sta(s1qs) =>
  fprint!(out, "F1ARGsome_sta(", s1qs, ")")
| F1ARGsome_met(s1es) =>
  fprint!(out, "F1ARGsome_met(", s1es, ")")
//
) (* end of [fprint_f1arg] *)

(* ****** ****** *)

implement
fprint_tq1arg
  (out, x0) =
(
//
case+
x0.node() of
| TQ1ARGnone(tok) =>
  fprint!(out, "TQ1ARGnone(", tok, ")")
| TQ1ARGsome(q1as) =>
  fprint!(out, "TQ1ARGsome(", q1as, ")")
//
) (* end of [fprint_tq1arg] *)

(* ****** ****** *)

implement
print_d1pat(x0) =
fprint_d1pat(stdout_ref, x0)
implement
prerr_d1pat(x0) =
fprint_d1pat(stderr_ref, x0)


local

implement
fprint_val<d1pat> = fprint_d1pat

in (* in-of-local *)

implement
fprint_d1pat
  (out, x0) =
(
case+
x0.node() of
| D1Pid(tok) =>
  fprint!
  (out, "D1Pid(", tok, ")")
//
| D1Pint(tok) =>
  fprint!
  (out, "D1Pint(", tok, ")")
| D1Pchr(tok) =>
  fprint!
  (out, "D1Pchr(", tok, ")")
| D1Pflt(tok) =>
  fprint!
  (out, "D1Pflt(", tok, ")")
| D1Pstr(tok) =>
  fprint!
  (out, "D1Pstr(", tok, ")")
//
| D1Papp() =>
  fprint!(out, "D1Papp(", ")")
//
| D1Pbs0() =>
  fprint!(out, "D1Pbs0()")
| D1Pbs1(d1p) =>
  fprint!(out, "D1Pbs1(", d1p, ")")
//
| D1Papps(d1p0, d1ps) =>
  fprint!
  ( out
  , "D1Papps(", d1p0, "; ", d1ps, ")")
//
| D1Plist(d1ps) =>
  fprint!(out, "D1Plist(", d1ps, ")")
| D1Plist(d1ps1, d1ps2) =>
  fprint!
  (out, "D1Plist(", d1ps1, "; ", d1ps2, ")")
//
| D1Pnone((*void*)) => fprint!(out, "D1Pnone(", ")")
//
) (* end of [fprint_d1pat] *)

end // end of [local]

(* ****** ****** *)

implement
print_d1exp(x0) =
fprint_d1exp(stdout_ref, x0)
implement
prerr_d1exp(x0) =
fprint_d1exp(stderr_ref, x0)

local

implement
fprint_val<d1exp> = fprint_d1exp

in (* in-of-local *)

implement
fprint_d1exp
  (out, x0) =
(
case+
x0.node() of
| D1Eid(tok) =>
  fprint!
  (out, "D1Eid(", tok, ")")
//
| D1Eint(tok) =>
  fprint!
  (out, "D1Eint(", tok, ")")
| D1Echr(tok) =>
  fprint!
  (out, "D1Echr(", tok, ")")
| D1Eflt(tok) =>
  fprint!
  (out, "D1Eflt(", tok, ")")
| D1Estr(tok) =>
  fprint!
  (out, "D1Estr(", tok, ")")
//
| D1Eapp() =>
  fprint!(out, "D1Eapp(", ")")
//
| D1Ebs0() =>
  fprint!(out, "D1Ebs0()")
| D1Ebs1(d1e) =>
  fprint!(out, "D1Ebs1(", d1e, ")")
//
| D1Eapps(d1e0, d1es) =>
  fprint!
  (out, "D1Eapps(", d1e0, "; ", d1es, ")")
//
| D1Elist(d1es) =>
  fprint!(out, "D1Elist(", d1es, ")")
| D1Elist(d1es1, d1es2) =>
  fprint!
  (out, "D1Elist(", d1es1, "; ", d1es2, ")")
//
| D1Etuple(tok, d1es) =>
  fprint!
  (out, "D1Etuple(", tok, "; ", d1es, ")")
| D1Etuple(tok, d1es1, d1es2) =>
  fprint!
  ( out
  , "D1Etuple(", tok, "; ", d1es1, "; ", d1es2, ")")
//
| D1Eif0(d1e1, d1e2, opt3) =>
  fprint!
  ( out
  , "D1Eif0(", d1e1, "; ", d1e2, "; ", opt3, ")")
//
| D1Enone((*void*)) => fprint!(out, "D1Enone(", ")")
//
) (* fprint_d1exp *)

end // end of [local]

(* ****** ****** *)

implement
print_effs1expopt(x0) =
fprint_effs1expopt(stdout_ref, x0)
implement
prerr_effs1expopt(x0) =
fprint_effs1expopt(stderr_ref, x0)
implement
fprint_effs1expopt
  (out, x0) =
(
case+ x0 of
| EFFS1EXPnone() =>
  fprint!(out, "EFFS1EXPnone(", ")")
| EFFS1EXPsome(s1f, s1e) =>
  fprint!
  ( out
  , "EFFS1EXPsome(", s1f, "; ", s1e, ")")
)

(* ****** ****** *)

implement
print_teqd1expopt(x0) =
fprint_teqd1expopt(stdout_ref, x0)
implement
prerr_teqd1expopt(x0) =
fprint_teqd1expopt(stderr_ref, x0)
implement
fprint_teqd1expopt
  (out, x0) =
(
case+ x0 of
| TEQD1EXPnone() =>
  fprint!
  (out, "TEQD1EXPnone(", ")")
| TEQD1EXPsome(tok, d1e) =>
  fprint!
  (out, "TEQD1EXPsome(", tok, "; ", d1e, ")")
)

(* ****** ****** *)

implement
print_wths1expopt(x0) =
fprint_wths1expopt(stdout_ref, x0)
implement
prerr_wths1expopt(x0) =
fprint_wths1expopt(stderr_ref, x0)
implement
fprint_wths1expopt
  (out, x0) =
(
case+ x0 of
| WTHS1EXPnone() =>
  fprint!
  (out, "WTHS1EXPnone(", ")")
| WTHS1EXPsome(tok, s1e) =>
  fprint!
  (out, "WTHS1EXPsome(", tok, "; ", s1e, ")")
)

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
| D1Cstatic(knd, d1c) =>
  fprint!
  (out, "D1Cstatic(", knd, "; ", d1c, ")")
//
| D1Cextern(knd, d1c) =>
  fprint!
  (out, "D1Cextern(", knd, "; ", d1c, ")")
//
| D1Cinclude(knd, d1e) =>
  fprint!
  (out, "D1Cinclude(", knd, "; ", d1e, ")")
//
| D1Cstaload(knd, d1e) =>
  fprint!
  (out, "D1Cstaload(", knd, "; ", d1e, ")")
//
| D1Csortdef
  (knd, tok, def) =>
  fprint!
  ( out
  , "D1Csortdef(", knd, "; ", tok, "; ", def, ")")
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
  ( knd, d1tsts ) =>
  fprint!
  (out, "D1Cdatasort(", knd, "; ", d1tsts, ")")
//
| D1Cdatatype
  (knd, d1typs, wopt) =>
  fprint!
  ( out
  , "D1Cdatatype(", knd, "; ", d1typs, "; ", wopt, ")")
//
| D1Clocal
  (d1cs_head, d1cs_body) =>
  fprint!
  ( out
  , "D1Clocal(", d1cs_head, "; ", d1cs_body, ")")
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

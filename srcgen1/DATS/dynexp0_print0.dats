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
// Start Time: July, 2018
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
_(*TMP*)=
"./../DATS/staexp0_print0.dats"
//
(* ****** ****** *)
//
#staload "./../SATS/lexing0.sats"
//
#staload "./../SATS/staexp0.sats"
//
#staload "./../SATS/dynexp0.sats"
//
(* ****** ****** *)
//
implement
fprint_val<token> = fprint_token
//
implement
fprint_val<t0int> = fprint_t0int
//
(* ****** ****** *)
//
implement
fprint_val<s0exp> = fprint_s0exp
implement
fprint_val<s0qua> = fprint_s0qua
//
(* ****** ****** *)
//
implement
fprint_val<d0pat> = fprint_d0pat
implement
fprint_val<d0exp> = fprint_d0exp
//
implement
fprint_val<q0arg> = fprint_q0arg
//
implement
fprint_val<a0typ> = fprint_a0typ
//
implement
fprint_val<d0arg> = fprint_d0arg
//
(* ****** ****** *)
implement
fprint_val<d0typ> = fprint_d0typ
(* ****** ****** *)
//
implement
fprint_val<sq0arg> = fprint_sq0arg
//
implement
fprint_val<tq0arg> = fprint_tq0arg
//
implement
fprint_val<ti0arg> = fprint_ti0arg
//
(* ****** ****** *)
//
implement
fprint_val<d0pat> = fprint_d0pat
//
implement
fprint_val<f0arg> = fprint_f0arg
//
(* ****** ****** *)
//
implement
fprint_val<d0exp> = fprint_d0exp
//
(* ****** ****** *)
implement
fprint_val<d0ecl> = fprint_d0ecl
(* ****** ****** *)
//
implement
(a)//tmp
fprint_val<dl0abeled(a)> = fprint_dl0abeled<a>
//
(* ****** ****** *)
//
implement
print_q0arg(x0) = 
fprint_q0arg(stdout_ref, x0)
implement
prerr_q0arg(x0) = 
fprint_q0arg(stderr_ref, x0)
//
implement
fprint_q0arg
  (out, x0) =
(
//
case+
x0.node() of
(*
| Q0ARGnone(tok) =>
  fprint!(out, "Q0ARGnone(", tok, ")")
*)
| Q0ARGsome(sid, opt) =>
  fprint!(out, "Q0ARGsome(", sid, "; ", opt, ")")
//
) (* end of [fprint_q0arg] *)
//
(* ****** ****** *)
//
implement
print_a0typ(x0) = 
fprint_a0typ(stdout_ref, x0)
implement
prerr_a0typ(x0) = 
fprint_a0typ(stderr_ref, x0)
//
implement
fprint_a0typ
  (out, x0) =
(
//
case+ x0.node() of
(*
| A0TYPnone(tok) =>
  fprint!(out, "A0TYPnone(", tok, ")")
*)
| A0TYPsome(s0e, opt) =>
  fprint!(out, "A0TYPsome(", s0e, "; ", opt, ")")
//
) (* end of [fprint_a0typ] *)
//
(* ****** ****** *)

local
//
fun
fprint_a0typlstopt
( out: FILEref
, opt: a0typlstopt): void =
(
case+ opt of
| None() => fprint!(out, "None()")
| Some(a0ts) => fprint!(out, "Some(", a0ts, ")")
)
//
overload fprint with fprint_a0typlstopt of 100
//
in (* in-of-local *)

implement
fprint_d0arg
  (out, x0) =
(
//
case+ x0.node() of
//
| D0ARGnone(tok) =>
  fprint!(out, "D0ARGnone(", tok, ")")
//
| D0ARGsome_sta
  (tbeg, s0qs, tend) =>
  fprint!
  ( out
  , "D0ARGsome_sta("
  , tbeg, "; ", s0qs, "; ", tend, ")")
//
| D0ARGsome_dyn1
  (tok) =>
  fprint!(out, "D0ARGsome_dyn1(", tok, ")")
| D0ARGsome_dyn2
  (tbeg, arg0, opt1, tend) =>
  fprint!
  ( out
  , "D0ARGsome_dyn("
  , tbeg, "; ", arg0, "; ", opt1, "; ", tend, ")")
//
) (* end of [fprint_d0arg] *)

end // end of [local]

(* ****** ****** *)

implement
fprint_d0typ
  (out, x0) =
(
case+ x0.node() of
|
D0TYPnone
( tok ) =>
fprint!
( out
, "D0TYPnone(", tok, ")")
|
D0TYPsome
( id0, opt ) =>
(
case+ opt of
| None() =>
  fprint!
  ( out
  , "D0TYPsome(", id0, ")")
| Some(s0e) =>
  fprint!
  ( out
  , "D0TYPsome(", id0, ":", s0e, ")")
)
) (* end of [fprint_d0typ] *)

(* ****** ****** *)
//
implement
print_sq0arg(x0) = 
fprint_sq0arg(stdout_ref, x0)
implement
prerr_sq0arg(x0) = 
fprint_sq0arg(stderr_ref, x0)
//
(* ****** ****** *)
//
implement
fprint_sq0arg
  (out, x0) =
(
//
case+
x0.node() of
| SQ0ARGnone(tok) =>
  fprint!(out, "SQ0ARGnone(", tok, ")")
| SQ0ARGsome(tbeg, q0as, tend) =>
  fprint!
  ( out
  , "SQ0ARGsome(", tbeg, "; ", q0as, "; ", tend, ")")
//
) (* end of [fprint_sq0arg] *)
//
(* ****** ****** *)
//
implement
print_tq0arg(x0) = 
fprint_tq0arg(stdout_ref, x0)
implement
prerr_tq0arg(x0) = 
fprint_tq0arg(stderr_ref, x0)
//
(* ****** ****** *)
//
implement
fprint_tq0arg
  (out, x0) =
(
//
case+
x0.node() of
| TQ0ARGnone(tok) =>
  fprint!(out, "TQ0ARGnone(", tok, ")")
| TQ0ARGsome(tbeg, q0as, tend) =>
  fprint!
  ( out
  , "TQ0ARGsome(", tbeg, "; ", q0as, "; ", tend, ")")
//
) (* end of [fprint_tq0arg] *)
//
(* ****** ****** *)
//
implement
print_ti0arg(x0) = 
fprint_ti0arg(stdout_ref, x0)
implement
prerr_ti0arg(x0) = 
fprint_ti0arg(stderr_ref, x0)
//
(* ****** ****** *)
//
implement
fprint_ti0arg
  (out, x0) =
(
//
case+
x0.node() of
| TI0ARGnone(tok) =>
  fprint!(out, "TI0ARGnone(", tok, ")")
| TI0ARGsome(tbeg, q0as, tend) =>
  fprint!
  ( out
  , "TI0ARGsome(", tbeg, "; ", q0as, "; ", tend, ")")
//
) (* end of [fprint_ti0arg] *)

(* ****** ****** *)
//
implement
{a}(*tmp*)
fprint_dl0abeled
  (out, x0) = let
//
val+DL0ABELED(l0, t0, x1) = x0
//
in
  fprint!(out, "SL0ABELED(");
  fprint!(out, l0, ", ", t0, ", ");
  fprint_val<a>(out, x1); fprint!(out, ")")
end // end of [fprint_dl0abeled]

(* ****** ****** *)

implement
print_d0pat(x0) =
fprint_d0pat(stdout_ref, x0)
implement
prerr_d0pat(x0) =
fprint_d0pat(stderr_ref, x0)

(* ****** ****** *)

local

(*
implement
fprint_val<d0pat> = fprint_d0pat
*)

in (* in-of-local *)

implement
fprint_d0pat
  (out, x0) =
(
case+ x0.node() of
//
| D0Pid0(id) =>
  fprint!(out, "D0Pid0(", id, ")")
//
| D0Pint(i0) =>
  fprint!(out, "D0Pint(", i0, ")")
| D0Pchr(c0) =>
  fprint!(out, "D0Pchr(", c0, ")")
| D0Pflt(f0) =>
  fprint!(out, "D0Pflt(", f0, ")")
| D0Pstr(s0) =>
  fprint!(out, "D0Pstr(", s0, ")")
//
| D0Papps(d0ps) =>
  fprint!(out, "D0Papps(", d0ps, ")")
//
| D0Psqarg
  (tbeg, s0as, tend) =>
  fprint!
  ( out
  , "D0Psqarg("
  , tbeg, "; ", s0as, "; ", tend, ")")
//
| D0Pparen
  (tbeg, d0ps, tend) =>
  fprint!
  ( out
  , "D0Pparen("
  , tbeg, "; ", d0ps, "; ", tend, ")")
//
| D0Ptrcd1
  (tbeg, topt, d0ps, tend) =>
  fprint!
  ( out
  , "D0Ptrcd1("
  , tbeg, "; ", topt, "; ", d0ps, "; ", tend, ")")
| D0Ptrcd2
  (tbeg, topt, ld0ps, tend) =>
  fprint!
  ( out
  , "D0Ptrcd2("
  , tbeg, "; ", topt, "; ", ld0ps, "; ", tend, ")")
//
| D0Panno
  (d0p, ann) =>
  fprint!(out, "D0Panno(", d0p, "; ", ann, ")")
//
| D0Pqual
  (tok, d0p) =>
  fprint!(out, "D0Pqual(", tok, "; ", d0p, ")")
//
| D0Pnone(tok) => fprint!(out, "D0Pnone(", tok, ")")
//
) (* end of [fprint_d0pat] *)

end // end of [local]

(* ****** ****** *)

implement
print_d0pat_RPAREN(x0) =
fprint_d0pat_RPAREN(stdout_ref, x0)
implement
prerr_d0pat_RPAREN(x0) =
fprint_d0pat_RPAREN(stderr_ref, x0)

(* ****** ****** *)

local

(*
implement
fprint_val<d0pat> = fprint_d0pat
*)

in (* in-of-local *)

implement
fprint_d0pat_RPAREN
  (out, x0) =
(
case+ x0 of
| d0pat_RPAREN_cons0(tok1) =>
  fprint!
  (out, "d0pat_RPAREN_cons0(", tok1, ")")
| d0pat_RPAREN_cons1(tok1, d0ps, tok2) =>
  fprint!
  (out, "d0pat_RPAREN_cons1(", tok1, ", ", d0ps, ", ", tok2, ")")
) (* end of [fprint_d0pat_RPAREN] *)

end // end of [local]

(* ****** ****** *)

implement
print_labd0pat_RBRACE(x0) =
fprint_labd0pat_RBRACE(stdout_ref, x0)
implement
prerr_labd0pat_RBRACE(x0) =
fprint_labd0pat_RBRACE(stderr_ref, x0)

(* ****** ****** *)

local

(*
implement
fprint_val<d0pat> = fprint_d0pat
*)

in (* in-of-local *)

implement
fprint_labd0pat_RBRACE
  (out, x0) =
(
case+ x0 of
| labd0pat_RBRACE_cons0
  ( tok1 ) =>
  fprint!
  ( out
  , "labd0pat_RBRACE_cons0(", tok1, ")")
| labd0pat_RBRACE_cons1
  ( tok1, ld0ps, tok2 ) =>
  fprint!
  ( out
  , "labd0pat_RBRACE_cons1(", tok1, ", ", ld0ps, ", ", tok2, ")")
) (* end of [fprint_labd0pat_RBRACE] *)

end // end of [local]

(* ****** ****** *)
//
implement
print_f0arg(x0) = 
fprint_f0arg(stdout_ref, x0)
implement
prerr_f0arg(x0) = 
fprint_f0arg(stderr_ref, x0)
//
implement
fprint_f0arg
  (out, x0) =
(
//
case+
x0.node() of
| F0ARGnone(tok) =>
  fprint!(out, "F0ARGnone(", tok, ")")
| F0ARGsome_dyn(d0p) =>
  fprint!(out, "F0ARGsome_dyn(", d0p, ")")
| F0ARGsome_sta(tbeg, s0qs, tend) =>
  fprint!
  ( out
  , "F0ARGsome_sta(", tbeg, "; ", s0qs, "; ", tend, ")")
| F0ARGsome_met(tbeg, s0es, tend) =>
  fprint!
  ( out
  , "F0ARGsome_met(", tbeg, "; ", s0es, "; ", tend, ")")
//
) (* end of [fprint_f0arg] *)
//
(* ****** ****** *)
//
implement
print_st0inv
  (x0) =
fprint_st0inv(stdout_ref, x0)
implement
prerr_st0inv
  (x0) =
fprint_st0inv(stderr_ref, x0)
//
(* ****** ****** *)
//
implement
fprint_st0qua
( out, stq ) =
(
case+ stq of
|
ST0QUAnone(tok) =>
fprint!
( out
, "ST0QUAnone(", tok, ")")
|
ST0QUAsome
(tbeg, s0qs, tend) =>
fprint!
( out
, "ST0QUAsome(", s0qs, ")")
) (* end of [fprint_st0qua] *)
//
(* ****** ****** *)
//
local
//
implement
fprint_val<d0typ> = fprint_d0typ
//
implement
fprint_val<st0qua> = fprint_st0qua
//
in(*in-of-local*)
//
implement
fprint_st0inv
  (out, x0) =
(
case+ x0 of
|
ST0INVnone
(stqs, terr) =>
fprint!
( out
, "ST0INVnone("
, stqs, "; ", terr, ")")
|
ST0INVsome
(stqs, tbeg, d0ts, tend) =>
fprint!
( out
, "ST0INVsome(", stqs, "; ", d0ts, ")")
) (* end of [fprint_st0inv] *)
//
end // end of [local]
//
(* ****** ****** *)
//
implement
print_endst0inv
  (x0) =
fprint_endst0inv(stdout_ref, x0)
implement
prerr_endst0inv
  (x0) =
fprint_endst0inv(stderr_ref, x0)
//
implement
fprint_endst0inv
  (out, x0) =
(
case+ x0 of
|
ENDST0INVnone
( (*void*) ) => ()
|
ENDST0INVsome
( tend, inv0 ) =>
fprint!
( out
, "ST0INV(", tend, ";", inv0, ")")
)
//
(* ****** ****** *)

implement
print_d0exp(x0) =
fprint_d0exp(stdout_ref, x0)
implement
prerr_d0exp(x0) =
fprint_d0exp(stderr_ref, x0)

(* ****** ****** *)

local

(*
implement
fprint_val<d0exp> = fprint_d0exp
*)

in (* in-of-local *)

implement
fprint_d0exp
  (out, x0) =
(
case+ x0.node() of
//
| D0Eid0(id) =>
  fprint!(out, "D0Eid0(", id, ")")
//
| D0Eint(i0) =>
  fprint!(out, "D0Eint(", i0, ")")
| D0Echr(c0) =>
  fprint!(out, "D0Echr(", c0, ")")
| D0Eflt(f0) =>
  fprint!(out, "D0Eflt(", f0, ")")
| D0Estr(s0) =>
  fprint!(out, "D0Estr(", s0, ")")
//
| D0Eopid(id) =>
  fprint!(out, "D0Eopid(", id, ")")
//
| D0Eapps(d0es) =>
  fprint!(out, "D0Eapps(", d0es, ")")
//
| D0Esqarg
  (tbeg, s0es, tend) =>
  fprint!
  ( out
  , "D0Esqarg("
  , tbeg, "; ", s0es, "; ", tend, ")")
| D0Etqarg
  (tbeg, s0es, tend) =>
  fprint!
  ( out
  , "D0Etqarg("
  , tbeg, "; ", s0es, "; ", tend, ")")
//
| D0Eparen
  (tbeg, d0es, tend) =>
  fprint!
  ( out
  , "D0Eparen("
  , tbeg, "; ", d0es, "; ", tend, ")")
//
| D0Etrcd1
  (tbeg, topt, d0es, tend) =>
  fprint!
  ( out
  , "D0Etrcd1("
  , tbeg, "; ", topt, "; ", d0es, "; ", tend, ")")
| D0Etrcd2
  (tbeg, topt, ldes, tend) =>
  fprint!
  ( out
  , "D0Etrcd2("
  , tbeg, "; ", topt, "; ", ldes, "; ", tend, ")")
//
| D0Eif0
  (tif0, d0e1, d0e2, d0e3) =>
  fprint!
  ( out
  , "D0Eif0(", tif0, "; "
  , d0e1, "; ", d0e2, "; ", d0e3, ")")
| D0Eif1
  (tif0, d0e1, d0e2, d0e3, tinv) =>
  fprint!
  ( out
  , "D0Eif1(", tif0, "; "
  , d0e1, "; ", d0e2, "; ", d0e3, "; ", tinv, ")")
//
| D0Ecas0
  (tok0, d0e1, tof2, tbar, d0cs) =>
  fprint!
  ( out
  , "D0Ecas0(", tok0, "; "
  , d0e1, "; ", tof2, "; ", tbar, "; ", "...", ")")
| D0Ecas1
  (tok0, d0e1, tof2, tbar, d0cs, tinv) =>
  fprint!
  ( out
  , "D0Ecas1(", tok0, "; "
  , d0e1, "; ", tof2, "; ", tbar, "; ", "...", "; ", tinv, ")")
//
| D0Elet
  (tok0, d0cs, topt, d0es, tok2) =>
  fprint!
  ( out
  , "D0Elet(", tok0, "; "
  , d0cs, "; ", topt, "; ", d0es, "; ", tok2, ")")
//
| D0Ewhere(d0e1, d0cs) =>
  fprint!(out, "D0Ewhere(", d0e1, "; ", d0cs, ")")
//
| D0Ebrack
  (tbeg, d0es, tend) =>
  fprint!
  ( out
  , "D0Ebrack(", tbeg, "; ", d0es, "; ", tend, ")")
| D0Edtsel
  (tdot, lab1, arg2) =>
  fprint!
  ( out
  , "D0Edtsel(", tdot, "; ", lab1, "; ", arg2, ")")
//
| D0Elam
  ( tok0
  , arg1, res2
  , arrw, body, tend) =>
  fprint!
  ( out
  , "D0Elam(", tok0, "; "
  , arg1, "; ", res2, "; ", arrw, "; ", body, "; ", tend, ")")
| D0Efix
  ( tok0, fid0
  , arg1, res2
  , arrw, body, tend) =>
  fprint!
  ( out
  , "D0Efix(", tok0, "; ", fid0, "; "
  , arg1, "; ", res2, "; ", arrw, "; ", body, "; ", tend, ")")
//
| D0Etry0
  (tok0, d0e1, twth, tbar, d0cs, tend) =>
  fprint!
  ( out
  , "D0Etry0(", tok0, "; "
  , d0e1, "; ", twth, "; ", tbar, "; ", "...", "; ", tend, ")")
//
| D0Eanno
  (d0e1, s0e2) =>
  fprint!(out, "D0Eanno(", d0e1, "; ", s0e2, ")")
//
| D0Equal
  (tok0, d0e1) =>
  fprint!(out, "D0Equal(", tok0, "; ", d0e1, ")")
//
| D0Enone(tok) => fprint!(out, "D0Enone(", tok, ")")
//
| D0Eextnam(g0e1) =>
  fprint!(out, "D0Eextnam(", g0e1, ")")
//
| D0Eexists
  (tok0, sqas, d0e1) =>
  fprint!(out, "D0Eexists(", tok0, "; ", sqas, "; ", d0e1, ")")
//
) (* end of [fprint_d0exp] *) end // end of [local]

(* ****** ****** *)

implement
print_d0exp_RPAREN(x0) =
fprint_d0exp_RPAREN(stdout_ref, x0)
implement
prerr_d0exp_RPAREN(x0) =
fprint_d0exp_RPAREN(stderr_ref, x0)

local

(*
implement
fprint_val<d0exp> = fprint_d0exp
*)

in (* in-of-local *)

implement
fprint_d0exp_RPAREN
  (out, x0) =
(
case+ x0 of
| d0exp_RPAREN_cons0(tok) =>
  fprint!
  (out, "d0exp_RPAREN_cons0(", tok, ")")
| d0exp_RPAREN_cons1(tok1, d0es, tok2) =>
  fprint!
  (out, "d0exp_RPAREN_cons1(", tok1, ", ", d0es, ", ", tok2, ")")
| d0exp_RPAREN_cons2(tok1, d0es, tok2) =>
  fprint!
  (out, "d0exp_RPAREN_cons2(", tok1, ", ", d0es, ", ", tok2, ")")
) (* end of [fprint_d0exp_RPAREN] *)

end // end of [local]

(* ****** ****** *)

implement
print_labd0exp_RBRACE(x0) =
fprint_labd0exp_RBRACE(stdout_ref, x0)
implement
prerr_labd0exp_RBRACE(x0) =
fprint_labd0exp_RBRACE(stderr_ref, x0)

local

(*
implement
fprint_val<d0exp> = fprint_d0exp
*)

in (* in-of-local *)

implement
fprint_labd0exp_RBRACE
  (out, x0) =
(
case+ x0 of
| labd0exp_RBRACE_cons0(tok) =>
  fprint!
  (out, "labd0exp_RBRACE_cons0(", tok, ")")
| labd0exp_RBRACE_cons1(tok1, ld0es, tok2) =>
  fprint!
  (out, "labd0exp_RBRACE_cons1(", tok1, ", ", ld0es, ", ", tok2, ")")
) (* end of [fprint_labd0exp_RBRACE] *)

end // end of [local]

(* ****** ****** *)

implement
print_d0exp_THEN(x0) =
fprint_d0exp_THEN(stdout_ref, x0)
implement
prerr_d0exp_THEN(x0) =
fprint_d0exp_THEN(stderr_ref, x0)
implement
fprint_d0exp_THEN(out, x0) =
(
case+ x0 of
| d0exp_THEN(tok, d0e) =>
  fprint!(out, "d0exp_THEN(", tok, "; ", d0e, ")")
) (* end of [fprint_d0exp_THEN] *)

(* ****** ****** *)

implement
print_d0exp_ELSE(x0) =
fprint_d0exp_ELSE(stdout_ref, x0)
implement
prerr_d0exp_ELSE(x0) =
fprint_d0exp_ELSE(stderr_ref, x0)
implement
fprint_d0exp_ELSE(out, x0) =
(
case+ x0 of
| d0exp_ELSEnone() =>
  fprint!(out, "d0exp_ELSEnone(", ")")
| d0exp_ELSEsome(tok, d0e) =>
  fprint!(out, "d0exp_ELSEsome(", tok, "; ", d0e, ")")
) (* end of [fprint_d0exp_ELSE] *)

(* ****** ****** *)
//
implement
print_endwhere(x0) =
fprint_endwhere(stdout_ref, x0)
implement
prerr_endwhere(x0) =
fprint_endwhere(stderr_ref, x0)
//
implement
fprint_endwhere(out, x0) =
(
case+ x0 of
| endwhere_cons1(tok) =>
  fprint!
  ( out
  , "endwhere_cons1(", tok, ")")
| endwhere_cons2(tok1, opt2) =>
  fprint!
  ( out
  , "endwhere_cons2(", tok1, "; ", opt2, ")")
)
//
(* ****** ****** *)
//
implement
print_d0eclseq_WHERE(x0) =
fprint_d0eclseq_WHERE(stdout_ref, x0)
implement
prerr_d0eclseq_WHERE(x0) =
fprint_d0eclseq_WHERE(stderr_ref, x0)
implement
fprint_d0eclseq_WHERE(out, x0) =
(
case+ x0 of
| d0eclseq_WHERE
  (tok0, opt1, d0cs, opt2) =>
  fprint!
  ( out
  , "d0eclseq_WHERE("
  , tok0, "; ", opt1, "; ", d0cs, "; ", opt2, ")")
) (* end of [fprint_d0eclseq_WHERE] *)
//
(* ****** ****** *)

implement
print_f0unarrow(x0) =
fprint_f0unarrow(stdout_ref, x0)
implement
prerr_f0unarrow(x0) =
fprint_f0unarrow(stderr_ref, x0)
implement
fprint_f0unarrow(out, x0) =
(
case+ x0 of
| F0UNARROWnone(tok) =>
  fprint!
  (out, "F0UNARROWnone(", tok, ")")
| F0UNARROWdflt(tok) =>
  fprint!
  (out, "F0UNARROWdflt(", tok, ")")
| F0UNARROWlist(tbeg, s0es, tend) =>
  fprint!
  ( out
  , "F0UNARROWlist(", tbeg, "; ", s0es, "; ", tend, ")")
) (* end of [fprint_f0unarrow] *)

(* ****** ****** *)

implement
print_decmodopt(x0) =
fprint_decmodopt(stdout_ref, x0)
implement
prerr_decmodopt(x0) =
fprint_decmodopt(stderr_ref, x0)
implement
fprint_decmodopt
  (out, x0) =
(
case+ x0 of
//
| DECMODnone() =>
  fprint!
  (out, "DECMODnone(", ")")
//
| DECMODsing(tok, id0) =>
  fprint!
  (out, "DECMODsing(", tok, "; ", id0, ")")
| DECMODlist(tok, tbeg, ids, tend) =>
  fprint!
  ( out, "DECMODlist("
  , tok, "; ", tbeg, "; ", ids, "; ", tend, ")")
)

(* ****** ****** *)

implement
print_teqd0expopt(x0) =
fprint_teqd0expopt(stdout_ref, x0)
implement
prerr_teqd0expopt(x0) =
fprint_teqd0expopt(stderr_ref, x0)
implement
fprint_teqd0expopt
  (out, x0) =
(
case+ x0 of
| TEQD0EXPnone() =>
  fprint!
  (out, "TEQD0EXPnone(", ")")
| TEQD0EXPsome(tok, d0e) =>
  fprint!
  (out, "TEQD0EXPsome(", tok, "; ", d0e, ")")
)

(* ****** ****** *)

implement
print_wths0expopt(x0) =
fprint_wths0expopt(stdout_ref, x0)
implement
prerr_wths0expopt(x0) =
fprint_wths0expopt(stderr_ref, x0)
implement
fprint_wths0expopt
  (out, x0) =
(
case+ x0 of
| WTHS0EXPnone() =>
  fprint!
  (out, "WTHS0EXPnone(", ")")
| WTHS0EXPsome(tok, d0e) =>
  fprint!
  (out, "WTHS0EXPsome(", tok, "; ", d0e, ")")
)

(* ****** ****** *)

implement
print_d0ecl(x0) =
fprint_d0ecl(stdout_ref, x0)
implement
prerr_d0ecl(x0) =
fprint_d0ecl(stderr_ref, x0)

local
//
(*
implement
fprint_val<d0ecl> = fprint_d0ecl
*)
//
implement
fprint_val<g0marg> = fprint_g0marg
//
implement
fprint_val<d0valdecl> = fprint_d0valdecl
implement
fprint_val<d0vardecl> = fprint_d0vardecl
implement
fprint_val<d0fundecl> = fprint_d0fundecl
implement
fprint_val<d0cstdecl> = fprint_d0cstdecl
//
in (* in-of-local *)

implement
fprint_d0ecl
  (out, x0) =
(
case+ x0.node() of
//
| D0Cnone(tok) =>
  fprint!(out, "D0Cnone(", tok, ")")
//
| D0Ctokerr(tok) =>
  fprint!(out, "D0Ctokerr(", tok, ")")
//
| D0Cnonfix(tok, ids) =>
  fprint!
  (out, "D0Cnonfix(", tok, "; ", ids, ")")
| D0Cfixity(tok, ids, opt) =>
  fprint!
  ( out
  , "D0Cfixity(", tok, "; ", ids, "; ", opt, ")")
//
| D0Cstatic(tok, d0c) =>
  fprint!
  (out, "D0Cstatic(", tok, "; ", d0c, ")")
| D0Cextern(tok, d0c) =>
  fprint!
  (out, "D0Cextern(", tok, "; ", d0c, ")")
//
| D0Cdefine
  (tok, gid, gmas, gdef) =>
  fprint!
  ( out, "D0Cdefine("
  , gid, "; ", gmas, "; ", gdef, ")")
//
| D0Cmacdef
  (tok, gid, gmas, mdef) =>
  fprint!
  ( out, "D0Cmacdef("
  , gid, "; ", gmas, "; ", mdef, ")")
//
| D0Clocal
  (tbeg, d0cs0, topt, d0cs1, tend) =>
  fprint!
  ( out
  , "D0Clocal("
  , tbeg, "; ", d0cs0, "; "
  , topt, "; ", d0cs1, "; ", tend, ")")
//
| D0Cinclude(tok, g0e) =>
  fprint!
  (out, "D0Cinclude(", tok, "; ", g0e, ")")
//
| D0Cstaload(tok, g0e) =>
  fprint!
  (out, "D0Cstaload(", tok, "; ", g0e, ")")
(*
| D0Cdynload(tok, d0e) =>
  fprint!
  (out, "D0Cdynload(", tok, "; ", d0e, ")")
*)
//
| D0Cabssort(tok, tid) =>
  fprint!
  (out, "D0Cabssort(", tok, "; ", tid, ")")
//
| D0Cstacst0
  (tok, sid, tmas, tok1, s0t2) =>
  fprint!
  ( out, "D0Cstacst0("
  , tok, "; ", sid, "; ", tmas, "; ", tok1, "; ", s0t2, ")")
//
| D0Csortdef
  (tok, tid, tok1, def2) =>
  fprint!
  ( out, "D0Csortdef("
  , tok, "; ", tid, "; ", tok1, "; ", def2, ")")
| D0Csexpdef
  ( tok, sid
  , arg, res, tok1, tdef) =>
  fprint!
  ( out
  , "D0Csexpdef("
  , tok, "; ", sid, "; "
  , arg, "; ", res, "; ", tok1, "; ", tdef, ")")
//
| D0Cabstype
  (tok, sid, arg, res, tdef) =>
  fprint!
  ( out, "D0Cabstype("
  , tok, "; ", sid, "; ", arg, "; ", res, "; ", tdef, ")")
//
| D0Cabsopen(tok, sqid) =>
  fprint!
  ( out
  , "D0Cabsopen(", tok, "; ", sqid, ")")
//
| D0Cabsimpl
  (tok, sqid, smas, res0, teq1, def2) =>
  fprint!
  ( out
  , "D0Cabsimpl("
  , tok, "; ", sqid, "; "
  , smas, "; ", res0, "; ", teq1, "; ", def2, ")")
//
| D0Csymload
  (tok, sym, twth, dqid, tint) =>
  fprint!
  ( out, "D0Csymload("
  , tok, "; ", sym, "; "
  , twth, "; ", dqid, "; ", tint, ")")
//
| D0Cdatasort(tok, d0cs) =>
  fprint!(out, "D0Cdatasort(", tok, "; ", d0cs, ")")
//
| D0Cexcptcon(tok, d0cs) =>
  fprint!
  ( out
  , "D0Cexcptcon(", tok, "; ", d0cs, ")")
| D0Cdatatype(tok, d0cs, wopt) =>
  fprint!
  ( out
  , "D0Cdatatype(", tok, "; ", d0cs, "; ", wopt, ")")
//
| D0Cdynconst
  (tok, tqas, d0cs) =>
  fprint!
  ( out
  , "D0Cdynconst(", tok, "; ", tqas, "; ", d0cs, ")")
//
| D0Cfundclst
  (tok, mopt, tqas, d0cs) =>
  fprint!
  ( out
  , "D0Cfundclst("
  , tok, "; ", mopt, "; ", tqas, "; ", d0cs, ")")
//
| D0Cvaldclst
  (tok, mopt, d0cs) =>
  fprint!
  ( out
  , "D0Cvaldclst(", tok, "; ", mopt, "; ", d0cs, ")")
| D0Cvardclst
  (tok, mopt, d0cs) =>
  fprint!
  ( out
  , "D0Cvardclst(", tok, "; ", mopt, "; ", d0cs, ")")
//
| D0Cimplmnt0
  ( tok, mopt, sqas, tqas
  , dqid, tias, f0as, res0, teq1, d0e2) =>
  fprint!
  ( out
  , "D0Cimplmnt0("
  , tok, "; ", mopt, "; ", sqas, "; ", tqas, "; "
  , dqid, "; ", tias, "; ", f0as, "; ", res0, "; ", teq1, "; ", d0e2, ")")
//
| D0Celse(tok) =>
  fprint!(out, "D0Celse(", tok, ")")
| D0Cendif(tok) =>
  fprint!(out, "D0Cendif(", tok, ")")
| D0Cifdec(tok, g0e1, topt) =>
  fprint!(out, "D0Cifdec(", tok, "; ", g0e1, "; ", topt, ")")
| D0Celsif(tok, g0e1, topt) =>
  fprint!(out, "D0Celsif(", tok, "; ", g0e1, "; ", topt, ")")
//
(*
| _(*rest-of-d1ecl*) =>
    fprint!(out, "fprint_d1ecl: D0C...: not-yet-implemented")
*)
//
) (* end of [fprint_d0ecl] *)

end // end of [local]

(* ****** ****** *)
//
implement
print_precopt(x0) =
fprint_precopt(stdout_ref, x0)
implement
prerr_precopt(x0) =
fprint_precopt(stderr_ref, x0)
//
implement
fprint_precopt
  (out, x0) =
(
case+ x0 of
| PRECOPTnil() =>
  fprint!(out, "PRECOPTnil()")
| PRECOPTint(tint) =>
  fprint!(out, "PRECOPTint(", tint, ")")
| PRECOPTopr(topr, pmod) =>
  fprint!
  (out, "PRECOPTopr(", topr, "; ", pmod, ")")
) (* end of [fprint_precopt] *)
//
implement
fprint_signint
  (out, x0) =
(
case+ x0 of
| SIGNINTint(tint) =>
  fprint!(out, "SIGNINTint(", tint, ")")
| SIGNINTopr(topr, tint) =>
  fprint!(out, "SIGNINTopr(", topr, "; ", tint, ")")
)
//
implement
fprint_precmod
  (out, x0) =
(
case+ x0 of
| PRECMODnone() =>
  fprint!(out, "PRECMODnone()")
| PRECMODsome(tbeg, sint, tend) =>
  fprint!
  (out, "PRECMODsome(", tbeg, "; ", sint, "; ", tend, ")")
)
//
(* ****** ****** *)

implement
print_abstdf0(x0) =
fprint_abstdf0(stdout_ref, x0)
implement
prerr_abstdf0(x0) =
fprint_abstdf0(stderr_ref, x0)

implement
fprint_abstdf0
  (out, x0) =
(
case+ x0 of
| ABSTDF0some() =>
  fprint
  (out, "ABSTDF0some()")
| ABSTDF0lteq(tok, s0e) =>
  fprint!
  (out, "ABSTDF0lteq(", tok, "; ", s0e, ")")
| ABSTDF0eqeq(tok, s0e) =>
  fprint!
  (out, "ABSTDF0eqeq(", tok, "; ", s0e, ")")
) (* end of [fprint_abstdf0] *)

(* ****** ****** *)
//
implement
print_g0expdef(x0) =
fprint_g0expdef(stdout_ref, x0)
implement
prerr_g0expdef(x0) =
fprint_g0expdef(stderr_ref, x0)
//
implement
fprint_g0expdef
  (out, x0) =
(
case+ x0 of
| G0EDEFnone() =>
  fprint!
  (out, "G0EDEFnone(", ")")
| G0EDEFsome(topt, g0e1) =>
  fprint!
  (out, "G0EDEFsome(", topt, "; ", g0e1, ")")
)
//
(* ****** ****** *)
//
implement
print_d0macdef(x0) =
fprint_d0macdef(stdout_ref, x0)
implement
prerr_d0macdef(x0) =
fprint_d0macdef(stderr_ref, x0)
//
implement
fprint_d0macdef
  (out, x0) =
(
case+ x0 of
| D0MDEFnone() =>
  fprint!
  (out, "D0MDEFnone(", ")")
| D0MDEFsome(topt, d0e1) =>
  fprint!
  (out, "D0MDEFsome(", topt, "; ", d0e1, ")")
)
//
(* ****** ****** *)

implement
print_wd0eclseq(x0) =
fprint_wd0eclseq(stdout_ref, x0)
implement
prerr_wd0eclseq(x0) =
fprint_wd0eclseq(stderr_ref, x0)

implement
fprint_wd0eclseq
  (out, x0) =
(
case+ x0 of
| WD0CSnone() =>
  fprint(out, "WD0CSnone()")
| WD0CSsome(tbeg, topt, d0cs, tend) =>
  fprint!
  ( out, "WD0CSsome("
  , tbeg, "; ", topt, "; ", d0cs, "; ", tend, ")")
) (* end of [fprint_wd0eclseq] *)

(* ****** ****** *)
//
implement
print_d0valdecl(x0) =
fprint_d0valdecl(stdout_ref, x0)
implement
prerr_d0valdecl(x0) =
fprint_d0valdecl(stderr_ref, x0)
//
implement
print_d0vardecl(x0) =
fprint_d0vardecl(stdout_ref, x0)
implement
prerr_d0vardecl(x0) =
fprint_d0vardecl(stderr_ref, x0)
//
implement
print_d0fundecl(x0) =
fprint_d0fundecl(stdout_ref, x0)
implement
prerr_d0fundecl(x0) =
fprint_d0fundecl(stderr_ref, x0)
//
(* ****** ****** *)

implement
fprint_d0valdecl
  (out, x0) = let
//
val+D0VALDECL(rcd) = x0
//
in
  fprint!
  ( out
  , "D0VALDECL@{"
  , "pat=", rcd.pat, ", teq=", rcd.teq
  , ", def=", rcd.def, ", wtp=", rcd.wtp, "}")
end // end of [fprint_d0valdecl]

(* ****** ****** *)

implement
fprint_d0vardecl
  (out, x0) = let
//
val+D0VARDECL(rcd) = x0
//
in
  fprint!
  ( out
  , "D0VARDECL@{"
  , "nam=", rcd.nam
  , ", wth=", rcd.wth
  , ", res=", rcd.res, ", ini=", rcd.ini, "}")
end // end of [fprint_d0vardecl]

(* ****** ****** *)

implement
fprint_d0fundecl
  (out, x0) = let
//
val+D0FUNDECL(rcd) = x0
//
in
  fprint!
  ( out
  , "D0FUNDECL@{"
  , "nam=", rcd.nam
  , ", arg=", rcd.arg
  , ", res=", rcd.res, ", teq=", rcd.teq
  , ", def=", rcd.def, ", wtp=", rcd.wtp, "}")
end // end of [fprint_d0fundecl]

(* ****** ****** *)

implement
print_d0cstdecl(x0) =
fprint_d0cstdecl(stdout_ref, x0)
implement
prerr_d0cstdecl(x0) =
fprint_d0cstdecl(stderr_ref, x0)

implement
fprint_d0cstdecl
  (out, x0) = let
//
val+D0CSTDECL(rcd) = x0
//
in
  fprint!
  ( out
  , "D0CSTDECL@{"
  , "nam=", rcd.nam, ", arg=", rcd.arg
  , ", res=", rcd.res, ", def=", rcd.def, "}")
end // end of [fprint_d0cstdecl]

(* ****** ****** *)

(* end of [xats_dynexp0_print.dats] *)

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
// Start Time: July, 2018
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
#staload "./../SATS/lexing.sats"
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
implement
fprint_val<d0arg> = fprint_d0arg
//
implement
fprint_val<f0arg> = fprint_f0arg
//
implement
fprint_val<tq0arg> = fprint_tq0arg
//
(* ****** ****** *)
//
implement
fprint_val<d0ecl> = fprint_d0ecl
//
(* ****** ****** *)
//
implement
(a)//tmp
fprint_val<dl0abeled(a)> = fprint_dl0abeled<a>
//
(* ****** ****** *)

implement
fprint_q0arg
  (out, x0) =
(
//
case+ x0.node() of
(*
| Q0ARGnone(tok) =>
  fprint!(out, "Q0ARGnone(", tok, ")")
*)
| Q0ARGsome(ids, tok, s0t) =>
  fprint!
  ( out
  , "Q0ARGsome(", ids, "; ", tok, "; ", s0t, ")")
//
) (* end of [fprint_q0arg] *)

(* ****** ****** *)

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

(* ****** ****** *)

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

(* ****** ****** *)

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

local

implement
fprint_val<d0pat> = fprint_d0pat

in (* in-of-local *)

implement
fprint_d0pat
  (out, x0) =
(
case+ x0.node() of
//
| D0Pid(id) =>
  fprint!(out, "D0Pid(", id, ")")
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
| D0Pparen
  (tbeg, d0ps, tend) =>
  fprint!
  ( out
  , "D0Pparen("
  , tbeg, "; ", d0ps, "; ", tend, ")")
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

local

implement
fprint_val<d0pat> = fprint_d0pat

in (* in-of-local *)

implement
fprint_d0pat_RPAREN
  (out, x0) =
(
case+ x0 of
| d0pat_RPAREN_cons0(tok) =>
  fprint!
  (out, "d0pat_RPAREN_cons0(", tok, ")")
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

local

implement
fprint_val<d0pat> = fprint_d0pat

in (* in-of-local *)

implement
fprint_labd0pat_RBRACE
  (out, x0) =
(
case+ x0 of
| labd0pat_RBRACE_cons0(tok) =>
  fprint!
  (out, "labd0pat_RBRACE_cons0(", tok, ")")
| labd0pat_RBRACE_cons1(tok1, ld0ps, tok2) =>
  fprint!
  (out, "labd0pat_RBRACE_cons1(", tok1, ", ", ld0ps, ", ", tok2, ")")
) (* end of [fprint_labd0pat_RBRACE] *)

end // end of [local]

(* ****** ****** *)

implement
print_d0exp(x0) =
fprint_d0exp(stdout_ref, x0)
implement
prerr_d0exp(x0) =
fprint_d0exp(stderr_ref, x0)

local

implement
fprint_val<d0exp> = fprint_d0exp

in (* in-of-local *)

implement
fprint_d0exp
  (out, x0) =
(
case+ x0.node() of
//
| D0Eid(id) =>
  fprint!(out, "D0Eid(", id, ")")
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
| D0Eapps(d0es) =>
  fprint!(out, "D0Eapps(", d0es, ")")
//
| D0Eparen
  (tbeg, d0es, tend) =>
  fprint!
  ( out
  , "D0Eparen("
  , tbeg, "; ", d0es, "; ", tend, ")")
//
| D0Etuple
  (tbeg, topt, d0es, tend) =>
  fprint!
  ( out
  , "D0Etuple("
  , tbeg, "; ", topt, "; ", d0es, "; ", tend, ")")
| D0Erecord
  (tbeg, topt, d0es, tend) =>
  fprint!
  ( out
  , "D0Erecord("
  , tbeg, "; ", topt, "; ", d0es, "; ", tend, ")")
//
| D0Eif0
  (tif0, d0e1, d0e2, d0e3, topt) =>
  fprint!
  ( out
  , "D0Eif0(", tif0, "; "
  , d0e1, "; ", d0e2, "; ", d0e3, "; ", topt, ")")
//
| D0Elet
  (tok0, d0cs, tok1, d0es, tok2) =>
  fprint!
  ( out
  , "D0Elet(", tok0, "; "
  , d0cs, "; ", tok1, "; ", d0es, "; ", tok2, ")")
| D0Ewhere _ => fprint!(out, "D0Ewhere(...)")
//
| D0Elam
  (tok0, arg1, res2, farrw, fbody) =>
  fprint!
  ( out
  , "D0Elam(", tok0, "; "
  , arg1, "; ", res2, "; ", farrw, "; ", fbody, ")")
//
| D0Eanno
  (d0e, ann) =>
  fprint!(out, "D0Eanno(", d0e, "; ", ann, ")")
//
| D0Equal
  (tok, d0e) =>
  fprint!(out, "D0Equal(", tok, "; ", d0e, ")")
//
| D0Enone(tok) => fprint!(out, "D0Enone(", tok, ")")
//
) (* end of [fprint_d0exp] *)

end // end of [local]

(* ****** ****** *)

implement
print_d0exp_RPAREN(x0) =
fprint_d0exp_RPAREN(stdout_ref, x0)
implement
prerr_d0exp_RPAREN(x0) =
fprint_d0exp_RPAREN(stderr_ref, x0)

local

implement
fprint_val<d0exp> = fprint_d0exp

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

implement
fprint_val<d0exp> = fprint_d0exp

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
print_declmodopt(x0) =
fprint_declmodopt(stdout_ref, x0)
implement
prerr_declmodopt(x0) =
fprint_declmodopt(stderr_ref, x0)
implement
fprint_declmodopt
  (out, x0) =
(
case+ x0 of
//
| DECLMODnone() =>
  fprint!
  (out, "DECLMODnone(", ")")
//
| DECLMODsing(tok, id0) =>
  fprint!
  (out, "DECLMODsing(", tok, "; ", id0, ")")
| DECLMODlist(tok, tbeg, ids, tend) =>
  fprint!
  ( out, "DECLMODlist("
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
print_d0cstdec(x0) =
fprint_d0cstdec(stdout_ref, x0)
implement
prerr_d0cstdec(x0) =
fprint_d0cstdec(stderr_ref, x0)

implement
fprint_d0cstdec
  (out, x0) = let
//
val+D0CSTDEC(rcd) = x0
//
in
  fprint!
  ( out
  , "D0CSTDEC@{"
  , ", nam=", rcd.nam, ", arg=", rcd.arg
  , ", res=", rcd.res, ", def=", rcd.def, "}")
end // end of [fprint_d0cstdec]

(* ****** ****** *)

implement
print_v0aldecl(x0) =
fprint_v0aldecl(stdout_ref, x0)
implement
prerr_v0aldecl(x0) =
fprint_v0aldecl(stderr_ref, x0)

implement
fprint_v0aldecl
  (out, x0) = let
//
val+V0ALDECL(rcd) = x0
//
in
  fprint!
  ( out
  , "V0ALDECL@{"
  , ", pat=", rcd.pat
  , ", def=", rcd.def, ", wtp=", rcd.wtp, "}")
end // end of [fprint_v0aldecl]

(* ****** ****** *)

implement
print_f0undecl(x0) =
fprint_f0undecl(stdout_ref, x0)
implement
prerr_f0undecl(x0) =
fprint_f0undecl(stderr_ref, x0)

implement
fprint_f0undecl
  (out, x0) = let
//
val+F0UNDECL(rcd) = x0
//
in
  fprint!
  ( out
  , "F0UNDECL@{"
  , ", nam=", rcd.nam
  , ", arg=", rcd.arg
  , ", res=", rcd.res
  , ", def=", rcd.def, ", wtp=", rcd.wtp, "}")
end // end of [fprint_f0undecl]

(* ****** ****** *)

implement
print_d0ecl(x0) =
fprint_d0ecl(stdout_ref, x0)
implement
prerr_d0ecl(x0) =
fprint_d0ecl(stderr_ref, x0)

local

implement
fprint_val<d0ecl> = fprint_d0ecl
implement
fprint_val<d0cstdec> = fprint_d0cstdec
implement
fprint_val<v0aldecl> = fprint_v0aldecl
implement
fprint_val<f0undecl> = fprint_f0undecl

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
| D0Ctkerr(tok) =>
  fprint!(out, "D0Ctkerr(", tok, ")")
//
| D0Cnonfix(tok, ids) =>
  fprint!
  (out, "D0Cnonfix(", tok, "; ", ids, ")")
| D0Cfixity(tok, opt, ids) =>
  fprint!
  ( out
  , "D0Cfixity(", tok, "; ", opt, "; ", ids, ")")
//
| D0Cstatic(tok, d0c) =>
  fprint!
  (out, "D0Cstatic(", tok, "; ", d0c, ")")
| D0Cextern(tok, d0c) =>
  fprint!
  (out, "D0Cextern(", tok, "; ", d0c, ")")
//
| D0Cinclude(tok, d0e) =>
  fprint!
  (out, "D0Cinclude(", tok, "; ", d0e, ")")
//
| D0Cstaload(tok, d0e) =>
  fprint!
  (out, "D0Cstaload(", tok, "; ", d0e, ")")
//
| D0Csortdef
  (tok, tid, tok1, def2) =>
  fprint!
  ( out, "D0Csortdef("
  , tok, "; ", tid, "; ", tok1, "; ", def2, ")")
| D0Csexpdef
  ( tok, sid
  , arg, opt, tok1, tdef) =>
  fprint!
  ( out
  , "D0Csexpdef("
  , tok, "; ", sid, "; "
  , arg, "; ", opt, "; ", tok1, "; ", tdef, ")")
//
| D0Cabstype
  (tok, sid, arg0, tdef) =>
  fprint!
  ( out, "D0Cabstype("
  , tok, "; ", sid, "; ", arg0, "; ", tdef, ")")
//
| D0Cvaldecl
  (tok, mods, d0cs) =>
  fprint!
  (out, "D0Cvaldecl(", tok, "; ", mods, "; ", d0cs)
//
| D0Cfundecl
  (tok, tqas, mods, d0cs) =>
  fprint!
  ( out
  , "D0Cfundecl(", tok, "; ", tqas, "; ", mods, "; ", d0cs)
//
| D0Cdatasort(tok, d0cs) =>
  fprint!(out, "D0Cdatasort(", tok, "; ", d0cs, ")")
//
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
| D0Clocal
  (tok, d0cs0, tok1, d0cs1, tok2) =>
  fprint!
  ( out, "D0Clocal("
  , tok, "; ", d0cs0, "; ", tok1, "; ", d0cs1, "; ", tok2, ")")
//
) (* end of [fprint_d0ecl] *)

end // end of [local]

(* ****** ****** *)

implement
print_precopt(x0) =
fprint_precopt(stdout_ref, x0)
implement
prerr_precopt(x0) =
fprint_precopt(stderr_ref, x0)

implement
fprint_precopt
  (out, x0) =
(
case+ x0 of
| PRECOPTnil() =>
  fprint(out, "PRECOPTnil()")
| PRECOPTsing(tok) =>
  fprint!(out, "PRECOPTsing(", tok, ")")
| PRECOPTlist(t0, ts, t1) =>
  fprint!(out, "PRECOPTlist(", t0, "; ", ts, "; ", t1)
) (* end of [fprint_precopt] *)

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
| ABSTDF0nil() =>
  fprint(out, "ABSTDF0nil()")
| ABSTDF0lteq(tok, s0e) =>
  fprint!
  (out, "ABSTDF0lteq(", tok, "; ", s0e, ")")
| ABSTDF0eqeq(tok, s0e) =>
  fprint!
  (out, "ABSTDF0eqeq(", tok, "; ", s0e, ")")
) (* end of [fprint_abstdf0] *)

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

(* end of [xats_dynexp0_print.dats] *)

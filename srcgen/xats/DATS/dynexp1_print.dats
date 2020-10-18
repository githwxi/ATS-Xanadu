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
// Start Time: August, 2018
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
FP0 = "./../SATS/filpath.sats"
#staload
LOC = "./../SATS/locinfo.sats"
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
#staload "./../SATS/lexing.sats"
//
#staload "./../SATS/staexp0.sats"
#staload "./../SATS/dynexp0.sats"
//
#staload "./../SATS/staexp1.sats"
//
#staload "./../SATS/dynexp1.sats"
//
(* ****** ****** *)

#staload _ = "./staexp0_print.dats"
#staload _ = "./dynexp0_print.dats"

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
fprint_val<token> = fprint_token
implement
fprint_val<t0int> = fprint_t0int
//
(* ****** ****** *)
//
implement
(a)//tmp
fprint_val<dl0abeled(a)> = fprint_dl0abeled<a>
//
(* ****** ****** *)

implement
fprint_val<g1exp> = fprint_g1exp

implement
fprint_val<sort1> = fprint_sort1
implement
fprint_val<s1exp> = fprint_s1exp

implement
fprint_val<s1arg> = fprint_s1arg
implement
fprint_val<t1arg> = fprint_t1arg
implement
fprint_val<s1qua> = fprint_s1qua
implement
fprint_val<s1marg> = fprint_s1marg
implement
fprint_val<t1marg> = fprint_t1marg

(* ****** ****** *)
//
implement
fprint_val<d1tsort> = fprint_d1tsort
//
implement
fprint_val<d1atcon> = fprint_d1atcon
implement
fprint_val<d1atype> = fprint_d1atype
//
(* ****** ****** *)
//
implement
fprint_val<d1exp> = fprint_d1exp
//
(* ****** ****** *)
//
implement
fprint_val<d1gua> = fprint_d1gua
implement
fprint_val<d1clau> = fprint_d1clau
implement
fprint_val<d1gpat> = fprint_d1gpat
//
(* ****** ****** *)
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
fprint_val<f1arg> = fprint_f1arg
//
implement
fprint_val<sq1arg> = fprint_sq1arg
//
implement
fprint_val<tq1arg> = fprint_tq1arg
//
implement
fprint_val<ti1arg> = fprint_ti1arg
//
(* ****** ****** *)
//
implement
fprint_val<d1ecl> = fprint_d1ecl
//
(* ****** ****** *)
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
(*
| Q1ARGnone(tok) =>
  fprint!(out, "Q1ARGnone(", tok, ")")
*)
| Q1ARGsome(tok, opt) =>
  fprint!(out, "Q1ARGsome(", tok, "; ", opt, ")")
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
| F1ARGsome_dyn(d1p0) =>
  fprint!(out, "F1ARGsome_dyn(", d1p0, ")")
| F1ARGsome_sta(s1qs) =>
  fprint!(out, "F1ARGsome_sta(", s1qs, ")")
| F1ARGsome_met(s1es) =>
  fprint!(out, "F1ARGsome_met(", s1es, ")")
//
) (* end of [fprint_f1arg] *)

(* ****** ****** *)

implement
fprint_sq1arg
  (out, x0) =
(
//
case+
x0.node() of
| SQ1ARGnone(tok) =>
  fprint!(out, "SQ1ARGnone(", tok, ")")
| SQ1ARGsome(q1as) =>
  fprint!(out, "SQ1ARGsome(", q1as, ")")
//
) (* end of [fprint_sq1arg] *)

(* ****** ****** *)

implement
fprint_ti1arg
  (out, x0) =
(
//
case+
x0.node() of
| TI1ARGnone(tok) =>
  fprint!(out, "TI1ARGnone(", tok, ")")
| TI1ARGsome(s1es) =>
  fprint!(out, "TI1ARGsome(", s1es, ")")
//
) (* end of [fprint_ti1arg] *)

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
| D1Pid0(tok) =>
  fprint!
  (out, "D1Pid0(", tok, ")")
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
| D1Papp1(d1p0, d1p1) =>
  fprint!
  ( out, "D1Papps("
  , d1p0, "; ", d1p1, ")")
| D1Papp2(d1p0, d1p1, d1p2) =>
  fprint!
  ( out, "D1Papps("
  , d1p0, "; ", d1p1, ";", d1p2, ")")
//
| D1Psarg(s1as) =>
  fprint!
  (out, "D1Psarg(", s1as, ")")
//
| D1Plist(d1ps) =>
  fprint!
  (out, "D1Plist1(", d1ps, ")")
| D1Plist(d1ps1, d1ps2) =>
  fprint!
  ( out
  , "D1Plist2(", d1ps1, "; ", d1ps2, ")")
//
| D1Ptuple(tok, d1ps) =>
  fprint!
  ( out
  , "D1Ptuple1(", tok, "; ", d1ps, ")")
| D1Ptuple(tok, d1ps1, d1ps2) =>
  fprint!
  ( out
  , "D1Ptuple2(", tok, "; ", d1ps1, "; ", d1ps2, ")")
//
| D1Precord(tok, ld1ps) =>
  fprint!
  ( out
  , "D1Precord1(", tok, "; ", ld1ps, ")")
| D1Precord(tok, ld1ps1, ld1ps2) =>
  fprint!
  (out
  , "D1Precord2(", tok, "; ", ld1ps1, "; ", ld1ps2, ")")
//
| D1Panno(d1p, s1e) =>
  fprint!
  (out, "D1Panno(", d1p, "; ", s1e, ")")
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
| D1Eid0(tok) =>
  fprint!
  (out, "D1Eid0(", tok, ")")
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
| D1Eapp1(d1e0, d1e1) =>
  fprint!
  ( out, "D1Eapp1("
  , d1e0, "; ", d1e1, ")")
| D1Eapp2(d1e0, d1e1, d1e2) =>
  fprint!
  ( out, "D1Eapp2("
  , d1e0, "; ", d1e1, "; ", d1e2, ")")
//
| D1Esqarg(s1es) =>
  fprint!(out, "D1Esqarg(", s1es, ")")
| D1Etqarg(s1es) =>
  fprint!(out, "D1Etqarg(", s1es, ")")
//
| D1Elist( d1es ) =>
  fprint!
  (out, "D1Elist1(", d1es, ")")
| D1Elist(d1es1, d1es2) =>
  fprint!
  (out, "D1Elist2(", d1es1, "; ", d1es2, ")")
//
| D1Enone((*void*)) =>
  fprint!(out, "D1Enone(", ")")
//
| D1Eseqn(d1es1, d1es2) =>
  fprint!
  (out, "D1Eseqn(", d1es1, "; ", d1es2, ")")
//
| D1Etuple(tok, d1es) =>
  fprint!
  ( out
  , "D1Etuple1(", tok, "; ", d1es, ")")
| D1Etuple(tok, d1es1, d1es2) =>
  fprint!
  ( out
  , "D1Etuple2(", tok, "; ", d1es1, "; ", d1es2, ")")
//
| D1Erecord(tok, ld1es) =>
  fprint!
  ( out
  , "D1Erecord1(", tok, "; ", ld1es, ")")
| D1Erecord(tok, ld1es1, ld1es2) =>
  fprint!
  ( out
  , "D1Erecord2(", tok, "; ", ld1es1, "; ", ld1es2, ")")
//
| D1Ebrack(d1es) =>
  fprint!(out, "D1Ebrack(", d1es, ")")
| D1Edtsel(lab1, arg2) =>
  fprint!
  (out, "D1Edtsel(", lab1, "; ", arg2, ")")
//
| D1Elet(d1cs, d1es) =>
  fprint!(out, "D1Elet(", d1cs, "; ", d1es, ")")
//
| D1Ewhere(d1e1, d1cs) =>
  fprint!(out, "D1Ewhere(", d1e1, "; ", d1cs, ")")
//
| D1Eif0(d1e1, d1e2, opt3) =>
  fprint!
  ( out
  , "D1Eif0(", d1e1, "; ", d1e2, "; ", opt3, ")")
//
| D1Ecase(knd, d1e1, dcls) =>
  fprint!
  ( out
  , "D1Ecase(", knd, "; ", d1e1, "; ", dcls , ")")
//
| D1Elam
  (knd, farg, tres, arrw, body) =>
  fprint!
  ( out
  , "D1Elam(", knd, "; "
  , farg, "; ", tres, "; ", arrw, "; ", body, ")")
| D1Efix
  (knd, fid, farg, tres, arrw, body) =>
  fprint!
  ( out
  , "D1Efix(", knd, "; ", fid, "; "
  , farg, "; ", tres, "; ", arrw, "; ", body, ")")
//
| D1Etry0(tok, d1e1, dcls) =>
  fprint!
  ( out
  , "D1Etry0(", tok, "; ", d1e1, "; ", dcls , ")")
//
| D1Eanno(d1e1, s1e2) =>
  (
    fprint!(out, "D1Eanno(", d1e1, "; ", s1e2, ")")
  )
//
| D1Equal(tok1, d1e2) =>
  (
    fprint!(out, "D1Equal(", tok1, "; ", d1e2, ")")
  )
//
) (* fprint_d1exp *)

end // end of [local]

(* ****** ****** *)

implement
print_f1unarrow(x0) =
fprint_f1unarrow(stdout_ref, x0)
implement
prerr_f1unarrow(x0) =
fprint_f1unarrow(stderr_ref, x0)
implement
fprint_f1unarrow(out, x0) =
(
case+ x0 of
| F1UNARROWdflt() =>
  fprint!(out, "F1UNARROWdflt(", ")")
| F1UNARROWlist(s1es) =>
  fprint!(out, "F1UNARROWlist(", s1es, ")")
) (* end of [fprint_f1unarrow] *)

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
print_d1gua(x0) =
fprint_d1gua(stdout_ref, x0)
implement
prerr_d1gua(x0) =
fprint_d1gua(stderr_ref, x0)

implement
fprint_d1gua
  (out, x0) =
(
case+
x0.node() of
| D1GUAexp(d1e) =>
  fprint!
  (out, "D1GUAexp(", d1e, ")")
| D1GUAmat(d1e, d1p) =>
  fprint!
  (out, "D1GUAmat(", d1e, "; ", d1p, ")")
) (* end of [fprint_d1gua] *)

(* ****** ****** *)

implement
print_d1clau(x0) =
fprint_d1clau(stdout_ref, x0)
implement
prerr_d1clau(x0) =
fprint_d1clau(stderr_ref, x0)

implement
print_d1gpat(x0) =
fprint_d1gpat(stdout_ref, x0)
implement
prerr_d1gpat(x0) =
fprint_d1gpat(stderr_ref, x0)

implement
fprint_d1clau
  (out, x0) =
(
case+
x0.node() of
| D1CLAUgpat(d1gp) =>
  fprint!
  (out, "D1CLAUgpat(", d1gp, ")")
| D1CLAUclau(d1gp, d0e0) =>
  fprint!
  (out, "D1CLAUclau(", d1gp, "; ", d0e0, ")")
) (* end of [fprint_d1clau] *)

implement
fprint_d1gpat
  (out, x0) =
(
case+
x0.node() of
| D1GPATpat(d1p) =>
  fprint!(out, "D1GPATpat(", d1p, ")")
| D1GPATgua(d1p, d1gs) =>
  fprint!(out, "D1GPATgua(", d1p, "; ", d1gs, ")")
) (* end of [fprint_d1gpat] *)

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
implement
fprint_val<g1marg> = fprint_g1marg
implement
fprint_val<f1undecl> = fprint_f1undecl
implement
fprint_val<v1aldecl> = fprint_v1aldecl
implement
fprint_val<v1ardecl> = fprint_v1ardecl
implement
fprint_val<d1cstdecl> = fprint_d1cstdecl

in (* in-of-local *)

implement
fprint_d1ecl
  (out, x0) =
(
case+ x0.node() of
//
| D1Cnone0() =>
  fprint!(out, "D1Cnone(", ")")
| D1Cnone1(d0c) =>
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
| D1Cdefine
  (tok, sym, arg, def) =>
  fprint!
  ( out
  , "D1Cdefine("
  , tok, "; ", sym, "; ", arg, "; ", def, ")")
| D1Cmacdef
  (tok, sym, arg, def) =>
  fprint!
  ( out
  , "D1Cmacdef("
  , tok, "; ", sym, "; ", arg, "; ", def, ")")
//
| D1Clocal
  (d1cs_head, d1cs_body) =>
  fprint!
  ( out
  , "D1Clocal(", d1cs_head, "; ", d1cs_body, ")")
//
| D1Cinclude
  (tok, src, knd, opt, body) =>
  (
  fprint!
  ( out
  , "D1Cinclude("
  , tok, "; "
  , src, "; " // src: d1exp
  , knd, "; ", opt, "; ", body, ")")
  ) where
  {
    val body =
    (
    case+ body of
    | None _ => "None()"
    | Some _ => "Some(<d1cls>)"): string
  }
//
| D1Cstaload
  ( tok, src
  , knd, opt, flag, body) =>
  (
  fprint!
  ( out
  , "D1Cstaload("
  , tok, "; "
  , src, "; " // src: d1exp
  , knd, "; " // knd: stadyn
  , opt, "; ", flag, "; ", body, ")")
  ) where
  {
    val body =
    (
    case+ body of
    | None _ => "None()"
    | Some _ => "Some(<d1cs>)") : string
  }
//
| D1Cabssort(tok, tid) =>
  fprint!
  (out, "D1Cabssort(", tok, "; ", tid, ")")
//
| D1Cstacst0
  (tok, sid, tmas, s0t) =>
  fprint!
  ( out
  , "D1Cstacst0("
  , tok, "; ", sid, "; ", tmas, "; ", s0t, ")")
//
| D1Csortdef
  (knd, tok, def) =>
  fprint!
  ( out
  , "D1Csortdef(", knd, "; ", tok, "; ", def, ")")
//
| D1Csexpdef
  ( knd, sid
  , arg, res, def) =>
  fprint!
  ( out
  , "D1Csexpdef("
  , knd, "; ", sid, "; ", arg, "; ", res, "; ", def, ")")
//
| D1Cabstype
  (knd, sid, arg, res, def) =>
  fprint!
  ( out
  , "D1Cabstype("
  , knd, "; ", sid, "; ", arg, "; ", res, "; ", def, ")")
//
| D1Cabsopen(tok, sqid) =>
  fprint!
  (out, "D1Cabsopen(", tok, "; ", sqid, ")")
//
| D1Cabsimpl
  (tok, sqid, smas, res0, def1) =>
  fprint!
  ( out
  , "D1Cabsimpl("
  , tok, "; ", sqid
  , "; ", smas, "; ", res0, "; ", def1, ")")
//
| D1Cfundecl
  (tok, mopt, tqas, d1cs) =>
  fprint!
  ( out
  , "D1Cfundecl("
  , tok, "; ", mopt, "; ", tqas, "; ", d1cs, ")")
//
| D1Cvaldecl
  (tok, mopt, d1cs) =>
  fprint!
  ( out
  , "D1Cvaldecl(", tok, "; ", mopt, "; ", d1cs, ")")
| D1Cvardecl
  (tok, mopt, d1cs) =>
  fprint!
  ( out
  , "D1Cvardecl(", tok, "; ", mopt, "; ", d1cs, ")")
//
| D1Cimpdecl
  ( tok, mopt, sqas, tqas
  , dqid, tias, f1as, res0, teq1, d1e2) =>
  fprint!
  ( out
  , "D1Cimpdecl("
  , tok, "; ", mopt, "; ", sqas, "; ", tqas, "; "
  , dqid, "; ", tias, "; ", f1as, "; ", res0, "; ", teq1, "; ", d1e2, ")")
//
| D1Csymload
  (knd, sym, dqid, tint) =>
  fprint!
  ( out, "D1Csymload("
  , knd, "; ", sym, "; ", dqid, "; ", tint, ")")
//
| D1Cdatasort
  (knd, dsrts) =>
  fprint!(out, "D1Cdatasort(", knd, "; ", dsrts, ")")
//
| D1Cexcptcon
  (knd, dcons) =>
  fprint!(out, "D1Cexcptcon(", knd, "; ", dcons, ")")
//
| D1Cdatatype
  (knd, dtyps, wopt) =>
  fprint!
  ( out
  , "D1Cdatatype(", knd, "; ", dtyps, "; ", wopt, ")")
//
| D1Cdynconst
  (tok, tqas, d1cs) =>
  fprint!
  (out, "D1Cdynconst(", tok, "; ", tqas, "; ", d1cs, ")")
//
| D1Celse(tok) =>
  fprint!(out, "D1Celse(", tok, ")")
| D1Cendif(tok) =>
  fprint!(out, "D1Cendif(", tok, ")")
| D1Cifdec(tok, g1e1, topt) =>
  fprint!
  (out, "D1Cifdec(", tok, "; ", g1e1, "; ", topt, ")")
| D1Celsif(tok, g1e1, topt) =>
  fprint!
  (out, "D1Celsif(", tok, "; ", g1e1, "; ", topt, ")")
//
| D1Ctokerr(d0c0) => fprint!(out, "D1Ctokerr(", d0c0, ")")
//
(*
| _(*rest-of-d1ecl*) =>
    fprint!(out, "fprint_d1ecl: D1C...: not-yet-implemented")
*)
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
| ABSTDF1some() =>
  fprint(out, "ABSTDF1some()")
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

implement
print_v1aldecl(x0) =
fprint_v1aldecl(stdout_ref, x0)
implement
prerr_v1aldecl(x0) =
fprint_v1aldecl(stderr_ref, x0)

implement
fprint_v1aldecl
  (out, x0) = let
//
val+V1ALDECL(rcd) = x0
//
in
  fprint!
  ( out
  , "V1ALDECL@{"
  , "pat=", rcd.pat
  , ", def=", rcd.def, ", wtp=", rcd.wtp, "}")
end // end of [fprint_v1aldecl]

(* ****** ****** *)

implement
print_v1ardecl(x0) =
fprint_v1ardecl(stdout_ref, x0)
implement
prerr_v1ardecl(x0) =
fprint_v1ardecl(stderr_ref, x0)

implement
fprint_v1ardecl
  (out, x0) = let
//
val+V1ARDECL(rcd) = x0
//
in
  fprint!
  ( out
  , "V1ARDECL@{"
  , "nam=", rcd.nam
  , ", wth=", rcd.wth
  , ", res=", rcd.res, ", ini=", rcd.ini, "}")
end // end of [fprint_v1ardecl]

(* ****** ****** *)

implement
print_f1undecl(x0) =
fprint_f1undecl(stdout_ref, x0)
implement
prerr_f1undecl(x0) =
fprint_f1undecl(stderr_ref, x0)

implement
fprint_f1undecl
  (out, x0) = let
//
val+F1UNDECL(rcd) = x0
//
in
  fprint!
  ( out
  , "F1UNDECL@{"
  , "nam=", rcd.nam
  , ", arg=", rcd.arg
  , ", res=", rcd.res
  , ", def=", rcd.def, ", wtp=", rcd.wtp, "}")
end // end of [fprint_f1undecl]

(* ****** ****** *)

implement
print_d1cstdecl(x0) =
fprint_d1cstdecl(stdout_ref, x0)
implement
prerr_d1cstdecl(x0) =
fprint_d1cstdecl(stderr_ref, x0)

implement
fprint_d1cstdecl
  (out, x0) = let
//
val+D1CSTDECL(rcd) = x0
//
in
  fprint!
  ( out
  , "D1CSTDEC@{"
  , "nam=", rcd.nam, ", arg=", rcd.arg
  , ", res=", rcd.res, ", def=", rcd.def, "}")
end // end of [fprint_d1cstdecl]

(* ****** ****** *)

(* end of [xats_dynexp1_print.dats] *)

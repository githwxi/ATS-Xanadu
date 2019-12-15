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
LOC = "./../SATS/locinfo.sats"
#staload
FP0 = "./../SATS/filpath.sats"
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
#staload "./../SATS/statyp2.sats"
#staload "./../SATS/dynexp2.sats"
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

implement
fprint_val<d2itm> = fprint_d2itm
implement
fprint_val<d2pitm> = fprint_d2pitm

(* ****** ****** *)
//
implement
fprint_val<d2pat> = fprint_d2pat
//
(* ****** ****** *)
//
implement
fprint_val<f2arg> = fprint_f2arg
//
(* ****** ****** *)
//
implement
fprint_val<d2exp> = fprint_d2exp
//
(* ****** ****** *)
//
implement
fprint_val<d2gua> = fprint_d2gua
implement
fprint_val<d2clau> = fprint_d2clau
implement
fprint_val<d2gpat> = fprint_d2gpat
//
(* ****** ****** *)
//
implement
fprint_val<d2ecl> = fprint_d2ecl
//
(* ****** ****** *)
//
implement
fprint_val<sq2arg> = fprint_sq2arg
implement
fprint_val<tq2arg> = fprint_tq2arg
implement
fprint_val<ti2arg> = fprint_ti2arg
//
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
(*
fprint!(out, ": ", x0.sexp());
fprint!(out, ": ", x0.type());
*)
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
(*
fprint!(out, "; tqas= ", x0.tqas());
fprint!(out, "; sexp= ", x0.sexp());
fprint!(out, "; type= ", x0.type());
*)
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
(out, sym, "(", stamp, ")");
(*
fprint!(out, "; tqas= ", x0.tqas());
fprint!(out, "; sexp= ", x0.sexp())
fprint!(out, "; type= ", x0.type())
*)
) where
{
  val sym = x0.sym() and stamp = x0.stamp()
} (* end of [fprint_d2var] *)
//
(* ****** ****** *)
//
implement
print_f2arg(x0) =
fprint_f2arg(stdout_ref, x0)
implement
prerr_f2arg(x0) =
fprint_f2arg(stderr_ref, x0)
//
implement
fprint_f2arg
  (out, x0) =
(
//
case+
x0.node() of
(*
| F2ARGnone(tok) =>
  fprint!(out, "F2ARGnone(", tok, ")")
*)
| F2ARGsome_met(s2es) =>
  fprint!(out, "F2ARGsome_met(", s2es, ")")
| F2ARGsome_dyn(npf, d2ps) =>
  fprint!(out, "F2ARGsome_dyn(", npf, "; ", d2ps, ")")
| F2ARGsome_sta(s2vs, s2ps) =>
  fprint!(out, "F2ARGsome_sta(", s2vs, "; ", s2ps, ")")
//
) (* end of [fprint_f2arg] *)
//
(* ****** ****** *)

implement
print_d2pat(x0) =
fprint_d2pat(stdout_ref, x0)
implement
prerr_d2pat(x0) =
fprint_d2pat(stderr_ref, x0)

local

in (* in-of-local *)

implement
fprint_d2pat
  (out, x0) =
(
case- x0.node() of
//
| D2Pnil() =>
  fprint!(out, "D2Pnil(", ")")
| D2Pany() =>
  fprint!(out, "D2Pany(", ")")
//
| D2Pint(tok) =>
  fprint!(out, "D2Pint(", tok, ")")
| D2Pbtf(tok) =>
  fprint!(out, "D2Pbtf(", tok, ")")
| D2Pchr(tok) =>
  fprint!(out, "D2Pchr(", tok, ")")
| D2Pflt(tok) =>
  fprint!(out, "D2Pflt(", tok, ")")
| D2Pstr(tok) =>
  fprint!(out, "D2Pstr(", tok, ")")
//
| D2Pvar(d2v) =>
  fprint!(out, "D2Pvar(", d2v, ")")
//
| D2Pcon1(d2c0) =>
  fprint!(out, "D2Pcon1(", d2c0, ")")
| D2Pcon2(d2cs) =>
  fprint!(out, "D2Pcon2(", d2cs, ")")
//
| D2Psym0(sym, d2pis) =>
  (
  fprint!(out, "D2Psym0(", sym, ")");
(*
  fprint!(out, "D2Psym0(", sym, "; ", d2pis, ")");
*)
  )
//
| D2Psapp(d2f0, s2vs) =>
  fprint!
  ( out, "D2Psapp("
  , d2f0, "; ", s2vs, ")")
| D2Pdapp(d2f0, npf0, d2ps) =>
  fprint!
  ( out, "D2Pdapp("
  , d2f0, "; ", npf0, "; ", d2ps, ")")
//
| D2Ptuple(knd, npf, d2ps) =>
  fprint!
  ( out, "D2Ptuple("
  , knd, "; ", npf, "; ", d2ps, ")")
//
| D2Panno(d2p1, s2e2) =>
  fprint!
  ( out
  , "D2Panno(", d2p1, "; ", s2e2, ")")
//
| D2Pnone0() => fprint!(out, "D2Pnone0(", ")")
| D2Pnone1(d1psrc) => fprint!(out, "D2Pnone1(", d1psrc, ")")
//
) (* end of [fprint_d2pat] *)

end // end of [local]

(* ****** ****** *)

implement
print_d2exp(x0) =
fprint_d2exp(stdout_ref, x0)
implement
prerr_d2exp(x0) =
fprint_d2exp(stderr_ref, x0)

local

in (* in-of-local *)

implement
fprint_d2exp
  (out, x0) =
(
case- x0.node() of
//
| D2Eint(tok) =>
  fprint!(out, "D2Eint(", tok, ")")
| D2Ebtf(tok) =>
  fprint!(out, "D2Ebtf(", tok, ")")
| D2Echr(tok) =>
  fprint!(out, "D2Echr(", tok, ")")
| D2Eflt(tok) =>
  fprint!(out, "D2Eflt(", tok, ")")
| D2Estr(tok) =>
  fprint!(out, "D2Estr(", tok, ")")
//
| D2Etop(tok) =>
  fprint!(out, "D2Etop(", tok, ")")
//
| D2Evar(d2v) =>
  fprint!(out, "D2Evar(", d2v, ")")
//
| D2Ecst1(d2c) =>
  fprint!(out, "D2Ecst1(", d2c, ")")
| D2Econ1(d2c) =>
  fprint!(out, "D2Econ1(", d2c, ")")
| D2Ecst2(d2cs) =>
  fprint!(out, "D2Ecst2(", d2cs, ")")
| D2Econ2(d2cs) =>
  fprint!(out, "D2Econ2(", d2cs, ")")
//
| D2Esym0
  (d1e1, dpis) =>
  fprint!(out, "D2Esym0(", d1e1, ")")
(*
  fprint!
  (out, "D2Esym0(", d1e1, "; ", dpis, ")")
*)
//
| D2Esapp
  (d2f0, s2as) =>
  fprint!
  ( out
  , "D2Esapp(", d2f0, "; ", s2as, ")")
| D2Etapp
  (d2f0, s2as) =>
  fprint!
  ( out
  , "D2Etapp(", d2f0, "; ", s2as, ")")
| D2Edapp
  (d2f0, npf0, d2as) =>
  fprint!
  ( out, "D2Edapp("
  , d2f0, "; ", npf0, "; ", d2as, ")")
//
| D2Elet
  (d2cs, d2e2) =>
  fprint!
  ( out
  , "D2Elet(", d2cs, "; ", d2e2, ")")
| D2Ewhere
  (d2e1, d2cs) =>
  fprint!
  ( out
  , "D2Ewhere(", d2e1, "; ", d2cs, ")")
//
| D2Eseqn
  (d2es, d1e1) =>
  fprint!
  ( out, "D2Eseqn("
  , d2es, "; ", d1e1(*last*), ")")
//
| D2Etuple
  (knd, npf, d2es) =>
  fprint!
  ( out, "D2Etuple("
  , knd, "; ", npf, "; ", d2es, ")")
//
| D2Eassgn
  (d2e1, d2e2) =>
  fprint!
  ( out
  , "D2Eassgn(", d2e1, "; ", d2e2, ")")
//
| D2Edtsel
  ( lab0
  , dpis, npf2, arg3) =>
  (
  case+
  arg3 of
  |
  None() =>
  fprint!
  ( out
  , "D2Edtsel("
  , lab0, "(", dpis, ")", ")")
  |
  Some(d2es) =>
  fprint!
  ( out
  , "D2Edtsel("
  , lab0, "(", dpis, ")", "(", npf2, "; ", d2es, ")", ")")
  )
//
| D2Eif0
  (d2e1, d2e2, opt3) =>
  fprint!
  ( out, "D2Eif0("
  , d2e1, "; ", d2e2, "; ", opt3, ")")
//
| D2Ecase
  (knd, d2e1, d2cls) =>
  fprint!
  ( out, "D2Ecase("
  , knd, "; ", d2e1, "; ", d2cls, ")")
//
| D2Elam
  (knd, f2as, tres, arrw, body) =>
  fprint!
  ( out
  , "D2Elam(", knd, "; "
  , f2as, "; "
  , tres, "; ", arrw, "; ", body, ")")
| D2Efix
  (knd, fid, f2as, tres, arrw, body) =>
  fprint!
  ( out
  , "D2Efix(", knd, "; "
  , fid, "; ", f2as, "; "
  , tres, "; ", arrw, "; ", body, ")")
//
(*
| D2Eflat(d2e1) =>
  fprint!(out, "D2Eflat(", d2e1, ")")
*)
//
| D2Eaddr(d2e1) =>
  fprint!(out, "D2Eaddr(", d2e1, ")")
| D2Eeval(d2e1) =>
  fprint!(out, "D2Eeval(", d2e1, ")")
| D2Efold(d2e1) =>
  fprint!(out, "D2Efold(", d2e1, ")")
//
| D2Elazy(d2e1) =>
  fprint!
  (out, "D2Elazy(", d2e1, ")")
| D2Ellazy(d2e1, opt2) =>
  fprint!
  (out, "D2Ellazy(", d2e1, "; ", opt2, ")")
//
| D2Eanno(d2e1, s2e2) =>
  fprint!
  (out, "D2Eanno(", d2e1, "; ", s2e2, ")")
//
| D2Enone0() => fprint!(out, "D2Enone0(", ")")
| D2Enone1(d1esrc) => fprint!(out, "D2Enone1(", d1esrc, ")")
//
) (* end of [fprint_d2exp] *)

end // end of [local]

(* ****** ****** *)

implement
print_d2gua(x0) =
fprint_d2gua(stdout_ref, x0)
implement
prerr_d2gua(x0) =
fprint_d2gua(stderr_ref, x0)

implement
fprint_d2gua
  (out, x0) =
(
case+
x0.node() of
| D2GUAexp(d2e) =>
  fprint!
  (out, "D2GUAexp(", d2e, ")")
| D2GUAmat(d2e, d2p) =>
  fprint!
  (out, "D2GUAmat(", d2e, "; ", d2p, ")")
) (* end of [fprint_d2gua] *)

(* ****** ****** *)

implement
print_d2clau(x0) =
fprint_d2clau(stdout_ref, x0)
implement
prerr_d2clau(x0) =
fprint_d2clau(stderr_ref, x0)

implement
print_d2gpat(x0) =
fprint_d2gpat(stdout_ref, x0)
implement
prerr_d2gpat(x0) =
fprint_d2gpat(stderr_ref, x0)

implement
fprint_d2clau
  (out, x0) =
(
case+
x0.node() of
| D2CLAUpat(d2gp) =>
  fprint!
  (out, "D2CLAUpat(", d2gp, ")")
| D2CLAUexp(d2gp, d0e0) =>
  fprint!
  (out, "D2CLAUexp(", d2gp, "; ", d0e0, ")")
) (* end of [fprint_d2clau] *)

implement
fprint_d2gpat
  (out, x0) =
(
case+
x0.node() of
| D2GPATpat(d2p) =>
  fprint!(out, "D2GPATpat(", d2p, ")")
| D2GPATgua(d2p, d2gs) =>
  fprint!(out, "D2GPATgua(", d2p, "; ", d2gs, ")")
) (* end of [fprint_d2gpat] *)

(* ****** ****** *)

implement
print_d2ecl(x0) =
fprint_d2ecl(stdout_ref, x0)
implement
prerr_d2ecl(x0) =
fprint_d2ecl(stderr_ref, x0)

local

implement
fprint_val<d2ecl> = fprint_d2ecl
implement
fprint_val<v2aldecl> = fprint_v2aldecl
implement
fprint_val<v2ardecl> = fprint_v2ardecl
implement
fprint_val<f2undecl> = fprint_f2undecl

in (* in-of-local *)

implement
fprint_d2ecl
  (out, x0) =
(
case- x0.node() of
//
| D2Cstatic
  (tok, d2c) =>
  fprint!(out, "D2Cstatic(", d2c, ")")
| D2Cextern
  (tok, d2c) =>
  fprint!(out, "D2Cextern(", d2c, ")")
//
| D2Cinclude
  ( tok
  , src, knd
  , fopt, body) =>
  (
  fprint!
  ( out
  , "D2Cinclude("
  , "src= ", src, "; "
  , "knd= ", knd, "; "
  , fopt, "; ", body, ")")
  ) where
  {
    val body =
    (
    case+ body of
    | None _ => "None()"
    | Some _ => "Some(<d2cls>)"): string
  }
//
| D2Cstaload
  ( tok
  , src, knd
  , fopt, flag, body) =>
  (
  fprint!
  ( out
  , "D2Cstaload("
  , "src= ", src, "; "
  , "knd= ", knd, "; "
  , fopt, "; ", flag, "; ", body, ")")
  ) where
  {
    val body =
    (
    case+ body of
    | None _ => "None()"
    | Some _ => "Some(<fmodenv>)"): string
  }
//
| D2Clocal(head, body) =>
  fprint!
  ( out
  , "D2Clocal(", head, "; ", body, ")")
//
| D2Cabssort(d1c) =>
  fprint!(out, "D2Cabssort(", d1c, ")")
//
| D2Cstacst0(s2c, s2t) =>
  fprint!
  ( out
  , "D2Cstacst0(", s2c, "; ", s2t, ")")
//
| D2Csortdef(sym, s2tx) =>
  fprint!
  ( out
  , "D2Csortdef(", sym, "; ", s2tx, ")")
//
| D2Csexpdef(s2c, s2e) =>
  fprint!
  ( out
  , "D2Csexpdef(", s2c, "; ", s2e, ")")
//
| D2Cabstype(s2c, df2) =>
  fprint!
  ( out
  , "D2Cabstype(", s2c, "; ", df2, ")")
//
| D2Cabsimpl
  (knd, sqid, def0) =>
  fprint!
  ( out
  , "D2Cabsimpl("
  , knd, "; ", sqid, "; ", def0, ")")
//
| D2Csymload
  (tok, sym0, dpi1) =>
  fprint!
  ( out
  , "D2Csymload("
  , tok, "; ", sym0, "; ", dpi1, ")")
//
| D2Cvaldecl
  (knd, mopt, v2ds) =>
  fprint!
  ( out
  , "D2Cvaldecl("
  , knd, "; ", mopt, "; ", v2ds, ")")
| D2Cvardecl
  (knd, mopt, v2ds) =>
  fprint!
  ( out
  , "D2Cvardecl("
  , knd, "; ", mopt, "; ", v2ds, ")")
//
| D2Cfundecl
  (knd, mopt, tqas, f2ds) =>
  fprint!
  ( out
  , "D2Cfundecl("
  , knd, "; ", mopt, "; ", tqas, "; ", f2ds, ")")
//
| D2Cimpdecl1
  ( knd, mopt, sqas, tqas
  , dqid, tias, f2as, res0, d2e1) =>
  fprint!
  ( out
  , "D2Cimpdecl1("
  , knd, "; ", mopt, "; "
  , sqas, "; ", tqas, "; "
  , dqid, "; ", tias, "; ", f2as, "; ", d2e1, ")")
| D2Cimpdecl2
  ( knd, mopt, sqas, tqas
  , dqid, tias, f2as, res0, d2e1) =>
  fprint!
  ( out
  , "D2Cimpdecl2("
  , knd, "; ", mopt, "; "
  , sqas, "; ", tqas, "; "
  , dqid, "; ", tias, "; ", f2as, "; ", d2e1, ")")
//
| D2Cdatasort(d1c) =>
  fprint!(out, "D2Cdatasort(", d1c, ")")
| D2Cdatatype(d1c) =>
  fprint!(out, "D2Cdatatype(", d1c, ")")
//
| D2Cdynconst
  (knd, tqas, d2cs) =>
  fprint!
  ( out
  , "D2Cynconst("
  , knd, "; ", tqas, "; ", d2cs, ")")
//
| D2Cnone0() =>
  fprint!(out, "D2Cnone0(", ")")
| D2Cnone1(d1csrc) =>
  fprint!(out, "D2Cnone1(", d1csrc, ")")
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
| D2ITMvar(d2v0) =>
  fprint!(out, "D2ITMvar(", d2v0, ")")
//
| D2ITMcon(d2cs) =>
  fprint!(out, "D2ITMcon(", d2cs, ")")
//
| D2ITMcst(d2cs) =>
  fprint!(out, "D2ITMcst(", d2cs, ")")
//
| D2ITMsym(sym, dpis) =>
  fprint!
  (out, "D2ITMsym(", sym, "; ", dpis, ")")
//
) (* end of [fprint_d2itm] *)
//
implement
fprint_d2pitm
  (out, x0) =
(
case+ x0 of
| D2PITMnone(dqid) =>
  fprint!(out, "D2PITMnone(", dqid, ")")
| D2PITMsome(pval, d2i0) =>
  fprint!
  (out, "D2PITMsome(", pval, "; ", d2i0, ")")
)
//
(* ****** ****** *)
//
implement
print_sq2arg(x0) =
fprint_sq2arg(stdout_ref, x0)
implement
prerr_sq2arg(x0) =
fprint_sq2arg(stdout_ref, x0)
//
implement
fprint_sq2arg
  (out, x0) =
(
  fprint!(out, "{", x0.s2vs(), "}")
) (* end of [fprint_sq2arg] *)
//
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
  fprint!(out, "<", x0.s2vs(), ">")
) (* end of [fprint_tq2arg] *)
//
(* ****** ****** *)
//
implement
print_ti2arg(x0) =
fprint_ti2arg(stdout_ref, x0)
implement
prerr_ti2arg(x0) =
fprint_ti2arg(stdout_ref, x0)
//
implement
fprint_ti2arg
  (out, x0) =
(
  fprint!(out, "<", x0.s2es(), ">")
) (* end of [fprint_ti2arg] *)
//
(* ****** ****** *)

implement
print_v2aldecl(x0) =
fprint_v2aldecl(stdout_ref, x0)
implement
prerr_v2aldecl(x0) =
fprint_v2aldecl(stderr_ref, x0)

implement
fprint_v2aldecl
  (out, x0) = let
//
val+V2ALDECL(rcd) = x0
//
in
  fprint!
  ( out
  , "V2ALDECL@{"
  , "pat=", rcd.pat, ", "
  , "def=", rcd.def, ", ", "wtp=", rcd.wtp, "}")
end // end of [fprint_v2aldecl]

(* ****** ****** *)

implement
print_v2ardecl(x0) =
fprint_v2ardecl(stdout_ref, x0)
implement
prerr_v2ardecl(x0) =
fprint_v2ardecl(stderr_ref, x0)

implement
fprint_v2ardecl
  (out, x0) = let
//
val+V2ARDECL(rcd) = x0
//
in
  fprint!
  ( out
  , "V2ARDECL@{"
  , "d2v=", rcd.d2v, ", "
  , "wth=", rcd.wth, ", "
  , "res=", rcd.res, ", ", "ini=", rcd.ini, "}")
end // end of [fprint_v2ardecl]

(* ****** ****** *)

implement
print_f2undecl(x0) =
fprint_f2undecl(stdout_ref, x0)
implement
prerr_f2undecl(x0) =
fprint_f2undecl(stderr_ref, x0)

implement
fprint_f2undecl
  (out, x0) = let
//
val+F2UNDECL(rcd) = x0
//
in
  fprint!
  ( out
  , "F2UNDECL@{"
  , "nam=", rcd.nam, ", "
  , "d2c=", rcd.d2c, ", "
  , "arg=", rcd.arg, ", "
  , "res=", rcd.res, ", "
  , "def=", rcd.def, ", ", "wtp=", rcd.wtp, "}")
end // end of [fprint_f2undecl]

(* ****** ****** *)
//
implement
print_impls2cst(x0) =
fprint_impls2cst(stdout_ref, x0)
implement
prerr_impls2cst(x0) =
fprint_impls2cst(stderr_ref, x0)
//
implement
fprint_impls2cst
  (out, x0) =
(
case+ x0 of
|
IMPLS2CST1(sqid, s2cs) =>
fprint!
( out
, "IMPLS2CST1(", sqid, "; ", s2cs, ")")
|
IMPLS2CST2(sqid, s2cs, opt2) =>
fprint!
( out
, "IMPLS2CST2(", sqid, "; ", s2cs, "; ", opt2, ")")
) // end of [fprint_impls2cst]
//
(* ****** ****** *)
//
implement
print_impld2cst(x0) =
fprint_impld2cst(stdout_ref, x0)
implement
prerr_impld2cst(x0) =
fprint_impld2cst(stderr_ref, x0)
//
implement
fprint_impld2cst
  (out, x0) =
(
case+ x0 of
|
IMPLD2CST1(dqid, d2cs) =>
fprint!
( out
, "IMPLD2CST1(", dqid, "; ", d2cs, ")")
|
IMPLD2CST2(dqid, d2cs, opt2) =>
fprint!
( out
, "IMPLD2CST2(", dqid, "; ", d2cs, "; ", opt2, ")")
) // end of [fprint_impld2cst]
//
(* ****** ****** *)

(* end of [xats_dynexp2_print.dats] *)

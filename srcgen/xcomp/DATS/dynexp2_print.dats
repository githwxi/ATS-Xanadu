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
STM = "./../SATS/xstamp0.sats"
#staload
SYM = "./../SATS/xsymbol.sats"
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
LAB = "./../SATS/xlabel0.sats"
overload
fprint with $LAB.fprint_label
//
(* ****** ****** *)
//
#staload "./../SATS/xbasics.sats"
//
#staload "./../SATS/lexing0.sats"
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
fprint_val<g1nam> = fprint_g1nam
implement
fprint_val<g1exp> = fprint_g1exp
//
(* ****** ****** *)
//
implement
fprint_val<sort2> = fprint_sort2
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
fprint_val<d2typ> = fprint_d2typ
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
fprint_d2con(stderr_ref, x0)
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
fprint_d2cst(stderr_ref, x0)
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
fprint_d2var(stderr_ref, x0)
//
implement
fprint_d2var
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
val
sym = x0.sym() and stamp = x0.stamp()
} (*where*) // end of [fprint_d2var]
//
(* ****** ****** *)
//
implement
print_d2typ(x0) =
fprint_d2typ(stdout_ref, x0)
implement
prerr_d2typ(x0) =
fprint_d2typ(stderr_ref, x0)
//
implement
fprint_d2typ
  (out, x0) =
(
case+ x0.node() of
(*
|
D2TYPnone
( tok ) =>
fprint!
( out
, "D2TYPnone(", tok, ")")
*)
//
|
D2TYPsome_tok
( tok1, opt2 ) =>
(
case+ opt2 of
|
None() =>
fprint!
( out
, "D2TYPsome_tok(", tok1, ")")
|
Some(s2e2) =>
fprint!
( out
, "D2TYPsome_tok(", tok1, ":", s2e2, ")")
) (* D2TYPsome_tok *)
//
|
D2TYPsome_var
( d2v1, opt2 ) =>
(
case+ opt2 of
|
None() =>
fprint!
( out
, "D2TYPsome_var(", d2v1, ")")
|
Some(s2e2) =>
fprint!
( out
, "D2TYPsome_var(", d2v1, ":", s2e2, ")")
//
) (* D2TYPsome_var *)
) (* end of [fprint_d2typ] *)

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
|
F2ARGnone(tok) =>
fprint!(out, "F2ARGnone(", tok, ")")
*)
|
F2ARGsome_met(s2es) =>
fprint!(out, "F2ARGsome_met(", s2es, ")")
|
F2ARGsome_dyn(npf, d2ps) =>
fprint!(out, "F2ARGsome_dyn(", npf, "; ", d2ps, ")")
|
F2ARGsome_sta(s2vs, s2ps) =>
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

(* ****** ****** *)

local

(*
implement
fprint_val<d2pat) = fprint_d2pat
*)

in(*in-of-local*)

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
| D2Parg() =>
  fprint!(out, "D2Parg(", ")")
//
| D2Pvar(d2v) =>
  fprint!(out, "D2Pvar(", d2v, ")")
//
| D2Pi00(int) =>
  fprint!(out, "D2Pi00(", int, ")")
| D2Pb00(btf) =>
  fprint!(out, "D2Pb00(", btf, ")")
| D2Ps00(str) =>
  fprint!(out, "D2Ps00(", str, ")")
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
| D2Pcon1(d2c0) =>
  fprint!(out, "D2Pcon1(", d2c0, ")")
| D2Pcon2(d2cs) =>
  fprint!(out, "D2Pcon2(", d2cs, ")")
//
| D2Pbang(d2p1) =>
  fprint!(out, "D2Pbang(", d2p1, ")")
| D2Pflat(d2p1) =>
  fprint!(out, "D2Pflat(", d2p1, ")")
| D2Pfree(d2p1) =>
  fprint!(out, "D2Pfree(", d2p1, ")")
//
| D2Psym0(sym, d2pis) =>
  (
  fprint!(out, "D2Psym0(", sym, ")");
(*
  fprint!(out, "D2Psym0(", sym, "; ", d2pis, ")");
*)
  )
//
| D2Psapp
  (d2f0, s2vs) =>
  fprint!
  ( out
  , "D2Psapp("
  , d2f0, "; ", s2vs(*sarg*), ")")
//
| D2Pdap0(d2f0) =>
  fprint!(out, "D2Pdap0(", d2f0, ")")
| D2Pdap1(d2f0) =>
  fprint!(out, "D2Pdap1(", d2f0, ")")
//
| D2Pdapp(d2f0, npf0, d2ps) =>
  fprint!
  ( out, "D2Pdapp("
  , d2f0, "; ", npf0, "; ", d2ps, ")")
//
| D2Ptrcd1
  (knd0, npf1, d2ps) =>
  fprint!
  ( out, "D2Ptrcd1("
  , knd0, "; ", npf1, "; ", d2ps, ")")
//
| D2Panno
  (d2p1, s1e1, s2e2) =>
  fprint!
  ( out
  , "D2Panno(", d2p1, "; ", s2e2, ")")
//
| D2Pg1mac(g1m0) =>
  fprint!(out, "D2Pg1mac(", g1m0, ")")
//
| D2Pnone0() => fprint!(out, "D2Pnone0(", ")")
| D2Pnone1(d1psrc) => fprint!(out, "D2Pnone1(", d1psrc, ")")
//
) (* end of [fprint_d2pat] *)

end // end of [local]

(* ****** ****** *)
//
implement
print_st2inv(x0) =
fprint_st2inv(stdout_ref, x0)
implement
prerr_st2inv(x0) =
fprint_st2inv(stderr_ref, x0)
//
(* ****** ****** *)
//
implement
fprint_st2qua
  (out, stq) =
(
case+ stq of
|
ST2QUAsome
(loc0, s2vs, s2ps) =>
fprint!
( out
, "ST2QUAsome(", s2vs, "; ", s2ps, ")")
) (* end of [fprint_st2qua] *)
//
(* ****** ****** *)

local
//
implement
fprint_val<d2typ> = fprint_d2typ
implement
fprint_val<st2qua> = fprint_st2qua
//
in(*in-of-local*)
//
implement
fprint_st2inv
  (out, x0) =
(
case+ x0 of
(*
|
ST2INVnone
(stqs, terr) =>
fprint!
( out
, "ST2INVnone("
, stqs, "; ", terr, ")")
*)
|
ST2INVsome
(loc1, stqs, d2ts) =>
fprint!
( out
, "ST2INVsome(", stqs, "; ", d2ts, ")")
) (* end of [fprint_st2inv] *)
//
end // end of [local]

(* ****** ****** *)

implement
print_d2exp(x0) =
fprint_d2exp(stdout_ref, x0)
implement
prerr_d2exp(x0) =
fprint_d2exp(stderr_ref, x0)

(* ****** ****** *)

local

(*
implement
fprint_val<d2exp) = fprint_d2exp
*)

in (*in-of-local*)

implement
fprint_d2exp
  (out, x0) =
(
case- x0.node() of
//
| D2Ei00(int) =>
  fprint!(out, "D2Ei00(", int, ")")
| D2Eb00(btf) =>
  fprint!(out, "D2Eb00(", btf, ")")
| D2Ec00(chr) =>
  fprint!(out, "D2Ec00(", chr, ")")
| D2Es00(str) =>
  fprint!(out, "D2Es00(", str, ")")
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
//
| D2Edap0(d2f0) =>
  fprint!(out, "D2Edap0(", d2f0, ")")
| D2Edapp
  (d2f0, npf1, d2as) =>
  fprint!
  ( out, "D2Edapp("
  , d2f0, "; ", npf1, "; ", d2as, ")")
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
| D2Etrcd1
  (knd0, npf1, d2es) =>
  fprint!
  ( out, "D2Etrcd1("
  , knd0, "; ", npf1, "; ", d2es, ")")
//
| D2Eassgn
  (d2e1, d2e2) =>
  fprint!
  ( out
  , "D2Eassgn(", d2e1, "; ", d2e2, ")")
//
| D2Ebrack
  (dpis, d2es) =>
  fprint!
  ( out
  , "D2Ebrack(", dpis, "; ", d2es, ")")  
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
  , lab0, "(", dpis, ")", ")" )
  |
  Some(d2es) =>
  fprint!
  ( out
  , "D2Edtsel("
  , lab0, "(", dpis, ")"
  , "(", npf2, "; ", d2es, ")", ")" )
  )
//
| D2Eif0
  (d2e1, d2e2, opt3) =>
  fprint!
  ( out, "D2Eif0("
  , d2e1, "; ", d2e2, "; ", opt3, ")")
| D2Eif1
  (d2e1, d2e2, opt3, tinv) =>
  fprint!
  ( out, "D2Eif1("
  , d2e1, "; ", d2e2, "; ", opt3, "; ", tinv, ")")
//
| D2Ecas0
  (knd0, d2e1, d2cls) =>
  fprint!
  ( out, "D2Ecas0("
  , knd0, "; ", d2e1, "; ", d2cls, ")")
| D2Ecas1
  (knd0, d2e1, d2cls, tinv) =>
  fprint!
  ( out, "D2Ecas1("
  , knd0, "; ", d2e1, "; ", d2cls, "; ", tinv, ")")
//
| D2Elam
  (knd0, f2as, tres, arrw, body) =>
  fprint!
  ( out
  , "D2Elam(", knd0, "; "
  , f2as, "; "
  , tres, "; ", arrw, "; ", body, ")")
| D2Efix
  (knd0, fid1, f2as, tres, arrw, body) =>
  fprint!
  ( out
  , "D2Efix(", knd0, "; "
  , fid1, "; ", f2as, "; "
  , tres, "; ", arrw, "; ", body, ")")
//
| D2Etry0
  (tok0, d2e1, d2cls) =>
  fprint!
  ( out, "D2Etry0("
  , tok0, "; ", d2e1, "; ", d2cls, ")")
//
(*
| D2Eflat(d2e1) =>
  fprint!(out, "D2Eflat(", d2e1, ")")
*)
//
| D2Eaddr(d2e1) =>
  fprint!(out, "D2Eaddr(", d2e1, ")")
//
| D2Efold(d2e1) =>
  fprint!(out, "D2Efold(", d2e1, ")")
//
| D2Eeval(d2e1) =>
  fprint!(out, "D2Eeval(", d2e1, ")")
| D2Efree(d2e1) =>
  fprint!(out, "D2Efree(", d2e1, ")")
//
| D2Eraise(d2e1) =>
  fprint!(out, "D2Eraise(", d2e1, ")")
//
| D2Elazy(d2e1) =>
  fprint!(out, "D2Elazy(", d2e1, ")")
| D2Ellazy
  ( d2e1
  , d2es(*frees*)) =>
  fprint!
  (out, "D2Ellazy(", d2e1, "; ", d2es, ")")
//
| D2Eanno
  (d2e1, s1e2, s2e2) =>
  fprint!
  (out, "D2Eanno(", d2e1, "; ", s2e2, ")")
//
| D2Eexist1
  ( s2es(*wits*)
  , d2e1(*packed*)) =>
  fprint!
  (out, "D2Eexist1(", s2es, "; ", d2e1, ")")
//
| D2Eg1mac(g1m0) =>
  fprint!(out, "D2Eg1mac(", g1m0, ")")
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

(* ****** ****** *)

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

(* ****** ****** *)

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

(* ****** ****** *)

local
//
implement
fprint_val<d2ecl> = fprint_d2ecl
//
implement
fprint_val<d2valdecl> = fprint_d2valdecl
implement
fprint_val<d2vardecl> = fprint_d2vardecl
//
implement
fprint_val<d2fundecl> = fprint_d2fundecl
//
in (* in-of-local *)

implement
fprint_d2ecl
  (out, x0) =
(
case- x0.node() of
//
| D2Cnone0
  ((*void*)) =>
  fprint!
  (out, "D2Cnone0(", ")")
| D2Cnone1
  (  d1cl  ) =>
  fprint!
  (out, "D2Cnone1(", d1cl, ")")
//
| D2Cd1ecl
  (  d1cl  ) =>
  fprint!
  (out, "D2Cd1ecl(", d1cl, ")")
//
| D2Cstatic
  (tok, d2cl) =>
  fprint!
  (out, "D2Cstatic(", d2cl, ")")
| D2Cextern
  (tok, d2cl) =>
  fprint!
  (out, "D2Cextern(", d2cl, ")")
//
| D2Clocal
  (head, body) =>
  fprint!
  ( out
  , "D2Clocal(", head, "; ", body, ")")
//
| D2Cinclude
  ( tok0
  , src1, knd2
  , fopt, body) =>
  (
  fprint!
  ( out
  , "D2Cinclude("
  , "src= ", src1, "; "
  , "knd= ", knd2, "; "
  ,  fopt, "; ", body, ")")
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
  ( tok0
  , src1, knd2
  , fopt, flag, body) =>
  (
  fprint!
  ( out
  , "D2Cstaload("
  , "src= ", src1, "; "
  , "knd= ", knd2, "; "
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
| D2Cabssort(d1c) =>
  fprint!(out, "D2Cabssort(", d1c, ")")
//
| D2Cstacst0(s2c, s2t0) =>
  fprint!
  ( out
  , "D2Cstacst0(", s2c, "; ", s2t0, ")")
//
| D2Csortdef(sym, s2tx) =>
  fprint!
  ( out
  , "D2Csortdef(", sym, "; ", s2tx, ")")
//
| D2Csexpdef(s2c, def0) =>
  fprint!
  ( out
  , "D2Csexpdef(", s2c, "; ", def0, ")")
//
| D2Cabstype(s2c, def0) =>
  fprint!
  ( out
  , "D2Cabstype(", s2c, "; ", def0, ")")
//
| D2Cabsopen
  (tok0, sqid) =>
  fprint!
  ( out
  , "D2Cabsopen("
  , tok0(*absopen*), "; ", sqid, ")")
| D2Cabsimpl
  (knd0, sqid, def0) =>
  fprint!
  ( out
  , "D2Cabsimpl("
  , knd0(*abskind*), "; ", sqid, "; ", def0, ")")
//
| D2Csymload
  (tok0, sym0, dpi1) =>
  fprint!
  ( out
  , "D2Csymload("
  , tok0, "; ", sym0, "; ", dpi1, ")")
//
| D2Cdatasort(d1cl, s2ts) =>
  fprint!
  ( out
  , "D2Cdatasort(", d1cl, "; ", s2ts, ")")
//
| D2Cexcptcon(d1cl, d2cs) =>
  fprint!
  ( out
  , "D2Cexcptcon(", d1cl, "; ", d2cs, ")")
| D2Cdatatype(d1cl, s2cs) =>
  fprint!
  ( out
  , "D2Cdatatype(", d1cl, "; ", s2cs, ")")
//
| D2Cdynconst
  (knd0, tqas, d2cs) =>
  fprint!
  ( out
  , "D2Cynconst("
  , knd0, "; ", tqas, "; ", d2cs, ")")
//
| D2Cfundclst
  ( knd0
  , mopt, tqas, f2ds) =>
  fprint!
  ( out
  , "D2Cfundclst("
  , knd0, "; ", mopt, "; ", tqas, "; ", f2ds, ")")
//
| D2Cvaldclst
  (knd0, mopt, v2ds) =>
  fprint!
  ( out
  , "D2Cvaldclst("
  , knd0, "; ", mopt, "; ", v2ds, ")")
| D2Cvardclst
  (knd0, mopt, v2ds) =>
  fprint!
  ( out
  , "D2Cvardclst("
  , knd0, "; ", mopt, "; ", v2ds, ")")
//
| D2Cimplmnt1
  ( knd0
  , stmp, mopt, sqas, tqas
  , dqid, tias, f2as, res0, d2e1) =>
  fprint!
  ( out
  , "D2Cimplmnt1("
  , knd0, "; "
  , stmp, "; ", mopt, "; "
  , sqas, "; ", tqas, "; "
  , dqid, "; ", tias, "; ", f2as, "; ", d2e1, ")")
| D2Cimplmnt2
  ( knd0
  , stmp, mopt, sqas, tqas
  , dqid, tias, f2as, res0, d2e1) =>
  fprint!
  ( out
  , "D2Cimplmnt2("
  , knd0, "; "
  , stmp, "; ", mopt, "; "
  , sqas, "; ", tqas, "; "
  , dqid, "; ", tias, "; ", f2as, "; ", d2e1, ")")
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
fprint_d2itm(stderr_ref, x0)
//
(* ****** ****** *)
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
fprint_sq2arg(stderr_ref, x0)
//
(* ****** ****** *)
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
fprint_tq2arg(stderr_ref, x0)
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
fprint_ti2arg(stderr_ref, x0)
//
(* ****** ****** *)
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
print_d2valdecl(x0) =
fprint_d2valdecl(stdout_ref, x0)
implement
prerr_d2valdecl(x0) =
fprint_d2valdecl(stderr_ref, x0)

(* ****** ****** *)

implement
fprint_d2valdecl
  (out, x0) = let
//
val+D2VALDECL(rcd) = x0
//
in
  fprint!
  ( out
  , "D2VALDECL@{"
  , "pat=", rcd.pat, ", "
  , "def=", rcd.def, ", ", "wtp=", rcd.wtp, "}")
end // end of [fprint_d2valdecl]

(* ****** ****** *)

implement
print_d2vardecl(x0) =
fprint_d2vardecl(stdout_ref, x0)
implement
prerr_d2vardecl(x0) =
fprint_d2vardecl(stderr_ref, x0)

(* ****** ****** *)

implement
fprint_d2vardecl
  (out, x0) = let
//
val+D2VARDECL(rcd) = x0
//
in
  fprint!
  ( out
  , "D2VARDECL@{"
  , "d2v=", rcd.d2v, ", "
  , "wth=", rcd.wth, ", "
  , "res=", rcd.res, ", ", "ini=", rcd.ini, "}")
end // end of [fprint_d2vardecl]

(* ****** ****** *)

implement
print_d2fundecl(x0) =
fprint_d2fundecl(stdout_ref, x0)
implement
prerr_d2fundecl(x0) =
fprint_d2fundecl(stderr_ref, x0)

(* ****** ****** *)

implement
fprint_d2fundecl
  (out, x0) = let
//
val+D2FUNDECL(rcd) = x0
//
in
fprint!
( out
, "D2FUNDECL@{"
, "nam=", rcd.nam, ", "
, "d2c=", rcd.d2c, ", "
, "f2g=", rcd.f2g, ", "
, "res=", rcd.res, ", "
, "xnm=", rcd.xnm, ", "
, "def=", rcd.def, ", ", "wtp=", rcd.wtp, "}")
end // end of [fprint_d2fundecl]

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
(* ****** ****** *)
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

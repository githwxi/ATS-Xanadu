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
fprint_val<d2ecl> = fprint_d2ecl
//
(* ****** ****** *)
//
implement
fprint_val<tq2arg> = fprint_tq2arg
//
(* ****** ****** *)
//
implement
print_t2ype(x0) =
fprint_t2ype(stdout_ref, x0) 
implement
prerr_t2ype(x0) =
fprint_t2ype(stdout_ref, x0) 
//
implement
fprint_t2ype
  (out, x0) =
(
case+
x0.topt() of
| None() =>
  fprint!(out, "T2YPE()")
| Some(s2e) =>
  fprint!(out, "T2YPE(", s2e, ")")
)
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
| D2Pvar(d2v) =>
  fprint!(out, "D2Pvar(", d2v, ")")
//
| D2Ptuple(knd, npf, d2ps) =>
  fprint!
  ( out, "D2Ptuple("
  , knd, "; ", npf, "; ", d2ps, ")")
//
| D2Panno(d2p1, s2e2) =>
  fprint!
  (out, "D2Panno(", d2p1, "; ", s2e2, ")")
//
| D2Pnone0() =>
  fprint!(out, "D2Pnone0(", ")")
| D2Pnone1(d1psrc) =>
  fprint!(out, "D2Pnone1(", d1psrc, ")")
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
| D2Echr(tok) =>
  fprint!(out, "D2Echr(", tok, ")")
| D2Eflt(tok) =>
  fprint!(out, "D2Eflt(", tok, ")")
| D2Estr(tok) =>
  fprint!(out, "D2Estr(", tok, ")")
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
  (d1e0, dpis) =>
  fprint!(out, "D2Esym0(", d1e0, ")")
(*
  fprint!
  (out, "D2Esym0(", d1e0, "; ", dpis, ")")
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
| D2Ewhere
  (d2e1, d2cs) =>
  fprint!
  ( out
  , "D2Ewhere(", d2e1, "; ", d2cs, ")")
//
| D2Etuple
  (knd, npf, d2es) =>
  fprint!
  ( out, "D2Etuple("
  , knd, "; ", npf, "; ", d2es, ")")
//
| D2Eif0
  (d2e1, d2e2, opt3) =>
  fprint!
  ( out, "D2Eif0("
  , d2e1, "; ", d2e2, "; ", opt3, ")")
//
| D2Eanno(d2e1, s2e2) =>
  fprint!
  (out, "D2Eanno(", d2e1, "; ", s2e2, ")")
//
| D2Enone0() =>
  fprint!(out, "D2Enone0(", ")")
| D2Enone1(d1esrc) =>
  fprint!(out, "D2Enone1(", d1esrc, ")")
//
) (* end of [fprint_d2exp] *)

end // end of [local]

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
| D2Cvaldecl
  (knd, mopt, v2ds) =>
  fprint!
  ( out
  , "D2Cvaldecl("
  , knd, "; ", mopt, "; ", v2ds)
| D2Cfundecl
  (knd, mopt, tqas, f2ds) =>
  fprint!
  ( out
  , "D2Cfundecl("
  , knd, "; ", mopt, "; ", tqas, "; ", f2ds)
//
| D2Cdatasort(d1c) =>
  fprint!(out, "D2Cdatasort(", d1c, ")")
| D2Cdatatype(d1c) =>
  fprint!(out, "D2Cdatatype(", d1c, ")")
//
| D2Cdynconst(knd, tqas, d2cs) =>
  fprint!
  (out, "D2Cdcstdecl(", knd, "; ", tqas, "; ", d2cs)
//
| D2Clocal(d2cs1, d2cs2) =>
  fprint!
  ( out
  , "D2Clocal(", d2cs1, "; ", d2cs2, ")")
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
| D2ITMcon(d2cs) =>
  fprint!(out, "D2ITMcon(", d2cs, ")")
//
| D2ITMcst(d2cs) =>
  fprint!(out, "D2ITMcst(", d2cs, ")")
//
| D2ITMvar(d2v0) =>
  fprint!(out, "D2ITMvar(", d2v0, ")")
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
| D2PITMnone(pval) =>
  fprint!(out, "D2PITMnone(", pval, ")")
| D2PITMsome(pval, d2i0) =>
  fprint!(out, "D2PITMsome(", pval, "; ", d2i0, ")")
)
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
list_foreach<s2varlst>(x0.svss())
) where
{
implement
list_foreach$fwork<s2varlst><void>
  (s2vs, env) = fprint!(out, "<", s2vs, ">")
} (* end of [fprint_tq2arg] *)
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
  , ", pat=", rcd.pat
  , ", def=", rcd.def, ", wtp=", rcd.wtp, "}")
end // end of [fprint_v2aldecl]

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
  , ", nam=", rcd.nam
  , ", arg=", rcd.arg
  , ", res=", rcd.res
  , ", def=", rcd.def, ", wtp=", rcd.wtp, "}")
end // end of [fprint_f2undecl]

(* ****** ****** *)

(* end of [xats_dynexp2_print.dats] *)

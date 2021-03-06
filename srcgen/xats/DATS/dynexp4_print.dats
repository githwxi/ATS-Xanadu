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
#staload "./../SATS/dynexp0.sats"
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
fprint_val<f2arg> = fprint_f2arg
//
implement
fprint_val<tq2arg> = fprint_tq2arg
//
(* ****** ****** *)
//
implement
fprint_val<d4pat> = fprint_d4pat
//
(* ****** ****** *)
//
implement
fprint_val<f4arg> = fprint_f4arg
//
(* ****** ****** *)
//
implement
fprint_val<d4exp> = fprint_d4exp
//
(* ****** ****** *)
//
implement
fprint_val<d4ecl> = fprint_d4ecl
//
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
| D4Pnone1(d3p) =>
  fprint!
  (out, "D4Pnone1(", d3p, ")")
//
| _(* rest-of-d4pat *) => fprint!(out, "D4P...(...)")
//
) (* end of [fprint_d4pat] *)
//
(* ****** ****** *)
//
implement
print_f4arg(x0) =
fprint_f4arg(stdout_ref, x0)
implement
prerr_f4arg(x0) =
fprint_f4arg(stderr_ref, x0)
//
implement
fprint_f4arg
  (out, x0) =
(
//
case+
x0.node() of
//
| F4ARGnone2(f2a) =>
  fprint!(out, "F4ARGnone2(", f2a, ")")
| F4ARGnone3(f3a) =>
  fprint!(out, "F4ARGnone3(", f3a, ")")
//
|
F4ARGsome_met(s2es) =>
fprint!(out, "F4ARGsome_met(", s2es, ")")
//
|
F4ARGsome_dyn(npf1, d3ps) =>
fprint!
(out, "F4ARGsome_dyn(", npf1, "; ", d3ps, ")")
|
F4ARGsome_sta(s2vs, s2ps) =>
fprint!
(out, "F4ARGsome_sta(", s2vs, "; ", s2ps, ")")
//
) (* end of [fprint_f4arg] *)
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
(*
fprint!(out, ":", x0.sexp())
*)
) where
{
val () =
(
case+ x0.node() of
//
| D4Ei00(int) =>
  fprint!(out, "D4Ei00(", int, ")")
| D4Eb00(btf) =>
  fprint!(out, "D4Eb00(", btf, ")")
| D4Ec00(chr) =>
  fprint!(out, "D4Ec00(", chr, ")")
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
| D4Efcst(d2c) =>
  fprint!(out, "D4Efcst(", d2c, ")")
//
| D4Esap0
  (d4f0, s2es) =>
  fprint!
  ( out
  , "D4Esap0(", d4f0, "; ", s2es, ")")
| D4Esap1
  (d4f0, s2es) =>
  fprint!
  ( out
  , "D4Esap1(", d4f0, "; ", s2es, ")")
//
| D4Esapx
  (d4f0, s2es, s2ps) =>
  fprint!
  ( out
  , "D4Esapx("
  , d4f0, "; ", s2es, "; ", s2ps, ")")
//
| D4Edapp
  ( d4f0
  , npf1, d4es) =>
  fprint!
  ( out
  , "D4Edapp("
  , d4f0, "; ", npf1, "; ", d4es, ")")
//
| D4Etcast
  ( d4e0, s2e0 ) =>
  fprint!
  ( out
  , "D4Etcast(", d4e0, "; ", s2e0, ")")
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
) (*val*) } (*where*) (* end of [fprint_d4exp] *)
//
(* ****** ****** *)
//
implement
print_d4ecl(x0) =
fprint_d4ecl(stdout_ref, x0)
implement
prerr_d4ecl(x0) =
fprint_d4ecl(stderr_ref, x0)
//
local
//
implement
fprint_val<f4undecl> = fprint_f4undecl
implement
fprint_val<v4aldecl> = fprint_v4aldecl
//
in(*in-of-local*)
//
implement
fprint_d4ecl
  (out, x0) =
(
case+ x0.node() of
|
D4Cvaldecl
(tok0, mopt, v4ds) =>
fprint!
( out, "D4Cvaldecl("
, tok0, "; ", mopt, "; ", "; ", v4ds, ")")
|
D4Cfundecl
(tok0, mopt, tqas, f4ds) =>
fprint!
( out, "D4Cfundecl("
, tok0, "; ", mopt, "; ", tqas, "; ", f4ds, ")")
//
| _(* rest-of-d4ecl *) => fprint!(out, "D4C...(...)")
//
) (* end of [fprint_d4ecl] *)
//
end // end of [local]

(* ****** ****** *)

implement
print_v4aldecl(x0) =
fprint_v4aldecl(stdout_ref, x0)
implement
prerr_v4aldecl(x0) =
fprint_v4aldecl(stderr_ref, x0)

(* ****** ****** *)
//
implement
fprint_v4aldecl
  (out, x0) = let
//
val+V4ALDECL(rcd) = x0
//
in
  fprint!
  ( out
  , "V4ALDECL@{"
  , ", pat=", rcd.pat
  , ", def=", rcd.def
  , ", wtp=", rcd.wtp, "}")
end // end of [fprint_v4aldecl]
//
(* ****** ****** *)

implement
print_f4undecl(x0) =
fprint_f4undecl(stdout_ref, x0)
implement
prerr_f4undecl(x0) =
fprint_f4undecl(stderr_ref, x0)

implement
fprint_f4undecl
  (out, x0) = let
//
val+F4UNDECL(rcd) = x0
//
in
//
case+
rcd.a4g of
|
None() =>
(
  fprint!
  ( out
  , "F4UNDECL@{"
  , "nam=", rcd.nam, ", "
  , "d2c=", rcd.d2c, ", "
  , "a2g=", rcd.a2g, ", ", "}")
)
|
Some(rcd_a3g) =>
(
  fprint!
  ( out
  , "F4UNDECL@{"
  , "nam=", rcd.nam, ", "
  , "d2c=", rcd.d2c, ", "
  , "a3g=", rcd_a3g, ", "
  , "res=", rcd.res, ", "
  , "def=", rcd.def, ", "
  , "rtp=", rcd.rtp, ", "
  , "wtp=", rcd.wtp, ", ", "ctp=", rcd.ctp, "}")
)
//
end // end of [fprint_f4undecl]

(* ****** ****** *)

(* end of [xats_dynexp4_print.dats] *)

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

#staload "./../SATS/label0.sats"
#staload "./../SATS/lexing.sats"

(* ****** ****** *)

#staload "./../SATS/staexp0.sats"
#staload "./../SATS/dynexp0.sats"

(* ****** ****** *)

#staload "./../SATS/staexp1.sats"
#staload "./../SATS/dynexp1.sats"

(* ****** ****** *)
//
#staload "./../SATS/staexp2.sats"
#staload "./../SATS/statyp2.sats"
#staload "./../SATS/dynexp2.sats"
//
(* ****** ****** *)
//
#staload "./../SATS/dynexp3.sats"
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
fprint_val<d2itm> = fprint_d2itm
implement
fprint_val<d2pitm> = fprint_d2pitm
//
(* ****** ****** *)
//
implement
fprint_val<f2arg> = fprint_f2arg
implement
fprint_val<tq2arg> = fprint_tq2arg
//
(* ****** ****** *)
//
implement
fprint_val<d3pat> = fprint_d3pat
//
(* ****** ****** *)

implement
fprint_val<f3arg> = fprint_f3arg

(* ****** ****** *)
//
implement
fprint_val<d3exp> = fprint_d3exp
//
(* ****** ****** *)
//
implement
fprint_val<d3gua> = fprint_d3gua
implement
fprint_val<d3clau> = fprint_d3clau
implement
fprint_val<dg3pat> = fprint_dg3pat
//
(* ****** ****** *)

implement
fprint_val<d3ecl> = fprint_d3ecl

(* ****** ****** *)
//
implement
fprint_val<sq2arg> = fprint_sq2arg
implement
fprint_val<tq2arg> = fprint_tq2arg
implement
fprint_val<ti2arg> = fprint_ti2arg
implement
fprint_val<ti3arg> = fprint_ti3arg
//
(* ****** ****** *)
//
implement
print_d3pat(x0) =
fprint_d3pat(stdout_ref, x0)
implement
prerr_d3pat(x0) =
fprint_d3pat(stderr_ref, x0)
//
implement
fprint_d3pat
  (out, x0) =
(
case- x0.node() of
//
| D3Pany() =>
  fprint!(out, "D3Pany()")
//
| D3Pvar(d2v) =>
  fprint!
  (out, "D3Pvar(", d2v, ")")
//
| D3Pint(tok) =>
  fprint!
  (out, "D3Pint(", tok, ")")
| D3Pbtf(tok) =>
  fprint!
  (out, "D3Pbtf(", tok, ")")
| D3Pchr(tok) =>
  fprint!
  (out, "D3Pchr(", tok, ")")
| D3Pflt(tok) =>
  fprint!
  (out, "D3Pflt(", tok, ")")
| D3Pstr(tok) =>
  fprint!
  (out, "D3Pstr(", tok, ")")
//
| D3Pcon1(d2c0) =>
  fprint!
  (out, "D3Pcon1(", d2c0, ")")
| D3Pcon2(d2cs) =>
  fprint!
  (out, "D3Pcon2(", d2cs, ")")
//
| D3Psym0(sym0, d2pis) =>
  (
  fprint!
  (out, "D3Psym0(", sym0, ")");
(*
  fprint!
  ( out
  , "D3Psym0(", sym, "; ", d2pis, ")");
*)
  )
//
| D3Pdapp
  (d3f0, npf0, d3ps) =>
  fprint!
  ( out, "D3Pdapp("
  , d3f0, "; ", npf0, "; ", d3ps, ")")
//
| D3Panno(d3p1, s2e2) =>
  fprint!
  (out, "D3Panno(", d3p1, "; ", s2e2, ")")
//
| D3Pcast(d3p1, t2p2) =>
  fprint!
  (out, "D3Pcast(", d3p1, "; ", t2p2, ")")
//
| D3Pnone0() => fprint!(out, "D3Pnone0(", ")")
| D3Pnone1(d1psrc) => fprint!(out, "D3Pnone1(", d1psrc, ")")
| D3Pnone2(d2psrc) => fprint!(out, "D3Pnone2(", d2psrc, ")")
//
) (* end of [fprint_d3pat] *)
//
(* ****** ****** *)

implement
fprint_f3arg
  (out, x0) =
(
//
case+
x0.node() of
(*
| F2ARGnone(tok) =>
  fprint!(out, "F2ARGnone(", tok, ")")
*)
| F3ARGsome_met(s2es) =>
  fprint!(out, "F3ARGsome_met(", s2es, ")")
| F3ARGsome_dyn(npf, d3ps) =>
  fprint!(out, "F3ARGsome_dyn(", npf, "; ", d3ps, ")")
| F3ARGsome_sta(s2vs, s2ps) =>
  fprint!(out, "F3ARGsome_sta(", s2vs, "; ", s2ps, ")")
//
) (* end of [fprint_f3arg] *)

(* ****** ****** *)
//
implement
print_d3exp(x0) =
fprint_d3exp(stdout_ref, x0) 
implement
prerr_d3exp(x0) =
fprint_d3exp(stdout_ref, x0) 
//
implement
fprint_d3exp
  (out, x0) =
(
case+
x0.node() of
//
| D3Eint(tok) =>
  fprint!(out, "D3Eint(", tok, ")")
| D3Ebtf(tok) =>
  fprint!(out, "D3Ebtf(", tok, ")")
| D3Echr(tok) =>
  fprint!(out, "D3Echr(", tok, ")")
| D3Eflt(tok) =>
  fprint!(out, "D3Eflt(", tok, ")")
| D3Estr(tok) =>
  fprint!(out, "D3Estr(", tok, ")")
//
| D3Evar(d2v) =>
  fprint!(out, "D3Evar(", d2v, ")")
//
| D3Econ1(d2c) =>
  fprint!(out, "D3Econ1(", d2c, ")")
| D3Ecst1(d2c) =>
  fprint!(out, "D3Ecst1(", d2c, ")")
//
| D3Econ2(d2cs) =>
  fprint!(out, "D3Econ2(", d2cs, ")")
| D3Ecst2(d2cs) =>
  fprint!(out, "D3Ecst2(", d2cs, ")")
//
| D3Esym0
  (d1e1, dpis) =>
(*
  fprint!(out, "D3Esym0(", d1e1, ")")
*)
  fprint!
  ( out
  , "D3Esym0(", d1e1, "; ", dpis, ")")
(*
  let
  val t2p0 = x0.type()
  in
  fprint!
  ( out
  , "D3Esym0(", d1e1, ": ", t2p0, ")")
  end
*)
//
| D3Esap0
  (d3e1, s2es) =>
  fprint!
  ( out
  , "D3Esap0(", d3e1, "; ", s2es, ")")
| D3Esap1
  (d3e1, s2es) =>
  fprint!
  ( out
  , "D3Esap1(", d3e1, "; ", s2es, ")")
//
(*
| D3Etap0
  (d2c0, s2es) =>
  fprint!
  ( out
  , "D3Etap0(", d2c0, "; ", s2es, ")")
*)
| D3Etap1
  (d2f0, s2es) =>
  fprint!
  ( out
  , "D3Etap1(", d2f0, "; ", s2es, ")")
//
| D3Edapp
  (d3e1, npf2, d3es) =>
  fprint!
  ( out, "D3Edapp("
  , d3e1, "; ", npf2, "; ", d3es, ")")
//
| D3Elet(d3cs, d3e2) =>
  fprint!
  ( out
  , "D3Elet(", d3cs, "; ", d3e2, ")")
| D3Ewhere(d3e1, d3cs) =>
  fprint!
  ( out
  , "D3Ewhere(", d3e1, "; ", d3cs, ")")
//
| D3Eseqn(d3es, d3e2) =>
  fprint!
  ( out
  , "D3Eseqn(", d3es, "; ", d3e2, ")")
//
| D3Etuple
  (knd1, npf2, d3es) =>
  fprint!
  ( out, "D3Etuple("
  , knd1, "; ", npf2, "; ", d3es, ")")
//
| D3Edtsel
  (lab1, dpis, arg3) =>
  fprint!
  ( out, "D3Edtsel("
  , lab1, "; ", dpis, "; ", arg3, ")")
//
| D3Eif0
  (d3e1, d3e2, opt3) =>
  fprint!
  ( out, "D3Eif0("
  , d3e1, "; ", d3e2, "; ", opt3, ")")
//
| D3Ecase
  (knd0, d3e1, d3cls) =>
  fprint!
  ( out, "D3Ecase("
  , knd0, "; ", d3e1, "; ", d3cls, ")")
//
| D3Elam
  (f3as, tres, arrw, body) =>
  fprint!
  ( out, "D3Elam("
  , f3as, "; "
  , tres, "; ", arrw, "; ", body, ")")
//
| D3Eanno(d3e1, s2e2) =>
  fprint!
  ( out
  , "D3Eanno(", d3e1, "; ", s2e2, ")")
//
| D3Ecast(d3e1, t2p2) =>
  fprint!
  ( out
  , "D3Ecast(", d3e1, "; ", t2p2, ")")
//
| D3Enone0() =>
  fprint!(out, "D3Enone0(", ")")
| D3Enone1(d2esrc) =>
  fprint!(out, "D3Enone1(", d2esrc, ")")
| D3Enone2(d3esrc) =>
  fprint!(out, "D3Enone2(", d3esrc, ")")
//
)
//
(* ****** ****** *)

implement
print_d3gua(x0) =
fprint_d3gua(stdout_ref, x0)
implement
prerr_d3gua(x0) =
fprint_d3gua(stderr_ref, x0)

implement
fprint_d3gua
  (out, x0) =
(
case+
x0.node() of
| D3GUAexp(d3e) =>
  fprint!
  (out, "D3GUAexp(", d3e, ")")
| D3GUAmat(d3e, d3p) =>
  fprint!
  (out, "D3GUAmat(", d3e, "; ", d3p, ")")
) (* end of [fprint_d3gua] *)

(* ****** ****** *)

implement
print_d3clau(x0) =
fprint_d3clau(stdout_ref, x0)
implement
prerr_d3clau(x0) =
fprint_d3clau(stderr_ref, x0)

implement
print_dg3pat(x0) =
fprint_dg3pat(stdout_ref, x0)
implement
prerr_dg3pat(x0) =
fprint_dg3pat(stderr_ref, x0)

implement
fprint_d3clau
  (out, x0) =
(
case+
x0.node() of
//
| D3CLAUgpat(dg3p) =>
  fprint!
  (out, "D3CLAUgpat(", dg3p, ")")
//
| D3CLAUclau(dg3p, d0e0) =>
  fprint!
  ( out
  , "D3CLAUclau(", dg3p, "; ", d0e0, ")")
//
) (* end of [fprint_d3clau] *)

implement
fprint_dg3pat
  (out, x0) =
(
case+
x0.node() of
//
| DG3PATpat(d3p) =>
  fprint!
  (out, "DG3PATpat(", d3p, ")")
//
| DG3PATgua(d3p, d3gs) =>
  fprint!
  (out, "DG3PATgua(", d3p, "; ", d3gs, ")")
//
) (* end of [fprint_dg3pat] *)

(* ****** ****** *)
//
implement
print_ti3arg(x0) =
fprint_ti3arg(stdout_ref, x0) 
implement
prerr_ti3arg(x0) =
fprint_ti3arg(stdout_ref, x0) 
//
implement
fprint_ti3arg
  (out, x0) =
(
case+ x0 of
| TI3ARG(t2ps) =>
  fprint!(out, "TI3ARG(", t2ps, ")")
)
//
(* ****** ****** *)
//
implement
print_d3ecl(x0) =
fprint_d3ecl(stdout_ref, x0) 
implement
prerr_d3ecl(x0) =
fprint_d3ecl(stdout_ref, x0) 
//
local

implement
fprint_val<d3ecl> = fprint_d3ecl
implement
fprint_val<v3aldecl> = fprint_v3aldecl
implement
fprint_val<v3ardecl> = fprint_v3ardecl
implement
fprint_val<f3undecl> = fprint_f3undecl

in(*in-of-local*)

implement
fprint_d3ecl
  (out, x0) =
(
//
case-
x0.node() of
//
| D3Cd2ecl(d2c) =>
  fprint!(out, "D3Cd2ecl(", d2c, ")")
//
| D3Cstatic
  (tok, d3c) =>
  fprint!(out, "D3Cstatic(", d3c, ")")
| D3Cextern
  (tok, d3c) =>
  fprint!(out, "D3Cextern(", d3c, ")")
//
| D3Cvaldecl
  (knd, mopt, v3ds) =>
  fprint!
  ( out
  , "D3Cvaldecl("
  , knd, "; ", mopt, "; ", v3ds, ")")
| D3Cvardecl(knd, v3ds) =>
  fprint!
  ( out
  , "D3Cvardecl(", knd, "; ", v3ds, ")")
//
| D3Cfundecl
  (knd, mopt, tqas, f3ds) =>
  fprint!
  ( out
  , "D3Cfundecl("
  , knd, "; ", mopt, "; ", tqas, "; ", f3ds, ")")
//
| D3Cimpdecl
  ( knd, mopt
  , sqas, tqas
  , id2c, ti2s, ti3s, f3as, res0, d3e0) =>
  fprint!
  ( out
  , "D3Cimpdecl("
  , knd, "; ", mopt, "; "
  , sqas, "; ", tqas, "; "
  , id2c, "; ", ti2s, "; ", ti3s, "; ", f3as, "; ", res0, "; ", d3e0, ")"
  ) (* end of [D3Cimpdecl] *)
//
| D3Cnone0() =>
  fprint!(out, "D3Cnone0(", ")")
| D3Cnone1(d3csrc) =>
  fprint!(out, "D3Cnone1(", d3csrc, ")")
)
//
end // end of [local]

(* ****** ****** *)
//
implement
print_t2pcast(x0) =
fprint_t2pcast(stdout_ref, x0)
implement
prerr_t2pcast(x0) =
fprint_t2pcast(stderr_ref, x0)
//
implement
fprint_t2pcast
  (out, x0) =
(
case+ x0 of
| T2PCASTnone() =>
  fprint!
  (out, "T2PCASTnone(", ")")
| T2PCASTsome(t2p1, t2p2) =>
  fprint!
  (out, "T2PCASTsome(", t2p1, "; ", t2p2, ")")
) (* end of [fprint_t2pcast] *)
//
(* ****** ****** *)

implement
print_v3aldecl(x0) =
fprint_v3aldecl(stdout_ref, x0)
implement
prerr_v3aldecl(x0) =
fprint_v3aldecl(stderr_ref, x0)

implement
fprint_v3aldecl
  (out, x0) = let
//
val+V3ALDECL(rcd) = x0
//
in
  fprint!
  ( out
  , "V3ALDECL@{"
  , ", pat=", rcd.pat
  , ", def=", rcd.def
  , ", wtp=", rcd.wtp, "}")
end // end of [fprint_v3aldecl]

(* ****** ****** *)

implement
print_v3ardecl(x0) =
fprint_v3ardecl(stdout_ref, x0)
implement
prerr_v3ardecl(x0) =
fprint_v3ardecl(stderr_ref, x0)

implement
fprint_v3ardecl
  (out, x0) = let
//
val+V3ARDECL(rcd) = x0
//
in
  fprint!
  ( out
  , "V3ARDECL@{"
  , "d2v=", rcd.d2v, ", "
  , "wth=", rcd.wth, ", "
  , "res=", rcd.res, ", ", "ini=", rcd.ini, "}")
end // end of [fprint_v3ardecl]

(* ****** ****** *)

implement
print_f3undecl(x0) =
fprint_f3undecl(stdout_ref, x0)
implement
prerr_f3undecl(x0) =
fprint_f3undecl(stderr_ref, x0)

implement
fprint_f3undecl
  (out, x0) = let
//
val+F3UNDECL(rcd) = x0
//
in
  fprint!
  ( out
  , "F3UNDECL@{"
  , ", nam=", rcd.nam
  , ", a2g=", rcd.a2g
  , ", res=", rcd.res
  , ", def=", rcd.def
  , ", ctp=", rcd.ctp
  , ", wtp=", rcd.wtp, "}")
end // end of [fprint_f3undecl]

(* ****** ****** *)
(*
implement
print_impld3cst(x0) =
fprint_impld3cst(stdout_ref, x0)
implement
prerr_impld3cst(x0) =
fprint_impld3cst(stderr_ref, x0)
//
implement
fprint_impld3cst
  (out, x0) = let
//
val+
IMPLD3CST(dqid, d2cs, ct2p) = x0
//
in
//
fprint!(out, "IMPLD3CST(", dqid, "; ", d2cs, "; ", ct2p, ")")
//
end // end of [fprint_impdeclst]
*)
(* ****** ****** *)

(* end of [xats_dynexp3_print.dats] *)

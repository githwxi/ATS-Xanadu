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
// Start Time: November, 2019
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
#staload "./../SATS/basics.sats"
//
#staload "./../SATS/label0.sats"
//
#staload "./../SATS/lexing.sats"
//
#staload "./../SATS/dynexp0.sats"
//
#staload "./../SATS/dynexp1.sats"
//
#staload "./../SATS/staexp2.sats"
#staload "./../SATS/statyp2.sats"
#staload "./../SATS/dynexp2.sats"
//
#staload "./../SATS/dynexp3.sats"
//
(* ****** ****** *)
//
#staload "./../SATS/intrep0.sats"
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
implement
fprint_val<f3arg> = fprint_f3arg
//
(* ****** ****** *)
//
implement
fprint_val<sq2arg> = fprint_sq2arg
implement
fprint_val<tq2arg> = fprint_tq2arg
//
implement
fprint_val<ti2arg> = fprint_ti2arg
//
(* ****** ****** *)

implement
fprint_val<ir0pat> = fprint_ir0pat
implement
fprint_val<ir0arg> = fprint_ir0arg
implement
fprint_val<ir0exp> = fprint_ir0exp
implement
fprint_val<ir0dcl> = fprint_ir0dcl

(* ****** ****** *)

(*
implement
fprint_val<ir0arglst> = fprint_ir0arglst
*)

(* ****** ****** *)
//
implement
fprint_val<ir0gua> = fprint_ir0gua
implement
fprint_val<ir0clau> = fprint_ir0clau
implement
fprint_val<ir0gpat> = fprint_ir0gpat
//
(* ****** ****** *)
//
implement
print_ir0pat(x0) =
fprint_ir0pat(stdout_ref, x0)
implement
prerr_ir0pat(x0) =
fprint_ir0pat(stderr_ref, x0)
//
implement
fprint_ir0pat
  (out, x0) =
(
case+ x0.node() of
//
| IR0Pnil() =>
  fprint!(out, "IR0Pnil(", ")")
| IR0Pany() =>
  fprint!(out, "IR0Pany(", ")")
//
| IR0Pint(tok) =>
  fprint!(out, "IR0Pint(", tok, ")")
| IR0Pbtf(tok) =>
  fprint!(out, "IR0Pbtf(", tok, ")")
//
| IR0Pvar(d2v) =>
  fprint!(out, "IR0Pvar(", d2v, ")")
//
| IR0Pcapp(d2c0, irps) =>
  fprint!
  ( out
  , "IR0Pcapp(", d2c0, "; ", irps, ")")
//
| IR0Ptuple(knd, irps) =>
  fprint!
  ( out
  , "IR0Ptuple(", knd, "; ", irps, ")")
//
| IR0Pnone0() =>
    fprint!(out, "IR0Pnone0(", ")")
  // end of [IR0Pnone0]
| IR0Pnone1(d3p) =>
    fprint!(out, "IR0Pnone1(", d3p, ")")
  // end of [IR0Pnone1]
//
)
//
(* ****** ****** *)
//
implement
print_ir0arg(x0) =
fprint_ir0arg(stdout_ref, x0)
implement
prerr_ir0arg(x0) =
fprint_ir0arg(stderr_ref, x0)
//
implement
fprint_ir0arg
  (out, x0) =
let
val+IR0ARGsome(npf, irps) = x0
in
fprint!
(out, "IR0ARGsome(", npf, "; ", irps, ")")
end // end of [fprint_ir0arg]
//
(*
implement
fprint_ir0arglst(out, xs) = fprint!(out, xs)
*)
//
(* ****** ****** *)
//
implement
print_ir0exp(x0) =
fprint_ir0exp(stdout_ref, x0)
implement
prerr_ir0exp(x0) =
fprint_ir0exp(stderr_ref, x0)
//
implement
fprint_ir0exp
  (out, x0) =
(
case+
x0.node() of
//
| IR0Eint(tok) =>
  fprint!(out, "IR0Eint(", tok, ")")
| IR0Ebtf(tok) =>
  fprint!(out, "IR0Ebtf(", tok, ")")
(*
| IR0Eflt(tok) =>
  fprint!(out, "IR0Eflt(", tok, ")")
*)
| IR0Estr(tok) =>
  fprint!(out, "IR0Estr(", tok, ")")
//
| IR0Evar(d2v) =>
  fprint!(out, "IR0Evar(", d2v, ")")
//
| IR0Econ1(d2c) =>
  fprint!(out, "IR0Econ1(", d2c, ")")
| IR0Ecst1(d2c) =>
  fprint!(out, "IR0Ecst1(", d2c, ")")
//
| IR0Efcst(d2c) =>
  fprint!(out, "IR0Efcst(", d2c, ")")
//
| IR0Etcst
  (d2c1, ti3a, ti2s) =>
  fprint!
  ( out
  , "IR0Etcst("
  , d2c1, "; ", ti3a, "; [", ti2s, "])")
| IR0Etimp
  ( ire1
  , targ, irc2, tsub) =>
  fprint!
  ( out
  , "IR0Etimp("
  , ire1, "; [", targ, "]; ", irc2, "; [", tsub, "])")
//
| IR0Edapp
  (irf0, npf1, ires) =>
  fprint!
  ( out
  , "IR0Edapp("
  , irf0, "; ", npf1, "; [", ires, "])")
//
| IR0Eproj
  (ire1, lab2, idx2) =>
  fprint!
  ( out
  , "IR0Eproj("
  , ire1, "; ", lab2, "; ", idx2, ")")
//
| IR0Elet(irds, ire1) =>
  fprint!
  ( out
  , "IR0Elet(", irds, "; ", ire1, ")")
| IR0Ewhere(ire1, irds) =>
  fprint!
  ( out
  , "IR0Ewhere(", ire1, "; [", irds, "])")
//
| IR0Eseqn
  (ires, ire1) =>
  fprint!
  ( out
  , "IR0Eseqn(", ires, "; ", ire1, ")")
//
| IR0Etuple
  (knd0, npf1, ires) =>
  fprint!
  ( out
  , "IR0Etuple("
  , knd0, "; ", npf1, "; [", ires, "])")
//
| IR0Eassgn(irel, irer) =>
  fprint!
  ( out
  , "IR0Eassgn(", irel, "; ", irer, ")")
//
| IR0Eif0
  (ire1, ire2, opt3) =>
  fprint!
  ( out, "IR0Eif0("
  , ire1, "; ", ire2, "; ", opt3, ")")
//
| IR0Ecase
  (knd0, ire1, ircls) =>
  fprint!
  ( out, "IR0Ecase("
  , knd0, "; ", ire1, "; ", "...", ")")
//
| IR0Elam
  (knd0, farg, body) =>
  fprint!
  ( out, "IR0Elam("
  , knd0, "; [", farg, "]; ", body, ")")
| IR0Efix
  (knd0, d2v0, farg, body) =>
  fprint!
  ( out, "IR0Efix("
  , knd0, "; "
  , d2v0, "; [", farg, "]; ", body, ")")
//
| IR0Eaddr(ire1) =>
  (
    fprint!(out, "IR0Eaddr(", ire1, ")")
  )
| IR0Efold(ire1) =>
  (
    fprint!(out, "IR0Efold(", ire1, ")")
  )
//
| IR0Eeval
  (knd0, ire1) =>
  fprint!
  ( out
  , "IR0Elazy(", knd0, "; ", ire1, ")")
//
| IR0Elazy(ire1) =>
  (
    fprint!(out, "IR0Elazy(", ire1, ")")
  )
//
| IR0Eflat(ire1) =>
  (
    fprint!(out, "IR0Eflat(", ire1, ")")
  )
| IR0Etalf(ire1) =>
  (
    fprint!(out, "IR0Etalf(", ire1, ")")
  )
//
| IR0Enone0(   ) =>
  (
    fprint!(out, "IR0Enone0(", ")")
  )
| IR0Enone1(d3e1) =>
  (
    fprint!(out, "IR0Enone1(", d3e1, ")")
  )
//
)
//
(* ****** ****** *)
//
implement
print_ir0gua(x0) =
fprint_ir0gua(stdout_ref, x0)
implement
prerr_ir0gua(x0) =
fprint_ir0gua(stderr_ref, x0)
//
implement
fprint_ir0gua
  (out, x0) =
(
case+
x0.node() of
| IR0GUAexp(ir0e) =>
  fprint!
  (out, "IR0GUAexp(", ir0e, ")")
| IR0GUAmat(ir0e, ir0p) =>
  fprint!
  (out, "IR0GUAmat(", ir0e, "; ", ir0p, ")")
) (* end of [fprint_ir0gua] *)
//
(* ****** ****** *)
//
implement
print_ir0clau(x0) =
fprint_ir0clau(stdout_ref, x0)
implement
prerr_ir0clau(x0) =
fprint_ir0clau(stderr_ref, x0)
//
implement
print_ir0gpat(x0) =
fprint_ir0gpat(stdout_ref, x0)
implement
prerr_ir0gpat(x0) =
fprint_ir0gpat(stderr_ref, x0)
//
implement
fprint_ir0clau
  (out, x0) =
(
case+
x0.node() of
//
|
IR0CLAUpat(ir0gp) =>
fprint!
(out, "IR0CLAUpat(", ir0gp, ")")
//
|
IR0CLAUexp(ir0gp, d0e0) =>
fprint!
(out, "IR0CLAUexp(", ir0gp, "; ", d0e0, ")")
//
) (* end of [fprint_ir0clau] *)
//
implement
fprint_ir0gpat
  (out, x0) =
(
case+
x0.node() of
//
|
IR0GPATpat(ir0p) =>
fprint!
(out, "IR0GPATpat(", ir0p, ")")
//
|
IR0GPATgua(ir0p, ir0gs) =>
fprint!
(out, "IR0GPATgua(", ir0p, "; ", ir0gs, ")")
//
) (* end of [fprint_ir0gpat] *)
//
(* ****** ****** *)
//
implement
print_ir0dcl(x0) =
fprint_ir0dcl(stdout_ref, x0)
implement
prerr_ir0dcl(x0) =
fprint_ir0dcl(stderr_ref, x0)
//
local

implement
fprint_val<ir0valdecl> = fprint_ir0valdecl
implement
fprint_val<ir0vardecl> = fprint_ir0vardecl
implement
fprint_val<ir0fundecl> = fprint_ir0fundecl

in(*in-of-local*)

implement
fprint_ir0dcl
  (out, x0) =
(
case+ x0.node() of
//
| IR0Cstatic
  (tok, irc1) =>
  fprint!
  ( out
  , "IR0Cstatic("
  , tok, "; ", irc1, ")")
| IR0Cextern
  (tok, irc1) =>
  fprint!
  ( out
  , "IR0Cextern("
  , tok, "; ", irc1, ")")
//
| IR0Cinclude
  ( tok
  , src, knd
  , fopt, body) =>
  (
  fprint!
  ( out
  , "IR0Cinclude("
  , "src= ", src, "; "
  , "knd= ", knd, "; "
  , fopt, "; ", body, ")")
  ) where
  {
    val body =
    (
    case+ body of
    | None _ => "None()"
    | Some _ => "Some(<irdcls>)"): string
  }
//
| IR0Clocal
  (head, body) =>
  fprint!
  ( out
  , "IR0Clocal("
  , head, "; ", body, ")")
//
| IR0Cvaldecl
  (knd, mopt, irds) =>
  fprint!
  ( out
  , "IR0Cvaldecl("
  , knd, "; ", mopt, "; ", irds, ")")
//
| IR0Cvardecl
  (knd, mopt, irds) =>
  fprint!
  ( out
  , "IR0Cvardecl("
  , knd, "; ", mopt, "; ", irds, ")")
//
| IR0Cfundecl
  (knd, mopt, tqas, irds) =>
  fprint!
  ( out
  , "IR0Cfundecl("
  , knd, "; ", mopt, "; ", tqas, "; ", irds, ")")
//
| IR0Cimpdecl3
  ( knd, mopt
  , sqas, tqas, id2c
  , ti3a, ti2s, iras, body) =>
  fprint!
  ( out
  , "IR0Cimpdecl3("
  , knd, "; ", mopt, "; "
  , sqas, "; ", tqas, "; ", id2c, "; "
  , ti3a, "; ", ti2s, "; ", iras, "; ", body, ")")
//
| IR0Cnone0() =>
    fprint!(out, "IR0Cnone0(", ")")
| IR0Cnone1(d3cl) =>
    fprint!(out, "IR0Cnone1(", d3cl, ")")
//
)
//
end // end of [local]
//
(* ****** ****** *)
//
implement
print_ir0valdecl(x0) =
fprint_ir0valdecl(stdout_ref, x0)
implement
prerr_ir0valdecl(x0) =
fprint_ir0valdecl(stderr_ref, x0)
//
implement
fprint_ir0valdecl
  (out, x0) = let
//
val+IR0VALDECL(rcd) = x0
//
in
  fprint!
  ( out
  , "IR0VALDECL@{"
  , ", pat=", rcd.pat
  , ", def=", rcd.def, "}")
end // end of [fprint_ir0valdecl]
//
(* ****** ****** *)
//
implement
print_ir0vardecl(x0) =
fprint_ir0vardecl(stdout_ref, x0)
implement
prerr_ir0vardecl(x0) =
fprint_ir0vardecl(stderr_ref, x0)
//
implement
fprint_ir0vardecl
  (out, x0) = let
//
val+IR0VARDECL(rcd) = x0
//
in
  fprint!
  ( out
  , "IR0VARDECL@{"
  , ", d2v=", rcd.d2v
  , ", ini=", rcd.ini, "}")
end // end of [fprint_ir0vardecl]
//
(* ****** ****** *)
//
implement
print_ir0fundecl(x0) =
fprint_ir0fundecl(stdout_ref, x0)
implement
prerr_ir0fundecl(x0) =
fprint_ir0fundecl(stderr_ref, x0)
//
implement
fprint_ir0fundecl
  (out, x0) = let
//
val+IR0FUNDECL(rcd) = x0
//
in
  fprint!
  ( out
  , "IR0FUNDECL@{"
  , ", nam=", rcd.nam
  , ", d2c=", rcd.d2c
  , ", a2g=", rcd.a2g
(*
  , ", a3g=", rcd.a3g
*)
  , ", def=", rcd.def, "}")
end // end of [fprint_ir0fundecl]
//
(* ****** ****** *)

(* end of [intrep0_print.dats] *)

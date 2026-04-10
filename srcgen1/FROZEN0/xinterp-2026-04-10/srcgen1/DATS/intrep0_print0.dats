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
#include
"./../HATS/libxinterp.hats"
//
(* ****** ****** *)
#staload $S2T; #staload $S2E
#staload $D2E; #staload $D3E
(* ****** ****** *)
typedef filpath = $FP0.filpath
(* ****** ****** *)
#symload
fprint with $LAB.fprint_label
#symload
fprint with $LEX.fprint_token
#symload
fprint with $LOC.fprint_location
(* ****** ****** *)
#symload
fprint with $S1E.fprint_g1exp
#symload
fprint with $D0E.fprint_decmodopt
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
fprint_val<irpat> = fprint_irpat
implement
fprint_val<irarg> = fprint_irarg
implement
fprint_val<irexp> = fprint_irexp
implement
fprint_val<irdcl> = fprint_irdcl

(* ****** ****** *)

(*
implement
fprint_val<irarglst> = fprint_irarglst
*)

(* ****** ****** *)
//
implement
fprint_val<irgua> = fprint_irgua
implement
fprint_val<irclau> = fprint_irclau
implement
fprint_val<irgpat> = fprint_irgpat
//
(* ****** ****** *)
//
implement
print_irpat(x0) =
fprint_irpat(stdout_ref, x0)
implement
prerr_irpat(x0) =
fprint_irpat(stderr_ref, x0)
//
implement
fprint_irpat
  (out, x0) =
(
case+ x0.node() of
//
| IRPnil() =>
  fprint!(out, "IRPnil(", ")")
| IRPany() =>
  fprint!(out, "IRPany(", ")")
//
| IRPvar(d2v) =>
  fprint!(out, "IRPvar(", d2v, ")")
//
| IRPint(tok) =>
  fprint!(out, "IRPint(", tok, ")")
| IRPbtf(tok) =>
  fprint!(out, "IRPbtf(", tok, ")")
| IRPchr(tok) =>
  fprint!(out, "IRPchr(", tok, ")")
| IRPstr(tok) =>
  fprint!(out, "IRPstr(", tok, ")")
//
| IRPbang(irp1) =>
  fprint!(out, "IRPbang(", irp1, ")")
| IRPflat(irp1) =>
  fprint!(out, "IRPflat(", irp1, ")")
| IRPfree(irp1) =>
  fprint!(out, "IRPfree(", irp1, ")")
//
| IRPcapp(d2c0, irps) =>
  fprint!
  ( out
  , "IRPcapp(", d2c0, "; ", irps, ")")
//
| IRPtrcd1(knd, irps) =>
  fprint!
  ( out
  , "IRPtrcd1(", knd, "; ", irps, ")")
//
| IRPnone0() =>
    fprint!(out, "IRPnone0(", ")")
  // end of [IRPnone0]
| IRPnone1(d3p) =>
    fprint!(out, "IRPnone1(", d3p, ")")
  // end of [IRPnone1]
//
)
//
(* ****** ****** *)
//
implement
print_irarg(x0) =
fprint_irarg(stdout_ref, x0)
implement
prerr_irarg(x0) =
fprint_irarg(stderr_ref, x0)
//
implement
fprint_irarg
  (out, x0) =
let
val+IRARGsome(npf, irps) = x0
in
fprint!
(out, "IRARGsome(", npf, "; ", irps, ")")
end // end of [fprint_irarg]
//
(*
implement
fprint_irarglst(out, xs) = fprint!(out, xs)
*)
//
(* ****** ****** *)
//
implement
print_irexp(x0) =
fprint_irexp(stdout_ref, x0)
implement
prerr_irexp(x0) =
fprint_irexp(stderr_ref, x0)
//
implement
fprint_irexp
  (out, x0) =
(
case+
x0.node() of
//
| IREi00(int) =>
  fprint!(out, "IREi00(", int, ")")
| IREs00(str) =>
  fprint!(out, "IREs00(", str, ")")
//
| IREint(tok) =>
  fprint!(out, "IREint(", tok, ")")
| IREbtf(tok) =>
  fprint!(out, "IREbtf(", tok, ")")
| IREchr(tok) =>
  fprint!(out, "IREchr(", tok, ")")
| IREflt(tok) =>
  fprint!(out, "IREflt(", tok, ")")
| IREstr(tok) =>
  fprint!(out, "IREstr(", tok, ")")
//
| IREtop(tok) =>
  fprint!(out, "IREtop(", tok, ")")
//
| IREvar(d2v) =>
  fprint!(out, "IREvar(", d2v, ")")
//
| IREcon1(d2c) =>
  fprint!(out, "IREcon1(", d2c, ")")
| IREcst1(d2c) =>
  fprint!(out, "IREcst1(", d2c, ")")
//
| IREfcon(d2c) =>
  fprint!(out, "IREfcon(", d2c, ")")
| IREfcst(d2c) =>
  fprint!(out, "IREfcst(", d2c, ")")
//
| IREtcon
  (d2c1, ti3a, ti2s) =>
  fprint!
  ( out
  , "IREtcon("
  , d2c1, "; ", ti3a, "; ", ti2s, ")")
| IREtcst
  (d2c1, ti3a, ti2s) =>
  fprint!
  ( out
  , "IREtcst("
  , d2c1, "; ", ti3a, "; ", ti2s, ")")
//
| IREtimp
  ( ire1
  , targ, irc2, tsub) =>
  fprint!
  ( out
  , "IREtimp("
  , ire1, "; "
  , targ, "; ", irc2, "; ", tsub, ")")
//
| IREdapp
  (irf0, npf1, ires) =>
  fprint!
  ( out
  , "IREdapp("
  , irf0, "; ", npf1, "; ", ires, ")")
//
| IREtrcd1
  (knd0, npf1, ires) =>
  fprint!
  ( out
  , "IREtrcd1("
  , knd0, "; ", npf1, "; ", ires, ")")
//
| IREpcon
  (ire1, lab2) =>
  fprint!
  ( out
  , "IREpcon(", ire1, "; ", lab2, ")")
| IREpbox
  (ire1, lab2, idx2) =>
  fprint!
  ( out
  , "IREpbox("
  , ire1, "; ", lab2, "; ", idx2, ")")
//
| IREproj
  (ire1, lab2, idx2) =>
  fprint!
  ( out
  , "IREproj("
  , ire1, "; ", lab2, "; ", idx2, ")")
| IREplft
  (ire1, lab2, idx2) =>
  fprint!
  ( out
  , "IREplft("
  , ire1, "; ", lab2, "; ", idx2, ")")
| IREpptr
  (ire1, lab2, idx2) =>
  fprint!
  ( out
  , "IREpptr("
  , ire1, "; ", lab2, "; ", idx2, ")")
//
| IRElet(irds, ire1) =>
  fprint!
  ( out
  , "IRElet(", irds, "; ", ire1, ")")
| IREwhere(ire1, irds) =>
  fprint!
  ( out
  , "IREwhere(", ire1, "; ", irds, ")")
//
| IREseqn
  (ires, ire1) =>
  fprint!
  ( out
  , "IREseqn(", ires, "; ", ire1, ")")
//
| IREassgn(irel, irer) =>
  fprint!
  ( out
  , "IREassgn(", irel, "; ", irer, ")")
//
| IREift1
  (ire1, ire2, opt3) =>
  fprint!
  ( out, "IREift1("
  , ire1, "; ", ire2, "; ", opt3, ")")
//
| IREcase
  (knd0, ire1, ircls) =>
  fprint!
  ( out, "IREcase("
  , knd0, "; ", ire1, "; ", "...", ")")
//
| IRElam
  (knd0, farg, body) =>
  fprint!
  ( out, "IRElam("
  , knd0, "; ", farg, "; ", body, ")")
| IREfix
  (knd0, d2v0, farg, body) =>
  fprint!
  ( out, "IREfix("
  , knd0, "; "
  , d2v0, "; ", farg, "; ", body, ")")
//
| IREtry0(ire1, ircls) =>
  fprint!
  ( out
  , "IREtry0(", ire1, "; ", "...", ")")
//
| IREaddr(ire1) =>
  (
    fprint!(out, "IREaddr(", ire1, ")")
  )
| IREflat(ire1) =>
  (
    fprint!(out, "IREflat(", ire1, ")")
  )
| IREtalf(ire1) =>
  (
    fprint!(out, "IREtalf(", ire1, ")")
  )
//
| IREfold(ire1) =>
  (
    fprint!(out, "IREfold(", ire1, ")")
  )
//
| IREeval
  (knd0, ire1) =>
  fprint!
  ( out
  , "IREeval(", knd0, "; ", ire1, ")")
| IREfree
  (knd0, ire1) =>
  fprint!
  ( out
  , "IREfree(", knd0, "; ", ire1, ")")
//
| IREraise(ire1) =>
  (
    fprint!(out, "IREraise(", ire1, ")")
  )
//
| IRElazy(ire1) =>
  (
    fprint!(out, "IRElazy(", ire1, ")")
  )
| IREllazy
  (ire1, ires(*frees*)) =>
  fprint!
  ( out
  , "IREllazy(", ire1, "; ", ires, ")")
//
| IREnone0(   ) =>
  (
    fprint!(out, "IREnone0(", ")")
  )
|
IREnone1(d3e1) =>
let
  val loc1 = x0.loc()
in
  fprint!
  (out, "IREnone1(", loc1, ":", d3e1, ")")
end
//
)
//
(* ****** ****** *)
//
implement
print_irgua(x0) =
fprint_irgua(stdout_ref, x0)
implement
prerr_irgua(x0) =
fprint_irgua(stderr_ref, x0)
//
implement
fprint_irgua
  (out, x0) =
(
case+
x0.node() of
| IRGUAexp(ire) =>
  fprint!
  (out, "IRGUAexp(", ire, ")")
| IRGUAmat(ire, irp) =>
  fprint!
  (out, "IRGUAmat(", ire, "; ", irp, ")")
) (* end of [fprint_irgua] *)
//
(* ****** ****** *)
//
implement
print_irclau(x0) =
fprint_irclau(stdout_ref, x0)
implement
prerr_irclau(x0) =
fprint_irclau(stderr_ref, x0)
//
implement
print_irgpat(x0) =
fprint_irgpat(stdout_ref, x0)
implement
prerr_irgpat(x0) =
fprint_irgpat(stderr_ref, x0)
//
implement
fprint_irclau
  (out, x0) =
(
case+
x0.node() of
//
|
IRCLAUpat(irgp) =>
fprint!
(out, "IRCLAUpat(", irgp, ")")
//
|
IRCLAUexp(irgp, d0e0) =>
fprint!
(out, "IRCLAUexp(", irgp, "; ", d0e0, ")")
//
) (* end of [fprint_irclau] *)
//
implement
fprint_irgpat
  (out, x0) =
(
case+
x0.node() of
//
|
IRGPATpat(irp) =>
fprint!
(out, "IRGPATpat(", irp, ")")
//
|
IRGPATgua(irp, irgs) =>
fprint!
(out, "IRGPATgua(", irp, "; ", irgs, ")")
//
) (* end of [fprint_irgpat] *)
//
(* ****** ****** *)
//
implement
print_irdcl(x0) =
fprint_irdcl(stdout_ref, x0)
implement
prerr_irdcl(x0) =
fprint_irdcl(stderr_ref, x0)
//
local

implement
fprint_val<irvaldecl> = fprint_irvaldecl
implement
fprint_val<irvardecl> = fprint_irvardecl
implement
fprint_val<irfundecl> = fprint_irfundecl

in(*in-of-local*)

implement
fprint_irdcl
  (out, x0) =
(
case+ x0.node() of
//
| IRCstatic
  (tok, irc1) =>
  fprint!
  ( out
  , "IRCstatic("
  , tok, "; ", irc1, ")")
| IRCextern
  (tok, irc1) =>
  fprint!
  ( out
  , "IRCextern("
  , tok, "; ", irc1, ")")
//
| IRCinclude
  ( tok
  , src, knd
  , fopt, body) =>
  (
  fprint!
  ( out
  , "IRCinclude("
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
| IRClocal
  (head, body) =>
  fprint!
  ( out
  , "IRClocal("
  , head, "; ", body, ")")
//
| IRCvaldclst
  (knd, mopt, irds) =>
  fprint!
  ( out
  , "IRCvaldclst("
  , knd, "; ", mopt, "; ", irds, ")")
//
| IRCvardclst
  (knd, mopt, irds) =>
  fprint!
  ( out
  , "IRCvardclst("
  , knd, "; ", mopt, "; ", irds, ")")
//
| IRCfundclst
  (knd, mopt, tqas, irds) =>
  fprint!
  ( out
  , "IRCfundclst("
  , knd, "; ", mopt, "; ", tqas, "; ", irds, ")")
//
| IRCimplmnt3
  ( knd, mopt
  , sqas, tqas, id2c
  , ti3a, ti2s, iras, body) =>
  fprint!
  ( out
  , "IRCimplmnt3("
  , knd, "; ", mopt, "; "
  , sqas, "; ", tqas, "; ", id2c, "; "
  , ti3a, "; ", ti2s, "; ", iras, "; ", body, ")")
//
| IRCnone0() =>
    fprint!(out, "IRCnone0(", ")")
| IRCnone1(d3cl) =>
    fprint!(out, "IRCnone1(", d3cl, ")")
//
)
//
end // end of [local]
//
(* ****** ****** *)
//
implement
print_irvaldecl(x0) =
fprint_irvaldecl(stdout_ref, x0)
implement
prerr_irvaldecl(x0) =
fprint_irvaldecl(stderr_ref, x0)
//
implement
fprint_irvaldecl
  (out, x0) = let
//
val+IRVALDECL(rcd) = x0
//
in
  fprint!
  ( out
  , "IRVALDECL@{"
  , ", pat=", rcd.pat
  , ", def=", rcd.def, "}")
end // end of [fprint_irvaldecl]
//
(* ****** ****** *)
//
implement
print_irvardecl(x0) =
fprint_irvardecl(stdout_ref, x0)
implement
prerr_irvardecl(x0) =
fprint_irvardecl(stderr_ref, x0)
//
implement
fprint_irvardecl
  (out, x0) = let
//
val+IRVARDECL(rcd) = x0
//
in
  fprint!
  ( out
  , "IRVARDECL@{"
  , ", d2v=", rcd.d2v
  , ", ini=", rcd.ini, "}")
end // end of [fprint_irvardecl]
//
(* ****** ****** *)
//
implement
print_irfundecl(x0) =
fprint_irfundecl(stdout_ref, x0)
implement
prerr_irfundecl(x0) =
fprint_irfundecl(stderr_ref, x0)
//
implement
fprint_irfundecl
  (out, x0) = let
//
val+IRFUNDECL(rcd) = x0
//
in
  fprint!
  ( out
  , "IRFUNDECL@{"
  , ", nam=", rcd.nam
  , ", d2c=", rcd.d2c
  , ", f2g=", rcd.f2g
(*
  , ", f3g=", rcd.f3g
*)
  , ", def=", rcd.def, "}")
end (*let*) // end of [fprint_irfundecl]
//
(* ****** ****** *)

(* end of [ATS3/XANADU_srcgen1_xinterp_srcgen1_intrep0_print0.dats] *)

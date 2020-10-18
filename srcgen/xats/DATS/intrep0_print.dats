(***********************************************************************)
(*                                                                     *)
(*                         Applied Type System                         *)
(*                                                                     *)
(***********************************************************************)

(*
** ATS/Xanadu - Unleashing the Potential of Types!
** Copyright (C) 2020 Hongwei Xi, ATS Trustful Software, Inc.
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
// Start Time: June, 2020
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
#staload "./../SATS/symbol.sats"
//
(* ****** ****** *)
#staload "./../SATS/label0.sats"
(* ****** ****** *)
#staload "./../SATS/lexing.sats"
(* ****** ****** *)

#staload "./../SATS/dynexp0.sats"

(* ****** ****** *)

#staload "./../SATS/staexp2.sats"
#staload "./../SATS/statyp2.sats"

(* ****** ****** *)

#staload "./../SATS/intrep0.sats"

(* ****** ****** *)

implement
fprint_val<h0srt> = fprint_h0srt

(* ****** ****** *)

implement
fprint_val<htcst> = fprint_htcst
implement
fprint_val<htvar> = fprint_htvar

(* ****** ****** *)

implement
fprint_val<h0typ> = fprint_h0typ

(* ****** ****** *)

implement
fprint_val<hdvar> = fprint_hdvar
implement
fprint_val<hdcon> = fprint_hdcon
implement
fprint_val<hdcst> = fprint_hdcst

(* ****** ****** *)

implement
fprint_val<h0pat> = fprint_h0pat
implement
fprint_val<hfarg> = fprint_hfarg

(* ****** ****** *)

implement
fprint_val<h0exp> = fprint_h0exp

(* ****** ****** *)
//
implement
fprint_val<h0gua> = fprint_h0gua
implement
fprint_val<h0clau> = fprint_h0clau
implement
fprint_val<h0gpat> = fprint_h0gpat
//
(* ****** ****** *)
implement
fprint_val<htqarg> = fprint_htqarg
(* ****** ****** *)

implement
fprint_val<h0dcl> = fprint_h0dcl

(* ****** ****** *)
//
local
#staload "./../SATS/stamp0.sats"
in
overload fprint with fprint_stamp
end // end of [local]
//
(* ****** ****** *)
//
implement
print_h0srt(x0) =
fprint_h0srt(stdout_ref, x0)
implement
prerr_h0srt(x0) =
fprint_h0srt(stderr_ref, x0)
//
implement
fprint_h0srt(out, x0) =
(
case+ x0 of
|
HSTid0(sym) =>
fprint!(out, "HSTid0(", sym, ")")
|
HSTint(int) =>
fprint!(out, "HSTint(", int, ")")
|
HSTfun(arg, res) =>
fprint!
( out
, "HSTfun(", arg, "; ", res, ")")
|
HSTnone1(_) =>
fprint!(out, "HSTnone1(", "...", ")")
)
//
(* ****** ****** *)
//
implement
print_htcst(x0) =
fprint_htcst(stdout_ref, x0)
implement
prerr_htcst(x0) =
fprint_htcst(stderr_ref, x0)
//
implement
fprint_htcst(out, x0) =
(
fprint!
(out, sym, "(", stamp, ")");
(*
fprint!(out, ": ", x0.sort());
*)
) where
{
val sym = x0.sym() and stamp = x0.stamp()
} (* end of [fprint_htcst] *)
//
(* ****** ****** *)
//
implement
print_htvar(x0) =
fprint_htvar(stdout_ref, x0)
implement
prerr_htvar(x0) =
fprint_htvar(stderr_ref, x0)
//
implement
fprint_htvar(out, x0) =
(
fprint!
(out, sym, "(", stamp, ")");
(*
fprint!(out, ": ", x0.sort());
*)
) where
{
val sym = x0.sym() and stamp = x0.stamp()
} (* end of [fprint_htvar] *)
//
(* ****** ****** *)
//
implement
print_h0typ(x0) =
fprint_h0typ(stdout_ref, x0)
implement
prerr_h0typ(x0) =
fprint_h0typ(stderr_ref, x0)
//
implement
fprint_h0typ(out, x0) =
(
case+
x0.node() of
//
| H0Tbas(sym) =>
  fprint!(out, "H0Tsym(", sym, ")")
//
| H0Tcst(htc) =>
  fprint!(out, "H0Tcst(", htc, ")")
//
| H0Tvar(htv) =>
  fprint!(out, "H0Tvar(", htv, ")")
//
| H0Tlft(h0t) =>
  fprint!(out, "H0Tlft(", h0t, ")")
//
| H0Tfun
  (npf, h0ts, h0t1) =>
  fprint!
  ( out
  , "H0Tfun("
  , npf, "; ", h0ts, "; ", h0t1, ")")
//
| H0Tapp
  (h0t1, h0ts) =>
  fprint!
  ( out
  , "H0Tapp(", h0t1, "; ", h0ts, ")")
| H0Tlam
  (htvs, h0t1) =>
  fprint!
  ( out
  , "H0Tlam(", htvs, "; ", h0t1, ")")
//
| H0Ttyrec
  (knd0, npf1, lhts) =>
  fprint!
  ( out
  , "H0Ttyrec("
  , knd0, "; ", npf1, "; ", lhts, ")")  
//
| H0Tnone1(_) =>
  fprint!(out, "H0Tnone1(", "...", ")")
//
(*
| _(* H0T... *) => fprint!(out, "H0T...(...)")
*)
) where
{
  implement
  fprint_val<labh0typ> = fprint_labh0typ
}
//
(* ****** ****** *)
//
implement
print_labh0typ(lx) =
fprint_labh0typ(stdout_ref, lx)
implement
prerr_labh0typ(lx) =
fprint_labh0typ(stderr_ref, lx)
//
implement
fprint_labh0typ(out, lx) =
(
case+ lx of
| SLABELED
  (l0, x0) => fprint!(out, l0, "=", x0)
) (* end of [fprint_labh0typ] *)
//
(* ****** ****** *)
//
implement
print_hdcon(x0) =
fprint_hdcon(stdout_ref, x0)
implement
prerr_hdcon(x0) =
fprint_hdcon(stderr_ref, x0)
//
implement
fprint_hdcon(out, x0) =
(
fprint!
(out, sym, "(", stamp, ")");
(*
fprint!(out, ": ", x0.type());
*)
) where
{
val sym = x0.sym() and stamp = x0.stamp()
} (* end of [fprint_hdcon] *)
//
(* ****** ****** *)
//
implement
print_hdcst(x0) =
fprint_hdcst(stdout_ref, x0)
implement
prerr_hdcst(x0) =
fprint_hdcst(stderr_ref, x0)
//
implement
fprint_hdcst(out, x0) =
(
fprint!
(out, sym, "(", stamp, ")");
(*
fprint!(out, ": ", x0.type());
*)
) where
{
val sym = x0.sym() and stamp = x0.stamp()
} (* end of [fprint_hdcst] *)
//
(* ****** ****** *)
//
implement
print_hdvar(x0) =
fprint_hdvar(stdout_ref, x0)
implement
prerr_hdvar(x0) =
fprint_hdvar(stderr_ref, x0)
//
implement
fprint_hdvar(out, x0) =
(
fprint!
(out, sym, "(", stamp, ")");
(*
fprint!(out, ": ", x0.type());
*)
) where
{
val sym = x0.sym() and stamp = x0.stamp()
} (* end of [fprint_hdvar] *)
//
(* ****** ****** *)
//
implement
print_h0pat(x0) =
fprint_h0pat(stdout_ref, x0)
implement
prerr_h0pat(x0) =
fprint_h0pat(stderr_ref, x0)
//
implement
fprint_h0pat(out, x0) =
(
case+
x0.node() of
//
| H0Pnil() =>
  fprint!(out, "H0Pnil(", ")")
//
| H0Pany() =>
  fprint!(out, "H0Pany(", ")")
//
| H0Pvar(hdv) =>
  fprint!(out, "H0Pvar(", hdv, ")")
//
| H0Pcon(hdc) =>
  fprint!(out, "H0Pcon(", hdc, ")")
//
| H0Pbang(h0p) =>
  fprint!(out, "H0Pbang(", h0p, ")")
| H0Pflat(h0p) =>
  fprint!(out, "H0Pflat(", h0p, ")")
| H0Pfree(h0p) =>
  fprint!(out, "H0Pfree(", h0p, ")")
//
| H0Pdapp
  (h0f0, npf1, h0ps) =>
  fprint!
  ( out
  , "H0Pdapp("
  , h0f0, "; ", npf1, "; ", h0ps, ")")
//
| H0Ptuple
  (knd0, npf1, h0ps) =>
  fprint!
  ( out
  , "H0Ptuple("
  , knd0, "; ", npf1, "; ", h0ps, ")")
//
| H0Pnone1(_(*dataptr*)) =>
  fprint!(out, "H0Pnone1(", "...", ")")
//
(*
| _(* H0P... *) => fprint!(out, "H0P...(...)")
*)
)
//
(* ****** ****** *)
//
implement
print_hfarg(x0) =
fprint_hfarg(stdout_ref, x0)
implement
prerr_hfarg(x0) =
fprint_hfarg(stderr_ref, x0)
//
implement
fprint_hfarg(out, x0) =
(
case+
x0.node() of
//
|
HFARGnpats
(npf0, h0ps) =>
fprint!
( out
, "HFARGnpats(", npf0, "; ", h0ps, ")")
//
| HFARGnone0 _ =>
  fprint!(out, "HFARGnone0(", ")")
| HFARGnone1 _ =>
  fprint!(out, "HFARGnone1(", "...", ")")
)
//
(* ****** ****** *)
//
implement
print_htiarg(x0) =
fprint_htiarg(stdout_ref, x0)
implement
prerr_htiarg(x0) =
fprint_htiarg(stderr_ref, x0)
//
implement
fprint_htiarg(out, x0) =
(
case+ x0 of
//
| HTIARGnone() =>
  fprint!
  (out, "HTIARGnone(", ")")
| HTIARGsome(h0ts) =>
  fprint!
  (out, "HTIARGsome(", h0ts, ")")
//
)
//
(* ****** ****** *)
//
implement
print_h0exp(x0) =
fprint_h0exp(stdout_ref, x0)
implement
prerr_h0exp(x0) =
fprint_h0exp(stderr_ref, x0)
//
implement
fprint_h0exp(out, x0) =
(
case+
x0.node() of
//
| H0Ei00(int) =>
  fprint!(out, "H0Ei00(", int, ")")
| H0Eb00(btf) =>
  fprint!(out, "H0Eb00(", btf, ")")
| H0Es00(str) =>
  fprint!(out, "H0Es00(", str, ")")
//
| H0Eint(tok) =>
  fprint!(out, "H0Eint(", tok, ")")
| H0Ebtf(tok) =>
  fprint!(out, "H0Ebtf(", tok, ")")
| H0Echr(tok) =>
  fprint!(out, "H0Echr(", tok, ")")
//
| H0Eflt(tok) =>
  fprint!(out, "H0Eflt(", tok, ")")
| H0Estr(tok) =>
  fprint!(out, "H0Estr(", tok, ")")
//
| H0Etop(tok) =>
  fprint!(out, "H0Etop(", tok, ")")
//
| H0Evar(hdv) =>
  fprint!(out, "H0Evar(", hdv, ")")
| H0Evknd(knd, hdv) =>
  fprint!
  ( out
  , "H0Evknd(", knd, "; ", hdv, ")")
//
| H0Efcon(hdc) =>
  fprint!(out, "H0Efcon(", hdc, ")")
| H0Efcst(hdc) =>
  fprint!(out, "H0Efcst(", hdc, ")")
//
| H0Etcon(hdc, tia) =>
  fprint!
  ( out
  , "H0Etcon(", hdc, "; ", tia, ")")
| H0Etcst(hdc, tia) =>
  fprint!
  ( out
  , "H0Etcst(", hdc, "; ", tia, ")")
//
(*
| H0Etimp
  (stmp, h0e1) =>
  fprint!
  ( out
  , "H0Etimp(", stmp, "; ", h0e1, ")")
*)
| H0Etimp
  (stmp, hdc0, targ, hdcl, tsub) =>
  fprint!
  ( out
  , "H0Etimp("
  , stmp, "; "
  , hdc0, "; ", targ, "; ", hdcl, "; ", tsub, ")")
//
| H0Edapp
  (h0f0, npf1, h0es) =>
  fprint!
  ( out
  , "H0Edapp("
  , h0f0, "; ", npf1, "; ", h0es, ")")
//
| H0Epcon
  (h0e1, lab2) =>
  fprint!
  ( out
  , "H0Epcon(", h0e1, "; ", lab2, ")")
//
| H0Epbox
  ( h0e1(*rcd*)
  , lab2, idx2) =>
  fprint!
  ( out, "H0Epbox("
  , h0e1, "; ", lab2, "; ", idx2, ")")
//
| H0Eproj
  ( h0e1(*rcd*)
  , lab2, idx2) =>
  fprint!
  ( out, "H0Eproj("
  , h0e1, "; ", lab2, "; ", idx2, ")")
| H0Eplft
  ( h0e1(*rcd*)
  , lab2, idx2) =>
  fprint!
  ( out, "H0Eplft("
  , h0e1, "; ", lab2, "; ", idx2, ")")
| H0Epptr
  ( h0e1(*rcd*)
  , lab2, idx2) =>
  fprint!
  ( out, "H0Epptr("
  , h0e1, "; ", lab2, "; ", idx2, ")")
//
| H0Elet
  ( dcls
  , h0e1(*scope*)) =>
  (
   fprint!
   ( out
   , "H0Elet(", dcls, "; ", h0e1, ")")
  )
//
| H0Eseqn
  ( h0es(*semi*)
  , h0e1(*last*) ) =>
  fprint!
  ( out
  , "H0Eseqn(", h0es, "; ", h0e1, ")")
//
| H0Etuple
  (knd0, npf1, h0es) =>
  fprint!
  ( out
  , "H0Etuple("
  , knd0, "; ", npf1, "; ", h0es, ")")
//
| H0Eassgn
  (h0e1, h0e2) =>
  fprint!
  ( out
  , "H0Eassgn(", h0e1, "; ", h0e2, ")")
//
| H0Eif0
  (h0e1, h0e2, opt3) =>
  fprint!
  ( out
  , "H0Eif0("
  , h0e1, "; ", h0e2, "; ", opt3, ")")
//
| H0Ecase
  (knd0, h0e1, hcls) =>
  fprint!
  ( out, "H0Ecase("
  , knd0, "; ", h0e1, "; ", hcls, ")")
//
| H0Elam
  (knd0, hfas, body) =>
  fprint!
  ( out, "H0Elam("
  , knd0, "; ", hfas, "; ", body, ")")
| H0Efix
  (knd0, fid1, hfas, body) =>
  fprint!
  ( out, "H0Efix("
  , knd0, "; ", fid1, "; ", hfas, "; ", body, ")")
//
| H0Etry0
  (knd0, h0e1, hcls) =>
  fprint!
  ( out, "H0Etry0("
  , knd0, "; ", h0e1, "; ", hcls, ")")
//
| H0Eaddr(h0e1) =>
  (
   fprint!(out, "H0Eaddr(", h0e1, ")")
  )
| H0Eflat(h0e1) =>
  (
   fprint!(out, "H0Eflat(", h0e1, ")")
  )
| H0Etalf(h0e1) =>
  (
   fprint!(out, "H0Etalf(", h0e1, ")")
  )
//
| H0Efold(h0e1) =>
  (
   fprint!(out, "H0Efold(", h0e1, ")")
  )
//
| H0Eeval(knd0, h0e1) =>
  fprint!
  ( out
  , "H0Eeval(", knd0, "; ", h0e1, ")")
| H0Efree(knd0, h0e1) =>
  fprint!
  ( out
  , "H0Efree(", knd0, "; ", h0e1, ")")
//
| H0Eraise(h0e1) =>
  (
   fprint!(out, "H0Eraise(", h0e1, ")")
  )
//
| H0Elazy(h0e1) =>
  (
    fprint!(out, "H0Elazy(", h0e1, ")")
  )
| H0Ellazy
  (h0e1, h0es(*frees*)) =>
  fprint!
  ( out
  , "H0Ellazy(", h0e1, "; ", h0es, ")")
//
| H0Enone0() => // nil/none/null
  fprint!(out, "H0Enone0(", ")")
//
| H0Enone1(_) => // HX: for ignores
  fprint!(out, "H0Enone1(", "**DATA**", ")")
//
(*
| _(* H0E... *) => fprint!(out, "H0E...(...)")
*)
)
//
(* ****** ****** *)
//
implement
print_h0gua(x0) =
fprint_h0gua(stdout_ref, x0)
implement
prerr_h0gua(x0) =
fprint_h0gua(stderr_ref, x0)
//
implement
fprint_h0gua
  (out, x0) =
(
case+
x0.node() of
| H0GUAexp(h0e) =>
  fprint!
  (out, "H0GUAexp(", h0e, ")")
| H0GUAmat(h0e, h0p) =>
  fprint!
  (out, "H0GUAmat(", h0e, "; ", h0p, ")")
) (* end of [fprint_h0gua] *)
//
(* ****** ****** *)
//
implement
print_h0clau(x0) =
fprint_h0clau(stdout_ref, x0)
implement
prerr_h0clau(x0) =
fprint_h0clau(stderr_ref, x0)
//
implement
print_h0gpat(x0) =
fprint_h0gpat(stdout_ref, x0)
implement
prerr_h0gpat(x0) =
fprint_h0gpat(stderr_ref, x0)
//
implement
fprint_h0clau
  (out, x0) =
(
case+
x0.node() of
//
|
H0CLAUpat(h0gp) =>
fprint!
(out, "H0CLAUpat(", h0gp, ")")
//
|
H0CLAUexp(h0gp, d0e0) =>
fprint!
( out
, "H0CLAUexp(", h0gp, "; ", d0e0, ")")
//
) (* end of [fprint_h0clau] *)
//
implement
fprint_h0gpat
  (out, x0) =
(
case+
x0.node() of
//
|
H0GPATpat(h0p) =>
fprint!
(out, "H0GPATpat(", h0p, ")")
//
|
H0GPATgua(h0p, h0gs) =>
fprint!
(out, "H0GPATgua(", h0p, "; ", h0gs, ")")
//
) (* end of [fprint_h0gpat] *)
//
(* ****** ****** *)
//
implement
print_h0dcl(x0) =
fprint_h0dcl(stdout_ref, x0)
implement
prerr_h0dcl(x0) =
fprint_h0dcl(stderr_ref, x0)
//
local
//
implement
fprint_val<h0dcl> = fprint_h0dcl
implement
fprint_val<hfundecl> = fprint_hfundecl
implement
fprint_val<hvaldecl> = fprint_hvaldecl
implement
fprint_val<hvardecl> = fprint_hvardecl
//
in
//
implement
fprint_h0dcl(out, x0) =
(
case+
x0.node() of
//
| H0Cstatic
  (tok, h0c1) =>
  fprint!
  ( out
  , "H0Cstatic(", tok, "; ", h0c1, ")")
| H0Cextern
  (tok, h0c1) =>
  fprint!
  ( out
  , "H0Cextern(", tok, "; ", h0c1, ")")
//
| H0Clocal(head, body) =>
  fprint!
  ( out
  , "H0Clocal(", head, "; ", body, ")")
//
| H0Cfundecl
  (knd, mopt, tqas, hfds) =>
  fprint!
  ( out
  , "H0Cfundecl("
  , knd, "; ", mopt, "; ", tqas, "; ", hfds, ")")
//
| H0Cvaldecl
  (knd, mopt, hvds) =>
  fprint!
  ( out
  , "H0Cvaldecl("
  , knd, "; ", mopt, "; ", hvds, ")")
| H0Cvardecl
  (knd, mopt, hvds) =>
  fprint!
  ( out
  , "H0Cvardecl("
  , knd, "; ", mopt, "; ", hvds, ")")
//
| H0Cexcptcon(hdcs) =>
  fprint!
  (out, "H0Cexcptcon(", hdcs, ")")
//
| H0Cimpdecl3
  ( knd
  , stmp, mopt
  , tqas, hdc0, htia, hfas, body) =>
  fprint!
  ( out
  , "H0Cimpdecl3("
  , knd, "; "
  , stmp, "; "
  , mopt, "; "
  , tqas, "; "
  , hdc0, "; ", htia, "; ", hfas, "; ", body, ")")
//
| H0Cnone1(_) =>
  fprint!(out, "H0Cnone1(", "...", ")")
//
(*
| _(* H0C... *) => fprint!(out, "H0C...(...)")
*)
)
end // end of [local]
//
(* ****** ****** *)
//
implement
print_htqarg(x0) =
fprint_htqarg(stdout_ref, x0)
implement
prerr_htqarg(x0) =
fprint_htqarg(stderr_ref, x0)
//
implement
fprint_htqarg
  (out, x0) =
(
  fprint!(out, "<", x0.htvs(), ">")
) (* end of [fprint_htqarg] *)
//
(* ****** ****** *)
//
implement
print_hvaldecl(x0) =
fprint_hvaldecl(stdout_ref, x0)
implement
prerr_hvaldecl(x0) =
fprint_hvaldecl(stderr_ref, x0)
//
implement
fprint_hvaldecl
  (out, x0) = let
//
val+HVALDECL(rcd) = x0
//
in
  fprint!
  ( out
  , "HVALDECL@{"
  , ", pat=", rcd.pat
  , ", def=", rcd.def, "}")
end // end of [fprint_hvaldecl]
//
(* ****** ****** *)
//
implement
print_hvardecl(x0) =
fprint_hvardecl(stdout_ref, x0)
implement
prerr_hvardecl(x0) =
fprint_hvardecl(stderr_ref, x0)
//
implement
fprint_hvardecl
  (out, x0) = let
//
val+HVARDECL(rcd) = x0
//
in
  fprint!
  ( out
  , "HVARDECL@{"
  , ", hdv=", rcd.hdv
  , ", wth=", rcd.wth
  , ", ini=", rcd.ini, "}")
end // end of [fprint_hvardecl]
//
(* ****** ****** *)

implement
print_hfundecl(x0) =
fprint_hfundecl(stdout_ref, x0)
implement
prerr_hfundecl(x0) =
fprint_hfundecl(stderr_ref, x0)

implement
fprint_hfundecl
  (out, x0) = let
//
val+HFUNDECL(rcd) = x0
//
in
//
case+
rcd.hag of
| None() =>
  fprint!
  ( out
  , "HFUNDECL@{"
  , "nam=", rcd.nam, ", "
  , "hdc=", rcd.hdc, ", ", "}")
| Some(rcd_hag) =>
  fprint!
  ( out
  , "HFUNDECL@{"
  , "nam=", rcd.nam, ", "
  , "hdc=", rcd.hdc, ", "
  , "hag=", rcd_hag, ", "
  , "def=", rcd.def, ", ", "rtp=", rcd.rtp, ", ", "}")
//
end // end of [fprint_hfundecl]

(* ****** ****** *)

(* end of [xats_intrep0_print.dats] *)

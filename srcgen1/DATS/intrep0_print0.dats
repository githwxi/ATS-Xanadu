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
#staload
FP0 = "./../SATS/filpath.sats"
(* ****** ****** *)
//
#staload "./../SATS/xsymbol.sats"
//
(* ****** ****** *)
#staload "./../SATS/xlabel0.sats"
(* ****** ****** *)
#staload "./../SATS/lexing0.sats"
(* ****** ****** *)

#staload "./../SATS/staexp0.sats"
#staload "./../SATS/dynexp0.sats"

(* ****** ****** *)

#staload "./../SATS/staexp1.sats"
#staload "./../SATS/dynexp1.sats"

(* ****** ****** *)

#staload "./../SATS/staexp2.sats"
#staload "./../SATS/statyp2.sats"
#staload "./../SATS/dynexp2.sats"

(* ****** ****** *)

#staload "./../SATS/dynexp3.sats"

(* ****** ****** *)

#staload "./../SATS/intrep0.sats"

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
fprint_val<h0var> = fprint_h0var
implement
fprint_val<h0con> = fprint_h0con
implement
fprint_val<h0cst> = fprint_h0cst

(* ****** ****** *)

implement
fprint_val<h0pat> = fprint_h0pat
implement
fprint_val<h0fag> = fprint_h0fag

(* ****** ****** *)

implement
fprint_val<h0exp> = fprint_h0exp

(* ****** ****** *)

implement
fprint_val<h0dcl> = fprint_h0dcl

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
//
local
#staload "./../SATS/xstamp0.sats"
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
//
| HSTid0(sym) =>
  fprint!
  (out, "HSTid0(", sym, ")")
| HSTint(int) =>
  fprint!
  (out, "HSTint(", int, ")")
//
| HSTfun(arg, res) =>
  fprint!
  ( out
  , "HSTfun(", arg, "; ", res, ")")
//
|
HSTnone0() =>
fprint!(out, "HSTnone0(", ")")
|
HSTnone1(s2rt) =>
let
  val
  s2rt = $UN.cast{sort2}(s2rt)
  val () =
  fprint!(out, "HSTnone1(sort2)")
in
  fprint!(out, "HSTnone1(", s2rt, ")")
end
//
) (*case*) // end of [fprint_h0srt]
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
| H0Ttyext
  (name, h0ts) =>
  fprint!
  ( out
  , "H0Ttyext(", name, "; ", h0ts, ")")
//
| H0Ttyrec
  (knd0, npf1, lhts) =>
  fprint!
  ( out
  , "H0Ttyrec("
  , knd0, "; ", npf1, "; ", lhts, ")")  
//
|
H0Tnone0() =>
fprint!(out, "H0Tnone0(", ")")
//
|
H0Tnone1(t2p1) =>
let
  val
  t2p1 = $UN.cast{t2ype}(t2p1)
  val () =
  fprint!(out, "H0Tnone1([t2ype])")
in
  fprint!(out, "H0Tnone1(", t2p1, ")")
end
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
|
SLABELED
(l0, x0) => fprint!(out, l0, "=", x0)
) (* end of [fprint_labh0typ] *)
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
  fprint!( out, "<", x0.htvs(), ">" )
) (* end of [fprint_htqarg] *)
//
(* ****** ****** *)
//
implement
print_h0con(x0) =
fprint_h0con(stdout_ref, x0)
implement
prerr_h0con(x0) =
fprint_h0con(stderr_ref, x0)
//
implement
fprint_h0con(out, x0) =
(
fprint!
(out, sym, "(", stamp, ")");
(*
fprint!(out, ": ", x0.type());
*)
) where
{
val sym = x0.sym() and stamp = x0.stamp()
} (* end of [fprint_h0con] *)
//
(* ****** ****** *)
//
implement
print_h0cst(x0) =
fprint_h0cst(stdout_ref, x0)
implement
prerr_h0cst(x0) =
fprint_h0cst(stderr_ref, x0)
//
implement
fprint_h0cst(out, x0) =
(
fprint!
(out, sym, "(", stamp, ")");
(*
fprint!(out, ": ", x0.type());
*)
) where
{
val sym = x0.sym() and stamp = x0.stamp()
} (* end of [fprint_h0cst] *)
//
(* ****** ****** *)
//
implement
print_h0var(x0) =
fprint_h0var(stdout_ref, x0)
implement
prerr_h0var(x0) =
fprint_h0var(stderr_ref, x0)
//
implement
fprint_h0var(out, x0) =
(
fprint!
(out, sym, "(", stamp, ")");
(*
fprint!(out, ": ", x0.type());
*)
) where
{
val sym = x0.sym() and stamp = x0.stamp()
} (* end of [fprint_h0var] *)
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
(*
fprint!(out, ":", x0.type())
*)
) where
{
val () =
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
| H0Pi00(int) =>
  fprint!(out, "H0Pi00(", int, ")")
| H0Pb00(btf) =>
  fprint!(out, "H0Pb00(", btf, ")")
| H0Pc00(chr) =>
  fprint!(out, "H0Pc00(", chr, ")")
| H0Ps00(str) =>
  fprint!(out, "H0Ps00(", str, ")")
//
| H0Pint(tok) =>
  fprint!(out, "H0Pint(", tok, ")")
| H0Pbtf(tok) =>
  fprint!(out, "H0Pbtf(", tok, ")")
| H0Pchr(tok) =>
  fprint!(out, "H0Pchr(", tok, ")")
| H0Pstr(tok) =>
  fprint!(out, "H0Pstr(", tok, ")")
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
| H0Pdap1(h0f0) =>
  fprint!(out, "H0Pdap1(", h0f0, ")")
| H0Pdapp
  (h0f0, npf1, h0ps) =>
  fprint!
  ( out
  , "H0Pdapp("
  , h0f0, "; ", npf1, "; ", h0ps, ")")
//
| H0Ptrcd1
  (knd0, npf1, h0ps) =>
  fprint!
  ( out
  , "H0Ptrcd1("
  , knd0, "; ", npf1, "; ", h0ps, ")")
//
| H0Pnone1(d3p1) =>
  let
  val
  d3p1 = $UN.cast{d3pat}(d3p1)
  val () =
  fprint!(out, "H0Pnone1(d3pat)")
  in
  fprint!(out, "H0Pnone1(", d3p1, ")")
  end
//
(*
| _(* H0P... *) => fprint!(out, "H0P...(...)")
*)
) (*val*) } (*where*) // end of [fprint_h0pat]
//
(* ****** ****** *)
//
implement
print_h0fag(x0) =
fprint_h0fag(stdout_ref, x0)
implement
prerr_h0fag(x0) =
fprint_h0fag(stderr_ref, x0)
//
(* ****** ****** *)
//
implement
fprint_h0fag(out, x0) =
(
case+
x0.node() of
//
|
H0FAGnpats
(npf0, h0ps) =>
fprint!
( out
, "H0FAGnpats(", npf0, "; ", h0ps, ")")
//
|
H0FAGnone0 _ =>
fprint!(out, "H0FAGnone0(", ")")
|
H0FAGnone1 _ =>
fprint!(out, "H0FAGnone1(", "...", ")")
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
|
HTIARGnone() =>
fprint!(out, "HTIARGnone(", ")")
|
HTIARGsome(h0ts) =>
fprint!(out, "HTIARGsome(", h0ts, ")")
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
(* ****** ****** *)
//
implement
fprint_h0exp(out, x0) =
(
(*
fprint!(out, ":", x0.type())
*)
) where
{
val () =
(
case+
x0.node() of
//
| H0Ei00(int) =>
  fprint!(out, "H0Ei00(", int, ")")
| H0Eb00(btf) =>
  fprint!(out, "H0Eb00(", btf, ")")
| H0Ec00(chr) =>
  fprint!(out, "H0Ec00(", chr, ")")
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
| H0Ekvar(knd, hdv) =>
  fprint!
  ( out
  , "H0Ekvar(", knd, "; ", hdv, ")")
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
  (stmp, hcst, targ, hdcl, tsub) =>
  fprint!
  ( out
  , "H0Etimp("
  , stmp, "; "
  , hcst, "; ", targ, "; ", hdcl, "; ", tsub, ")")
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
| H0Etrcd1
  (knd0, npf1, h0es) =>
  fprint!
  ( out
  , "H0Etrcd1("
  , knd0, "; ", npf1, "; ", h0es, ")")
//
| H0Eassgn
  (h0e1, h0e2) =>
  fprint!
  ( out
  , "H0Eassgn(", h0e1, "; ", h0e2, ")")
//
| H0Eift1
  (h0e1, h0e2, opt3) =>
  fprint!
  ( out
  , "H0Eift1("
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
| H0Enone1(d3e1) => // HX: for ignores
  let
  val
  d3e1 = $UN.cast{d3exp}(d3e1)
  val () =
  fprint!(out, "H0Enone1(d3exp)")
  in
  fprint!(out, "H0Enone1(", d3e1, ")")
  end
//
(*
| _(* H0E... *) => fprint!(out, "H0E...(...)")
*)
) (*val*) } (*where*) // end of [fprint_h0exp]
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
(* ****** ****** *)
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
(* ****** ****** *)
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
(* ****** ****** *)

local
//
implement
fprint_val<h0dcl> = fprint_h0dcl
implement
fprint_val<h0fundecl> = fprint_h0fundecl
implement
fprint_val<h0valdecl> = fprint_h0valdecl
implement
fprint_val<h0vardecl> = fprint_h0vardecl
//
in
//
implement
fprint_h0dcl(out, x0) =
(
case+
x0.node() of
//
|
H0Cstatic
(tok, hdcl) =>
fprint!
( out
, "H0Cstatic(", tok, "; ", hdcl, ")")
|
H0Cextern
(tok, hdcl) =>
fprint!
( out
, "H0Cextern(", tok, "; ", hdcl, ")")
//
|
H0Clocal
(head, body) =>
fprint!
( out
, "H0Clocal(", head, "; ", body, ")")
//
|
H0Cinclude
( tok0
, src1, knd2
, fopt, body) =>
(
  fprint!
  ( out
  , "H0Cinclude("
  , "src= ", src1, "; "
  , "knd= ", knd2, "; "
  ,  fopt, "; ", body, ")")
) where
{
  val body =
  (
  case+ body of
  | None _ => "None()"
  | Some _ => "Some(<hdcls>)"): string
}
//
|
H0Cabstype
(htc1, def2) =>
fprint!
( out
, "H0Cabstype(", htc1, "; ", def2)
//
|
H0Cvaldclst
(knd, mopt, hvds) =>
fprint!
( out
, "H0Cvaldclst("
, knd, "; ", mopt, "; ", hvds, ")")
|
H0Cvardclst
(knd, mopt, hvds) =>
fprint!
( out
, "H0Cvardclst("
, knd, "; ", mopt, "; ", hvds, ")")
//
|
H0Cfundclst
(knd, mopt, tqas, hfds) =>
fprint!
( out
, "H0Cfundclst("
, knd, "; ", mopt, "; ", tqas, "; ", hfds, ")")
//
|
H0Cexcptcon(hdcs) =>
fprint!(out, "H0Cexcptcon(", hdcs, ")")
|
H0Cdatatype(htcs) =>
fprint!(out, "H0Cdatatype(", htcs, ")")
//
|
H0Cimplmnt3
( knd
, stmp, mopt
, tqas, hdc1, htia, hfas, body) =>
fprint!
( out
, "H0Cimplmnt3("
, knd, "; "
, stmp, "; "
, mopt, "; "
, tqas, "; "
, hdc1, "; ", htia, "; ", hfas, "; ", body, ")")
//
|
H0Cnone1(d3cl) =>
let
  val
  d3cl = $UN.cast{d3ecl}(d3cl)
  val () =
  fprint!(out, "H0Cnone1(d3cl)")
in
  fprint!(out, "H0Cnone1(", d3cl, ")")
end
//
(*
| _(* H0C... *) => fprint!(out, "H0C...(...)")
*)
)
end (*local*) // end of [local]

(* ****** ****** *)
//
implement
print_h0valdecl(x0) =
fprint_h0valdecl(stdout_ref, x0)
implement
prerr_h0valdecl(x0) =
fprint_h0valdecl(stderr_ref, x0)
//
(* ****** ****** *)
//
implement
fprint_h0valdecl
  (out, x0) = let
//
val+
H0VALDECL(rcd) = x0
val pat = rcd.pat
val def = rcd.def
val t2p = pat.type()
//
in
  fprint!
  ( out
  , "H0VALDECL@{"
  , ", pat=", pat
  , ", t2p=", t2p
  , ", def=", def, "}" )
end // end of [fprint_h0valdecl]
//
(* ****** ****** *)
//
implement
print_h0vardecl(x0) =
fprint_h0vardecl(stdout_ref, x0)
implement
prerr_h0vardecl(x0) =
fprint_h0vardecl(stderr_ref, x0)
//
(* ****** ****** *)
//
implement
fprint_h0vardecl
  (out, x0) = let
//
val+H0VARDECL(rcd) = x0
//
in
  fprint!
  ( out
  , "H0VARDECL@{"
  , ", hdv=", rcd.hdv
  , ", wth=", rcd.wth
  , ", ini=", rcd.ini, "}" )
end // end of [fprint_h0vardecl]
//
(* ****** ****** *)

implement
print_h0fundecl(x0) =
fprint_h0fundecl(stdout_ref, x0)
implement
prerr_h0fundecl(x0) =
fprint_h0fundecl(stderr_ref, x0)

(* ****** ****** *)

implement
fprint_h0fundecl
  (out, x0) = let
//
val+H0FUNDECL(rcd) = x0
//
in//in-of-let
//
case+
rcd.hfg of
| None() =>
  fprint!
  ( out
  , "H0FUNDECL@{"
  , "nam=", rcd.nam, ", "
  , "hdc=", rcd.hdc, ", ", "}")
| Some(rcd_hfg) =>
  fprint!
  ( out
  , "H0FUNDECL@{"
  , "nam=", rcd.nam, ", "
  , "hdc=", rcd.hdc, ", "
  , "hfg=", rcd_hfg, ", "
  , "def=", rcd.def, ", ", "rtp=", rcd.rtp, ", ", "}")
//
end // end of [fprint_h0fundecl]

(* ****** ****** *)

(* end of [xats_intrep0_print.dats] *)

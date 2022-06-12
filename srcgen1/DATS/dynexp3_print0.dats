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
LOC = "./../SATS/locinfo.sats"
#staload
FP0 = "./../SATS/filpath.sats"
//
(* ****** ****** *)
//
#staload "./../SATS/xbasics.sats"
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
implement
fprint_val<f3arg> = fprint_f3arg
//
(* ****** ****** *)
//
implement
fprint_val<d3exp> = fprint_d3exp
implement
fprint_val<t3imp> = fprint_t3imp
//
(* ****** ****** *)

implement
fprint_val<d3ecl> = fprint_d3ecl

(* ****** ****** *)
//
implement
fprint_val<d3gua> = fprint_d3gua
//
implement
fprint_val<d3clau> = fprint_d3clau
implement
fprint_val<d3gpat> = fprint_d3gpat
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
fprint!(out, ":", x0.type())
) where
{
val () =
(
case+ x0.node() of
//
| D3Pnil() =>
  fprint!(out, "D3Pnil()")
| D3Pany() =>
  fprint!(out, "D3Pany()")
//
| D3Pvar(d2v) =>
  fprint!
  (out, "D3Pvar(", d2v, ")")
//
| D3Pi00(int) =>
  fprint!
  (out, "D3Pi00(", int, ")")
| D3Pb00(btf) =>
  fprint!
  (out, "D3Pb00(", btf, ")")
| D3Pc00(chr) =>
  fprint!
  (out, "D3Pc00(", chr, ")")
| D3Ps00(str) =>
  fprint!
  (out, "D3Ps00(", str, ")")
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
| D3Pbang(d3p1) =>
  fprint!(out, "D3Pbang(", d3p1, ")")
| D3Pflat(d3p1) =>
  fprint!(out, "D3Pflat(", d3p1, ")")
| D3Pfree(d3p1) =>
  fprint!(out, "D3Pfree(", d3p1, ")")
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
| D3Psap0
  (d3f0, s2vs) =>
  fprint!
  ( out
  , "D3Psap0(", d3f0, "; ", s2vs, ")")
| D3Psap1
  (d3f0, s2vs) =>
  fprint!
  ( out
  , "D3Psap1(", d3f0, "; ", s2vs, ")")
//
| D3Pdap1(d3f0) =>
  fprint!
  ( out, "D3Pdap1(", d3f0, ")")
| D3Pdapp
  (d3f0, npf1, d3ps) =>
  fprint!
  ( out, "D3Pdapp("
  , d3f0, "; ", npf1, "; ", d3ps, ")")
//
| D3Ptrcd1
  (knd1, npf2, ldps) =>
  fprint!
  ( out, "D3Ptrcd1("
  , knd1, "; ", npf2, "; ", ldps, ")")
//
| D3Panno
  (d3p1, s1e2, s2e2) =>
  fprint!
  (out, "D3Panno(", d3p1, "; ", s2e2, ")")
//
| D3Ptcast(d3p1, t2p2) =>
  fprint!
  (out, "D3Ptcast(", d3p1, "; ", t2p2, ")")
//
| D3Pnone0
  ((*void*)) => fprint!(out, "D3Pnone0(", ")")
| D3Pnone1
  ( d1psrc ) => fprint!(out, "D3Pnone1(", d1psrc, ")")
| D3Pnone2
  ( d2psrc ) => fprint!(out, "D3Pnone2(", d2psrc, ")")
//
) (*val*) } (*where*) // end of [fprint_d3pat]
//
(* ****** ****** *)
//
implement
print_f3arg(x0) =
fprint_f3arg(stdout_ref, x0)
implement
prerr_f3arg(x0) =
fprint_f3arg(stderr_ref, x0)
//
(* ****** ****** *)
//
implement
fprint_f3arg
  (out, x0) =
(
//
case+
x0.node() of
//
|
F3ARGnone2(f2a) =>
fprint!(out, "F3ARGnone2(", f2a, ")")
|
F3ARGnone3(f3a) =>
fprint!(out, "F3ARGnone3(", f3a, ")")
//
|
F3ARGsome_met(s2es) =>
fprint!(out, "F3ARGsome_met(", s2es, ")")
//
|
F3ARGsome_dyn(npf1, d3ps) =>
fprint!
(out, "F3ARGsome_dyn(", npf1, "; ", d3ps, ")")
|
F3ARGsome_sta(s2vs, s2ps) =>
fprint!
(out, "F3ARGsome_sta(", s2vs, "; ", s2ps, ")")
//
) (* end of [fprint_f3arg] *)
//
(* ****** ****** *)
//
implement
print_ti3arg(x0) =
fprint_ti3arg(stdout_ref, x0) 
implement
prerr_ti3arg(x0) =
fprint_ti3arg(stderr_ref, x0) 
//
(* ****** ****** *)
//
implement
fprint_ti3arg
  (out, x0) =
(
case+ x0 of
|
TI3ARGnone() =>
fprint!(out, "TI3ARGnone(", ")")
|
TI3ARGsome(t2ps) =>
fprint!(out, "TI3ARGsome(", t2ps, ")")
)
//
(* ****** ****** *)
//
implement
print_ti3err(x0) =
fprint_ti3err(stdout_ref, x0) 
implement
prerr_ti3err(x0) =
fprint_ti3err(stderr_ref, x0) 
//
implement
fprint_ti3err
  (out, x0) =
(
case+ x0 of
|
TI3ERRnfd() => fprint!(out, "TI3ERRnfd()")
|
TI3ERRrec() => fprint!(out, "TI3ERRrec()")
)
//
(* ****** ****** *)
//
implement
print_d3exp(x0) =
fprint_d3exp(stdout_ref, x0) 
implement
prerr_d3exp(x0) =
fprint_d3exp(stderr_ref, x0) 
//
implement
fprint_d3exp
  (out, x0) =
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
| D3Ei00(int) =>
  fprint!(out, "D3Ei00(", int, ")")
| D3Eb00(btf) =>
  fprint!(out, "D3Eb00(", btf, ")")
| D3Ec00(chr) =>
  fprint!(out, "D3Ec00(", chr, ")")
| D3Es00(str) =>
  fprint!(out, "D3Es00(", str, ")")
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
| D3Etop(tok) =>
  fprint!(out, "D3Etop(", tok, ")")
//
| D3Evar(d2v1) =>
  fprint!(out, "D3Evar(", d2v1, ")")
| D3Ekvar(knd0, d2v1) =>
  fprint!
  ( out
  , "D3Ekvar(", knd0, ", ", d2v1, ")")
//
| D3Econ1(d2c1) =>
  fprint!(out, "D3Econ1(", d2c1, ")")
| D3Ecst1(d2c1) =>
  fprint!(out, "D3Ecst1(", d2c1, ")")
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
(*
  fprint!
  ( out
  , "D3Esym0(", d1e1, "; ", dpis, ")")
*)
// (*
  let
  val t2p0 = x0.type()
  in
  fprint!
  ( out
  , "D3Esym0(", d1e1, ": ", t2p0, ")"
  )
  end
// *)
//
| D3Efcon(d2c1) =>
  fprint!(out, "D3Efcon(", d2c1, ")")
| D3Efcst(d2c1) =>
  fprint!(out, "D3Efcst(", d2c1, ")")
//
| D3Etcon
  (d2c1, ti3a, ti2s) =>
  fprint!
  ( out
  , "D3Etcon("
  , d2c1, "; ", ti3a, "; ", ti2s, ")")
| D3Etcst
  (d2c1, ti3a, ti2s) =>
  fprint!
  ( out
  , "D3Etcst("
  , d2c1, "; ", ti3a, "; ", ti2s, ")")
//
| D3Eterr
  (d2e1, terr, d3es) =>
  fprint!
  ( out
  , "D3Eterr("
  , d2e1, "; ", terr, "; ", d3es, ")")
//
| D3Etimp
  ( stmp
  , d3e1, targ
  , d3cl, tsub) =>
  fprint!
  ( out
  , "D3Etimp(", stmp, "; "
  , d3e1, "; ", targ, "; ", d3cl, "; ", tsub, ")")
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
| D3Etapp
  (d2f0, s2es) =>
  fprint!
  ( out
  , "D3Etapp(", d2f0, "; ", s2es, ")")
//
| D3Edapp
  (d3e1, npf2, d3es) =>
  fprint!
  ( out, "D3Edapp("
  , d3e1, "; ", npf2, "; ", d3es, ")")
//
| D3Epcon
  (d3e1, lab2) =>
  fprint!
  ( out
  , "D3Epcon(", d3e1, "; ", lab2, ")")
| D3Epbox
  (d3e1, lab2, idx2) =>
  fprint!
  ( out
  , "D3Epbox("
  , d3e1, "; ", lab2, "; ", idx2, ")")
//
| D3Eproj
  (d3e1, lab2, idx2) =>
  fprint!
  ( out
  , "D3Eproj("
  , d3e1, "; ", lab2, "; ", idx2, ")")
| D3Eplft
  (d3e1, lab2, idx2) =>
  fprint!
  ( out
  , "D3Eplft("
  , d3e1, "; ", lab2, "; ", idx2, ")")
| D3Epptr
  (d3e1, lab2, idx2) =>
  fprint!
  ( out
  , "D3Epptr("
  , d3e1, "; ", lab2, "; ", idx2, ")")
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
| D3Etrcd1
  (knd1, npf2, d3es) =>
  fprint!
  ( out, "D3Etrcd1("
  , knd1, "; ", npf2, "; ", d3es, ")")
//
| D3Eassgn
  (d3e1, d3e2) =>
  fprint!
  ( out
  , "D3Eassgn(", d3e1, "; ", d3e2, ")")
//
| D3Ebrack
  (dpis, d3es) =>
  fprint!
  ( out
  , "D3Ebrack(", dpis, "; ", d3es, ")")  
| D3Edtsel
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
  Some(d3es) =>
  fprint!
  ( out
  , "D2Edtsel("
  , lab0, "(", dpis, ")", "(", npf2, "; ", d3es, ")", ")")
  )
//
| D3Eif0
  (d3e1, d3e2, opt3) =>
  fprint!
  ( out, "D3Eif0("
  , d3e1, "; ", d3e2, "; ", opt3, ")")
| D3Eif1
  (d3e1, d3e2, opt3, tinv) =>
  fprint!
  ( out, "D3Eif1("
  , d3e1, "; ", d3e2, "; ", opt3, "; ", tinv, ")")
//
| D3Ecas0
  (knd0, d3e1, dcls) =>
  fprint!
  ( out, "D3Ecas0("
  , knd0, "; ", d3e1, "; ", dcls, ")")
| D3Ecas1
  (knd0, d3e1, dcls, tinv) =>
  fprint!
  ( out, "D3Ecas1("
  , knd0, "; ", d3e1, "; ", dcls, "; ", tinv, ")")
//
| D3Elam
  (knd0, f3as, tres, arrw, body) =>
  fprint!
  ( out
  , "D3Elam("
  , knd0, "; "
  , f3as, "; "
  , tres, "; ", arrw, "; ", body, ")")
| D3Efix
  (knd0, fid, f3as, tres, arrw, body) =>
  fprint!
  ( out
  , "D3Efix("
  , knd0, "; "
  , fid, "; ", f3as, "; "
  , tres, "; ", arrw, "; ", body, ")")
//
| D3Etry0
  (tok0, d3e1, dcls) =>
  fprint!
  ( out, "D3Etry0("
  , tok0, "; ", d3e1, "; ", dcls, ")")
//
| D3Eaddr(d3e1) =>
  (
   fprint!(out, "D3Eaddr(", d3e1, ")")
  )
| D3Eflat(d3e1) =>
  (
   fprint!(out, "D3Eflat(", d3e1, ")")
  )
| D3Etalf(d3e1) =>
  (
   fprint!(out, "D3Etalf(", d3e1, ")")
  )
//
| D3Efold(d3e1) =>
  (
   fprint!(out, "D3Efold(", d3e1, ")")
  )
//
| D3Eeval
  (knd0, d3e1) =>
  fprint!
  ( out
  , "D3Eeval(", knd0, "; ", d3e1, ")")
//
| D3Efree
  (knd0, d3e1) =>
  fprint!
  ( out
  , "D3Efree(", knd0, "; ", d3e1, ")")
//
| D3Eraise(d3e1) =>
  (
  fprint!(out, "D3Eraise(", d3e1, ")")
  )
//
| D3Elazy(d3e1) =>
  (
   fprint!(out, "D3Elazy(", d3e1, ")")
  )
| D3Ellazy
  ( d3e1
  , d3es(*frees*)) =>
  fprint!
  (out
  , "D3Ellazy(", d3e1, "; ", d3es, ")")
//
| D3Eanno
  (d3e1, s1e2, s2e2) =>
  fprint!
  ( out
  , "D3Eanno(", d3e1, "; ", s2e2, ")")
//
| D3Eexist1(s2es, d3e1) =>
  fprint!
  ( out
  , "D3Eexist1(", s2es, "; ", d3e1, ")")
//
| D3Elcast(d3e1, lab2) =>
  fprint!
  ( out
  , "D3Elcast(", d3e1, "; ", lab2, ")")
| D3Etcast(d3e1, t2p2) =>
  fprint!
  ( out
  , "D3Etcast(", d3e1, "; ", t2p2, ")")
//
| D3Enone0() =>
  fprint!(out, "D3Enone0(", ")")
| D3Enone1(d2esrc) =>
  fprint!(out, "D3Enone1(", d2esrc, ")")
| D3Enone2(d3esrc) =>
  fprint!(out, "D3Enone2(", d3esrc, ")")
//
) (*val*) } (*where*) // end of [fprint_d3exp]
//
(* ****** ****** *)
//
implement
print_t3imp(x0) =
fprint_t3imp(stdout_ref, x0)
implement
prerr_t3imp(x0) =
fprint_t3imp(stderr_ref, x0)
//
implement
fprint_t3imp
  (out, x0) =
let
val
d3e0 = d3exp(x0)
val-
D3Etimp
( stmp
, d3e0
, targ
, d3cl
, tsub) = d3e0.node()
val-
D3Etcst
( d2c1
, ti3a
, ti2s) = d3e0.node()
val-
TI3ARGsome(targ) = ti3a
in
//
  fprint!(out, d2c1, "<", targ, ">")
//
end (* end of [fprint_t3imp] *)

(* ****** ****** *)
//
implement
print_d3gua(x0) =
fprint_d3gua(stdout_ref, x0)
implement
prerr_d3gua(x0) =
fprint_d3gua(stderr_ref, x0)
//
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
//
(* ****** ****** *)
//
implement
print_d3clau(x0) =
fprint_d3clau(stdout_ref, x0)
implement
prerr_d3clau(x0) =
fprint_d3clau(stderr_ref, x0)
//
implement
print_d3gpat(x0) =
fprint_d3gpat(stdout_ref, x0)
implement
prerr_d3gpat(x0) =
fprint_d3gpat(stderr_ref, x0)
//
implement
fprint_d3clau
  (out, x0) =
(
case+
x0.node() of
//
|
D3CLAUpat(d3gp) =>
fprint!
(out, "D3CLAUpat(", d3gp, ")")
//
|
D3CLAUexp(d3gp, d0e0) =>
fprint!
( out
, "D3CLAUexp(", d3gp, "; ", d0e0, ")")
//
) (* end of [fprint_d3clau] *)
//
implement
fprint_d3gpat
  (out, x0) =
(
case+
x0.node() of
//
|
D3GPATpat(d3p) =>
fprint!
(out, "D3GPATpat(", d3p, ")")
//
|
D3GPATgua(d3p, d3gs) =>
fprint!
(out, "D3GPATgua(", d3p, "; ", d3gs, ")")
//
) (* end of [fprint_d3gpat] *)
//
(* ****** ****** *)
//
implement
print_d3ecl(x0) =
fprint_d3ecl(stdout_ref, x0) 
implement
prerr_d3ecl(x0) =
fprint_d3ecl(stderr_ref, x0) 
//
local
//
implement
fprint_val<d3ecl> = fprint_d3ecl
//
implement
fprint_val<d3valdecl> = fprint_d3valdecl
implement
fprint_val<d3vardecl> = fprint_d3vardecl
//
implement
fprint_val<d3fundecl> = fprint_d3fundecl
//
in(*in-of-local*)

implement
fprint_d3ecl
  (out, x0) =
(
//
case+
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
| D3Cinclude
  ( tok0
  , src1, knd2
  , fopt, body) =>
  (
  fprint!
  ( out
  , "D3Cinclude("
  , "src= ", src1, "; "
  , "knd= ", knd2, "; "
  ,  fopt, "; ", body, ")")
  ) where
  {
    val body =
    (
    case+ body of
    | None _ => "None()"
    | Some _ => "Some(<d3cls>)"): string
  }
//
| D3Clocal(head, body) =>
  fprint!
  ( out
  , "D3Clocal(", head, "; ", body, ")")
//
| D3Cstaload
  ( tok0
  , src1, knd2
  , fopt, flag, body) =>
  (
  fprint!
  ( out
  , "D3Cstaload("
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
| D3Cabstype(s2c1, def2) =>
  fprint!
  ( out
  , "D3Cabstype(", s2c1, "; ", def2, ")")
//
| D3Cabsopen
  (tok0, sqid) =>
  fprint!
  ( out
  , "D3Cabsopen("
  , tok0(*absopen*), "; ", sqid, ")")
| D3Cabsimpl
  (knd0, sqid, def0) =>
  fprint!
  ( out
  , "D3Cabsimpl("
  , knd0(*abskind*), "; ", sqid, "; ", def0, ")")
//
| D3Cfundclst
  (knd0, mopt, tqas, f3ds) =>
  fprint!
  ( out
  , "D3Cfundclst("
  , knd0, "; ", mopt, "; ", tqas, "; ", f3ds, ")")
//
| D3Cvaldclst
  (knd0, mopt, v3ds) =>
  fprint!
  ( out
  , "D3Cvaldclst("
  , knd0, "; ", mopt, "; ", v3ds, ")")
| D3Cvardclst
  (knd0, mopt, v3ds) =>
  fprint!
  ( out
  , "D3Cvardclst("
  , knd0, "; ", mopt, "; ", v3ds, ")")
//
| D3Cexcptcon
  (d1cl, d2cs) =>
  fprint!
  ( out
  , "D3Cexcptcon(", d1cl, "; ", d2cs, ")")
| D3Cdatatype
  (d1cl, s2cs) =>
  fprint!
  ( out
  , "D3Cdatatype(", d1cl, "; ", s2cs, ")")
//
| D3Cimplmnt1
  ( knd0
  , stmp, mopt
  , sqas, tqas
  , id2c, ti3a, ti2s
  , f3as, res0, d3e0) =>
  fprint!
  ( out
  , "D3Cimplmnt1("
  , knd0, "; "
  , stmp, "; ", mopt, "; "
  , sqas, "; ", tqas, "; "
  , id2c, "; ", ti3a, "; ", ti2s, "; ", f3as, "; ", res0, "; ", d3e0, ")"
  ) (* end of [D3Cimplmnt1] *)
| D3Cimplmnt2
  ( knd0
  , stmp, mopt
  , sqas, tqas
  , id2c, ti3a, ti2s
  , f3as, res0, d3e0) =>
  fprint!
  ( out
  , "D3Cimplmnt2("
  , knd0, "; "
  , stmp, "; ", mopt, "; "
  , sqas, "; ", tqas, "; "
  , id2c, "; ", ti3a, "; ", ti2s, "; ", f3as, "; ", res0, "; ", d3e0, ")"
  ) (* end of [D3Cimplmnt2] *)
| D3Cimplmnt3
  ( knd0
  , stmp, mopt
  , sqas, tqas
  , id2c, ti3a, ti2s
  , f3as, res0, d3e0) =>
  fprint!
  ( out
  , "D3Cimplmnt3("
  , knd0, "; "
  , stmp, "; ", mopt, "; "
  , sqas, "; ", tqas, "; "
  , id2c, "; ", ti3a, "; ", ti2s, "; ", f3as, "; ", res0, "; ", d3e0, ")"
  ) (* end of [D3Cimplmnt3] *)
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
//
implement
print_d3valdecl(x0) =
fprint_d3valdecl(stdout_ref, x0)
implement
prerr_d3valdecl(x0) =
fprint_d3valdecl(stderr_ref, x0)
//
implement
print_d3fundecl(x0) =
fprint_d3fundecl(stdout_ref, x0)
implement
prerr_d3fundecl(x0) =
fprint_d3fundecl(stderr_ref, x0)
//
implement
print_d3vardecl(x0) =
fprint_d3vardecl(stdout_ref, x0)
implement
prerr_d3vardecl(x0) =
fprint_d3vardecl(stderr_ref, x0)
//
(* ****** ****** *)

implement
fprint_d3valdecl
  (out, x0) = let
//
val+D3VALDECL(rcd) = x0
//
in
  fprint!
  ( out
  , "D3VALDECL@{"
  , ", pat=", rcd.pat
  , ", def=", rcd.def
  , ", wtp=", rcd.wtp, "}")
end // end of [fprint_d3valdecl]
//
(* ****** ****** *)

implement
fprint_d3vardecl
  (out, x0) = let
//
val+D3VARDECL(rcd) = x0
//
in
  fprint!
  ( out
  , "D3VARDECL@{"
  , "d2v=", rcd.d2v, ", "
  , "wth=", rcd.wth, ", "
  , "res=", rcd.res, ", ", "ini=", rcd.ini, "}")
end // end of [fprint_d3vardecl]

(* ****** ****** *)

implement
fprint_d3fundecl
  (out, x0) = let
//
val+D3FUNDECL(rcd) = x0
//
in
//
case+
rcd.f3g of
|
None() =>
(
  fprint!
  ( out
  , "D3FUNDECL@{"
  , "nam=", rcd.nam, ", "
  , "d2c=", rcd.d2c, ", "
  , "f2g=", rcd.f2g, ", ", "}")
)
|
Some(rcd_f3g) =>
(
  fprint!
  ( out
  , "D3FUNDECL@{"
  , "nam=", rcd.nam, ", "
  , "d2c=", rcd.d2c, ", "
  , "f3g=", rcd_f3g, ", "
  , "res=", rcd.res, ", "
  , "def=", rcd.def, ", "
  , "rtp=", rcd.rtp, ", "
  , "wtp=", rcd.wtp, ", ", "ctp=", rcd.ctp, "}")
)
//
end // end of [fprint_d3fundecl]

(* ****** ****** *)

(* end of [xats_dynexp3_print.dats] *)

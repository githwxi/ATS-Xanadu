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
#staload "./../SATS/cstrnt0.sats"
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
//
implement
fprint_val<s2var> = fprint_s2var
//
implement
fprint_val<s2xtv> = fprint_s2xtv
//
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
fprint_val<ti2arg> = fprint_ti2arg
implement
fprint_val<ti3arg> = fprint_ti3arg
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
fprint_val<d4gua> = fprint_d4gua
//
implement
fprint_val<d4clau> = fprint_d4clau
implement
fprint_val<d4gpat> = fprint_d4gpat
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
  let
  val s2e = d2v.sexp()
  in
  fprint!
  ( out
  , "D4Pvar(", d2v, ":", s2e, ")" )
  end
//
| D4Pi00(int) =>
  fprint!(out, "D4Pi00(", int, ")")
| D4Pb00(btf) =>
  fprint!(out, "D4Pb00(", btf, ")")
| D4Pc00(chr) =>
  fprint!(out, "D4Pc00(", chr, ")")
| D4Ps00(str) =>
  fprint!(out, "D4Ps00(", str, ")")
//
| D4Pint(tok) =>
  fprint!(out, "D4Pint(", tok, ")")
| D4Pbtf(tok) =>
  fprint!(out, "D4Pbtf(", tok, ")")
| D4Pchr(tok) =>
  fprint!(out, "D4Pchr(", tok, ")")
//
| D4Pcon1(d2c0) =>
  fprint!
  (out, "D4Pcon1(", d2c0, ")")
//
| D4Psap0
  (d4f0, s2es) =>
  fprint!
  ( out
  , "D4Psap0(", d4f0, "; ", s2es, ")")
| D4Psap1
  (d4f0, s2es) =>
  fprint!
  ( out
  , "D4Psap1(", d4f0, "; ", s2es, ")")
//
| D4Psapx
  (d4f0, s2es, s2ps) =>
  fprint!
  ( out
  , "D4Psapx("
  , d4f0, "; ", s2es, "; ", s2ps, ")")
//
(*
| D4Popnx
  (d4p1, xtv2) =>
  fprint!
  ( out
  , "D4Popnx(", d4p1, "; ", xtv2, ")")
*)
| D4Popny
  (d4p1, s2vs, s2ps) =>
  fprint!
  ( out
  , "D4Popny("
  , d4p1, "; ", s2vs, "; ", s2ps, ")")
//
| D4Pdap1(d4f0) =>
  fprint!
  ( out, "D4Pdap1(", d4f0, ")")
| D4Pdapp
  (d4f0, npf1, d4ps) =>
  fprint!
  ( out, "D4Pdapp("
  , d4f0, "; ", npf1, "; ", d4ps, ")")
//
| D4Panno
  (d4p1, s1e2, s2e2) =>
  fprint!
  ( out
  , "D4Panno(", d4p1, "; ", s2e2, ")")
//
| D4Ptasmp(d4p1, cstr) =>
  fprint!
  ( out
  , "D4Ptasmp(", d4p1, "; ", cstr, ")")
(*
| D4Ptcast(d4p1, cstr) =>
  fprint!
  ( out
  , "D4Ptcast(", d4p1, "; ", cstr, ")")
*)
//
| D4Pnone1(d3psrc) =>
  fprint!( out, "D4Pnone1(", d3psrc, ")" )
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
(*
| F4ARGnone(tok) => ...
*)
//
| F4ARGnone3(f3a) =>
  fprint!(out, "F4ARGnone3(", f3a, ")")
//
|
F4ARGsome_met(s2es) =>
fprint!(out, "F4ARGsome_met(", s2es, ")")
//
|
F4ARGsome_dyn(npf1, d4ps) =>
fprint!
(out, "F4ARGsome_dyn(", npf1, "; ", d4ps, ")")
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
print_ti4arg(x0) =
fprint_ti4arg(stdout_ref, x0) 
implement
prerr_ti4arg(x0) =
fprint_ti4arg(stderr_ref, x0) 
//
implement
fprint_ti4arg
  (out, x0) =
(
case+ x0 of
| TI4ARGnone() =>
  fprint!(out, "TI4ARGnone(", ")")
| TI4ARGsome(s2es) =>
  fprint!(out, "TI4ARGsome(", s2es, ")")
)
//
(* ****** ****** *)
//
implement
print_dlocs(x0) =
fprint_dlocs(stdout_ref, x0)
implement
prerr_dlocs(x0) =
fprint_dlocs(stderr_ref, x0)
//
(* ****** ****** *)
//
implement
fprint_dlocs
  (out, dvrs) =
(
auxlst
(dlocs_listize(dvrs))
) where
{
fun
auxlst
( d2vs
: List0_vt(d2var)): void =
(
case+ d2vs of
| ~
list_vt_nil
((*void*)) => ()
| ~
list_vt_cons
(d2v0, d2vs) =>
(
fprintln!(out, d2v0); auxlst(d2vs)
)
)
} (*where*) // end of [fprint_dlocs]
//
(* ****** ****** *)
//
implement
print_stmap(x0) =
fprint_stmap(stdout_ref, x0)
implement
prerr_stmap(x0) =
fprint_stmap(stderr_ref, x0)
//
(* ****** ****** *)

implement
fprint_stmap
  (out, map0) =
(
auxlst
(stmap_listize(map0))
) where
{
fun
auxlst
( vts
: List_vt
(
@(d2var, s2exp))
) : void =
(
case+ vts of
| ~
list_vt_nil
((*void*)) => ()
| ~
list_vt_cons
( vt0, vts ) =>
let
val
(d2v, s2e) = vt0
in
auxlst(vts) where
{
val () =
fprintln!
(out, "(", d2v, ": ", s2e, ")") }
end (*let*) // end of [list_cons]
) } (*where*) // end of [fprint_stmap]

(* ****** ****** *)
//
implement
print_stmrg(x0) =
fprint_stmrg(stdout_ref, x0)
implement
prerr_stmrg(x0) =
fprint_stmrg(stderr_ref, x0)
//
(* ****** ****** *)

implement
fprint_stmrg
  (out, mrg) =
(
auxlst
(stmrg_listize(mrg))
) where
{
typedef
xtt =
(d2var, s2exp, s2exp)
fun
auxlst
(xtts: List0_vt(xtt)): void =
(
case+ xtts of
| ~
list_vt_nil() => ()
| ~
list_vt_cons
(xtt0, xtts) =>
(
auxlst(xtts)) where
{
val
(x0, t1, t2) = xtt0
val () =
print!
("(", x0, "; ", t1, ";", t2, ")")
} (*where*) // end of [list_cons]
)
} (*where*) // end of [fprint_stmrg]

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
(*
| D4Evmut(d2v) =>
  fprint!(out, "D4Evmut(", d2v, ")")
*)
| D4Ekvar(knd0, d2v1) =>
  fprint!
  ( out
  , "D4Ekvar(", knd0, ", ", d2v1, ")")
//
| D4Efcon(d2c) =>
  fprint!(out, "D4Efcon(", d2c, ")")
| D4Efcst(d2c) =>
  fprint!(out, "D4Efcst(", d2c, ")")
//
| D4Etcon
  ( d2c1
  , ti4a, ti3a, ti2s) =>
  fprint!
  ( out
  , "D4Etcon("
  , d2c1, ";"
  , ti4a, ";", ti3a, ";", ti2s, ")")
| D4Etcst
  ( d2c1
  , ti4a, ti3a, ti2s) =>
  fprint!
  ( out
  , "D4Etcst("
  , d2c1, ";"
  , ti4a, ";", ti3a, ";", ti2s, ")")
//
| D4Etimp
  ( stmp
  , d4e1, targ
  , d4cl, tsub) =>
  fprint!
  ( out
  , "D4Etimp(", stmp, "; "
  , d4e1, "; ", targ, "; ", d4cl, "; ", tsub, ")")
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
(*
| D4Eopnx
  (d4e1, xtv2) =>
  fprint!
  ( out
  , "D4Eopnx(", d4e1, "; ", xtv2, ")")
*)
| D4Eopny
  (d4e1, s2vs, s2ps) =>
  fprint!
  ( out
  , "D4Eopny("
  , d4e1, "; ", s2vs, "; ", s2ps, ")")
//
| D4Edapp
  ( d4f0
  , npf1, d4es) =>
  fprint!
  ( out
  , "D4Edapp("
  , d4f0, "; ", npf1, "; ", d4es, ")")
| D4Edapq
  ( dapp
  , npf1, d4es) =>
  fprint!
  ( out
  , "D4Edapq("
  , dapp, "; ", npf1, "; ", d4es, ")")
| D4Edarg
  ( darg
  , knd0, saft) =>
  fprint!
  ( out
  , "D4Edarg("
  , darg, "; ", knd0, "; ", saft, ")")
//
| D4Eproj
  (d4e1, lab2, idx2) =>
  fprint!
  ( out
  , "D4Eproj("
  , d4e1, "; ", lab2, "; ", idx2, ")")
| D4Eplft
  (d4e1, lab2, idx2) =>
  fprint!
  ( out
  , "D4Eplft("
  , d4e1, "; ", lab2, "; ", idx2, ")")
| D4Epptr
  (d4e1, lab2, idx2) =>
  fprint!
  ( out
  , "D4Epptr("
  , d4e1, "; ", lab2, "; ", idx2, ")")
//
| D4Elet
  ( dcls, d4e1) =>
  fprint!
  ( out
  , "D4Elet(", dcls, "; ", d4e1, ")")
| D4Ewhere
  ( d4e1, dcls) =>
  fprint!
  ( out
  , "D4Ewhere(", d4e1, "; ", dcls, ")")
//
| D4Eseqn
  (d4es, d4e2) =>
  fprint!
  ( out
  , "D4Eseqn(", d4es, "; ", d4e2, ")")
//
| D4Eassgn
  (d4e1, d4e2, err3) =>
  fprint!
  ( out
  , "D4Eassgn("
  , d4e1, "; ", d4e2, "; ", err3, ")")
| D4Eupdtd
  (d4e1, s2e2, err3) =>
  fprint!
  ( out
  , "D4Eupdtd("
  , d4e1, "; ", s2e2, "; ", err3, ")")
//
| D4Eif0
  (d4e1, d4e2, opt3) =>
  fprint!
  ( out, "D4Eif0("
  , d4e1, "; ", d4e2, "; ", opt3, ")")
//
| D4Ecas0
  (knd0, d4e1, dcls) =>
  fprint!
  ( out, "D4Ecas0("
  , knd0, "; ", d4e1, "; ", dcls, ")")
//
(*
| D4Elval
  (dlft, d4e1) =>
  fprint!
  ( out
  , "D4Elval(", dlft, "; ", d4e1, ")")
*)
//
| D4Eaddr(d4e1) =>
  (
   fprint!(out, "D4Eaddr(", d4e1, ")")
  )
| D4Eflat
  ( d4e1, opt2 ) =>
  fprint!
  ( out
  , "D4Eflat(", d4e1, "; ", opt2, ")")
| D4Etalf
  ( d4e1, opt2 ) =>
  fprint!
  ( out
  , "D4Etalf(", d4e1, "; ", opt2, ")")
//
| D4Eanno
  (d4e1, s1e2, s2e2) =>
  fprint!
  ( out
  , "D4Eanno(", d4e1, "; ", s2e2, ")")
//
| D4Estmap
  ( d4e1, map2 ) =>
  fprint!
  ( out
  , "D4Estmap(", d4e1, "; ", "[]", ")")
| D4Estmrg
  ( d4e1, mrg2 ) =>
  fprint!
  ( out
  , "D4Estmrg(", d4e1, "; ", "[]", ")")
//
| D4Etcast
  ( d4e1, cstr ) =>
  fprint!
  ( out
  , "D4Etcast(", d4e1, "; ", cstr, ")")
//
| D4Eleakd(d4e1) =>
  fprint!
  ( out, "D4Eleakd(", d4e1, ")")
//
| D4Enone0() =>
  fprint!(out, "D4Enone0(", ")")
| D4Enone1(d3esrc) =>
  fprint!(out, "D4Enone1(", d3esrc, ")")
| D4Enone2(d4esrc) =>
  fprint!(out, "D4Enone2(", d4esrc, ")")
//
(*
| _(* rest-of-d4exp *) => fprint!(out, "D4E...(...)")
*)
//
) (*val*) } (*where*) (* end of [fprint_d4exp] *)
//
(* ****** ****** *)
(*
//
implement
print_d4lft(x0) =
fprint_d4lft(stdout_ref, x0)
implement
prerr_d4lft(x0) =
fprint_d4lft(stderr_ref, x0)
//
implement
fprint_d4lft
  (out, x0) =
(
case+ x0 of
|
D4ELFTvar(d2v) =>
fprint!
(out, "D4ELFTvar(", d2v, ")")
|
D4ELFTsome(dlft) =>
fprint!
(out, "D4ELFTsome(", dlft, ")")
|
D4ELFTproj
(dlft, lab1, ind2) =>
fprint!
( out
, "D4ELFTproj("
, dlft, "; ", lab1, "; ", ind2, ")")
)
*)
(* ****** ****** *)
implement
print_d4err(x0) =
fprint_d4err(stdout_ref, x0)
implement
prerr_d4err(x0) =
fprint_d4err(stderr_ref, x0)
(* ****** ****** *)
implement
fprint_d4err
  (out, x0) =
(
case+ x0 of
|
D4ERRnone() =>
fprint!
(out, "D4ERRnone(", ")")
//
|
D4ERRupdtd0() =>
fprint!
(out, "D4ERRupdtd0(", ")")
|
D4ERRupdtd1(d2w1, selt) =>
fprint!
( out
, "D4ERRupdtd1(", d2w1, "; ", selt, ")")
//
)
(* ****** ****** *)
//
implement
print_d4gua(x0) =
fprint_d4gua( stdout_ref, x0 )
implement
prerr_d4gua(x0) =
fprint_d4gua( stderr_ref, x0 )
//
implement
fprint_d4gua
  (out, x0) =
(
case+
x0.node() of
| D4GUAexp(d4e) =>
  fprint!
  (out, "D4GUAexp(", d4e, ")")
| D4GUAmat(d4e, d4p) =>
  fprint!
  (out, "D4GUAmat(", d4e, "; ", d4p, ")")
) (* end of [fprint_d4gua] *)
//
(* ****** ****** *)
//
implement
print_d4clau(x0) =
fprint_d4clau(stdout_ref, x0)
implement
prerr_d4clau(x0) =
fprint_d4clau(stderr_ref, x0)
//
implement
print_d4gpat(x0) =
fprint_d4gpat(stdout_ref, x0)
implement
prerr_d4gpat(x0) =
fprint_d4gpat(stderr_ref, x0)
//
implement
fprint_d4clau
  (out, x0) =
(
case+
x0.node() of
//
|
D4CLAUpat(d4gp) =>
fprint!
(out, "D4CLAUpat(", d4gp, ")")
//
|
D4CLAUexp
(d4gp, d4e1, map2) =>
fprint!
( out
, "D4CLAUexp("
, d4gp, "; ", d4e1, "; ", "[]", ")")
//
) (* end of [fprint_d4clau] *)
//
implement
fprint_d4gpat
  (out, x0) =
(
case+
x0.node() of
//
|
D4GPATpat(d4p1) =>
fprint!
(out, "D4GPATpat(", d4p1, ")")
//
|
D4GPATgua(d4p1, d4gs) =>
fprint!
(out, "D4GPATgua(", d4p1, "; ", d4gs, ")")
//
) (* end of [fprint_d4gpat] *)
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
fprint_val<v4aldecl> = fprint_v4aldecl
implement
fprint_val<v4ardecl> = fprint_v4ardecl
//
implement
fprint_val<f4undecl> = fprint_f4undecl
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
D4Cvardecl
(tok0, mopt, v4ds) =>
fprint!
( out, "D4Cvardecl("
, tok0, "; ", mopt, "; ", "; ", v4ds, ")")
//
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
print_v4ardecl(x0) =
fprint_v4ardecl(stdout_ref, x0)
implement
prerr_v4ardecl(x0) =
fprint_v4ardecl(stderr_ref, x0)

(* ****** ****** *)
//
implement
fprint_v4ardecl
  (out, x0) = let
//
val+V4ARDECL(rcd) = x0
//
in
  fprint!
  ( out
  , "V4ARDECL@{"
  , ", d2v=", rcd.d2v
  , ", d2w=", rcd.d2w
  , ", s2e=", rcd.s2e
(*
  , ", wth=", rcd.wth
*)
  , ", res=", rcd.res
  , ", ini=", rcd.ini, "}")
end // end of [fprint_v4ardecl]
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
Some(rcd_a4g) =>
(
  fprint!
  ( out
  , "F4UNDECL@{"
  , "nam=", rcd.nam, ", "
  , "d2c=", rcd.d2c, ", "
  , "a2g=", rcd.a2g, ", "
  , "a4g=", rcd_a4g, ", "
  , "res=", rcd.res, ", "
  , "def=", rcd.def, ", "
  , "rtp=", rcd.rtp, ", "
  , "wtp=", rcd.wtp, ", ", "ctp=", rcd.ctp, "}")
)
//
end // end of [fprint_f4undecl]

(* ****** ****** *)
//
implement
print_dvmrg2(x0) =
fprint_dvmrg2(stdout_ref, x0)
implement
prerr_dvmrg2(x0) =
fprint_dvmrg2(stderr_ref, x0)
implement
fprint_dvmrg2(out, x0) =
(
case+ x0 of
|
DVMRG2
(d2v0, opt1, opt2) =>
fprint!
( out
, "DVMRG2("
, d2v0, "; ", opt1, "; ", opt2, ")")
)
//
(* ****** ****** *)
//
implement
print_dvmrgs(x0) =
fprint_dvmrgs(stdout_ref, x0)
implement
prerr_dvmrgs(x0) =
fprint_dvmrgs(stderr_ref, x0)
implement
fprint_dvmrgs(out, x0) =
(
case+ x0 of
|
DVMRGS(d2v0, opts) =>
let
implement
fprint_val<s2expopt>(out,x0) =
(
case+ x0 of
| None() =>
  fprint!(out, "None(", ")")
| Some(s2e) =>
  fprint!(out, "Some(", s2e, ")")
)
in
fprint!
( out
, "DVMRGS(", d2v0, "; ", opts, ")")
end (*let*) // end of [DVMRGS]
)
//
(* ****** ****** *)

(* end of [xats_dynexp4_print.dats] *)

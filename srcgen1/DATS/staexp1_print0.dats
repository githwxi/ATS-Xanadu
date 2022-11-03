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
// Start Time: August, 2018
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
_(*TMP*) =
"./../DATS/staexp0_print0.dats"
//
(* ****** ****** *)
//
#staload "./../SATS/xsymbol.sats"
//
#staload "./../SATS/xlabel0.sats"
#staload "./../SATS/lexing0.sats"
//
#staload "./../SATS/locinfo.sats"
//
#staload "./../SATS/staexp0.sats"
//
#staload "./../SATS/staexp1.sats"
//
(* ****** ****** *)
//
implement
fprint_val<token> = fprint_token
//
(* ****** ****** *)
//
implement
fprint_val<g1nam> = fprint_g1nam
implement
fprint_val<g1exp> = fprint_g1exp
//
(*
implement
fprint_val<g1arg> = fprint_g1arg
*)
implement
fprint_val<g1marg> = fprint_g1marg
//
(* ****** ****** *)

implement
fprint_val<sort1> = fprint_sort1

(* ****** ****** *)

implement
fprint_val<s1rtcon> = fprint_s1rtcon
implement
fprint_val<d1tsort> = fprint_d1tsort
implement
fprint_val<s1rtdef> = fprint_s1rtdef

(* ****** ****** *)

implement
fprint_val<s1arg> = fprint_s1arg
implement
fprint_val<s1marg> = fprint_s1marg

(* ****** ****** *)

implement
fprint_val<t1arg> = fprint_t1arg
implement
fprint_val<t1marg> = fprint_t1marg

(* ****** ****** *)
//
implement
fprint_val<s1qua> = fprint_s1qua
implement
fprint_val<s1uni> = fprint_s1uni
//
implement
fprint_val<s1exp> = fprint_s1exp
//
(* ****** ****** *)

implement
fprint_val<d1atype> = fprint_d1atype
implement
fprint_val<d1atcon> = fprint_d1atcon

(* ****** ****** *)

implement
print_g1nam(x0) =
fprint_g1nam(stdout_ref, x0)
implement
prerr_g1nam(x0) =
fprint_g1nam(stderr_ref, x0)

implement
fprint_g1nam
  (out, gnm0) =
(
case+ gnm0 of
|
G1Nnil() =>
fprint!
(out, "G1Nnil(", ")")
|
G1Nid0(sym) =>
fprint!
(out, "G1Nid0(", sym, ")")
|
G1Nint(tok) =>
fprint!
(out, "G1Nint(", tok, ")")
|
G1Nflt(tok) =>
fprint!
(out, "G1Nflt(", tok, ")")
|
G1Nstr(tok) =>
fprint!
(out, "G1Nstr(", tok, ")")
//
|
G1Nlist(gnms) =>
fprint!
(out, "G1Nlist(", gnms, ")")
|
G1Nnone0() =>
fprint!(out, "G1Nnone0(", ")")
|
G1Nnone1(tok) =>
fprint!(out, "G1Nnone1(", tok, ")")
//
) (* end of [fprint_g1nam] *)

(* ****** ****** *)

implement
print_g1exp(x0) =
fprint_g1exp(stdout_ref, x0)
implement
prerr_g1exp(x0) =
fprint_g1exp(stderr_ref, x0)

local

implement
fprint_val<g1exp> = fprint_g1exp

in (* in-of-local *)

implement
fprint_g1exp
  (out, x0) =
(
case+ x0.node() of
//
| G1Eid0(gid) =>
  fprint!(out, "G1Eid0(", gid, ")")
//
| G1Eint(int) =>
  fprint!(out, "G1Eint(", int, ")")
| G1Echr(chr) =>
  fprint!(out, "G1Echr(", chr, ")")
| G1Eflt(flt) =>
  fprint!(out, "G1Eflt(", flt, ")")
| G1Estr(str) =>
  fprint!(out, "G1Estr(", str, ")")
//
| G1Eif0
  ( g1e1
  , g1e2, g1e3) =>
  fprint!
  ( out
  , "G1Eif0("
  , g1e1, "; ", g1e2, "; ", g1e3, ")")
//
| G1Eapp() =>
  fprint!(out, "G1Eapp()")
//
| G1Eapp1
  (g1e0, g1e1) =>
  fprint!
  ( out
  , "G1Eapp1(", g1e0, "; ", g1e1, ")")
| G1Eapp2
  (g1e0, g1e1, g1e2) =>
  fprint!
  ( out
  , "G1Eapp2("
  , g1e0, "; ", g1e1, "; ", g1e2, ")")
//
| G1Elist(g1es) =>
  fprint!( out, "G1Elist(", g1es, ")")
//
| G1Enone0() =>
  (
    fprint!(out, "G1Enone0(", ")")
  )
| G1Enone1(g0e1) =>
  (
    fprint!(out, "G1Enone1(", g0e1, ")")
  )
//
) (* fprint_g1exp *) end // end of [local]

(* ****** ****** *)

implement
print_g1marg(x0) =
fprint_g1marg(stdout_ref, x0)
implement
prerr_g1marg(x0) =
fprint_g1marg(stderr_ref, x0)

local

implement
fprint_val<g1arg> = fprint_token

in(* in-of-local *)

implement
fprint_g1marg
  (out, x0) =
(
case+
x0.node() of
|
G1MARGsarg(g1as) =>
fprint!(out, "G1MARGsarg(", g1as, ")")
|
G1MARGdarg(g1as) =>
fprint!(out, "G1MARGdarg(", g1as, ")")
) (* end of [fprint_g1marg] *)

end // end of [local]

(* ****** ****** *)

implement
print_sort1(x0) =
fprint_sort1(stdout_ref, x0)
implement
prerr_sort1(x0) =
fprint_sort1(stderr_ref, x0)

local

implement
fprint_val<sort1> = fprint_sort1

in (* in-of-local *)

(* ****** ****** *)

implement
fprint_sort1
  (out, x0) =
(
case+ x0.node() of
//
| S1Tid0(id0) =>
  fprint!(out, "S1Tid0(", id0, ")")
//
| S1Tint(int) =>
  fprint!(out, "S1Tint(", int, ")")
//
| S1Tapp() => fprint!(out, "S1Tapp()")
//
(*
| S1Ttype(knd) =>
  fprint!(out, "S1Ttype", knd, ")")
*)
//
(*
| S1Tapp(s1t0, s1ts) =>
  fprint!
  (out, "S1Tapp(", s1t0, "; ", s1ts, ")")
*)
//
| S1Tapp1
  (s1t1, s1t2) =>
  fprint!
  ( out
  , "S1Tapp1(", s1t1, "; ", s1t2, ")")
| S1Tapp2
  (s1t1, s1t2, s1t3) =>
  fprint!
  ( out
  , "S1Tapp2("
  , s1t1, "; ", s1t2, "; ", s1t3, ")" )
//
| S1Tlist(s1ts) =>
  fprint!
  ( out, "S1Tlist(", s1ts, ")" )
//
| S1Tqual(tok0, s1t1) =>
  fprint!
  ( out, "S1Tqual(", tok0, "; ", s1t1, ")" )
//
| S1Tnone((*void*)) => fprint!(out, "S1Tnone(", ")")
//
(*
| _ (* else-of-S1T... *) =>
  fprint!(out, "S1T...(", "...", ")")
*)
//
) (* case *) // end of [fprint_sort1]

(* ****** ****** *)

end // end of [local]

(* ****** ****** *)

implement
print_s1rtcon(x0) =
fprint_s1rtcon(stdout_ref, x0)
implement
prerr_s1rtcon(x0) =
fprint_s1rtcon(stderr_ref, x0)

implement
fprint_s1rtcon
  (out, x0) =
(
case+ x0.node() of
| S1RTCON(sid, opt) =>
  fprint!(out, "S1RTCON(", sid, ", ", opt, ")")
) (* end of [fprint_s1rtcon] *)

(* ****** ****** *)

implement
print_d1tsort(x0) =
fprint_d1tsort(stdout_ref, x0)
implement
prerr_d1tsort(x0) =
fprint_d1tsort(stderr_ref, x0)
implement
fprint_d1tsort
  (out, x0) =
(
case+ x0.node() of
| D1TSORT(tid, s1cs) =>
  fprint!
  (out, "D1TSORT(", tid, "; ", s1cs, ")")
) (* end of [fprint_d1tsort] *)

(* ****** ****** *)

implement
print_s1rtdef(x0) =
fprint_s1rtdef(stdout_ref, x0)
implement
prerr_s1rtdef(x0) =
fprint_s1rtdef(stderr_ref, x0)
implement
fprint_s1rtdef
  (out, x0) =
(
case+ x0.node() of
| S1RTDEFsort(s1t) =>
  fprint!(out, "S1RTDEFsort(", s1t, ")")
| S1RTDEFsbst(s1a0, s1es) =>
  fprint!
  ( out, "S1RTDEFsbst(", s1a0, "; ", s1es, ")")
) (* end of [fprint_s1rtdef] *)

(* ****** ****** *)

implement
print_s1arg(x0) =
fprint_s1arg(stdout_ref, x0)
implement
prerr_s1arg(x0) =
fprint_s1arg(stderr_ref, x0)

implement
fprint_s1arg
  (out, x0) =
(
case+
x0.node() of
(*
| S1ARGnone() =>
  fprint!(out, "S1ARGnone()")
*)
| S1ARGsome(tok, opt) =>
  fprint!(out, "S1ARGsome(", tok, ", ", opt, ")")
) (* fprint_s1arg *)

(* ****** ****** *)

implement
print_s1marg(x0) =
fprint_s1marg(stdout_ref, x0)
implement
prerr_s1marg(x0) =
fprint_s1marg(stderr_ref, x0)

local

implement
fprint_val<s1arg> = fprint_s1arg

in (* in-of-local *)

implement
fprint_s1marg
  (out, x0) =
(
case+
x0.node() of
(*
| S1MARGnone _ => ...
| S1MARGsing _ => ...
*)
| S1MARGlist(s1as) =>
  fprint!(out, "S1MARGlist(", s1as, ")")
) (* fprint_s1marg *)

end // end of [local]

(* ****** ****** *)

implement
print_t1arg(x0) =
fprint_t1arg(stdout_ref, x0)
implement
prerr_t1arg(x0) =
fprint_t1arg(stderr_ref, x0)

implement
fprint_t1arg
  (out, x0) =
(
case+
x0.node() of
(*
| T1ARGnone() =>
  fprint!(out, "T1ARGnone()")
*)
| T1ARGsome(tok, opt) =>
  fprint!(out, "T1ARGsome(", tok, ", ", opt, ")")
) (* fprint_t1arg *)

(* ****** ****** *)

implement
print_t1marg(x0) =
fprint_t1marg(stdout_ref, x0)
implement
prerr_t1marg(x0) =
fprint_t1marg(stderr_ref, x0)

local

implement
fprint_val<t1arg> = fprint_t1arg

in (* in-of-local *)

implement
fprint_t1marg
  (out, x0) =
(
case+
x0.node() of
(*
| T1MARGnone _ => ...
*)
| T1MARGlist(t1as) =>
  fprint!(out, "T1MARGlist(", t1as, ")")
) (* fprint_t1marg *)

end // end of [local]

(* ****** ****** *)

implement
print_s1qua(x0) =
fprint_s1qua(stdout_ref, x0)
implement
prerr_s1qua(x0) =
fprint_s1qua(stderr_ref, x0)

implement
fprint_s1qua
  (out, x0) =
(
case+ x0.node() of
| S1QUAprop(s1e) =>
  fprint!(out, "S1QUAprop(", s1e, ")")
| S1QUAvars(ids, opt) =>
  fprint!(out, "S1QUAvars(", ids, "; ", opt, ")")
)

(* ****** ****** *)

implement
print_s1uni(x0) =
fprint_s1uni(stdout_ref, x0)
implement
prerr_s1uni(x0) =
fprint_s1uni(stderr_ref, x0)

implement
fprint_s1uni
  (out, x0) =
(
case+ x0.node() of
| S1UNIsome(s1qs) =>
  fprint!(out, "S1UNIsome(", s1qs, ")")
)

(* ****** ****** *)

implement
print_s1exp(x0) =
fprint_s1exp(stdout_ref, x0)
implement
prerr_s1exp(x0) =
fprint_s1exp(stderr_ref, x0)

local

implement
fprint_val<s1exp> = fprint_s1exp

in (* in-of-local *)

implement
fprint_s1exp
  (out, x0) =
(
case+ x0.node() of
//
| S1Eid0(sid) =>
  fprint!
  (out, "S1Eid0(", sid, ")")
//
| S1Eint(tok) =>
  fprint!
  (out, "S1Eint(", tok, ")")
| S1Echr(tok) =>
  fprint!
  (out, "S1Echr(", tok, ")")
| S1Eflt(tok) =>
  fprint!
  (out, "S1Eflt(", tok, ")")
| S1Estr(tok) =>
  fprint!
  (out, "S1Estr(", tok, ")")
//
| S1Eapp() =>
  fprint!(out, "S1Eapp()")
//
| S1Eapp1
  (s1e0, s1e1) =>
  fprint!
  (out, "S1Eapp1(", s1e0, "; ", s1e1, ")")
| S1Eapp2
  (s1e0, s1e1, s1e2) =>
  fprint!
  (out, "S1Eapp2(", s1e0, "; ", s1e1, "; ", s1e2, ")")
//
| S1Ebs0() =>
  fprint!(out, "S1Ebs0()")
| S1Ebs1(s1e) =>
  fprint!(out, "S1Ebs1(", s1e, ")")
//
| S1Eimp(s1es) =>
  fprint!(out, "S1Eimp(", s1es, ")")
//
(*
| S1Eapp(s1e0, s1es) =>
  fprint!
  (out, "S1Eapp(", s1e0, "; ", s1es, ")")
*)
//
| S1El1st(s1es) =>
  fprint!
  (out, "S1El1st(", s1es, ")")
| S1El2st(s1es1, s1es2) =>
  fprint!
  (out, "S1El2st(", s1es1, "; ", s1es2, ")")
//
| S1Etrcd1(k0, s1es) =>
  fprint!(out, "S1Etrcd1(", k0, "; ", s1es, ")")
| S1Etrcd1(k0, s1es1, s1es2) =>
  fprint!
  ( out
  , "S1Etrcd1(", k0, "; ", s1es1, "; ", s1es2, ")")
//
| S1Etrcd2(k0, ls1es) =>
  fprint!(out, "S1Etrcd2(", k0, "; ", ls1es, ")")
| S1Etrcd2(k0, ls1es1, ls1es2) =>
  fprint!
  ( out
  , "S1Etrcd2(", k0, "; ", ls1es1, "; ", ls1es2, ")")
//
| S1Eforall(s1qs) =>
  fprint!(out, "S1Eforall(", s1qs, ")")
| S1Eexists(k0, s1qs) =>
  fprint!(out, "S1Eexists(", k0, "; ", s1qs, ")")
//
| S1Elam(arg, res, s1e) =>
  fprint!
  ( out
  , "S1Elam(", arg, "; ", res, "; ", s1e, ")")
//
| S1Eanno(s1e, s1t) =>
  fprint!(out, "S1Eanno(", s1e, "; ", s1t, ")")
//
| S1Equal(tok, s1e) =>
  fprint!
  (out, "S1Equal(", tok, "; ", s1e, ")")
//
| S1Enone(loc) => fprint!(out, "S1Enone(", ")")
//
) (* fprint_s0exp *)

end // end of [local]

(* ****** ****** *)

implement
print_f1unarrow(x0) =
fprint_f1unarrow(stdout_ref, x0)
implement
prerr_f1unarrow(x0) =
fprint_f1unarrow(stderr_ref, x0)
implement
fprint_f1unarrow(out, x0) =
(
case+ x0 of
| F1UNARROWdflt() =>
  fprint!(out, "F1UNARROWdflt(", ")")
| F1UNARROWlist(s1es) =>
  fprint!(out, "F1UNARROWlist(", s1es, ")")
) (* end of [fprint_f1unarrow] *)

(* ****** ****** *)

(*
implement
print_s1eff(x0) =
fprint_s1eff(stdout_ref, x0)
implement
prerr_s1eff(x0) =
fprint_s1eff(stderr_ref, x0)
implement
fprint_s1eff
  (out, x0) =
(
case+ x0 of
| S1EFFnone() =>
  fprint!(out, "S1EFFnone(", ")")
| S1EFFsome(s1es) =>
  fprint!(out, "S1EFFsome(", s1es, ")")
) (* end of [fprint_s1eff] *)
*)

(* ****** ****** *)

implement
print_effs1expopt(x0) =
fprint_effs1expopt(stdout_ref, x0)
implement
prerr_effs1expopt(x0) =
fprint_effs1expopt(stderr_ref, x0)
implement
fprint_effs1expopt
  (out, x0) =
(
case+ x0 of
| EFFS1EXPnone() =>
  fprint!(out, "EFFS1EXPnone(", ")")
| EFFS1EXPsome(s1e) =>
  fprint!(out, "EFFS1EXPsome(", s1e, ")")
(*
| EFFS1EXPsome(s1f, s1e) =>
  fprint!
  ( out
  , "EFFS1EXPsome(", s1f, "; ", s1e, ")")
*)
) (* end of [fprint_effs1expopt] *)

(* ****** ****** *)

implement
print_d1atype(x0) =
fprint_d1atype(stdout_ref, x0)
implement
prerr_d1atype(x0) =
fprint_d1atype(stderr_ref, x0)
implement
fprint_d1atype
  (out, x0) =
(
case+ x0.node() of
| D1ATYPE(tok, arg, res, d1cs) =>
  fprint!
  ( out
  , "D1ATYPE("
  , tok, "; ", arg, "; ", res, "; ", d1cs, ")")
) (* end of [fprint_d1atype] *)

(* ****** ****** *)

implement
print_d1atcon(x0) =
fprint_d1atcon(stdout_ref, x0)
implement
prerr_d1atcon(x0) =
fprint_d1atcon(stderr_ref, x0)
implement
fprint_d1atcon
  (out, x0) =
(
case+ x0.node() of
| D1ATCON(s1us, tok, s1is, argopt) =>
  fprint!
  ( out
  , "D1ATCON("
  , s1us, "; ", tok, "; ", s1is, "; ", argopt, ")")
) (* end of [fprint_d1atcon] *)

(* ****** ****** *)

(* end of [xats_staexp1_print.dats] *)

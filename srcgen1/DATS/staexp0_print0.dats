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
// Start Time: June, 2018
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
#staload "./../SATS/xlabel0.sats"
#staload "./../SATS/lexing0.sats"
#staload "./../SATS/staexp0.sats"
//
(* ****** ****** *)
//
implement
fprint_val<token> = fprint_token
//
implement
fprint_val<t0int> = fprint_t0int
implement
fprint_val<t0chr> = fprint_t0chr
implement
fprint_val<t0flt> = fprint_t0flt
implement
fprint_val<t0str> = fprint_t0str
//
implement
fprint_val<i0dnt> = fprint_i0dnt
//
implement
fprint_val<l0abl> = fprint_l0abl
//
implement
fprint_val<s0ymb> = fprint_s0ymb
//
(* ****** ****** *)

implement
fprint_val<g0nam> = fprint_g0nam
implement
fprint_val<g0exp> = fprint_g0exp

(* ****** ****** *)

implement
fprint_val<sort0> = fprint_sort0

(* ****** ****** *)

implement
fprint_val<s0rtcon> = fprint_s0rtcon
implement
fprint_val<d0tsort> = fprint_d0tsort
implement
fprint_val<s0rtdef> = fprint_s0rtdef

(* ****** ****** *)
//
implement
fprint_val<s0arg> = fprint_s0arg
implement
fprint_val<s0marg> = fprint_s0marg
//
implement
fprint_val<t0arg> = fprint_t0arg
implement
fprint_val<t0marg> = fprint_t0marg
//
(* ****** ****** *)

implement
fprint_val<s0qua> = fprint_s0qua
implement
fprint_val<s0uni> = fprint_s0uni

implement
fprint_val<s0exp> = fprint_s0exp

(* ****** ****** *)

implement
fprint_val<d0atype> = fprint_d0atype
implement
fprint_val<d0atcon> = fprint_d0atcon

(* ****** ****** *)

implement
(a)//tmp
fprint_val<sl0abled(a)> = fprint_sl0abled<a>

(* ****** ****** *)

implement
print_t0int(x0) =
fprint_t0int(stdout_ref, x0)
implement
prerr_t0int(x0) =
fprint_t0int(stderr_ref, x0)

implement
fprint_t0int
  (out, x0) =
(
case+ x0.node() of
| T0INTnone(tok) =>
  fprint!(out, "T0INTnone(", tok, ")")
| T0INTsome(tok) =>
  fprint!(out, "T0INTsome(", tok, ")")
)

(* ****** ****** *)

implement
print_t0chr(x0) =
fprint_t0chr(stdout_ref, x0)
implement
prerr_t0chr(x0) =
fprint_t0chr(stderr_ref, x0)

implement
fprint_t0chr
  (out, x0) =
(
case+ x0.node() of
| T0CHRnone(tok) =>
  fprint!(out, "T0CHRnone(", tok, ")")
| T0CHRsome(tok) =>
  fprint!(out, "T0CHRsome(", tok, ")")
)

(* ****** ****** *)

implement
print_t0flt(x0) =
fprint_t0flt(stdout_ref, x0)
implement
prerr_t0flt(x0) =
fprint_t0flt(stderr_ref, x0)

implement
fprint_t0flt
  (out, x0) =
(
case+ x0.node() of
| T0FLTnone(tok) =>
  fprint!(out, "T0FLTnone(", tok, ")")
| T0FLTsome(tok) =>
  fprint!(out, "T0FLTsome(", tok, ")")
)

(* ****** ****** *)

implement
print_t0str(x0) =
fprint_t0str(stdout_ref, x0)
implement
prerr_t0str(x0) =
fprint_t0str(stderr_ref, x0)

implement
fprint_t0str
  (out, x0) =
(
case+ x0.node() of
| T0STRnone(tok) =>
  fprint!(out, "T0STRnone(", tok, ")")
| T0STRsome(tok) =>
  fprint!(out, "T0STRsome(", tok, ")")
)

(* ****** ****** *)

implement
print_i0dnt(x0) =
fprint_i0dnt(stdout_ref, x0)
implement
prerr_i0dnt(x0) =
fprint_i0dnt(stderr_ref, x0)

implement
fprint_i0dnt
  (out, x0) =
(
case+ x0.node() of
| I0DNTnone(tok) =>
  fprint!(out, "I0DNTnone(", tok, ")")
| I0DNTsome(tok) =>
  fprint!(out, "I0DNTsome(", tok, ")")
)

(* ****** ****** *)
//
implement
print_l0abl(l0) =
fprint_l0abl(stdout_ref, l0)
implement
prerr_l0abl(l0) =
fprint_l0abl(stderr_ref, l0)
//
implement
fprint_l0abl
  (out, l0) =
(
case+
l0.node() of
| L0ABLsome(lab) =>
  fprint!(out, "L0ABLsome(", lab, ")")
| L0ABLnone(tok) =>
  fprint!(out, "L0ABLnone(", tok, ")")
)
//
(* ****** ****** *)
//
implement
print_s0ymb(x0) =
fprint_s0ymb(stdout_ref, x0)
implement
prerr_s0ymb(x0) =
fprint_s0ymb(stderr_ref, x0)
//
implement
fprint_s0ymb
  (out, x0) =
(
case+
x0.node() of
//
| S0YMBi0dnt(id0) =>
  fprint!
  (out, "S0YMBi0dnt(", id0, ")")
//
(*
| S0YMBdtlab(dot1, lab2) =>
  fprint!
  ( out
  , "S0YMBdtlab(", dot1, "; ", lab2, ")")
*)
| S0YMBbrack(tok1, tok2) =>
  fprint!
  ( out
  , "S0YMBbrack(", tok1, "; ", tok2, ")")
//
) (* end of [fprint_s0ymb] *)
//
(* ****** ****** *)
//
implement
print_sq0eid(x0) =
fprint_sq0eid(stdout_ref, x0)
implement
prerr_sq0eid(x0) =
fprint_sq0eid(stderr_ref, x0)
//
implement
fprint_sq0eid
  (out, x0) =
(
case+ x0 of
| SQ0EIDnone(sid) =>
  fprint!(out, "SQ0EIDnone(", sid, ")")
| SQ0EIDsome(tok, sid) =>
  fprint!(out, "SQ0EIDsome(", tok, "; ", sid, ")")
)
//
(* ****** ****** *)
//
implement
print_dq0eid(x0) =
fprint_dq0eid(stdout_ref, x0)
implement
prerr_dq0eid(x0) =
fprint_dq0eid(stderr_ref, x0)
//
implement
fprint_dq0eid
  (out, x0) =
(
case+ x0 of
| DQ0EIDnone(sid) =>
  fprint!(out, "DQ0EIDnone(", sid, ")")
| DQ0EIDsome(tok, sid) =>
  fprint!(out, "DQ0EIDsome(", tok, "; ", sid, ")")
)
//
(* ****** ****** *)

implement
print_g0nam(x0) =
fprint_g0nam(stdout_ref, x0)
implement
prerr_g0nam(x0) =
fprint_g0nam(stderr_ref, x0)

(* ****** ****** *)

local

implement
fprint_val<g0nam> = fprint_g0nam

in (* in-of-local *)

implement
fprint_g0nam
  (out, x0) =
(
case+ x0.node() of
|
G0Nid0(tok) =>
fprint!(out, "G0Nid0(", tok, ")")
|
G0Nint(tok) =>
fprint!(out, "G0Nint(", tok, ")")
|
G0Nchr(tok) =>
fprint!(out, "G0Nchr(", tok, ")")
|
G0Nflt(tok) =>
fprint!(out, "G0Nflt(", tok, ")")
|
G0Nstr(tok) =>
fprint!(out, "G0Nstr(", tok, ")")
|
G0Nlist
(tbeg, gnms, tend) =>
fprint!
( out
, "G0Nlist("
, tbeg, "; ", gnms, "; ", tend, ")")
//
(*
| G0Nnone0() =>
  fprint!(out, "G0Nnone0(", ")")
*)
| G0Nnone1(tok) =>
  fprint!(out, "G0Nnone1(", tok, ")")
)
//
end // end of [local]

(* ****** ****** *)

implement
print_g0exp(x0) =
fprint_g0exp(stdout_ref, x0)
implement
prerr_g0exp(x0) =
fprint_g0exp(stderr_ref, x0)

local

implement
fprint_val<g0exp> = fprint_g0exp

in (* in-of-local *)

implement
fprint_g0exp
  (out, x0) =
(
case+ x0.node() of
//
| G0Eid0(gid) =>
  fprint!(out, "G0Eid0(", gid, ")")
//
| G0Eint(int) =>
  fprint!(out, "G0Eint(", int, ")")
| G0Echr(chr) =>
  fprint!(out, "G0Echr(", chr, ")")
| G0Eflt(flt) =>
  fprint!(out, "G0Eflt(", flt, ")")
| G0Estr(str) =>
  fprint!(out, "G0Estr(", str, ")")
//
| G0Eif0
  ( tif0
  , g0e1
  , g0e2
  , g0e3, topt) =>
  fprint!
  ( out
  , "G0Eif0(", tif0
  , g0e1, "; ", g0e2, "; ", g0e3, ")" )
//
| G0Eapps(s0ts) =>
  fprint!( out, "G0Eapps(", s0ts, ")" )
//
| G0Elist
  ( tbeg
  , g0es, tend) =>
  fprint!
  ( out
  , "G0Elist("
  , tbeg, "; ", g0es, "; ", tend, ")" )
//
| G0Enone1(tok) =>
  (
    fprint!( out, "G0Enone1(", tok, ")" )
  ) // end of [G0Enone]
//
) (* end of [fprint_g0exp] *)

end // end of [local]

(* ****** ****** *)

implement
print_g0exp_THEN(x0) =
fprint_g0exp_THEN(stdout_ref, x0)
implement
prerr_g0exp_THEN(x0) =
fprint_g0exp_THEN(stderr_ref, x0)
implement
fprint_g0exp_THEN(out, x0) =
(
case+ x0 of
| g0exp_THEN(tok, g0e) =>
  fprint!(out, "g0exp_THEN(", tok, "; ", g0e, ")")
) (* end of [fprint_g0exp_THEN] *)

implement
print_g0exp_ELSE(x0) =
fprint_g0exp_ELSE(stdout_ref, x0)
implement
prerr_g0exp_ELSE(x0) =
fprint_g0exp_ELSE(stderr_ref, x0)
implement
fprint_g0exp_ELSE(out, x0) =
(
case+ x0 of
| g0exp_ELSE(tok, g0e) =>
  fprint!(out, "g0exp_ELSE(", tok, "; ", g0e, ")")
) (* end of [fprint_g0exp_ELSE] *)

(* ****** ****** *)

implement
print_g0marg(x0) =
fprint_g0marg(stdout_ref, x0)
implement
prerr_g0marg(x0) =
fprint_g0marg(stderr_ref, x0)

local

implement
fprint_val<g0eid> = fprint_i0dnt

in (* in-of-local *)

implement
fprint_g0marg
  (out, x0) =
(
case+
x0.node() of
| G0MARGnone(tok) =>
  fprint!
  (out, "G0MARGnone(", tok, ")")
| G0MARGsarg(tbeg, g0as, tend) =>
  fprint!
  (out, "G0MARGsarg(", tbeg, "; ", g0as, "; ", tend, ")")
| G0MARGdarg(tbeg, g0as, tend) =>
  fprint!
  (out, "G0MARGdarg(", tbeg, "; ", g0as, "; ", tend, ")")
) (* fprint_g0marg *)

end // end of [local]

(* ****** ****** *)

implement
print_sort0(x0) =
fprint_sort0(stdout_ref, x0)
implement
prerr_sort0(x0) =
fprint_sort0(stderr_ref, x0)

local

implement
fprint_val<sort0> = fprint_sort0

in (* in-of-local *)

implement
fprint_sort0
  (out, x0) =
(
case+ x0.node() of
//
| S0Tid0(tid) =>
  fprint!(out, "S0Tid0(", tid, ")")
//
| S0Tint(int) =>
  fprint!(out, "S0Tint(", int, ")")
//
| S0Tapps(s0ts) =>
  fprint!(out, "S0Tapps(", s0ts, ")")
//
| S0Tlpar(t0, s0ts, t1) =>
  fprint!
  (out, "S0Tlpar(", t0, "; ", s0ts, "; ", t1, ")")
//
| S0Tqual(q0, s0t) =>
  fprint!
  (out, "S0Tqid(", q0, ", ", s0t, ")")
//
| S0Tnone(tok) =>
  fprint!( out, "S0Tnone(", tok, ")" )
//
) (* end of [fprint_sort0] *)

end // end of [local]

(* ****** ****** *)

implement
print_s0rtcon(x0) =
fprint_s0rtcon(stdout_ref, x0)
implement
prerr_s0rtcon(x0) =
fprint_s0rtcon(stderr_ref, x0)

implement
fprint_s0rtcon
  (out, x0) =
(
case+ x0.node() of
| S0RTCON(sid, opt) =>
  fprint!(out, "S0RTCON(", sid, ", ", opt, ")")
) (* end of [fprint_s0rtcon] *)

(* ****** ****** *)

implement
print_d0tsort(x0) =
fprint_d0tsort(stdout_ref, x0)
implement
prerr_d0tsort(x0) =
fprint_d0tsort(stderr_ref, x0)
implement
fprint_d0tsort
  (out, x0) =
(
case+ x0.node() of
| D0TSORT(tid, tok, s0cs) =>
  fprint!
  (out, "D0TSORT(", tid, "; ", tok, "; ", s0cs, ")")
) (* end of [fprint_d0tsort] *)

(* ****** ****** *)

implement
print_s0rtdef(x0) =
fprint_s0rtdef(stdout_ref, x0)
implement
prerr_s0rtdef(x0) =
fprint_s0rtdef(stderr_ref, x0)
implement
fprint_s0rtdef
  (out, x0) =
(
case+ x0.node() of
| S0RTDEFsort(s0t) =>
  fprint!(out, "S0RTDEFsort(", s0t, ")")
| S0RTDEFsbst(tbeg, s0a0, tbar, s0es, tend) =>
  fprint!
  ( out, "S0RTDEFsbst("
  , tbeg, "; ", s0a0, "; ", tbar, "; ", s0es, "; ", tend, ")")
) (* end of [fprint_s0rtdef] *)

(* ****** ****** *)

implement
print_s0arg(x0) =
fprint_s0arg(stdout_ref, x0)
implement
prerr_s0arg(x0) =
fprint_s0arg(stderr_ref, x0)

implement
print_s0marg(x0) =
fprint_s0marg(stdout_ref, x0)
implement
prerr_s0marg(x0) =
fprint_s0marg(stderr_ref, x0)

implement
fprint_s0arg
  (out, x0) =
(
case+
x0.node() of
| S0ARGnone(tok) =>
  fprint!(out, "S0ARGnone(", tok, ")")
| S0ARGsome(sid, opt) =>
  fprint!
  (out
  , "S0ARGsome(", sid, ", ", opt, ")")
) (* fprint_s0arg *)

implement
fprint_s0marg
  (out, x0) =
(
case+
x0.node() of
| S0MARGnone(tok) =>
  fprint!
  (out, "S0MARGnone(", tok, ")")
| S0MARGsing(tid) =>
  fprint!
  (out, "S0MARGsing(", tid, ")")
| S0MARGlist(tbeg, s0as, tend) =>
  fprint!
  (out, "S0MARGlist(", tbeg, "; ", s0as, "; ", tend, ")")
) (* fprint_s0marg *)

(* ****** ****** *)

implement
print_t0arg(x0) =
fprint_t0arg(stdout_ref, x0)
implement
prerr_t0arg(x0) =
fprint_t0arg(stderr_ref, x0)

implement
print_t0marg(x0) =
fprint_t0marg(stdout_ref, x0)
implement
prerr_t0marg(x0) =
fprint_t0marg(stderr_ref, x0)

implement
fprint_t0arg
  (out, x0) =
(
case+
x0.node() of
| T0ARGnone(tok) =>
  fprint!
  (out, "T0ARGnone(", tok, ")")
| T0ARGsome(s0t, opt) =>
  fprint!
  (out
  , "T0ARGsome(", s0t, ", ", opt, ")")
) (* fprint_t0arg *)

implement
fprint_t0marg
  (out, x0) =
(
case+
x0.node() of
| T0MARGnone(tok) =>
  fprint!(out, "T0MARGnone(", tok, ")")
| T0MARGlist(tbeg, t0as, tend) =>
  fprint!
  (out, "T0MARGlist(", tbeg, ", ", t0as, ", ", tend, ")")
) (* fprint_t0marg *)

(* ****** ****** *)

implement
print_s0qua(x0) =
fprint_s0qua(stdout_ref, x0)
implement
prerr_s0qua(x0) =
fprint_s0qua(stderr_ref, x0)

implement
fprint_s0qua
  (out, x0) =
(
case+ x0.node() of
| S0QUAprop(s0e) =>
  fprint!(out, "S0QUAprop(", s0e, ")")
| S0QUAvars(ids, opt) =>
  fprint!(out, "S0QUAvars(", ids, "; ", opt, ")")
)

(* ****** ****** *)

implement
print_s0uni(x0) =
fprint_s0uni(stdout_ref, x0)
implement
prerr_s0uni(x0) =
fprint_s0uni(stderr_ref, x0)

implement
fprint_s0uni
  (out, x0) =
(
case+ x0.node() of
| S0UNInone(tok) =>
  fprint!(out, "S0UNInone(", tok, ")")
| S0UNIsome(tbeg, s0qs, tend) =>
  fprint!
  ( out
  , "S0UNIsome(", tbeg, "; ", s0qs, "; ", tend, ")")
)

(* ****** ****** *)

implement
{a}(*tmp*)
fprint_sl0abled
  (out, x0) = let
//
val+SL0ABLED(l0, t0, x1) = x0
//
in
  fprint!(out, "SL0ABLED(");
  fprint!(out, l0, ", ", t0, ", ");
  fprint_val<a>(out, x1); fprint!(out, ")")
end // end of [fprint_sl0abled]

(* ****** ****** *)

implement
print_s0exp(x0) =
fprint_s0exp(stdout_ref, x0)
implement
prerr_s0exp(x0) =
fprint_s0exp(stderr_ref, x0)

local

implement
fprint_val<s0exp> = fprint_s0exp

in (* in-of-local *)

implement
fprint_s0exp
  (out, x0) =
(
case+ x0.node() of
//
| S0Eid0(sid) =>
  fprint!(out, "S0Eid0(", sid, ")")
//
| S0Eop1(opid) =>
  fprint!(out, "S0Eop1(", opid, ")")
| S0Eop2(tbeg, opid, tend) =>
  fprint!
  (out, "S0Eop2(", tbeg, "; ", opid, "; ", tend, ")")
//
| S0Eint(i0) =>
  fprint!(out, "S0Eint(", i0, ")")
| S0Echr(c0) =>
  fprint!(out, "S0Echr(", c0, ")")
| S0Eflt(f0) =>
  fprint!(out, "S0Eflt(", f0, ")")
| S0Estr(s0) =>
  fprint!(out, "S0Estr(", s0, ")")
//
| S0Eapps(s0es) =>
  fprint!(out, "S0Eapps(", s0es, ")")
//
| S0Eimp(tbeg, s0es, tend) =>
  fprint!
  ( out
  , "S0Eimp(", tbeg, "; ", s0es, "; ", tend, ")")
//
| S0Elpar
  (tbeg, s0es, tend) =>
  fprint!
  ( out
  , "S0Elpar(", tbeg, "; ", s0es, "; ", tend, ")")
//
| S0Eforall(tbeg, s0qs, tend) =>
  fprint!
  ( out
  , "S0Eforall(", tbeg, "; ", s0qs, "; ", tend, ")")
| S0Eexists(tbeg, s0qs, tend) =>
  fprint!
  ( out
  , "S0Eexists(", tbeg, "; ", s0qs, "; ", tend, ")")
//
| S0Etrcd1
  (tbeg, topt, s0es, tend) =>
  fprint!
  ( out
  , "S0Etrcd1("
  , tbeg, "; ", topt, "; ", s0es, "; ", tend, ")")
| S0Etrcd2
  (tbeg, topt, s0es, tend) =>
  fprint!
  ( out
  , "S0Etrcd2("
  , tbeg, "; ", topt, "; ", s0es, "; ", tend, ")")
//
| S0Elam
  ( tbeg
  , arg0, res1
  , tok1, s0e0, tend) =>
  fprint!
  ( out, "S0Elam("
  , tbeg, ";", arg0, ";", res1, "; "
  , tok1, "; ", s0e0, "; ", tend, ")")
//
| S0Eanno
  (s0e, ann) =>
  fprint!(out, "S0Eanno(", s0e, "; ", ann, ")")
//
| S0Equal
  (tok, s0e) =>
  fprint!(out, "S0Equal(", tok, "; ", s0e, ")")
//
| S0Enone(tok) => fprint!(out, "S0Enone(", tok, ")")
//
) (* end of [fprint_s0exp] *)

end // end of [local]

(* ****** ****** *)

implement
print_s0exp_RPAREN(x0) =
fprint_s0exp_RPAREN(stdout_ref, x0)
implement
prerr_s0exp_RPAREN(x0) =
fprint_s0exp_RPAREN(stderr_ref, x0)

local

implement
fprint_val<s0exp> = fprint_s0exp

in (* in-of-local *)

implement
fprint_s0exp_RPAREN
  (out, x0) =
(
case+ x0 of
| s0exp_RPAREN_cons0(tok) =>
  fprint!
  (out, "s0exp_RPAREN_cons0(", tok, ")")
| s0exp_RPAREN_cons1(tok1, s0es, tok2) =>
  fprint!
  (out, "s0exp_RPAREN_cons1(", tok1, ", ", s0es, ", ", tok2, ")")
) (* end of [fprint_s0exp_RPAREN] *)

end // end of [local]

(* ****** ****** *)

implement
print_labs0exp_RBRACE(x0) =
fprint_labs0exp_RBRACE(stdout_ref, x0)
implement
prerr_labs0exp_RBRACE(x0) =
fprint_labs0exp_RBRACE(stderr_ref, x0)

local

implement
fprint_val<s0exp> = fprint_s0exp

in (* in-of-local *)

implement
fprint_labs0exp_RBRACE
  (out, x0) =
(
case+ x0 of
| labs0exp_RBRACE_cons0(tok) =>
  fprint!
  (out, "labs0exp_RBRACE_cons0(", tok, ")")
| labs0exp_RBRACE_cons1(tok1, ls0es, tok2) =>
  fprint!
  (out, "labs0exp_RBRACE_cons1(", tok1, ", ", ls0es, ", ", tok2, ")")
) (* end of [fprint_labs0exp_RBRACE] *)

end // end of [local]

(* ****** ****** *)

(*
implement
print_s0eff(x0) =
fprint_s0eff(stdout_ref, x0)
implement
prerr_s0eff(x0) =
fprint_s0eff(stderr_ref, x0)
implement
fprint_s0eff
  (out, x0) =
(
case+ x0 of
| S0EFFnone(tok) =>
  fprint!
  (out, "S0EFFnone(", tok, ")")
| S0EFFsome
  (tbeg, s0es, tend) =>
  fprint!
  ( out
  , "S0EFFsome("
  , tbeg, "; ", s0es, "; ", tend, ")")
) (* end of [fprint_s0eff] *)
*)

(* ****** ****** *)

implement
print_effs0expopt(x0) =
fprint_effs0expopt(stdout_ref, x0)
implement
prerr_effs0expopt(x0) =
fprint_effs0expopt(stderr_ref, x0)
implement
fprint_effs0expopt
  (out, x0) =
(
case+ x0 of
| EFFS0EXPnone() =>
  fprint!(out, "EFFS0EXPnone(", ")")
| EFFS0EXPsome(s0e) =>
  fprint!(out, "EFFS0EXPsome(", s0e, ")")
(*
| EFFS0EXPsome(s0f, s0e) =>
  fprint!
  ( out
  , "EFFS0EXPsome(", s0f, "; ", s0e, ")")
*)
) (* end of [fprint_effs0expopt] *)

(* ****** ****** *)

implement
print_d0atype(x0) =
fprint_d0atype(stdout_ref, x0)
implement
prerr_d0atype(x0) =
fprint_d0atype(stderr_ref, x0)
implement
fprint_d0atype
  (out, x0) =
(
case+ x0.node() of
| D0ATYPE(tid, arg, res, teq, d0cs) =>
  fprint!
  ( out
  , "D0ATYPE("
  , tid, "; "
  , arg, "; ", res, "; ", teq, "; ", d0cs, ")")
) (* end of [fprint_d0atype] *)

(* ****** ****** *)

implement
print_d0atcon(x0) =
fprint_d0atcon(stdout_ref, x0)
implement
prerr_d0atcon(x0) =
fprint_d0atcon(stderr_ref, x0)
implement
fprint_d0atcon
  (out, x0) =
(
case+ x0.node() of
| D0ATCON(s0us, dcon, s0is, argopt) =>
  fprint!
  ( out, "D0ATCON("
  , s0us, "; ", dcon, "; ", s0is, "; ", argopt, ")")
) (* end of [fprint_d0atcon] *)

(* ****** ****** *)

(* end of [xats_staexp0_print.dats] *)

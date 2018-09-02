(***********************************************************************)
(*                                                                     *)
(*                         Applied Type System                         *)
(*                                                                     *)
(***********************************************************************)

(*
** ATS/Postiats - Unleashing the Potential of Types!
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
#staload
UN =
"prelude/SATS/unsafe.sats"
//
(* ****** ****** *)
//
#staload "./../SATS/label0.sats"
#staload "./../SATS/lexing.sats"
#staload "./../SATS/staexp1.sats"
//
(* ****** ****** *)
//
implement
fprint_val<token> = fprint_token
//
(* ****** ****** *)

implement
fprint_val<sort1> = fprint_sort1

(* ****** ****** *)

implement
fprint_val<s1arg> = fprint_s1arg

(* ****** ****** *)

implement
fprint_val<s1exp> = fprint_s1exp

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

implement
fprint_sort1
  (out, x0) =
(
case+ x0.node() of
//
| S1Tid(id) =>
  fprint!(out, "S1Tid(", id, ")")
//
| S1Tapp() =>
  fprint!(out, "S1Tapp()")
| S1Tinf(s1t) =>
  fprint!(out, "S1Tinf(", s1t, ")")
//
| S1Ttype(knd) =>
  fprint!(out, "S1Ttype", knd, ")")
//
| S1Tapps(s1t0, s1ts) =>
  fprint!
  (out, "S1Tapps(", s1t0, "; ", s1ts, ")")
//
| S1Tlist(s1ts) =>
  fprint!(out, "S1Tlist(", s1ts, ")")
//
| S1Tqual(tok0, s1t1) =>
  fprint!
  (out, "S1Tqual(", tok0, "; ", s1t1, ")")
//
| S1Tnone((*void*)) => fprint!(out, "S1Tnone(", ")")
//
) (* end of [fprint_sort1] *)

end // end of [local]

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
| S1ARGnone(tok) =>
  fprint!(out, "S1ARGnone(", tok, ")")
*)
| S1ARGsome(sid, opt) =>
  fprint!(out, "S1ARGsome(", sid, ", ", opt, ")")
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
| S1RTDEFsubset(s1a0, s1es) =>
  fprint!
  ( out, "S1RTDEFsubset(", s1a0, "; ", s1es, ")")
) (* end of [fprint_s1rtdef] *)

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
| S1Eid(tok) =>
  fprint!(out, "S1Eid(", tok, ")")
//
| S1Eint(tok) =>
  fprint!(out, "S1Eint(", tok, ")")
//
| S1Eapp() =>
  fprint!(out, "S1Eapp()")
| S1Einf(s1e) =>
  fprint!(out, "S1Einf(", s1e, ")")
//
| S1Eapps
  (s1e0, s1es) =>
  fprint!
  ( out
  , "S1Eapps(", s1e0, "; ", s1es, ")")
| S1Elist(s1es) =>
  fprint!(out, "S1Elist(", s1es, ")")
//
| S1Equal(tok, s1e) =>
  fprint!
  (out, "S1Equal(", tok, "; ", s1e, ")")
//
| S1Enone((*void*)) => fprint!(out, "S1Enone(", ")")
//
) (* fprint_s0exp *)

end // end of [local]

(* ****** ****** *)

(* end of [xats_staexp1_print.dats] *)

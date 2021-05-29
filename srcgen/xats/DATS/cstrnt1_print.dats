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
// Start Time: May 22nd, 2021
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
#staload "./../SATS/staexp2.sats"
#staload "./../SATS/cstrnt0.sats"
(* ****** ****** *)
#staload "./../SATS/cstrnt1.sats"
(* ****** ****** *)
implement
print_c1knd(x0) =
fprint_c1knd(stdout_ref, x0)
implement
prerr_c1knd(x0) =
fprint_c1knd(stderr_ref, x0)
(* ****** ****** *)
implement
print_c1itm(x0) =
fprint_c1itm(stdout_ref, x0)
implement
prerr_c1itm(x0) =
fprint_c1itm(stderr_ref, x0)
(* ****** ****** *)
implement
print_c1str(x0) =
fprint_c1str(stdout_ref, x0)
implement
prerr_c1str(x0) =
fprint_c1str(stderr_ref, x0)
(* ****** ****** *)
implement
fprint_val<s2exp> = fprint_s2exp
(* ****** ****** *)
implement
fprint_val<c1itm> = fprint_c1itm
implement
fprint_val<c1str> = fprint_c1str
(* ****** ****** *)
//
implement
fprint_c1knd
  (out, x0) =
(
case+ x0 of
|
C1Knone() =>
fprint!(out, "C1Knone")
|
C1Kbloc() =>
fprint!(out, "C1Kbloc")
//
|
C1Ksexi() =>
fprint!(out, "C1Ksexi")
|
C1Kif0() =>
fprint!(out, "C1Kif0")
|
C1Kcas0() =>
fprint!(out, "C1Kcas0")
|
C1Klams() =>
fprint!(out, "C1Klams")
|
C1Kfix1() =>
fprint!(out, "C1Kfix1")
|
C1Kfun0() =>
fprint!(out, "C1Kfun0")
|
C1Kimpl() =>
fprint!(out, "C1Kimpl")
) (* end of [fprint_c1knd] *)
//
(* ****** ****** *)
implement
fprint_c1itm
  (out, x0) =
(
case+ x0 of
| C1Isvar(s2v1) =>
  fprint!(out, "C1Isvar(", s2v1, ")")
| C1Ichyp(chyp) =>
  fprint!(out, "C1Ichyp(", chyp, ")")
| C1Icstr(cstr) =>
  fprint!(out, "C1Icstr(", cstr, ")")
| C1Idisj(c1ss) =>
  fprint!(out, "C1Idisj(", "...", ")")
)
(* ****** ****** *)
//
implement
fprint_c1str
  (out, x0) =
(
case+ x0.node() of
|
C1Ssexp(s2p1) =>
fprint!
(out, "C1Ssexp(", s2p1, ")")
|
C1Scstr(cstr) =>
fprint!
(out, "C1Scstr(", cstr, ")")
|
C1Smwfd(s2es) =>
fprint!
(out, "C1Smwfd(", s2es, ")")
|
C1Sitms(c1is) =>
fprint!
(out, "C1Sitms(", c1is, ")")
|
C1Seqeq(s2e1, s2e2) =>
fprint!
( out
, "C1Seqeq(", s2e1, ", ", s2e2, ")")
|
C1Stple(s2e1, s2e2) =>
fprint!
( out
, "C1Stple(", s2e1, ", ", s2e2, ")")
//
) (* end of [fprint_c1str] *)
//
(* ****** ****** *)
implement
print_c1hyp(x0) =
fprint_c1hyp(stdout_ref, x0)
implement
prerr_c1hyp(x0) =
fprint_c1hyp(stderr_ref, x0)
(* ****** ****** *)
implement
fprint_val<c1hyp> = fprint_c1hyp
(* ****** ****** *)
//
implement
fprint_c1hyp
  (out, x0) =
(
case+ x0.node() of
|
C1Hsexp(s2e1) =>
fprint!
(out, "C1Hsexp(", s2e1, ")")
|
C1Hbind(s2v1, s2e2) =>
fprint!
( out
, "C1Hbind(", s2v1, ", ", s2e2, ")")
|
C1Heqeq(s2e1, s2e2) =>
fprint!
( out
, "C1Heqeq(", s2e1, ", ", s2e2, ")")
) (* end of [fprint_c1hyp] *)
//
(* ****** ****** *)

(* end of [xats_cstrnt1_print.dats] *)

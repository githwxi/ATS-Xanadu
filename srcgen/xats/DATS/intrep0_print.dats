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
#staload "./../SATS/stamp0.sats"
//
#staload "./../SATS/symbol.sats"
//
(* ****** ****** *)

#staload "./../SATS/intrep0.sats"

(* ****** ****** *)

implement
fprint_val<htvar> = fprint_htvar
implement
fprint_val<h0srt> = fprint_h0srt
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
fprint_val<h0exp> = fprint_h0exp

(* ****** ****** *)

implement
fprint_val<h0dcl> = fprint_h0dcl

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
| H0Tnone1(_) =>
  fprint!(out, "H0Tnone1(", "...", ")")
//
| _(* H0T... *) => fprint!(out, "H0T...(...)")
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
| H0Enone1(_) =>
  fprint!(out, "H0Enone1(", "...", ")")
//
| _(* H0E... *) => fprint!(out, "H0E...(...)")
)
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
implement
fprint_h0dcl(out, x0) =
(
case+
x0.node() of
//
| H0Cnone1(_) =>
  fprint!(out, "H0Cnone1(", "...", ")")
//
| _(* H0C... *) => fprint!(out, "H0C...(...)")
)
//
(* ****** ****** *)

(* end of [xats_intrep0_print.dats] *)

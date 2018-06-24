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
// Start Time: June, 2018
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
#staload "./../SATS/lexing.sats"
#staload "./../SATS/staexp0.sats"
//
(* ****** ****** *)

implement
fprint_i0nt
  (out, x0) =
(
case+ x0.node() of
| I0NTnone() =>
  fprint!(out, "I0NTnone(", ")")
| I0NTsome(tok) =>
  fprint!(out, "I0NTsome(", tok, ")")
)

(* ****** ****** *)

implement
fprint_i0dnt
  (out, x0) =
(
case+ x0.node() of
| I0DNTnone() =>
  fprint!(out, "I0DNTnone(", ")")
| I0DNTsome(tok) =>
  fprint!(out, "I0DNTsome(", tok, ")")
)

(* ****** ****** *)

implement
fprint_s0rtq
  (out, x0) =
(
case+ x0.node() of
| S0RTQnone() =>
  fprint!(out, "S0RTQnone(", ")")
| S0RTQsymdot(tok) =>
  fprint!(out, "S0RTQsymdot(", tok, ")")
)

(* ****** ****** *)

(* end of [xats_staexp0_print.dats] *)

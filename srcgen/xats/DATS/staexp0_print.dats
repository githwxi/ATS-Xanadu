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
print_i0nt(x0) =
fprint_i0nt(stdout_ref, x0)
implement
prerr_i0nt(x0) =
fprint_i0nt(stderr_ref, x0)

implement
fprint_i0nt
  (out, x0) =
(
case+ x0.node() of
| I0NTnone(tok) =>
  fprint!(out, "I0NTnone(", tok, ")")
| I0NTsome(tok) =>
  fprint!(out, "I0NTsome(", tok, ")")
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
| S0QUAnone(tok) =>
  fprint!(out, "S0QUAnone(", tok, ")")
| S0QUAsymdot(tok0, tok1) =>
  fprint!(out, "S0QUAsymdot(", tok0, ", ", tok1, ")")
)

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
| SORT0id(id) =>
  fprint!(out, "SORT0id(", id, ")")
//
| SORT0qid(q, id) =>
  fprint!
  (out, "SORT0qid(", q, ", ", id, ")")
//
| SORT0app(s0ts) =>
  fprint!(out, "SORT0app(", s0ts, ")")
//
| SORT0list(t0, s0ts, t1) =>
  fprint!
  (out, "SORT0list(", t0, ", ", s0ts, ", ", t1, ")")
//
| SORT0none(token) =>
  fprint!(out, "SORT0none(", token, ")")
//
) (* end of [fprint_sort0] *)

end // end of [local]

(* ****** ****** *)

(* end of [xats_staexp0_print.dats] *)

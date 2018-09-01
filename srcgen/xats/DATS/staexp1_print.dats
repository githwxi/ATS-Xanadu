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
| S1Txerr((*void*)) => fprint!(out, "S1Txerr(", ")")
//
) (* end of [fprint_sort1] *)

end // end of [local]

(* ****** ****** *)

(* end of [xats_staexp1_print.dats] *)

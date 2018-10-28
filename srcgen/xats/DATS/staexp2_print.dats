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

#staload
SYM = "./../SATS/symbol.sats"

overload
fprint with $SYM.fprint_symbol

(* ****** ****** *)

#staload "./../SATS/staexp2.sats"

(* ****** ****** *)

implement
print_sort2(x0) =
fprint_sort2(stdout_ref, x0) 
implement
prerr_sort2(x0) =
fprint_sort2(stdout_ref, x0) 

local

implement
fprint_val<sort2> = fprint_sort2

in (* in-of-local *)

implement
fprint_sort2
  (out, s2t0) =
(
case+ s2t0 of
| S2Tbas(s2tb) =>
  fprint!(out, "S2Tbas(", s2tb, ")")
| S2Txtv(s2tx) =>
  fprint!(out, "S2Txtv(", "...", ")")
| S2Ttup(s2ts) =>
  fprint!(out, "S2Ttup(", s2ts, ")")
| S2Tfun(s2ts, s2t1) =>
  fprint!
  (out, "S2Tfun(", s2ts, "; ", s2t1, ")")
//
| S2Terr() => fprint!(out, "S2Terr(", ")")
//
) (* end of [fprint_sort2] *)

end // end of [local]

(* ****** ****** *)

implement
fprint_t2bas
  (out, s2tb) =
(
case+ s2tb of
| T2BASpre(sym) =>
  fprint!(out, "T2BASpre(", sym, ")")
| T2BASdef(s2td) =>
  fprint!(out, "T2BASdef(", s2td, ")")
| T2BASimp(knd, sym) =>
  fprint!(out, "T2BASimp(", knd, "; ", sym, ")")
)

(* ****** ****** *)
//
implement
print_t2dat(s2td) =
fprint_t2dat(stdout_ref, s2td)
implement
prerr_t2dat(s2td) =
fprint_t2dat(stderr_ref, s2td)
implement
fprint_t2dat(out, s2td) =
$SYM.fprint_symbol(out, s2td.sym())
//
(* ****** ****** *)

(* end of [xats_staexp2_print.dats] *)

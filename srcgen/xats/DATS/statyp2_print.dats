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
//
#staload
STM = "./../SATS/stamp0.sats"
overload
fprint with $STM.fprint_stamp
//
#staload
SYM = "./../SATS/symbol.sats"
overload
fprint with $SYM.fprint_symbol
//
(* ****** ****** *)
//
#staload "./../SATS/staexp2.sats"
#staload "./../SATS/statyp2.sats"
//
(* ****** ****** *)
//
#staload
_(*TMP*) = "./../DATS/staexp2_print.dats"
//
(* ****** ****** *)
//
implement
fprint_val<t2ype> = fprint_t2ype
//
(* ****** ****** *)
//
implement
print_t2ype(x0) =
fprint_t2ype(stdout_ref, x0) 
implement
prerr_t2ype(x0) =
fprint_t2ype(stdout_ref, x0) 
//
implement
fprint_t2ype
  (out, x0) =
(
case+
x0.node() of
//
| T2Pbas(sym) =>
  fprint!(out, "T2Pbas(", sym, ")")  
| T2Pcst(s2c) =>
  fprint!(out, "T2Pcst(", s2c, ")")
| T2Pvar(s2v) =>
  fprint!(out, "T2Pvar(", s2v, ")")
//
| T2Pxtv(xtv) =>
  let
(*
    val t2p = "..."
*)
    val t2p = t2xtv_get_type(xtv)
  in
    case+
    t2p.node() of
    | T2Pnone0() =>
      (
      fprint!
      (out, "T2Pxtv(", stm, ")")
      ) where
      {
        val stm = xtv.stamp((*void*))
      }
    | _ (* else *) =>
      fprint!(out, "T2Pxtv(", t2p, ")")
  end
//
| T2Pfun(fcr, npf, arg, res) =>
  fprint!
  ( out, "T2Pfun("
  , npf, "; ", arg, "; ", res, ")")
//
| T2Pexi(s2vs, body) =>
  fprint!(out, "T2Pexi(", "...", ")")
| T2Puni(s2vs, body) =>
  fprint!(out, "T2Puni(", "...", ")")
//
| T2Ptyrec(knd, npf, lxs) =>
  fprint!(out, "T2Ptyrec(", "...", ")")
//
| T2Pnone0() => fprint!(out, "T2Pnone0(", ")")
| T2Pnone1(s2e) => fprint!(out, "T2Pnone1(", s2e, ")")
//
)
//
(* ****** ****** *)

(* end of [xats_statyp2_print.dats] *)

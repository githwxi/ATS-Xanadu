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
STM = "./../SATS/stamp0.sats"
#staload
SYM = "./../SATS/symbol.sats"

overload
fprint with $STM.fprint_stamp
overload
fprint with $SYM.fprint_symbol

(* ****** ****** *)

#staload "./../SATS/basics.sats"

(* ****** ****** *)

#staload "./../SATS/staexp2.sats"

(* ****** ****** *)

implement
fprint_val<sort2> = fprint_sort2

implement
fprint_val<s2cst> = fprint_s2cst
implement
fprint_val<s2var> = fprint_s2var

implement
fprint_val<s2eff> = fprint_s2eff
implement
fprint_val<s2exp> = fprint_s2exp

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
  fprint!(out, "S2Txtv(", s2tx, ")")
| S2Ttup(s2ts) =>
  fprint!(out, "S2Ttup(", s2ts, ")")
| S2Tfun(s2ts, s2t1) =>
  fprint!
  (out, "S2Tfun(", s2ts, "; ", s2t1, ")")
//
| S2Tnone() => fprint!(out, "S2Tnone(", ")")
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
//
implement
print_t2xtv(s2tx) =
fprint_t2xtv(stdout_ref, s2tx)
implement
prerr_t2xtv(s2tx) =
fprint_t2xtv(stderr_ref, s2tx)
implement
fprint_t2xtv(out, s2tx) =
$STM.fprint_stamp(out, s2tx.stamp())
//
(* ****** ****** *)
//
implement
print_s2cst(x0) =
fprint_s2cst(stdout_ref, x0) 
implement
prerr_s2cst(x0) =
fprint_s2cst(stdout_ref, x0) 
//
implement
fprint_s2cst
  (out, x0) =
{
//
val () =
fprint!(out, x0.sym())
val () =
fprint!(out, "(", x0.stamp(), ")")
//
} (* end of [fprint_s2cst] *)
//
(* ****** ****** *)
//
implement
print_s2var(x0) =
fprint_s2var(stdout_ref, x0) 
implement
prerr_s2var(x0) =
fprint_s2var(stdout_ref, x0) 
//
implement
fprint_s2var
  (out, x0) =
{
//
val () =
fprint!(out, x0.sym())
val () =
fprint!(out, "(", x0.stamp(), ")")
//
} (* end of [fprint_s2var] *)
//
(* ****** ****** *)

implement
print_s2eff(x0) =
fprint_s2eff(stdout_ref, x0) 
implement
prerr_s2eff(x0) =
fprint_s2eff(stdout_ref, x0) 

local

implement
fprint_val<s2eff> = fprint_s2eff

in (* in-of-local *)
//
implement
fprint_s2eff
  (out, s2f0) =
(
case+ s2f0 of
| S2EFFexp(s2e) =>
  fprint!(out, "S2EFFexp(", s2e, ")")
| S2EFFset(efs) =>
  fprint!(out, "S2EFFset(", "...", ")")
| S2EFFjoin(s2fs) =>
  fprint!(out, "S2EFFjoin(", s2fs, ")")
)
//
end // end of [local]

(* ****** ****** *)

implement
print_s2exp(x0) =
fprint_s2exp(stdout_ref, x0) 
implement
prerr_s2exp(x0) =
fprint_s2exp(stdout_ref, x0) 

local

implement
fprint_val<s2exp> = fprint_s2exp

in (* in-of-local *)

implement
fprint_s2exp
  (out, s2e0) =
(
case+
s2e0.node() of
//
| S2Eint(i0) =>
  fprint!(out, "S2Eint(", i0, ")")
//
| S2Ecst(s2c) =>
  fprint!(out, "S2Ecst(", s2c, ")")
| S2Evar(s2v) =>
  fprint!(out, "S2Evar(", s2v, ")")
//
| S2Eapp
  (s2fn, s2es) =>
  fprint!
  (out, "S2Eapp(", s2fn, "; ", s2es, ")")
| S2Elam
  (s2vs, body) =>
  fprint!
  (out, "S2Elam(", s2vs, "; ", body, ")")
//
| S2Efun
  (fc2, lin, eff, npf, arg, res) =>
  fprint!
  ( out
  , "S2Efun(", fc2, "; ", lin, "; ", eff, "; ", npf, "; ", arg, "; ", res, ")"
  )
//
| S2Etop(knd, s2e) =>
  fprint!(out, "S2Etop(", knd, "; ", s2e, ")")
//
| S2Euni
  (s2vs, s2ps, body) =>
  fprint!
  ( out
  , "S2Euni(", s2vs, "; ", s2ps, "; ", body, ")")
| S2Eexi
  (s2vs, s2ps, body) =>
  fprint!
  ( out
  , "S2Eexi(", s2vs, "; ", s2ps, "; ", body, ")")
//
| S2Enone((*void*)) => fprint!(out, "S2Enone(", ")")
)

end // end of [local]

(* ****** ****** *)

(* end of [xats_staexp2_print.dats] *)

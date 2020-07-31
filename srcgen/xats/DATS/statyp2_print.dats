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
LAB = "./../SATS/label0.sats"
overload
fprint with $LAB.fprint_label
//
#staload
SYM = "./../SATS/symbol.sats"
overload
fprint with $SYM.fprint_symbol
//
(* ****** ****** *)
//
#staload "./../SATS/basics.sats"

(* ****** ****** *)

#staload "./../SATS/staexp2.sats"
#staload "./../SATS/statyp2.sats"
//
(* ****** ****** *)
//
#staload
_(*TMP*) =
  "./../DATS/staexp2_print.dats"
//
(* ****** ****** *)
//
implement
print_t2xtv(x0) =
fprint_t2xtv(stdout_ref, x0) 
implement
prerr_t2xtv(x0) =
fprint_t2xtv(stderr_ref, x0) 
//
implement
fprint_t2xtv
  (out, x0) = let
//
val s2t = x0.sort()
val t2p = x0.type()
val stm = x0.stamp()
//
in
fprint!
( out
, "X(", stm, ")", "[", t2p, " : ", s2t, "]")
end
//
(* ****** ****** *)
//
implement
print_t2ype(x0) =
fprint_t2ype(stdout_ref, x0) 
implement
prerr_t2ype(x0) =
fprint_t2ype(stderr_ref, x0) 
//
implement
print_labt2ype(x0) =
fprint_labt2ype(stdout_ref, x0) 
implement
prerr_labt2ype(x0) =
fprint_labt2ype(stderr_ref, x0) 
//
(* ****** ****** *)
//
local

implement
fprint_val<t2ype> = fprint_t2ype
implement
fprint_val<labt2ype> = fprint_labt2ype

in (* in-of-local *)
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
| T2Plft(t2p1) =>
  fprint!
  (out, "T2Plft(", t2p1, ")")
//
| T2Papp(t2p1, t2ps) =>
  fprint!
  (out, "T2Papp(", t2p1, "; ", t2ps, ")")
| T2Plam(s2vs, t2p1) =>
  fprint!
  (out, "T2Plam(", s2vs, "; ", t2p1, ")")
//
| T2Pfc2(fc2) =>
  fprint!
  (out, "T2Pfc2(", fc2, ")")
| T2Pfun(fc2, npf, arg, res) =>
  fprint!
  ( out, "T2Pfun("
  , fc2, "; ", npf, "; ", arg, "; ", res, ")")
//
| T2Pexi(s2vs, body) =>
  fprint!(out, "T2Pexi(", s2vs, "; ", body, ")")
| T2Puni(s2vs, body) =>
  fprint!(out, "T2Puni(", s2vs, "; ", body, ")")
//
| T2Ptyext(tnm1, t2ps) =>
  fprint!(out, "T2Ptyext(", tnm1, "; ", t2ps, ")")
//
| T2Ptyrec(knd1, npf2, lt2ps) =>
  fprint!
  ( out
  , "T2Ptyrec(", knd1, "; ", npf2, "; ", lt2ps, ")")
//
| T2Pnone0() => fprint!(out, "T2Pnone0(", ")")
| T2Pnone1(s2e) => fprint!(out, "T2Pnone1(", s2e, ")")
//
)
//
implement
fprint_labt2ype
  (out, lt2p) =
(
case+ lt2p of
| SLABELED(l0, t2p) => fprint!(out, l0, "=", t2p)
) (* end of [fprint_labt2ype] *)
//
end // end of [local]

(* ****** ****** *)
//
implement
pprint_t2ype(x0) =
fpprint_t2ype(stdout_ref, x0) 
implement
pprerr_t2ype(x0) =
fpprint_t2ype(stderr_ref, x0) 
//
(* ****** ****** *)

local
//
overload
fprint with fpprint_t2ype of 10
overload
fprint with fpprint_labt2ype of 10
//
implement
fprint_val<t2ype> = fpprint_t2ype
implement
fprint_val<labt2ype> = fpprint_labt2ype
//
in (* in-of-local *)
//
implement
fpprint_t2ype
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
    | _ (* else *) => fprint!(out, t2p)
  end
//
| T2Plft(t2p1) =>
  fprint!
  (out, "T2Plft(", t2p1, ")")
//
| T2Papp(t2p1, t2ps) =>
  fprint!
  (out, "T2Papp(", t2p1, "; ", t2ps, ")")
| T2Plam(s2vs, t2p1) =>
  fprint!
  (out, "T2Plam(", s2vs, "; ", t2p1, ")")
//
| T2Pfc2(fc2) =>
  fprint!
  (out, "T2Pfc2(", fc2, ")")
| T2Pfun(fc2, npf, arg, res) =>
  fprint!
  ( out, "T2Pfun("
  , fc2, "; ", npf, "; ", arg, "; ", res, ")")
//
| T2Pexi(s2vs, body) =>
  fprint!(out, "T2Pexi(", s2vs, "; ", body, ")")
| T2Puni(s2vs, body) =>
  fprint!(out, "T2Puni(", s2vs, "; ", body, ")")
//
| T2Ptyext(tnm1, t2ps) =>
  fprint!(out, "T2Ptyext(", tnm1, "; ", t2ps, ")")
//
| T2Ptyrec(knd1, npf2, lt2ps) =>
  fprint!
  ( out
  , "T2Ptyrec(", knd1, "; ", npf2, "; ", lt2ps, ")")
//
| T2Pnone0() => fprint!(out, "T2Pnone0(", ")")
| T2Pnone1(s2e) => fprint!(out, "T2Pnone1(", s2e, ")")
//
)
//
(* ****** ****** *)
//
implement
fpprint_labt2ype
  (out, lt2p) =
(
case+ lt2p of
| SLABELED(l0, t2p) => fprint!(out, l0, "=", t2p)
) (* end of [fprint_labt2ype] *)
//
end // end of [local]

(* ****** ****** *)

(* end of [xats_statyp2_print.dats] *)

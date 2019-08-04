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
// Start Time: August, 2019
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
#staload
SYM = "./../SATS/symbol.sats"
//
overload
= with $STM.eq_stamp_stamp
overload
= with $SYM.eq_symbol_symbol
//
(* ****** ****** *)
//
#staload "./../SATS/basics.sats"
//
#staload "./../SATS/staexp2.sats"
#staload "./../SATS/statyp2.sats"
//
(* ****** ****** *)

implement
sort2_erase(s2t0) =
(
case+ s2t0 of
| _ (* else *) => T2Snone()
)

(* ****** ****** *)

implement
s2exp_erase(s2e0) =
let
(*
val
t2s0 =
sort2_erase(s2e0.sort())
*)
in
case-
s2e0.node() of
//
| S2Ecst(s2c) => t2ype_cst(s2c)
| S2Evar(s2v) => t2ype_var(s2v)
//
| S2Eexi
  (s2vs, s2ps, body) =>
  t2ype_exi(s2vs, s2exp_erase(body))
| S2Euni
  (s2vs, s2ps, body) =>
  t2ype_uni(s2vs, s2exp_erase(body))
//
| _ (* else *) => t2ype_none((*void*))
//
end (* end of [s2exp_erase] *)

(* ****** ****** *)

(* end of [xats_statyp2_util0.dats] *)

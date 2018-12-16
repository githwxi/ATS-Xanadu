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
// Start Time: December, 2018
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
#staload "./../SATS/staexp2.sats"
//
(* ****** ****** *)
//
implement
eq_t2dat_t2dat
(x1, x2) =
(x1.stamp() = x2.stamp())
//
(* ****** ****** *)

implement
eq_t2bas_t2bas
(x1, x2) =
(
case+
(x1, x2) of
| ( T2BASpre s1
  , T2BASpre s2) => (s1 = s2)
| ( T2BASdat t1
  , T2BASdat t2) => (t1 = t2)
| ( T2BASimp(_, s1)
  , T2BASimp(_, s2)) => (s1 = s2)
//
| (_(*rest*), _(*rest*)) => false
//
) (* end of [eq_t2bas_t2bas] *)
//
(* ****** ****** *)

(* end of [xats_staexp2_util1.dats] *)

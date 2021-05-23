(***********************************************************************)
(*                                                                     *)
(*                         Applied Type System                         *)
(*                                                                     *)
(***********************************************************************)

(*
** ATS/Xanadu - Unleashing the Potential of Types!
** Copyright (C) 2021 Hongwei Xi, ATS Trustful Software, Inc.
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
// Start Time: May 22nd, 2021
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
#staload "./../SATS/staexp2.sats"
//
(* ****** ****** *)
//
#staload "./../SATS/cstrnt1.sats"
//
(* ****** ****** *)
implement
print_c1str(x0) =
fprint_c1str(stdout_ref, x0)
implement
prerr_c1str(x0) =
fprint_c1str(stderr_ref, x0)
(* ****** ****** *)
implement
fprint_val<c1str> = fprint_c1str
(* ****** ****** *)
//
implement
fprint_c1str
  (out, x0) =
(
case+ x0.node() of
|
C1Sprop(s2e1) =>
fprint!
(out, "C1Sprop(", s2e1, ")")
|
C1Sitms(c1is) =>
fprint!
(out, "C1Sitms(", "...", ")")
) (* end of [fprint_c0str] *)
//
(* ****** ****** *)

(* end of [xats_cstrnt1_print.dats] *)

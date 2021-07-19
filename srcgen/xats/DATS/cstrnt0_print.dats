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
// Start Time: March, 2021
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
#staload "./../SATS/statyp2.sats"
#staload "./../SATS/dynexp2.sats"
//
(* ****** ****** *)
//
#staload "./../SATS/cstrnt0.sats"
//
(* ****** ****** *)
implement
print_c0str(x0) =
fprint_c0str(stdout_ref, x0)
implement
prerr_c0str(x0) =
fprint_c0str(stderr_ref, x0)
(* ****** ****** *)
implement
fprint_val<c0str> = fprint_c0str
(* ****** ****** *)
//
implement
fprint_c0str
  (out, x0) =
(
case+ x0 of
//
(*
|
C0Heqeq(s2e1, s2e2) =>
fprint!
( out
, "C0Heqeq(", s2e1, "; ", s2e2, ")")
*)
|
C0Htpeq(s2e1, s2e2) =>
fprint!
( out
, "C0Htpeq(", s2e1, "; ", s2e2, ")")
//
(*
|
C0Ieqeq(s2e1, s2e2) =>
fprint!
( out
, "C0Ieqeq(", s2e1, "; ", s2e2, ")")
*)
|
C0Itple(s2e1, s2e2) =>
fprint!
( out
, "C0Itple(", s2e1, "; ", s2e2, ")")
|
C0Itpeq(s2e1, s2e2) =>
fprint!
( out
, "C0Itpeq(", s2e1, "; ", s2e2, ")")
//
) (* end of [fprint_c0str] *)
//
(* ****** ****** *)

(* end of [xats_cstrnt0_print.dats] *)

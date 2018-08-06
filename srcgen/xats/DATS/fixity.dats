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

#staload "./../SATS/fixity.sats"

(* ****** ****** *)
//
implement
print_assoc(x0) =
fprint_assoc(stdout_ref, x0)
implement
prerr_assoc(x0) =
fprint_assoc(stderr_ref, x0)
//
implement
fprint_assoc(out, x0) =
(
  case+ x0 of
  | ASSOCnon() => fprint!(out, "ASSOCnon")
  | ASSOClft() => fprint!(out, "ASSOClft")
  | ASSOCrgt() => fprint!(out, "ASSOCrgt")
) // end of [fprint_assoc]
//
(* ****** ****** *)

local

absimpl
prcdv_tflat = int

#define
MINPRCDV ~1000000000 // this is low enough
#define
MAXPRCDV  1000000000 // this is high enough

in (* in-of-local *)

implement
int2prcdv(x) =
(
ifcase
| x <= MINPRCDV => MINPRCDV
| x >= MAXPRCDV => MAXPRCDV | _ (*else*) => x
)
implement
prcdv2int(x) = x

implement app_prcdv = 70

implement
backslash_prcdv =
succ(prcdv2int(app_prcdv))
implement
infixtemp_prcdv = 0 // for temporary infix status

implement exists_prcdv = 0
implement forall_prcdv = 0

implement
the_neginf_prcdv = MINPRCDV
implement
the_posinf_prcdv = MAXPRCDV

end // end of [local]

(* ****** ****** *)
//
implement
print_prcdv(x0) = fprint(stdout_ref, x0)
implement
prerr_prcdv(x0) = fprint(stderr_ref, x0)
implement
fprint_prcdv(out, x0) = fprint(out, prcdv2int(x0))
//
(* ****** ****** *)

(* end of [xats_fixity.sats] *)

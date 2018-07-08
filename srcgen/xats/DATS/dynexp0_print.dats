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
// Start Time: July, 2018
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
#staload "./../SATS/lexing.sats"
//
#staload "./../SATS/staexp0.sats"
//
#staload "./../SATS/dynexp0.sats"
//
(* ****** ****** *)

implement
print_d0exp(x0) =
fprint_d0exp(stdout_ref, x0)
implement
prerr_d0exp(x0) =
fprint_d0exp(stderr_ref, x0)

local

implement
fprint_val<d0exp> = fprint_d0exp

in (* in-of-local *)

implement
fprint_d0exp
  (out, x0) =
(
case+ x0.node() of
//
| D0Eid(id) =>
  fprint!(out, "D0Eid(", id, ")")
| D0Equal(d0e) =>
  fprint!(out, "D0Equal(", d0e, ")")
//
) (* end of [fprint_d0exp] *)

end // end of [local]

(* ****** ****** *)

(* end of [xats_dynexp0_print.dats] *)

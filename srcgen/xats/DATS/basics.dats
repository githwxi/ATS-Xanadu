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
// Start Time: June, 2018
// Authoremail: gmhwxiATgmailDOTcom
//
(* ****** ****** *)
//
#staload
"./../SATS/basics.sats"
//
(* ****** ****** *)
//
#staload
UN =
"prelude/SATS/unsafe.sats"
//
(* ****** ****** *)

implement
fprint_valkind
  (out, vlk) =
(
//
case+ vlk of
| VLKval() => fprint(out, "VLKval")
| VLKvalp() => fprint(out, "VLKvalp")
| VLKvaln() => fprint(out, "VLKvaln")
(*
| VLKmcval() => fprint(out, "VLKprval")
*)
| VLKprval() => fprint(out, "VLKprval")
//
) (* end of [fprint_valkind] *)

(* ****** ****** *)

implement
fprint_funkind
  (out, fnk) =
(
//
case+ fnk of
| FNKfn0() => fprint(out, "FNKfn0")
| FNKfnx() => fprint(out, "FNKfnx")
| FNKfn1() => fprint(out, "FNKfn1")
| FNKfun() => fprint(out, "FNKfun")
//
| FNKprfn0() => fprint(out, "FNKprfn0")
| FNKprfn1() => fprint(out, "FNKprfn1")
| FNKprfun() => fprint(out, "FNKprfun")
| FNKpraxi() => fprint(out, "FNKpraxi")
//
| FNKcastfn() => fprint(out, "FNKcastfn")
//
) (* end of [fprint_funkind] *)

(* ****** ****** *)

implement
fprint_impkind
  (out, knd) =
(
  case+ knd of
  | IMPval() => fprint!(out, "IMPval")
  | IMPprf() => fprint!(out, "IMPprf")
) (* end of [fprint_impkind] *)

(* ****** ****** *)

local
//
#staload
"prelude/SATS/string.sats"
#staload
"prelude/DATS/string.dats"
//
in (* in-of-local *)

implement
xats_string_append
  (xs, ys) = let
  val xs = g1ofg0(xs)
  and ys = g1ofg0(ys)
in
  $effmask_all
  (strptr2string(string_append<>(xs, ys)))
end // end of [xats_string_append]

end // end of [local]

(* ****** ****** *)

(* end of [xats_basics.dats] *)

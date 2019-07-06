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
// Start Time: September, 2018
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
#staload "./../SATS/locinfo.sats"
//
(* ****** ****** *)
//
#staload "./../SATS/lexing.sats"
//
#staload "./../SATS/staexp2.sats"
#staload "./../SATS/dynexp2.sats"
//
#staload "./../SATS/t2check.sats"
//
(* ****** ****** *)

implement
{}(*tmp*)
t2check_d2ecl
  (d2c0) = let
//
val loc0 = d2c0.loc()
//
(*
val () =
println!
("t2check_d2ecl: d2c0 = ", d2c0)
*)
//
in
//
case+
d2c0.node() of
//
| _(* rest-of-d2ecl *) =>
  (
    prerrln!("t2check_d2ecl: d2c0 = ", d2c0)
  )
//
end // end of [t2check_d2ecl]

(* ****** ****** *)
//
implement
{}(*tmp*)
t2check_d2eclist
  (d2cs) =
(
list_foreach<d2ecl>(d2cs)
) where
{
implement(env)
list_foreach$fwork<d2ecl><env>(d2c, env) = t2check_d2ecl<>(d2c)
} (* end of [t2check_d2ecllst] *)
//
(* ****** ****** *)

(* end of [xats_t2check_dynexp.dats] *)

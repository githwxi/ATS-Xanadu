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
//
#staload "./../SATS/t2xread.sats"
//
(* ****** ****** *)

implement
{}(*tmp*)
t2xread_s2exp
  (s2e0) = let
//
(*
val loc0 = s2e0.loc()
*)
//
// (*
val () =
println!
("t2xread_s2exp: s2e0 = ", s2e0)
// *)
//
in
//
case+
s2e0.node() of
//
| S2Eint(int) => ()
| S2Echr(chr) => ()
//
| S2Ecst(s2c) => ()
| S2Evar(s2v) => ()
//
| S2Eapp(s2e1, s2es) =>
  {
    val () = t2xread_s2exp<>(s2e1)
    val () = t2xread_s2explst<>(s2es)  
  }
//
| S2Ecast
  (loc0, s2e1, s2t2) =>
  {
//
    val () =
    t2xerr_add(T2XERRs2exp(s2e0))
//
    val () = t2xread_s2exp<>(s2e1)
    val () = t2xread_sort2<>(s2t2)
//
    val () =
    prerrln!(loc0, ": T2XERR(s2exp): ", s2e0);
//
  }
//
| _(*rest-of-s2exp*) => ()
//
end // end of [t2xread_s2exp]

(* ****** ****** *)
//
implement
{}(*tmp*)
t2xread_s2explst
  (d2cs) =
(
list_foreach<s2exp>(d2cs)
) where
{
implement(env)
list_foreach$fwork<s2exp><env>(d2c, env) = t2xread_s2exp<>(d2c)
} (* end of [t2xread_s2explst] *)
//
(* ****** ****** *)

(* end of [xats_t2xread_staexp.dats] *)

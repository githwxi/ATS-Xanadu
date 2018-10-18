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
#staload "./../SATS/location.sats"
//
(* ****** ****** *)
//
#staload "./../SATS/lexing.sats"
#staload "./../SATS/staexp0.sats"
#staload "./../SATS/dynexp0.sats"
//
#staload "./../SATS/synread.sats"
//
(* ****** ****** *)

#staload
_(*TMP*) = "./../DATS/synread_staexp.dats"

(* ****** ****** *)

implement
{}(*tmp*)
synread_SORTDEF
  (tok) =
(
case+
tok.node() of
| T_SORTDEF() => ()
| _(*non-*SORTDEF*) =>
  let
    val () =
    synerr_add
    (SYNERRtoken(T_SORTDEF, tok))
  in
    prerr(tok.loc());
    prerrln!(": synread_SORTDEF: tok = ", tok)
  end // end of [let]
) (* end of [synread_SORTDEF] *)

(* ****** ****** *)
//
implement
{}(*tmp*)
synread_d0explst
  (d0es) =
(
list_foreach<d0exp>(d0es)
) where
{
implement(env)
list_foreach$fwork<d0exp><env>(d0e, env) = synread_d0exp<>(d0e)
} (* end of [synread_d0explst] *)
//
(* ****** ****** *)

implement
{}(*tmp*)
synread_d0ecl
  (d0c0) = let
//
val loc0 = d0c0.loc()
//
// (*
val () =
println!
("synread_d0ecl: d0c0 = ", d0c0)
// *)
//
in
//
case+
d0c0.node() of
| D0Csortdef
  (tok, tid, teq, def) =>
  {
    val () =
    synread_SORTDEF<>(tok)
    val () = synread_EQ<>(teq)
    val () = synread_s0tid<>(tid)
    val () = synread_s0rtdef<>(def)
  }
| D0Ctokerr(tok) =>
  (
    prerrln!(loc0, ": [d0ecl] needed");
    prerrln!(tok.loc(), ": tokerr: ", tok);
  )
| _(* rest-of-d0ecl *) =>
  (
    prerrln!("synread_d0ecl: d0c0 = ", d0c0)
  )
end // end of [synread_d0ecl]

(* ****** ****** *)
//
implement
{}(*tmp*)
synread_d0eclist
  (d0cs) =
(
list_foreach<d0ecl>(d0cs)
) where
{
implement(env)
list_foreach$fwork<d0ecl><env>(d0c, env) = synread_d0ecl<>(d0c)
} (* end of [synread_d0explst] *)
//
(* ****** ****** *)

implement
synread_top(d0cs) = let
in
  synread_d0eclist<>(d0cs)
end // end of [synread_top]

(* ****** ****** *)

(* end of [xats_synread_dynexp.dats] *)

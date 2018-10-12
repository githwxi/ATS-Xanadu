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

#staload "./../SATS/staexp0.sats"

(* ****** ****** *)

implement
synread_s0tid
  (tid) =
(
case+
tid.node() of
| I0DNTsome _ => ()
| I0DNTnone(tok) =>
  (
    println!
    ("synread_s0tid: tok = ", tok)
  )
)

(* ****** ****** *)

(*
implement
synread_sort0
  (s0t0) = let
//
val loc0 = s0t0.loc()
//
val () =
println!
("synread_sort0: s0t0 = ", s0t0)
//
in
//
case+
s0t0.node() of
| S0Tid(tid) =>
  synread_s0tid(tid)
//
| S0Tapps(s0ts) =>
  synread_sort0lst(s0ts)
//
| S0Tlist
  (tok1, s0ts, tok2) =>
  {
    val () = synread_LPAREN(tok1)
    val () = synread_RPAREN(tok2)
    val () = synread_sort0lst(s0ts)
  }
//
| S0Tqual(tok, s0t) =>
  synread_sort0(s0t) where
  {
    val () = synread_IDENT_qual(tok)
  }
| S0Tnone(tok) =>
  (
    prerrln!(loc0, ": [sort] needed");
    prerrln!(tok.loc(), ": tokerr: ", tok);
  )
//
end // end of [synread_sort0]
*)

(* ****** ****** *)

(* end of [xats_synread_staexp.dats] *)

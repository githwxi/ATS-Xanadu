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
//
#staload "./../SATS/synread.sats"
//
(* ****** ****** *)
//
extern
fun{}
synread_LPAREN: synreader(token)
extern
fun{}
synread_RPAREN: synreader(token)
//
(* ****** ****** *)
//
extern
fun{}
synread_IDENT_qual: synreader(token)
//
(* ****** ****** *)

implement
{}(*tmp*)
synread_LPAREN
  (tok) =
(
case+
tok.node() of
| T_LPAREN() => ()
| _(*non-*LPAREN*) =>
  let
    val () =
    synerr_add(SYNERRlparen(tok))
  in
    print(tok.loc());
    println!(": synread_LPAREN: tok = ", tok)
  end // end of [let]
) (* end of [synread_LPAREN] *)

(* ****** ****** *)

implement
{}(*tmp*)
synread_RPAREN
  (tok) =
(
case+
tok.node() of
| T_RPAREN() => ()
| _(*non-*PAREN*) =>
  let
    val () =
    synerr_add(SYNERRrparen(tok))
  in
    print(tok.loc());
    println!(": synread_RPAREN: tok = ", tok)
  end // end of [let]
) (* end of [synread_RPAREN] *)

(* ****** ****** *)

implement
{}(*tmp*)
synread_s0tid
  (tid) =
(
case+
tid.node() of
| I0DNTsome _ => ()
| I0DNTnone(tok) =>
  let
    val () =
    synerr_add(SYNERRs0tid(tid))
  in
    print(tok.loc());
    println!(": synread_s0tid: tok = ", tok)
  end // end of [let]
) (* end of [synread_s0tid] *)

(* ****** ****** *)

implement
{}(*tmp*)
synread_sort0
  (s0t0) = let
//
val loc0 = s0t0.loc()
//
(*
val () =
println!
("synread_sort0: s0t0 = ", s0t0)
*)
//
in
//
case+
s0t0.node() of
| S0Tid(tid) =>
  synread_s0tid<>(tid)
//
| S0Tapps(s0ts) =>
  synread_sort0lst<>(s0ts)
//
| S0Tlist
  (tok1, s0ts, tok2) =>
  {
    val () = synread_LPAREN<>(tok1)
    val () = synread_RPAREN<>(tok2)
    val () = synread_sort0lst<>(s0ts)
  }
//
| S0Tqual(tok, s0t) =>
  synread_sort0(s0t) where
  {
    val () = synread_IDENT_qual<>(tok)
  }
| S0Tnone(tok) =>
  (
    prerrln!(loc0, ": [sort] needed");
    prerrln!(tok.loc(), ": tokerr: ", tok);
  )
//
end // end of [synread_sort0]

(* ****** ****** *)
//
implement
{}(*tmp*)
synread_sort0lst
  (s0ts) =
(
list_foreach<sort0>(s0ts)
) where
{
implement
(env)
list_foreach$fwork<env><sort0>
  (env, s0t) = synread_sort0(s0t)
} (* end of [synread_sort0lst] *)
//
(* ****** ****** *)

(* end of [xats_synread_staexp.dats] *)

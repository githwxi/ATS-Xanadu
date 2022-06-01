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
// Start Time: April, 2018
// Authoremail: gmhwxiATgmailDOTcom
//
(* ****** ****** *)
//
#staload
UN = "prelude/SATS/unsafe.sats"
//
(* ****** ****** *)

#staload "./../SATS/cblist0.sats"

(* ****** ****** *)
//
implement
string2cblist(cs) =
(
cblist_cons(n0, cs, nil)
) where
{
  val n0 = length(cs)
  val cs = $UN.cast(cs)
  val nil = cblist_nil()
} (* end of [string2cblist] *)
//
(* ****** ****** *)

implement
cblist_length
  (cbs) = loop(cbs, 0) where
{
//
fun
loop
(cbs: cblist, res: Nat): Nat =
(
case+ cbs of
|
cblist_nil() => res
|
cblist_cons
(_, _, cbs) => loop(cbs, res+1)
)
//
} (* end of [cblist_length] *)

(* ****** ****** *)
//
implement
cblist_vt_length
  (cbs) =
(
cblist_length($UN.castvwtp1{cblist}(cbs))
) (* end of [cblist_vt_length] *)
//
(* ****** ****** *)

implement
{}(*tmp*)
cblist_foreach
  (cbs) = loop(cbs) where
{
//
fun
loop
(cbs: cblist): void =
(
case+ cbs of
|
cblist_nil() => ()
|
cblist_cons(n, cs, cbs) =>
(
cblist_foreach$fwork<>(n, cs); loop(cbs)
)
)
//
} (* end of [cblist_foreach] *)

(* ****** ****** *)

(* end of [XATSOPT_UTIL_cblist0.dats] *)

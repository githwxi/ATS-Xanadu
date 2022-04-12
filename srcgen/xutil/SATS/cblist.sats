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
datatype
cblist =
| cblist_nil of ()
| {n:pos}
  cblist_cons of
  (size_t(n), arrayref(uchar, n), cblist)
//
datavtype
cblist_vt =
| cblist_vt_nil of ()
| {n:pos}
  cblist_vt_cons of
  (size_t(n), arrayptr(uchar, n), cblist_vt)
//
(* ****** ****** *)
//
castfn
clist_vt2t(cbs: cblist_vt): cblist
//
(* ****** ****** *)
//
fun
string2cblist
  {n:pos}(text: string(n)): cblist
//
(* ****** ****** *)
//
fun
cblist_length(cbs: cblist): intGte(0)
fun
cblist_vt_length(cbs: !cblist_vt): intGte(0)
//
overload length with cblist_length
overload length with cblist_vt_length
//
(* ****** ****** *)

fun cblist_vt_free(cbs: cblist_vt): void

(* ****** ****** *)

fun{}
cblist_foreach(cbs: cblist): void
fun{}
cblist_foreach$fwork{n:int}(size_t(n), arrayref(uchar, n)): void
//
overload foreach with cblist_foreach
//
(* ****** ****** *)

(* end of [cblist.sats] *)

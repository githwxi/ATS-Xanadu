(***********************************************************************)
(*                                                                     *)
(*                         Applied Type System                         *)
(*                                                                     *)
(***********************************************************************)

(*
** ATS/Xanadu - Unleashing the Potential of Types!
** Copyright (C) 2021 Hongwei Xi, ATS Trustful Software, Inc.
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
// Start Time: January, 2021
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

#staload "./../SATS/statyp2.sats"
#staload "./../SATS/staexp2.sats"
#staload "./../SATS/dynexp2.sats"
#staload "./../SATS/dynexp3.sats"
#staload "./../SATS/dynexp4.sats"

(* ****** ****** *)

#staload "./../SATS/trans34.sats"

(* ****** ****** *)
//
datavtype
tr34env =
TR34ENV of
(abststk, dvarstk)
//
(* ****** ****** *)
//
and abststk =
//
| abststk_nil of ()
//
| abststk_let1 of abststk
| abststk_loc1 of abststk
| abststk_loc2 of abststk
//
| abststk_open of
  (d3ecl, s2cst, s2exp, abststk)
| abststk_impl of
  (d3ecl, s2cst, s2exp, abststk)
//
(* ****** ****** *)
//
and dvarstk =
//
| dvarstk_nil of ()
//
| dvarstk_let1 of dvarstk
| dvarstk_loc1 of dvarstk
| dvarstk_loc2 of dvarstk
//
| dvarstk_cons of (d2var, s2exp, dvarstk)
//
(* ****** ****** *)

absimpl
tr34env_vtype = tr34env

(* ****** ****** *)
//
implement
tr34env_make_nil() =
TR34ENV
(abststk_nil(), dvarstk_nil())
//
(* ****** ****** *)
//
implement
tr34env_free_nil
  (env0) = () where
{
//
val+~TR34ENV(stk1, stk2) = env0
//
val () =
case- stk1 of ~abststk_nil() => ()
val () =
case- stk2 of ~dvarstk_nil() => ()
//
} (* end of [tr34env_free_nil] *)
//
(* ****** ****** *)
//
local
//
fun
dvarstk_search
( dstk:
! dvarstk
, d2v0: d2var): s2exp =
(
case+ dstk of
|
dvarstk_nil() =>
the_s2exp_none0(*void*)
//
|
dvarstk_let1
( dstk ) =>
dvarstk_search(dstk, d2v0)
|
dvarstk_loc1
( dstk ) =>
dvarstk_search(dstk, d2v0)
|
dvarstk_loc2
( dstk ) =>
dvarstk_search(dstk, d2v0)
//
|
dvarstk_cons
(d2v1, s2e1, dstk) =>
if
(d2v0=d2v1)
then s2e1
else dvarstk_search(dstk, d2v0)
//
)
//
in(* in-of-local *)
//
implement
tr34env_d2var_get_sexp
( env0, d2v0 ) =
(
case+ env0 of
|
TR34ENV
(_, dstk) => dvarstk_search(dstk, d2v0)
)
//
end // end of [local]
//
(* ****** ****** *)

(* end of [xats_trans34_envmap.dats] *)

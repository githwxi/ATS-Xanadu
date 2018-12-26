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
// Start Time: December, 2018
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
#staload "./../SATS/staexp2.sats"
//
(* ****** ****** *)
//
#staload "./../SATS/trans12.sats"
//
(* ****** ****** *)

implement
s2cst_select_bin
(s2cs, s2t1, s2t2) =
(
list_find_opt<s2cst>(s2cs)
) where
{
fun
test
( s2c0
: s2cst): bool = let
//
val
s2t0 = s2c0.sort()
//
in
//
case+ s2t0 of
| S2Tfun
  (s2ts, _) => test_1_(s2ts)
| _(* non-S2Tfun *) => false
//
end // end of [test]
and
test_1_
( s2ts
: sort2lst): bool =
(
  if
  length(s2ts) = 2
  then
  (
  s2ts[0] <= s2t1
  &&
  s2ts[1] <= s2t2
  ) else false // end of [if]
)
//
val () = $tempenver(s2t1)
val () = $tempenver(s2t2)
//
implement
list_find$pred<s2cst>
  (s2c) = $effmask_all(test(s2c))
//
} (* end of [s2cst_select_bin] *)

(* ****** ****** *)

implement
s2cst_select_list
(s2cs, s2es) =
(
list_find_opt<s2cst>(s2cs)
) where
{
fun
test
( s2c0
: s2cst): bool = let
//
in
//
case+
s2c0.sort() of
| S2Tfun(s2ts, _) =>
  test_1_(s2ts, s2es)
| _(* non-S2Tfun *) => false
//
end // end of [test]
and
test_1_
( s2ts
: sort2lst
, s2es
: s2explst): bool =
(
case+ s2ts of
| list_nil() =>
  (
  case+ s2es of
  | list_nil() => true
  | list_cons _ => false
  )
| list_cons(s2t0, s2ts) =>
  (
  case+ s2es of
  | list_nil() => false
  | list_cons(s2e0, s2es) =>
    if
    s2e0.sort() <= s2t0
    then test_1_(s2ts, s2es) else false
  )
)
//
val () = $tempenver(s2es)
//
implement
list_find$pred<s2cst>
  (s2c) = $effmask_all(test(s2c))
//
} (* end of [s2cst_select_list] *)

(* ****** ****** *)

(* end of [trans12_basics.dats] *)

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
// Start Time: October, 2018
// Authoremail: gmhwxiATgmailDOTcom
//
(* ****** ****** *)

primplmnt
(*nonrec*)
lemma_list_param
  (xs) =
(
//
case+ xs of
| list_nil _ => ()
| list_cons _ => ()
//
) (* lemma_list_param *)

primplmnt
(*nonrec*)
lemma_list_vt_param
  (xs) =
(
//
case+ xs of
| list_vt_nil _ => ()
| list_vt_cons _ => ()
//
) (* lemma_list_vt_param *)

(* ****** ****** *)

implement
<x>(*tmp*)
list_copy
  (xs) =
(
list_map_vt1<x><x>(xs)
) where
{
implement
list_map$fopr_vt1<x><x>(x) = copy$val<x>(x)
} (* end of [list_copy] *)

(* ****** ****** *)

implement
<x>(*tmp*)
list_free
  (xs) =
(
  loop(xs)
) where
{
fun
loop
( xs
: list_vt(x)): void =
(
case+ xs of
| ~list_vt_nil() => ()
| @list_vt_cons(x0, xs1) =>
  (
    let
      val xs1 = xs1
    in
      free$ref<x>(x0); $freecon(xs1); loop(xs1)
    end
  )
) (* end of [loop] *)
} (* end of [list_free] *)

(* ****** ****** *)

implement
<x><n>
list_tabulate(n0) =
(
let
//
var r0: ptr?
val () =
loop(0, r0) in r0
//
endlet
) where
{
fun
loop
{ i:nat
| i <= n}
(
i0: sint(i)
,
r0: ptr? >>
    list_vt(x0, n-i)
) : void =
(
if
(i0 < n0)
then let
//
val x0 =
list_tabulate$fopr
<x><n>(i0)
//
val r0 =
list_vt_cons(x0, ?)
val+
list_vt_cons(_, r1) = r0
//
in
  loop(i0+1, r1); fold@(r0)
end // end of [then]
else (r0 := list_vt_nil())
) (* end of [loop] *)
} endwhere // list_tabulate

(* ****** ****** *)

implement
<x>
list_tabulate
{n}(n0, f0) =
(
  list_tabulate<x><n>(n0)
) where
{
  implement
  list_tabulate$fopr<x><n>(x) = f0(x)
} endwhere // list_tabulate

(* ****** ****** *)

(* end of [list.dats] *)

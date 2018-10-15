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
// Start Time: October, 2018
// Authoremail: gmhwxiATgmailDOTcom
//
(* ****** ****** *)

primplmnt
(*nonrec*)
lemma_list_param(xs) =
(
//
case+ xs of
| list_nil _ => () | list_cons _ => ()
//
) (* lemma_list_param *)

(* ****** ****** *)
//
implement
<a>(*tmp*)
list_tuple_0() = list_nil()
//
implement
<a>(*tmp*)
list_tuple_1(x0) = $list{a}(x0)
implement
<a>(*tmp*)
list_tuple_2(x0, x1) = $list{a}(x0, x1)
implement
<a>(*tmp*)
list_tuple_3(x0, x1, x2) = $list{a}(x0, x1, x2)
//
implement
<a>(*tmp*)
list_tuple_4
(x0, x1, x2, x3) = $list{a}(x0, x1, x2, x3)
implement
<a>(*tmp*)
list_tuple_5
(x0, x1, x2, x3, x4) = $list{a}(x0, x1, x2, x3, x4)
implement
<a>(*tmp*)
list_tuple_6
(x0, x1, x2, x3, x4, x5) = $list{a}(x0, x1, x2, x3, x4, x5)
//
(* ****** ****** *)

implement
<x>(*tmp*)
list_make_elt
  {n}(n, x) = let
//
fun loop
  {i:nat | i <= n} .<i>.
(
 i: int(i), x: x, res: list(x, n-i)
) :<> list(x, n) =
(
  if (i > 0)
    then loop(pred(i), x, list_cons(x, res)) else res
  // end of [if]
) // end of [loop]
//
in
  loop(n, x, list_nil(*void*))
end // end of [list_make_elt]

(* ****** ****** *)

implement
<(*tmp*)>
list_make_intrange
  {l0,r} (l0, r) = let
//
typedef
elt = intBtw(l0, r)
//
vtypedef
res(l:int) = list(elt, r-l)
//
fun
loop
{
  l:int
| l0 <= l; l <= r
} .<r-l>.
(
  l: int l, r: int r
, res: &ptr? >> res(l)
) :<!wrt> void =
(
//
if
(l < r)
then let
  val () = res :=
    list_cons{elt}{0}(l, _)
  // end of [val]
  val+list_cons(_, res1) = res
  val () = loop(l+1, r, res1)
  prval ((*folded*)) = fold@(res)
in
  // nothing
end else (res := list_nil())
//
) (* end of [loop] *)
//
in
//
  res where
  {
    // var res: ptr
    val ((*void*)) = $effmask_wrt(loop(l0, r, res))
  } (* end of [where] *)
end // end of [list_make_intrange]

(* ****** ****** *)
//
implement
<(*tmp*)>
fprint_list$sep
  (out) =
  fprint_string(out, ", ")
// end of [fprint_list$sep]
//
implement
<a>(*tmp*)
fprint_list(out, xs) = let
//
implement
{env}
list_iforeach$fwork<a><env>
  (i, x, env) = let
  val () =
  if i > 0
    then
    fprint_list$sep<(*none*)>(out)
  // end of [if]
  // end of [val]
in
  fprint_val<a>(out, x)
end // end of [list_iforeach$fwork]
//
val _(*len*) = list_iforeach<a>(xs)
//
in
  // nothing
endlet // end of [fprint_list]

(* ****** ****** *)

implement
<x0><y0>
list_map =
opverb_map
<x0><list(x0)><y0><list(y0)>
implement
<x0><y0>
list_map_vt0 =
opverb_map_vt0
<x0><list(x0)><y0><list_vt(y0)>

(* ****** ****** *)

implement
<r0><x0>
list_foldleft =
opverb_foldleft<r0><x0><list(x0)>

(* ****** ****** *)
//
implement
<x0>//tmp
list_length =
opverb_length<x0><list(x0)>

(* ****** ****** *)
//
implement
<x0><r0>
list_foldright =
opverb_foldright<x0><list(x0)><r0>
//
(* ****** ****** *)

(* end of [list.dats] *)

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
// Start Time: August, 2018
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
#staload
SYM = "./../SATS/symbol.sats"
#staload
MAP = "./../SATS/symmap.sats"
//
typedef sym_t = $SYM.sym_t
vtypedef
symmap(itm:type) = $MAP.symmap(itm)
//
(* ****** ****** *)
//
vtypedef
symmaplst
(
  itm:type, n:int
) = list_vt(symmap(itm), n)
vtypedef
symmaplst0
(itm:type) = [n:nat] symmaplst(itm, n)
//
(* ****** ****** *)

#staload "./../SATS/symenv.sats"

(* ****** ****** *)
//
fun
symmaplst_free
{itm:type}{n:nat} .<n>.
(xs: symmaplst(itm, n)): void =
(
case+ xs of
|
~list_vt_nil() => ()
|
~list_vt_cons(x, xs) =>
 ($MAP.symmap_free(x); symmaplst_free(xs))
) // end of [symmaplst_free]
//
(* ****** ****** *)
//
fun
symmaplst_search
{itm:type}{n:nat} .<n>.
( ms
: !symmaplst(itm, n), k0: sym_t
) : Option_vt(itm) =
(
case+ ms of
| list_vt_nil
    () => None_vt()
  // list_vt_nil
| list_vt_cons
    (m1, ms2) => let
    val ans =
      $MAP.symmap_search(m1, k0)
    // end of [val]
  in
    case+ ans of
    | @Some_vt _ => ans where
      {
        prval () = fold@(ans)
      }
    | ~None_vt() => symmaplst_search(ms2, k0)
  end (* end of [list_vt_cons] *)
) (* end of [symmaplst_search] *)
//
(* ****** ****** *)

absimpl
symenv_vt0ype
  (itm:type) = @{
  map0= symmap(itm)
, maps= symmaplst0(itm)
//
, saved=
  List0_vt(@(symmap(itm), symmaplst0(itm)))
//
, pmap0= symmap(itm) // HX: for the pervasive map
//
} // end of [symenv_v0type]

(* ****** ****** *)

implement
symenv_make_nil
  {itm}((*void*)) =
  (pf | p0) where
{
//
  vtypedef env_t = symenv(itm)
//
  val map0 = $MAP.symmap_make_nil()
//
  val
  (pf, pfgc | p0) = ptr_alloc<env_t>()
//
  prval((*linref*)) = mfree_gc_v_elim(pfgc)
//
  val () = p0->map0 := map0
  val () = p0->maps := list_vt_nil()
  val () = p0->saved := list_vt_nil()
  val () = p0->pmap0 := $MAP.symmap_make_nil()
//
} (* end of [symenv_make_nil] *)

(* ****** ****** *)
//
implement
symenv_search
{itm}(env, k0) = let
//
  val ans =
  $MAP.symmap_search(env.map0, k0)
//
in
  case+ ans of
  | ~None_vt() =>
    (
    $effmask_all
    (
      symmaplst_search(env.maps, k0)
    )
    )
  | @Some_vt _ =>
    (
      ans where { prval () = fold@(ans) }
    )
end // end of [symenv_search]
//
(* ****** ****** *)
//
implement
symenv_psearch
  {itm}(env, k0) =
  $MAP.symmap_search{itm}(env.pmap0, k0)
// end of [symenv_pervasive_search]
//
(* ****** ****** *)

implement
symenv_insert
{itm}(env, k0, x0) =
(
$MAP.symmap_insert{itm}(env.map0, k0, x0)
) (* end of [symenv_insert] *)

(* ****** ****** *)

implement
symenv_insert2
{itm}(env, k0, x0, mix) =
(
$MAP.symmap_insert2{itm}(env.map0, k0, x0, mix)
) (* end of [symenv_insert2] *)

(* ****** ****** *)
//
implement
symenv_pinsert
  {itm}(env, k0, x0) =
(
  $MAP.symmap_insert{itm}(env.pmap0, k0, x0)
) (* end of [symenv_pinsert] *)
//
(* ****** ****** *)

implement
symenv_pop
  (env) = map0 where
{
  val map0 = env.map0
  val-
 ~list_vt_cons
    (map1, maps) = env.maps
  // end of [val]
  val ((*void*)) = env.map0 := map1
  val ((*void*)) = env.maps := maps
} (* end of [symenv_pop] *)

implement
symenv_push
  (env, map0) = () where
{
//
val map1 = env.map0
val maps = env.maps
//
val ((*void*)) =
  (env.map0 := map0)
val ((*void*)) =
  (env.maps := list_vt_cons(map1, maps))
//
} (* end of [symenv_push] *)

(* ****** ****** *)
//
implement
symenv_popfree
  (env) =
  $MAP.symmap_free(symenv_pop(env))
implement
symenv_pushnil
  (env) =
  symenv_push(env, $MAP.symmap_make_nil())
//
(* ****** ****** *)

implement
symenv_locjoin
  {itm}(env) = let
//
val maps = env.maps
//
val-
~list_vt_cons(map1, maps) = maps
val-
~list_vt_cons(map2, maps) = maps
//
val ((*void*)) = $MAP.symmap_free(map1)
val ((*void*)) = (env.maps := maps)
//
// HX-2013-06:
// HX-2019-01-09:
// it is done in this way so as to hanlde the
// case where a binding in [map1] may replace
// another one in [map2] if they happen to be
// sharing the same key.
//
val m0 = env.map0
val () = env.map0 := map2
val () = $MAP.symmap_joinwth{itm}(env.map0, m0)
val () = $MAP.symmap_free{itm}(m0)
//
in
  // nothing
end // end of [symenv_locjoin]

(* ****** ****** *)

implement
symenv_pjoinwth0
  (env, map) = let
//
val () =
$MAP.symmap_joinwth(env.pmap0, map)
//
in
  $MAP.symmap_free(map)
end // end of [symenv_pervasive_joinwth0]

implement
symenv_pjoinwth1
  (env, map) =
  $MAP.symmap_joinwth(env.pmap0, map)
// end of [symenv_pervasive_joinwth1]

(* ****** ****** *)
//
implement
symenv_savecur
  {itm}(env) = let
val m0 = env.map0
val ms = env.maps
val () =
env.map0 :=
$MAP.symmap_make_nil()
val () =
env.maps := list_vt_nil()
val () =
env.saved := list_vt_cons((m0, ms), env.saved)
in
  // nothing
end // end of [symenv_savecur]
//
implement
symenv_restore
  {itm}(env) = let
//
val m0 = env.map0
val () =
symmaplst_free(env.maps)
//
val-
~list_vt_cons
  (x0, xs) = env.saved
val () = env.saved := (xs)
//
val () = env.map0 := x0.0 and () = env.maps := x0.1
in
m0 // HX-2019-10: the top map
end // end of [symenv_restore]
//
(* ****** ****** *)
//
implement
fprint_symenv_top
  (out, env, fpr) =
  $MAP.fprint_symmap(out, env.map0, fpr)
implement
fprint_symenv_ptop
  (out, env, fpr) =
  $MAP.fprint_symmap(out, env.pmap0, fpr)
//
(* ****** ****** *)

(* end of [xats_symenv.dats] *)

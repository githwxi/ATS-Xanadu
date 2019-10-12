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
//
(* ****** ****** *)

#staload "./../SATS/symmap.sats"

(* ****** ****** *)

typedef key = uint

(* ****** ****** *)

local
//
#staload _ =
"libats/DATS/qlist.dats"
//
#staload
"libats/SATS/linmap_avltree.sats"
#staload _ =
"libats/DATS/linmap_avltree.dats"
//
absimpl
symmap_vtype(itm:type) = map(key, itm)
//
implement
equal_key_key<key>(k0, k1) = (k0 = k1)
implement
compare_key_key<key>(k0, k1) = compare(k0, k1)
//
(* ****** ****** *)

in (* in-of-local *)

(* ****** ****** *)
//
implement
symmap_make_nil
  {itm}() =
  linmap_make_nil<>{key,itm}()
//
implement
symmap_free{itm}
  (map) = linmap_free<key,itm>(map)
//
(*
implement
symmaplst_free{itm}
  (maps) =
( loop(maps) ) where
{
//
vtypedef map = symmap(itm)
//
fun
loop{i:nat}.<i>.
(maps: list_vt(map, i)):<!wrt> void =
case+ maps of
| ~list_vt_nil
   () => ((*void*))
| ~list_vt_cons
   (m0, ms) => (symmap_free(m0); loop(ms))
//
} (* symmaplst_free *)
*)
//
(* ****** ****** *)
//
implement
symmap_search
{itm}(kxs, k0) =
$effmask_all
(
linmap_search_opt<key,itm>
  (kxs, stamp) where
{
  val
  stamp = $SYM.symbol_get_stamp(k0)
}
)
//
implement
symmap_insert
{itm}(kxs, k0, x0) =
$effmask_all
(
{
  val opt =
  linmap_insert_opt<key,itm>
    (kxs, stamp, x0) where
  {
    val
    stamp = $SYM.symbol_get_stamp(k0)
  }
  val ((*void*)) = option_vt_free(opt)
}
)
//
implement
symmap_insert2
{itm}(kxs, k0, x0, mix) =
$effmask_all
(
{
  local
    val
    stamp = $SYM.symbol_get_stamp(k0)
  in
  val opt =
  linmap_search_opt<key,itm>(kxs, stamp)
  val ((*void*)) =
  option_vt_free
  (
    linmap_insert_opt<key,itm>(kxs, stamp, x01)
  ) where
  {
    val x01 =
    (
    case+ opt of
    | ~None_vt() => x0 | ~Some_vt(x1) => mix(x0, x1)
    ) : itm // end of [val]
  }
  end // end of [local]
}
)
//
(* ****** ****** *)

implement
symmap_joinwth
{itm}
(map1, map2) = let
//
typedef kx = (key, itm)
//
fun
loop
{n:nat} .<n>.
( map: &symmap(itm)
, kxs: list_vt(kx, n)): void = let
(*
val () =
println!("symmap_joinwth: loop")
*)
in
//
case+ kxs of
| ~list_vt_nil
    ((*void*)) => ()
| @list_vt_cons
    (kx, kxs1) => let
    var res: itm
    val ret =
    linmap_insert<key,itm>
      (map, kx.0, kx.1, res)
    // end of [ret]
    val kxs1 = kxs1
    val ((*freed*)) = free@{kx}{0}(kxs)
  in
    let
      prval() =
      opt_clear(res) in loop{n-1}(map, kxs1)
    end
  end // end of [list_vt_cons]
//
end // end of [loop]
//
in
(
  loop(map1, kxs)
) where
  {
    val
    kxs = linmap_listize1<key,itm>(map2)
    prval
    ((*nonneg*)) = lemma_list_vt_param(kxs)
  } (* end of [where] *)
end // end of [symmap_joinwth]

(* ****** ****** *)

implement
fprint_symmap
{itm} // poly
(out, map, fpr) =
let
//
implement
fprint_val<key>
  (out, k0) = let
  val opt =
  $SYM.symbol_of_stamp(k0)
in
//
case- opt of
| ~Some_vt(sym) =>
  ($SYM.fprint_symbol(out, sym))
//
end // end of [fprint_val]
implement
fprint_val<itm>
  (out, itm) = fpr(out, itm)
//
(*
implement
fprint_linmap$sep<>(out) = ()
*)
// (*
implement
fprint_linmap$sep<>
  (out) = fprint_string(out, "\n")
implement
fprint_linmap$mapto<>
  (out) = fprint_string(out, " -> ")
// *)
//
in
//
  fprint_linmap<key,itm>(out, map)
//
end // end of [fprint_symmap]

(* ****** ****** *)

end // end of [local]

(* ****** ****** *)

(* end of [xats_symmap.dats] *)

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
(* ****** ****** *)
//
implement
symmap_search
{itm}(kxs, k0) =
(
linmap_search_opt<key,itm>
  (kxs, stamp) where
{
  val stamp = $SYM.symbol_get_stamp(k0)
}
)
//
implement
symmap_insert
{itm}(kxs, k0, x0) = () where
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
//
implement
symmap_insert2
{itm}(kxs, k0, x0, mix) = () where
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
//
(* ****** ****** *)

end // end of [local]

(* ****** ****** *)

(* end of [xats_symmap.dats] *)

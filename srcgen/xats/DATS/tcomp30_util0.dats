(***********************************************************************)
(*                                                                     *)
(*                         Applied Type System                         *)
(*                                                                     *)
(***********************************************************************)

(*
** ATS/Xanadu - Unleashing the Potential of Types!
** Copyright (C) 2020 Hongwei Xi, ATS Trustful Software, Inc.
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
// Start Time: July, 2020
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
#staload "./../SATS/basics.sats"
//
#staload "./../SATS/stamp0.sats"
//
(* ****** ****** *)

#staload "./../SATS/locinfo.sats"

(* ****** ****** *)

#staload "./../SATS/dynexp2.sats"
#staload "./../SATS/dynexp3.sats"

(* ****** ****** *)

#staload "./../SATS/intrep0.sats"

(* ****** ****** *)

#staload "./../SATS/tcomp30.sats"

(* ****** ****** *)

implement
hdvar_make_dvar
  (d2v) = let
//
val loc = d2v.loc()
val sym = d2v.sym()
val t2p = d2v.type()
//
val htp = tcomp30_type(t2p)
//
in
  hdvar_make_idtp(loc, sym, htp)
end // end of [hdvar_make_dvar]

(* ****** ****** *)

local

#staload
"libats/SATS\
/linmap_avltree.sats"
#staload _ =
"libats/DATS\
/linmap_avltree.dats"

typedef
cPtr0(a:vt0p) =
[l:agez] cptr(a, l)

typedef
key = d2var
and
itm = hdvar
vtypedef
d2vmap = map(key, itm)

var
the_d2var_map =
linmap_make_nil<>{key,itm}()
val
the_d2var_map = addr@the_d2var_map


implement
compare_key_key<key>
  (k1, k2) =
let
//
val x1 =
$effmask_all(k1.stamp())
and x2 =
$effmask_all(k2.stamp())
//
in compare_stamp_stamp(x1, x2) end

(* ****** ****** *)

in(*in-of-local*)

(* ****** ****** *)

implement
the_d2vmap_search_ref
  (d2v0) = let
//
val
map =
$UN.ptr0_get<d2vmap>(the_d2var_map)
val ref =
linmap_search_ref<key,itm>(map,d2v0)
//
in
let
prval () = $UN.cast2void(map) in ref
end
end // end of [the_d2vmap_search_ref]

implement
the_d2vmap_search_opt
  (d2v0) = let
//
val
ref = the_d2vmap_search_ref(d2v0)
//
in
//
if
iseqz(ref)
then None_vt()
else Some_vt($UN.cptr_get<itm>(ref))
//
end // end of [the_d2vmap_search_opt]

(* ****** ****** *)

implement
the_d2vmap_insert_any
  (d2v0, hdv1) = let
//
var
map =
$UN.ptr0_get<d2vmap>(the_d2var_map)
//
in
(
$UN.ptr0_set<d2vmap>(the_d2var_map, map)
) where
{
val () =
linmap_insert_any<key,itm>(map, d2v0, hdv1)
}
end // end of [the_d2vmap_insert_any]

implement
the_d2vmap_insert_exn
  (d2v0, hdv1) = let
//
var
map =
$UN.ptr0_get<d2vmap>(the_d2var_map)
//
in
(
$UN.ptr0_set<d2vmap>(the_d2var_map, map)
) where
{
val-
~None_vt() =
linmap_insert_opt<key,itm>(map, d2v0, hdv1)
}
end // end of [the_d2vmap_insert_exn]

(* ****** ****** *)

end // end of [local]

(* ****** ****** *)

(* end of [xats_tcomp30_util0.dats] *)

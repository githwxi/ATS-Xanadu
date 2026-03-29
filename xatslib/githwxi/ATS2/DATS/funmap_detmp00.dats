(***********************************************************************)
(*                                                                     *)
(*                         Applied Type System                         *)
(*                                                                     *)
(***********************************************************************)

(*
** ATS/Postiats - Unleashing the Potential of Types!
** Copyright (C) 2026 Hongwei Xi, ATS Trustful Software, Inc.
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
(* ****** ****** *)
(*
Author: Hongwei Xi
Sun Mar 29 11:30:05 AM EDT 2026
Authoremail: gmhwxiATgmailDOTcom
*)
//
(* ****** ****** *)
(* ****** ****** *)
//
#if
defq(
_FUNMAP_DETMP00_)
#then
(*
#typedef key = ???
#typedef itm = ???
*)
#else
//
#abstype key_type
#abstype itm_type
#typedef key = key_type
#typedef itm = itm_type
//
#endif//end-of-(#ifdefq(_DETMP_))
//
(* ****** ****** *)
(* ****** ****** *)
//
#staload
"./../SATS/funmap.sats"
//
#typedef fmap = fmap(key, itm)
//
(* ****** ****** *)
(* ****** ****** *)
//
#staload "./funmap_avltree.dats"
//
(* ****** ****** *)
(* ****** ****** *)
//
#extern
fun
funmap_search$opt__
(map: fmap, k0: key): optn_vt(itm)
#implfun
funmap_search$opt__ = funmap_search$opt<key><itm>
#impltmp
funmap_search$opt<key><itm> = funmap_search$opt__
//
(* ****** ****** *)
//
#extern
fun
funmap_insert$opt__
( map
: fmap
, k0: key, x0: itm): (fmap, optn_vt(itm))
#implfun
funmap_insert$opt__ = funmap_insert$opt<key><itm>
#impltmp
funmap_insert$opt<key><itm> = funmap_insert$opt__
//
(* ****** ****** *)
//
#extern
fun
funmap_remove$opt__
(map: fmap, k0: key): (fmap, bool)
#implfun
funmap_remove$opt__ = funmap_remove$opt<key><itm>
#impltmp
funmap_remove$opt<key><itm> = funmap_remove$opt__
//
#extern
fun
funmap_getout$opt__
(map: fmap, k0: key): (fmap, optn_vt(itm))
#implfun
funmap_getout$opt__ = funmap_getout$opt<key><itm>
#impltmp
funmap_getout$opt<key><itm> = funmap_getout$opt__
//
(* ****** ****** *)
(* ****** ****** *)
//
(***********************************************************************)
(* end of [ATS3/XANADU_xatslib_githwxi_ATS2_DATS_funmap_detmp00.dats] *)
(***********************************************************************)

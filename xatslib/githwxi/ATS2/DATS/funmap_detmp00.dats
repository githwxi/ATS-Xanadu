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
(* ****** ****** *)
(* ****** ****** *)
//
#if
defq(
_FUNMAP_DETMP00_)
#then
(*
#typedef _key_ = ???
#typedef _itm_ = ???
*)
#else
//
#abstype key_type
#abstype itm_type
#typedef _key_ = key_type
#typedef _itm_ = itm_type
//
#endif
//end(#ifdefq(_FUNMAP_DETMP00_))
//
(* ****** ****** *)
(* ****** ****** *)
//
#typedef _fmap_ = fmap(_key_, _itm_)
//
(* ****** ****** *)
(* ****** ****** *)
//
#extern
fun
funmap_search$opt__
(map: _fmap_, k0: _key_): optn_vt(_itm_)
#implfun
funmap_search$opt__ = funmap_search$opt<_key_><_itm_>
#impltmp
funmap_search$opt<_key_><_itm_> = funmap_search$opt__
//
(* ****** ****** *)
//
#extern
fun
funmap_insert$opt__
( map
: _fmap_
, k0: _key_, x0: _itm_): (_fmap_, optn_vt(_itm_))
#implfun
funmap_insert$opt__ = funmap_insert$opt<_key_><_itm_>
#impltmp
funmap_insert$opt<_key_><_itm_> = funmap_insert$opt__
//
(* ****** ****** *)
//
#extern
fun
funmap_remove$opt__
(map: _fmap_, k0: _key_): (_fmap_, bool)
#implfun
funmap_remove$opt__ = funmap_remove$opt<_key_><_itm_>
#impltmp
funmap_remove$opt<_key_><_itm_> = funmap_remove$opt__
//
#extern
fun
funmap_getout$opt__
(map: _fmap_, k0: _key_): (_fmap_, optn_vt(_itm_))
#implfun
funmap_getout$opt__ = funmap_getout$opt<_key_><_itm_>
#impltmp
funmap_getout$opt<_key_><_itm_> = funmap_getout$opt__
//
(* ****** ****** *)
(* ****** ****** *)
//
(***********************************************************************)
(* end of [ATS3/XANADU_xatslib_githwxi_ATS2_DATS_funmap_detmp00.dats] *)
(***********************************************************************)

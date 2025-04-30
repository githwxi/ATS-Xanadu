(***********************************************************************)
(*                                                                     *)
(*                         Applied Type System                         *)
(*                                                                     *)
(***********************************************************************)

(*
** ATS/Xanadu - Unleashing the Potential of Types!
** Copyright (C) 2025 Hongwei Xi, ATS Trustful Software, Inc.
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
//
(*
Author: Hongwei Xi
(*
Tue Apr 29 09:47:28 PM EDT 2025
*)
Authoremail: gmhwxiATgmailDOTcom
*)
//
(* ****** ****** *)
(* ****** ****** *)
//
#abstbox
mydict_type
(key:type,itm:type)
#sexpdef mydict = mydict_type
//
(* ****** ****** *)
(* ****** ****** *)
//
fun
<key:type>
mydict_make_nil
{itm:type}((*void*)): mydict(key, itm)
//
(* ****** ****** *)
(* ****** ****** *)
//
fun
<key:type>
mydict_search$opt
{itm:tbox}
( map
: mydict(key, itm), key: key): optn_vt(itm)
//
(* ****** ****** *)
//
fun
<key:type>
mydict_insert$any
{itm:tbox}
( map
: mydict(key, itm), key: key, itm: itm): void
//
(* ****** ****** *)
(* ****** ****** *)
//
(***********************************************************************)
(* end of [ATS3/XATSOPT_srcgen2_SATS_xlibext.sats] *)
(***********************************************************************)

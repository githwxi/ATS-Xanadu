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
Wed Apr 30 10:13:30 AM EDT 2025
*)
Authoremail: gmhwxiATgmailDOTcom
*)
//
(* ****** ****** *)
(* ****** ****** *)
#staload "./../SATS/xlibext.sats"
(* ****** ****** *)
(* ****** ****** *)
//
#impltmp
<key:type>
mydict_make_nil
{itm:tbox}((*void*)) =
XATSOPT_mydict_make_nil((*void*))
where{
#extern
fun
XATSOPT_mydict_make_nil
{key:type}
{itm:tbox}
((*void*)): mydict(key, itm) = $extnam()
}(*where*)//end-of-[impltmp(mydict_make_nil)]
//
(* ****** ****** *)
(* ****** ****** *)
//
#impltmp
<key:type>
mydict_search$opt
{itm:tbox}(map, key) =
XATSOPT_mydict_search$opt(map, key)
where{
#extern
fun
XATSOPT_mydict_search$opt
{key:type}
{itm:tbox}
( map
: mydict(key, itm), key: key): optn_vt(itm) = $extnam()
}(*where*)//end-of-[impltmp(mydict_search$opt(map,key))]
//
(* ****** ****** *)
//
#impltmp
<key:type>
mydict_insert$any
{itm:tbox}(map, key, itm) =
XATSOPT_mydict_insert$any(may, key, itm)
where{
#extern
fun
XATSOPT_mydict_insert$any
{key:type}
{itm:tbox}
( map
: mydict(key, itm), key: key, itm: itm): void
}(*where*)//end-of-[impltmp(mydict_insert$any(map,key,itm))]
//
(* ****** ****** *)
(* ****** ****** *)
//
(***********************************************************************)
(* end of [ATS3/XATSOPT_srcgen2_SATS_xlibext.dats] *)
(***********************************************************************)

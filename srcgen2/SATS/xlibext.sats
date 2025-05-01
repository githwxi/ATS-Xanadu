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
fpath_tbox(*void*)
#typedef fpath = fpath_tbox
//
(* ****** ****** *)
//
fcast
fpath_encode
(fpx: strn): fpath
#symload
fpath with fpath_encode
//
fun<>
fpath_char$strmize
(fpx: fpath): strm_vt(char)
//
(* ****** ****** *)
//
#abstbox
mya1sz_tbox(itm: type)
#abstbox
mydict_tbox
(key: type, itm: type)
//
#sexpdef mya1sz = mya1sz_tbox
#sexpdef mydict = mydict_tbox
//
(* ****** ****** *)
(* ****** ****** *)
//
fun
<itm:type>
mya1sz_strmize
(asz: mya1sz(itm)): strm_vt(itm)
//
(* ****** ****** *)
(* ****** ****** *)
//
fun
<key:type>
<itm:type>
mydict_make_nil
((*void*)): mydict(key, itm)
//
(* ****** ****** *)
(* ****** ****** *)
//
fun
<key:type>
<itm:type>
mydict_get_keys
(map: mydict(key, itm)): mya1sz(key)
//
(* ****** ****** *)
(* ****** ****** *)
//
fun
<key:type>
<itm:type>
mydict_search$opt
( map
: mydict(key, itm), key: key): optn_vt(itm)
//
(* ****** ****** *)
//
fun
<key:type>
<itm:type>
mydict_insert$any
( map
: mydict(key, itm), key: key, itm: itm): void
//
(* ****** ****** *)
(* ****** ****** *)
//
(***********************************************************************)
(* end of [ATS3/XATSOPT_srcgen2_SATS_xlibext.sats] *)
(***********************************************************************)

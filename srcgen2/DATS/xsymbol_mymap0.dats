(***********************************************************************)
(*                                                                     *)
(*                         Applied Type System                         *)
(*                                                                     *)
(***********************************************************************)

(*
** ATS/Xanadu - Unleashing the Potential of Types!
** Copyright (C) 2022 Hongwei Xi, ATS Trustful Software, Inc.
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
(*
Author: Hongwei Xi
Start Time: June 07th, 2022
Authoremail: gmhwxiATgmailDOTcom
*)
//
(* ****** ****** *)
#define
ATS_PACKNAME
"ATS3.XANADU.xatsopt-20220500"
(* ****** ****** *)
#include
"./../HATS/xatsopt_sats.hats"
#include
"./../HATS/xatsopt_dpre.hats"
(* ****** ****** *)
#staload "./../SATS/xlibext.sats"
#staload "./../SATS/xsymbol.sats"
(* ****** ****** *)
(* ****** ****** *)
#staload
_(*tmp*) =
"srcgen1\
/prelude/DATS/CATS/JS/basics3.dats"
(* ****** ****** *)
(* ****** ****** *)
//
#abstbox mymap_tbox // ptr
#typedef mymap = mymap_tbox
//
(* ****** ****** *)
//
local
//
(* ****** ****** *)
#typedef key = strn
#typedef itm = symbl
(* ****** ****** *)
#absimpl
mymap_tbox = mydict(key, itm)
(* ****** ****** *)
//
val
_MYMAP_: mymap =
mydict_make_nil<key><itm>((*nil*))
//
(* ****** ****** *)
in//local
(* ****** ****** *)
//
#implfun
symbl_search$opt(key) =
let
val map = _MYMAP_
in//let
(
mydict_search$opt<key><itm>(map, key))
end (*let*) // end of [symbl_search$opt(key)]
//
#implfun
symbl_insert$any(sym) =
let
val map = _MYMAP_
val key = sym.name()
in//let
(
mydict_insert$any<key><itm>(map, key, sym))
end (*let*) // end-of-[symbl_insert$any(sym)]
//
(* ****** ****** *)
//
end (*local*) // end of [local(absimpl(mymap_tbox))]
//
(* ****** ****** *)

(* end of [ATS3/XATSOPT_srcgen2_DATS_xsymbol_mymap0.dats] *)

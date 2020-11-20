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
// Start Time: July, 2019
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
"./../../xutl/SATS/mylibc.sats"
//
(* ****** ****** *)

#staload "./../SATS/global.sats"

(* ****** ****** *)
//
implement
the_XATSHOME_get() =
let
val
XATSHOME =
xatsopt_getenv_gc("XATSHOME")
in
//
if
isneqz(XATSHOME)
then
strptr2string(XATSHOME)
else let
//
// XATSHOME is undefined!
//
prval () =
strptr_free_null(XATSHOME) in ""
end (*let*) // end of [else]
//
end (* end of [the_XATSHOME_get *)
//
(* ****** ****** *)

local

typedef
fpathenv_struct =
@{
fpathenv_level = int
} (* fpathenv_struct *)

absimpl
fpathenv_tbox = ref(fpathenv_struct)

in (*in-of-local*)

end // end of [local]

(* ****** ****** *)

local
//
#staload
"libats/SATS/hashfun.sats"
#staload
"libats/SATS/hashtbl_chain.sats"
//
#staload _(*anon*) = "libats/DATS/qlist.dats"
//
#staload _(*anon*) = "libats/DATS/hashfun.dats"
#staload _(*anon*) = "libats/DATS/linmap_list.dats"
#staload _(*anon*) = "libats/DATS/hashtbl_chain.dats"
//
typedef key = filpath
typedef itm = fpathenv
//
vtypedef hashtbl = hashtbl(key, itm)
//
in (* in of local *)

end // end of [local]

(* ****** ****** *)

(* end of [xats_global.dats] *)

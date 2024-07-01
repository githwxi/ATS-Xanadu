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
Start Time: June 11th, 2022
Authoremail: gmhwxiATgmailDOTcom
*)
//
(* ****** ****** *)
#include
"./../HATS/xatsopt_sats.hats"
#include
"./../HATS/xatsopt_dats.hats"
(* ****** ****** *)
#define
ATS_PACKNAME
"ATS3.XANADU.xatsopt-20220500"
(* ****** ****** *)
#staload "./../SATS/xbasics.sats"
#staload "./../SATS/lexing0.sats"
(* ****** ****** *)

#abstbox mymap_tbox // ptr
#typedef mymap = mymap_tbox

(* ****** ****** *)

local

(* ****** ****** *)
#staload
"\
srcgen1\
/prelude/DATS/CATS/JS/basics1.dats"
(* ****** ****** *)

#typedef key = strn
#typedef itm = tnode

(* ****** ****** *)

#absimpl
mymap_tbox = jsobjmap(key, itm)

(* ****** ****** *)

val
mymaper: mymap =
XATS2JS_jsobjmap_make_nil<key>{itm}()

in//local

#implfun
lexing_tnode_search
  (   k0   ) =
(
case+ opt of
| ~optn_vt_nil() => T_EOF
| ~optn_vt_cons(tnd) => tnd
) where
{
val opt =
XATS2JS_jsobjmap_search_opt<key>{itm}(mymaper, k0)
}

#implfun
lexing_tnode_insert
  ( k0, x0 ) =
XATS2JS_jsobjmap_insert_any<key>{itm}(mymaper, k0, x0)

end (*local*) // end of [local]

(* ****** ****** *)

(* end of [ATS3/XATSOPT_srcgen2_DATS_lexing0_mymap0.dats] *)

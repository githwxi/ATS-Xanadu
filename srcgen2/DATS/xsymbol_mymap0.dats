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
"./../HATS/xatsopt_dats.hats"
(* ****** ****** *)
#staload "./../SATS/xsymbol.sats"
(* ****** ****** *)

#abstype mymap_tbox // ptr
#typedef mymap = mymap_tbox

(* ****** ****** *)

local

(* ****** ****** *)
#staload
"prelude\
/DATS/CATS/JS/basics1.dats"
(* ****** ****** *)

#typedef key = strn
#typedef itm = symbl

(* ****** ****** *)

#absimpl
mymap_tbox =
jsobjmap_type(key, itm)

(* ****** ****** *)

val
mymaper: mymap =
XATS2JS_jsobjmap_make_nil<key>{itm}()

in//local

#implfun
symbl_search_opt(k0) =
XATS2JS_jsobjmap_search_opt<key>{itm}(mymaper, k0)

#implfun
symbl_insert_any(sym) =
let
  val k0 = sym.name()
in//let
XATS2JS_jsobjmap_insert_any<key>{itm}(mymaper, k0, sym)
end (*let*) // end of [symbl_insert_any]

end (*local*) // end of [local]

(* ****** ****** *)

(* end of [ATS3/XATSOPT_xsymbol_mymap0.dats] *)

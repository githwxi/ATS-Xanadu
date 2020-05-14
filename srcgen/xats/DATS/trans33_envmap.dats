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
// Start Time: October, 2018
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

#staload "./../SATS/statyp2.sats"
#staload "./../SATS/staexp2.sats"
#staload "./../SATS/dynexp2.sats"
#staload "./../SATS/dynexp3.sats"

(* ****** ****** *)

#staload "./../SATS/trans33.sats"

(* ****** ****** *)
//
datavtype
abstenv =
ABSTENV of abstlst
//
and
abstlst =
//
| abstlst_nil of ()
//
| abstlst_let1 of abstlst
| abstlst_loc1 of abstlst
| abstlst_loc2 of abstlst
//
| abstlst_open of (d3ecl, t2ype, abstlst)
| abstlst_impl of (d3ecl, t2ype, abstlst)
//
(* ****** ****** *)

local

absimpl
abstenv_vtype = abstenv

in(*in-of-local*)

(* ****** ****** *)
//
implement
abstenv_make_nil
  ((*void*)) =
(
ABSTENV(abstlst_nil())
)
//
(* ****** ****** *)
//
implement
abstenv_free_nil
  (env0) =
{
val- ~ABSTENV(lst0) = env0
val- ~abstlst_nil() = lst0
}
//
(* ****** ****** *)

end // end of [local]

(* ****** ****** *)

(* end of [trans33_envmap.dats] *)
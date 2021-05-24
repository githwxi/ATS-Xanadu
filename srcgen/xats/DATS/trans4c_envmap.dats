(***********************************************************************)
(*                                                                     *)
(*                         Applied Type System                         *)
(*                                                                     *)
(***********************************************************************)

(*
** ATS/Xanadu - Unleashing the Potential of Types!
** Copyright (C) 2021 Hongwei Xi, ATS Trustful Software, Inc.
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
// Start Time: May 22nd, 2021
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

#staload "./../SATS/cstrnt1.sats"
#staload "./../SATS/trans4c.sats"

(* ****** ****** *)
//
datavtype
tr4cenv =
TR4cENV of citmstk
//
and citmstk =
//
| citmstk_nil of ()
//
| citmstk_if0 of (citmstk)
| citmstk_cas0 of (citmstk)
//
| citmstk_cons of (c1itm, citmstk)
//
(* ****** ****** *)

absimpl
tr4cenv_vtype = tr4cenv

(* ****** ****** *)
//
implement
tr4cenv_make_nil
  ((*void*)) =
(
  TR4cENV(citmstk_nil((*void*)))
)
//
(* ****** ****** *)
//
implement
tr4cenv_free_top
  (env0) =
(
let
val
c1is = list_vt_nil()
val+
~TR4cENV(stk0) = env0
in
list_vt2t(auxmain(stk0, c1is))
end
) where
{
fun
auxmain
( stk0
: citmstk
, c1is
: c1itmlst_vt): c1itmlst_vt =
(
case- stk0 of
| ~
citmstk_nil
((*void*)) =>
list_vt_reverse(c1is)
| ~
citmstk_cons
(c1i1, stk1) =>
auxmain
(stk1, list_vt_cons(c1i1, c1is))
)
} (*where*) // [tr4cenv_free_top]
//
(* ****** ****** *)

(* end of [xats_trans4c_envmap.dats] *)

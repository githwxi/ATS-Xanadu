(***********************************************************************)
(*                                                                     *)
(*                         Applied Type System                         *)
(*                                                                     *)
(***********************************************************************)

(*
** ATS/Xanadu - Unleashing the Potential of Types!
** Copyright (C) 2024 Hongwei Xi, ATS Trustful Software, Inc.
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
//
Fri Nov 29 04:00:58 PM EST 2024
//
Authoremail: gmhwxiATgmailDOTcom
*)
//
(* ****** ****** *)
(* ****** ****** *)
(*
#define
XATSOPT "./../../.."
*)
(* ****** ****** *)
#include
"./../../..\
/HATS/xatsopt_sats.hats"
(* ****** ****** *)
(* ****** ****** *)
//
#include
"./../HATS/libxats2js.hats"
//
(* ****** ****** *)
(* ****** ****** *)
//
#staload "./../SATS/py1emit.sats"
//
(* ****** ****** *)
(* ****** ****** *)
//
#implfun
py1emit_i1parsed
  (filr, ipar) = let
//
val stadyn =
i1parsed_get_stadyn(ipar)
val nerror =
i1parsed_get_nerror(ipar)
val source =
i1parsed_get_source(ipar)
val parsed =
i1parsed_get_parsed(ipar)
//
val
env0 = envx2js_make_out(filr)
//
in//let
(
  envx2js_free_top(env0)) where
{ val () =
  py1emit_i1dclistopt(env0, parsed) }
end(*let*)//end-of-[py1emit_i1parsed(filr,ipar)]
//
(* ****** ****** *)
(* ****** ****** *)
//
#impltmp
<x0>(*tmp*)
list_py1emit_fnp
( e1, xs, fopr ) =
(
list_foritm_e1nv<x0><e1>(xs, e1)) where
{
#vwtpdef e1 = envx2js
#impltmp
foritm$work_e1nv<x0><e1>(x0, e1) = fopr(e1, x0)
} (*where*)//end of [list_py1emit_fnp(e1,xs,fopr)]
//
(* ****** ****** *)
//
#impltmp
<x0>(*tmp*)
optn_py1emit_fnp
( e1, xs, fopr ) =
(
case+ xs of
| optn_nil() => () | optn_cons(x1) => fopr(e1, x1))
//
(* ****** ****** *)
(* ****** ****** *)

(***********************************************************************)
(* end of [ATS3/XANADU_srcgen2_xats2py_srcgen1_DATS_py1emit.dats] *)
(***********************************************************************)

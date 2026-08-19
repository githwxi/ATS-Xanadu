(***********************************************************************)
(*                                                                     *)
(*                         Applied Type System                         *)
(*                                                                     *)
(***********************************************************************)

(*
** ATS/Xanadu - Unleashing the Potential of Types!
** Copyright (C) 2026 Hongwei Xi, ATS Trustful Software, Inc.
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
Sun Jun 28 12:03:43 PM EDT 2026
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
//
#include
"./../../..\
/HATS/xatsopt_sats.hats"
#include
"./../../..\
/HATS/xatsopt_dpre.hats"
//
(* ****** ****** *)
(* ****** ****** *)
//
#include
"./../HATS/libxats2js.hats"
//
(* ****** ****** *)
(* ****** ****** *)
//
#staload "./../SATS/cm1emit.sats"
//
(* ****** ****** *)
(* ****** ****** *)
//
#impltmp
<x0>(*tmp*)
list_cm1emit_fnp
( xs, e1, fopr ) =
(
list_foritm$e1nv
<  x0  ><  e1  >(xs, e1)) where
{
#vwtpdef e1 = envx2cm
#impltmp
foritm$e1nv$work
<  x0  ><  e1  >(x0, e1) = fopr(x0, e1)
}(*where*)//end of [list_cm1emit_fnp(e1,xs,fopr)]
//
(* ****** ****** *)
//
#impltmp
<x0>(*tmp*)
optn_cm1emit_fnp
( xs, e1, fopr ) =
(
case+ xs of
|
optn_nil() =>
(  (*0*)  ) | optn_cons(x1) => fopr(x1, e1)
)(*case+*)//end of [optn_cm1emit_fnp(e1,xs,fopr)]
//
(* ****** ****** *)
(* ****** ****** *)
//
#implfun
i1parsed_cm1emit
  (ipar, filr) = let
//
val stadyn =
i1parsed_stadyn$get(ipar)
val nerror =
i1parsed_nerror$get(ipar)
val source =
i1parsed_source$get(ipar)
val parsed =
i1parsed_parsed$get(ipar)
//
val
env0 = envx2js_make_out(filr)
//
in//let
(
  envx2js_free_nil(env0)) where
{ val () =
  i1dclistopt_cm1emit(parsed, env0) }
end(*let*)//end-of-[cm1emit_i1parsed(ipar, filr)]
//
(* ****** ****** *)
(* ****** ****** *)
//
#implfun
i1dclist_cm1emit
  (dcls, env0) =
(
  list_cm1emit_fnp(dcls, env0, i1dcl_cm1emit))
(*where*)//end-of-[cm1emit_i1dclist(env0,dcl0)]
//
(* ****** ****** *)
(* ****** ****** *)
//
#implfun
i1valdclist_cm1emit
  (i1vs, env0) =
(
list_cm1emit_fnp(i1vs, env0, i1valdcl_cm1emit))
//
(* ****** ****** *)
//
#implfun
i1vardclist_cm1emit
  (i1vs, env0) =
(
list_cm1emit_fnp(i1vs, env0, i1vardcl_cm1emit))
//
(* ****** ****** *)
(* ****** ****** *)
//
#implfun
i1fundclist_cm1emit
  (i1fs, env0) =
(
list_cm1emit_fnp(i1fs, env0, i1fundcl_cm1emit))
//
(* ****** ****** *)
(* ****** ****** *)
//
#implfun
i1dclistopt_cm1emit
  (dopt, env0) =
(
  optn_cm1emit_fnp(dopt, env0, i1dclist_cm1emit))
//
(* ****** ****** *)
(* ****** ****** *)
//
(***********************************************************************)
(* end of [ATS3/XANADU_srcgen2_xats2cm_srcgen1_DATS_cm1emit.dats] *)
(***********************************************************************)

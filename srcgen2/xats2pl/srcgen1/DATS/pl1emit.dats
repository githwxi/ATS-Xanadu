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
Sat Sep  5 05:55:31 PM EDT 2026
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
#staload "./../SATS/pl1emit.sats"
//
(* ****** ****** *)
(* ****** ****** *)
//
#implfun
pl1emit_i1parsed
  (filr, ipar) = let
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
  pl1emit_i1dclistopt(env0, parsed) }
end(*let*)//end-of-[pl1emit_i1parsed(filr,ipar)]
//
(* ****** ****** *)
(* ****** ****** *)
//
#impltmp
<x0>(*tmp*)
list_pl1emit_fnp
( e1, xs, fopr ) =
(
list_foritm$e1nv<x0><e1>(xs, e1)) where
{
#vwtpdef e1 = envx2js
#impltmp
foritm$e1nv$work<x0><e1>(x0, e1) = fopr(e1, x0)
}(*where*)//end of [list_pl1emit_fnp(e1,xs,fopr)]
//
(* ****** ****** *)
//
#impltmp
<x0>(*tmp*)
optn_pl1emit_fnp
( e1, xs, fopr ) =
(
case+ xs of
|optn_nil
( (*0*) ) => () | optn_cons(x1) => fopr(e1, x1)
)(*case+*)//end of [optn_pl1emit_fnp(e1,xs,fopr)]
//
(* ****** ****** *)
(* ****** ****** *)
//
#implfun
pl1emit_i1dclist
  (env0, dcls) =
(
  list_pl1emit_fnp(env0, dcls, pl1emit_i1dcl))
(*where*)//end-of-[pl1emit_i1dclist(env0,dcl0)]
//
(* ****** ****** *)
(* ****** ****** *)
//
#implfun
pl1emit_i1valdclist
  (env0, i1vs) =
(
  list_pl1emit_fnp(env0, i1vs, pl1emit_i1valdcl))
//
(* ****** ****** *)
//
#implfun
pl1emit_i1vardclist
  (env0, i1vs) =
(
  list_pl1emit_fnp(env0, i1vs, pl1emit_i1vardcl))
//
(* ****** ****** *)
(* ****** ****** *)
//
#implfun
pl1emit_i1fundclist
  (env0, i1fs) =
(
  list_pl1emit_fnp(env0, i1fs, pl1emit_i1fundcl))
//
(* ****** ****** *)
(* ****** ****** *)
//
#implfun
pl1emit_i1dclistopt
  (env0, dopt) =
(
  optn_pl1emit_fnp(env0, dopt, pl1emit_i1dclist))
//
(* ****** ****** *)
(* ****** ****** *)
//
(***********************************************************************)
(* end of [ATS3/XANADU_srcgen2_xats2pl_srcgen1_DATS_pl1emit.dats] *)
(***********************************************************************)

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
Sun 26 May 2024 01:48:11 AM EDT
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
#staload "./../SATS/intrep0.sats"
#staload "./../SATS/intrep1.sats"
#staload "./../SATS/xats2js.sats"
#staload "./../SATS/js1emit.sats"
//
(* ****** ****** *)
(* ****** ****** *)
//
#implfun
js1emit_i1parsed
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
  js1emit_i1dclistopt(env0, parsed) }
end(*let*)//end-of-[js1emit_i1parsed(filr,ipar)]
//
(* ****** ****** *)
(* ****** ****** *)
//
#impltmp
<x0>(*tmp*)
list_js1emit_fnp
( e1, xs, fopr ) =
(
list_foritm$e1nv<x0><e1>(xs, e1)) where
{
#vwtpdef e1 = envx2js
#impltmp
foritm$e1nv$work<x0><e1>(x0, e1) = fopr(e1, x0)
} (*where*)//end of [list_js1emit_fnp(e1,xs,fopr)]
//
(* ****** ****** *)
//
#impltmp
<x0>(*tmp*)
optn_js1emit_fnp
( e1, xs, fopr ) =
(
case+ xs of
| optn_nil() => () | optn_cons(x1) => fopr(e1, x1))
//
(* ****** ****** *)
(* ****** ****** *)
//
//
#implfun
js1emit_i1dclist
  (env0, dcls) =
(
  list_js1emit_fnp(env0, dcls, js1emit_i1dcl))
(*where*)//end-of-[js1emit_i1dclist(env0,dcl0)]
//
(* ****** ****** *)
(* ****** ****** *)
//
#implfun
js1emit_i1valdclist
  (env0, i1vs) =
(
  list_js1emit_fnp(env0, i1vs, js1emit_i1valdcl))
//
(* ****** ****** *)
//
#implfun
js1emit_i1vardclist
  (env0, i1vs) =
(
  list_js1emit_fnp(env0, i1vs, js1emit_i1vardcl))
//
(* ****** ****** *)
(* ****** ****** *)
//
#implfun
js1emit_i1fundclist
  (env0, i1fs) =
(
  list_js1emit_fnp(env0, i1fs, js1emit_i1fundcl))
//
(* ****** ****** *)
(* ****** ****** *)
//
#implfun
js1emit_i1dclistopt
  (env0, dopt) =
(
  optn_js1emit_fnp(env0, dopt, js1emit_i1dclist))
//
(* ****** ****** *)
(* ****** ****** *)
//
(***********************************************************************)
(* end of [ATS3/XANADU_srcgen2_xats2js_srcgen1_DATS_js1emit.dats] *)
(***********************************************************************)

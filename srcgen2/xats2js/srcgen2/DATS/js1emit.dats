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
Sun May 17 11:47:38 AM EDT 2026
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
#include
"./../../..\
/HATS/xatsopt_dpre.hats"
(* ****** ****** *)
(* ****** ****** *)
//
#staload ".\
/../../../xats2cc\
/srcgen1/SATS/intrep0.sats"//...
//
#staload "./../SATS/intrep1.sats"
#staload "./../SATS/xats2js.sats"
#staload "./../SATS/js1emit.sats"
//
(* ****** ****** *)
(* ****** ****** *)
//
#implfun
i1parsed_js1emit
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
  i1dclistopt_js1emit(parsed, env0) }
end(*let*)//end-of-[i1parsed_js1emit(ipar,filr)]
//
(* ****** ****** *)
(* ****** ****** *)
//
#impltmp
<x0>(*tmp*)
list_js1emit_fnp
( xs, e1, fopr ) =
(
list_foritm$e1nv<x0><e1>(xs, e1)) where
{
#vwtpdef e1 = envx2js
#impltmp
foritm$e1nv$work<x0><e1>(*x0,e1*) = fopr(*0*)
}(*where*)//end-of-[list_js1emit_fnp(e1,xs,fopr)]
//
(* ****** ****** *)
//
#impltmp
<x0>(*tmp*)
optn_js1emit_fnp
( xs, e1, fopr ) =
(
case+ xs of
|
optn_nil() => () | optn_cons(x1) => fopr(x1, e1))
//
(* ****** ****** *)
(* ****** ****** *)
//
#implfun
i1letlst_js1emit
  (ilts, env0) =
(
  list_js1emit_fnp(ilts, env0, i1let_js1emit))
//
(* ****** ****** *)
(* ****** ****** *)
//
#implfun
i1dclist_js1emit
  (dcls, env0) =
(
  list_js1emit_fnp(dcls, env0, i1dcl_js1emit))
//
(* ****** ****** *)
(* ****** ****** *)
//
#implfun
i1valdclist_js1emit
  (i1vs, env0) =
(
  list_js1emit_fnp(i1vs, env0, i1valdcl_js1emit))
//
(* ****** ****** *)
//
#implfun
i1vardclist_js1emit
  (i1vs, env0) =
(
  list_js1emit_fnp(i1vs, env0, i1vardcl_js1emit))
//
(* ****** ****** *)
(* ****** ****** *)
//
#implfun
i1fundclist_js1emit
  (i1fs, env0) =
(
  list_js1emit_fnp(i1fs, env0, i1fundcl_js1emit))
//
#implfun
i1tfndclist_js1emit
  (i1fs, env0) =
(
  list_js1emit_fnp(i1fs, env0, i1tfndcl_js1emit))
//
(* ****** ****** *)
(* ****** ****** *)
//
#implfun
i1dclistopt_js1emit
  (dopt, env0) =
(
  optn_js1emit_fnp(dopt, env0, i1dclist_js1emit))
//
(* ****** ****** *)
(* ****** ****** *)
//
#implfun
i1fundclist_i0ws$js1emit
  (i1fs, i0ws, env0) =
(
list_foritm$e1nv<x0><e1>(i1fs, env0)
) where
{
#vwtpdef e1 = envx2js
#typedef x0 = i1fundcl
#impltmp
foritm$e1nv$work
<x0><e1>(ifun, env0) =
(
  i1fundcl_i0ws$js1emit(ifun, i0ws, env0))//impltmp
}(*where*)//end-of-[i1fundclist_i0ws$js1emit(i1fs,...)]
//
(* ****** ****** *)
//
#implfun
i1tfndclist_i0ws$js1emit
  (i1fs, i0ws, env0) =
(
list_foritm$e1nv<x0><e1>(i1fs, env0)
) where
{
#vwtpdef e1 = envx2js
#typedef x0 = i1fundcl
#impltmp
foritm$e1nv$work
<x0><e1>(ifun, env0) =
(
  i1tfndcl_i0ws$js1emit(ifun, i0ws, env0))//impltmp
}(*where*)//end-of-[i1tfndclist_i0ws$js1emit(i1fs,...)]
//
(* ****** ****** *)
(* ****** ****** *)
//
(***********************************************************************)
(* end of [ATS3/XANADU_srcgen2_xats2js_srcgen2_DATS_js1emit.dats] *)
(***********************************************************************)

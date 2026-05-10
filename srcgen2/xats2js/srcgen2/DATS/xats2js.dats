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
Sat May  9 10:58:19 AM EDT 2026
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
#staload "./../SATS/trxi0i1.sats"
#staload "./../SATS/xats2js.sats"
//
(* ****** ****** *)
(* ****** ****** *)
//
#implfun
i1parsed_xats2js
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
  i1dclistopt_xats2js(parsed, env0) }
end(*let*)//end-of-[i1parsed_xats2js(ipar,filr)]
//
(* ****** ****** *)
(* ****** ****** *)
//
#impltmp
<x0>(*tmp*)
list_xats2js_fnp
( xs, e1, fopr ) =
(
list_foritm$e1nv
<x0><e1>(xs, e1)) where
{
#vwtpdef e1 = envx2js
#impltmp
foritm$e1nv$work
<x0><e1>(x0, e1) = fopr(x0, e1)
}(*where*)//end(list_xats2js_fnp(e1,xs,fopr))
//
(* ****** ****** *)
//
#impltmp
<x0>(*tmp*)
optn_xats2js_fnp
( xs, e1, fopr ) =
(
case+ xs of
| optn_nil() => ()
| optn_cons(x1) => fopr(x1, e1)
)(*case+*)//end(optn_xats2js_fnp(e1,xs,fopr))
//
(* ****** ****** *)
(* ****** ****** *)
//
#implfun
i1letlst_xats2js
  (ilts, env0) =
(
  list_xats2js_fnp(ilts, env0, i1let_xats2js))
//
(* ****** ****** *)
(* ****** ****** *)
//
#implfun
fjarglst_xats2js
  (fjas, env0) =
(
  list_xats2js_fnp(fjas, env0, fjarg_xats2js))
//
(* ****** ****** *)
(* ****** ****** *)
//
#implfun
i1dclist_xats2js
  (dcls, env0) =
(
  list_xats2js_fnp(dcls, env0, i1dcl_xats2js))
//
(* ****** ****** *)
(* ****** ****** *)
//
#implfun
i1valdclist_xats2js
  (i1vs, env0) =
(
  list_xats2js_fnp(i1vs, env0, i1valdcl_xats2js))
//
(* ****** ****** *)
//
#implfun
i1vardclist_xats2js
  (i1vs, env0) =
(
  list_xats2js_fnp(i1vs, env0, i1vardcl_xats2js))
//
(* ****** ****** *)
//
#implfun
i1fundclist_xats2js
  (i1vs, env0) =
(
  list_xats2js_fnp(i1vs, env0, i1fundcl_xats2js))
//
(* ****** ****** *)
(* ****** ****** *)
//
#implfun
i1dclistopt_xats2js
  (dopt, env0) =
(
  optn_xats2js_fnp(dopt, env0, i1dclist_xats2js))
//
(* ****** ****** *)
(* ****** ****** *)
//
(***********************************************************************)
(* end of [ATS3/XANADU_srcgen2_xats2js_srcgen2_DATS_xats2js.dats] *)
(***********************************************************************)

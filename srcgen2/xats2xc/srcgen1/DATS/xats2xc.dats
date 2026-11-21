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
(*
Wed Mar 11 01:27:57 PM EDT 2026
*)
Authoremail: gmhwxiATgmailDOTcom
*)
//
(* ****** ****** *)
(* ****** ****** *)
#include
"./../../..\
/HATS/xatsopt_sats.hats"
#include
"./../../..\
/HATS/xatsopt_dpre.hats"
(* ****** ****** *)
#include
"./../HATS/mytmplib00.hats"
(* ****** ****** *)
(* ****** ****** *)
//
#staload "./../SATS/intrep0.sats"
#staload "./../SATS/intrep1.sats"
//
(* ****** ****** *)
//
#staload "./../SATS/xats2xc.sats"
//
(* ****** ****** *)
(* ****** ****** *)
//
#implfun
i1parsed_xcaemit
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
env0 = envx2cc_make_out(filr)
//
in//let
(
  envx2cc_free_nil(env0)) where
{ val () =
  i1dclistopt_xcaemit(parsed, env0) }
end(*let*)//end-of-[i1parsed_xcaemit(ipar,filr)]
//
(* ****** ****** *)
(* ****** ****** *)
//
#impltmp
<x0>(*tmp*)
list_xcaemit_fnp
( xs, e1, fopr ) =
(
list_foritm$e1nv
<x0><e1>(xs, e1)) where
{
#vwtpdef e1 = envx2cc
#impltmp
foritm$e1nv$work
<x0><e1>(x0, e1) = fopr(x0, e1)
}(*where*)//end(list_xcaemit_fnp(e1,xs,fopr))
//
(* ****** ****** *)
//
#impltmp
<x0>(*tmp*)
optn_xcaemit_fnp
( xs, e1, fopr ) =
(
case+ xs of
| optn_nil() => ()
| optn_cons(x1) => fopr(x1, e1)
)(*case+*)//end(optn_xcaemit_fnp(e1,xs,fopr))
//
(* ****** ****** *)
(* ****** ****** *)
//
#implfun
i1letlst_xcaemit
  (ilts, env0) =
(
  list_xcaemit_fnp(ilts, env0, i1let_xcaemit))
//
(* ****** ****** *)
(* ****** ****** *)
//
#implfun
i1cmplst_xcaemit
  (i1fs, env0) =
(
  list_xcaemit_fnp(i1fs, env0, i1cmp_xcaemit))
//
(* ****** ****** *)
(* ****** ****** *)
//
#implfun
fjarglst_xcaemit
  (fjas, env0) =
(
  list_xcaemit_fnp(fjas, env0, fjarg_xcaemit))
//
(* ****** ****** *)
(* ****** ****** *)
//
#implfun
i1dclist_xcaemit
  (dcls, env0) =
(
  list_xcaemit_fnp(dcls, env0, i1dcl_xcaemit))
//
(* ****** ****** *)
(* ****** ****** *)
//
#implfun
i1valdclist_xcaemit
  (i1vs, env0) =
(
  list_xcaemit_fnp(i1vs, env0, i1valdcl_xcaemit))
//
(* ****** ****** *)
//
#implfun
i1vardclist_xcaemit
  (i1vs, env0) =
(
  list_xcaemit_fnp(i1vs, env0, i1vardcl_xcaemit))
//
(* ****** ****** *)
//
#implfun
i1fundclist_xcaemit
  (i1vs, env0) =
(
  list_xcaemit_fnp(i1vs, env0, i1fundcl_xcaemit))
//
(* ****** ****** *)
//
#implfun
i1tfndclist_xcaemit
  (i1vs, env0) =
(
  list_xcaemit_fnp(i1vs, env0, i1tfndcl_xcaemit))
//
(* ****** ****** *)
(* ****** ****** *)
//
#implfun
i1dclistopt_xcaemit
  (dopt, env0) =
(
  optn_xcaemit_fnp(dopt, env0, i1dclist_xcaemit))
//
(* ****** ****** *)
(* ****** ****** *)
//
(***********************************************************************)
(***********************************************************************)
(* end of [ATS3/XANADU_srcgen2_xats2xc_srcgen1_DATS_xats2xc.dats] *)
(***********************************************************************)
(***********************************************************************)

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
Sun Aug 16 10:36:26 AM EDT 2026
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
#staload "./../SATS/intrep0.sats"
#staload "./../SATS/intrep1.sats"
//
(* ****** ****** *)
//
#staload "./../SATS/xats2xc.sats"
#staload "./../SATS/xc1emit.sats"
//
(* ****** ****** *)
(* ****** ****** *)
//
#implfun
envxcc1_make_out =
envx2cc_make_out(*out0*)
#implfun
envxcc1_free_nil =
envx2cc_free_nil(*env0*)
//
(* ****** ****** *)
//
#implfun
envxcc1_filr$get =
envx2cc_filr$get(*env0*)
#implfun
envxcc1_nind$get =
envx2cc_nind$get(*env0*)
//
(* ****** ****** *)
//
#implfun
envxcc1_incnind =
envx2cc_incnind(* env0 *)
#implfun
envxcc1_decnind =
envx2cc_decnind(* env0 *)
//
(* ****** ****** *)
//
#implfun
envxcc1_pshlam0 =
envx2cc_pshlam0(* env0 *)
#implfun
envxcc1_poplam0 =
envx2cc_poplam0(* env0 *)
//
#implfun
envxcc1_pshlet0 =
envx2cc_pshlet0(* env0 *)
#implfun
envxcc1_poplet0 =
envx2cc_poplet0(* env0 *)
//
(* ****** ****** *)
(* ****** ****** *)
//
#implfun
i1parsed_xc1emit
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
env0 = envxcc1_make_out(filr)
//
in//let
(
  envxcc1_free_nil(env0)) where
{ val () =
  i1dclistopt_xc1emit(parsed, env0) }
end(*let*)//end-of-[i1parsed_xc1emit(ipar,filr)]
//
(* ****** ****** *)
(* ****** ****** *)
//
#impltmp
<x0>(*tmp*)
list_xc1emit_fnp
( xs, e1, fopr ) =
(
list_foritm$e1nv
<  x0  ><  e1  >(xs, e1)) where
{
#vwtpdef e1 = envxcc1
#impltmp
foritm$e1nv$work
<  x0  ><  e1  >(x0, e1) = fopr(x0, e1)
}(*where*)//endof[list_xc1emit_fnp(xs,e1,fopr)]
//
(* ****** ****** *)
//
#impltmp
<x0>(*tmp*)
optn_xc1emit_fnp
( xs, e1, fopr ) =
(
case+ xs of
|
optn_nil() =>
(  (*0*)  ) | optn_cons(x1) => fopr(x1, e1)
)(*case+*)//endof[optn_xc1emit_fnp(xs,e1,fopr)]
//
(* ****** ****** *)
(* ****** ****** *)
//
#implfun
i1letlst_xc1emit
  (ilts, env0) =
(
  list_xc1emit_fnp(ilts, env0, i1let_xc1emit))
//
(* ****** ****** *)
(* ****** ****** *)
//
#implfun
i1dclist_xc1emit
  (dcls, env0) =
(
  list_xc1emit_fnp(dcls, env0, i1dcl_xc1emit))
//
(* ****** ****** *)
(* ****** ****** *)
//
#implfun
i1valdclist_xc1emit
  (i1vs, env0) =
(
  list_xc1emit_fnp(i1vs, env0, i1valdcl_xc1emit))
//
#implfun
i1vardclist_xc1emit
  (i1vs, env0) =
(
  list_xc1emit_fnp(i1vs, env0, i1vardcl_xc1emit))
//
(* ****** ****** *)
//
#implfun
i1fundclist_xc1emit
  (i1fs, env0) =
(
  list_xc1emit_fnp(i1fs, env0, i1fundcl_xc1emit))
//
#implfun
i1tfndclist_xc1emit
  (i1fs, env0) =
(
  list_xc1emit_fnp(i1fs, env0, i1tfndcl_xc1emit))
//  
(* ****** ****** *)
(* ****** ****** *)
//
#implfun
i1dclistopt_xc1emit
  (dopt, env0) =
(
  optn_xc1emit_fnp(dopt, env0, i1dclist_xc1emit))
//
(* ****** ****** *)
(* ****** ****** *)
//
#implfun
i1fundclist_i0ws$xc1emit
  (i1fs, i0ws, env0) =
(
list_foritm$e1nv<x0><e1>(i1fs, env0)
) where
{
#vwtpdef e1 = envxcc1
#typedef x0 = i1fundcl
#impltmp
foritm$e1nv$work
<x0><e1>(ifun, env0) =
(
  i1fundcl_i0ws$xc1emit(ifun, i0ws, env0))//impltmp
}(*where*)//end-of-[i1fundclist_i0ws$xc1emit(i1fs,...)]
//
(* ****** ****** *)
//
#implfun
i1tfndclist_i0ws$xc1emit
  (i1fs, i0ws, env0) =
(
list_foritm$e1nv<x0><e1>(i1fs, env0)
) where
{
#vwtpdef e1 = envxcc1
#typedef x0 = i1fundcl
#impltmp
foritm$e1nv$work
<x0><e1>(ifun, env0) =
(
  i1tfndcl_i0ws$xc1emit(ifun, i0ws, env0))//impltmp
}(*where*)//end-of-[i1tfndclist_i0ws$xc1emit(i1fs,...)]
//
(* ****** ****** *)
(* ****** ****** *)
//
(***********************************************************************)
(***********************************************************************)
(* end of [ATS3/XANADU_srcgen2_xats2xc_srcgen1_DATS_xc1emit.dats] *)
(***********************************************************************)
(***********************************************************************)

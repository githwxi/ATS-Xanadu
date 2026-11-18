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
Sun Aug 16 10:35:24 AM EDT 2026
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
#staload "./../SATS/xats2xc.sats"
#staload "./../SATS/xc0emit.sats"
//
(* ****** ****** *)
(* ****** ****** *)
//
#implfun
envxcc0_make_out =
envx2cc_make_out(*out0*)
#implfun
envxcc0_free_nil =
envx2cc_free_nil(*env0*)
//
(* ****** ****** *)
//
#implfun
envxcc0_filr$get =
envx2cc_filr$get(*env0*)
#implfun
envxcc0_nind$get =
envx2cc_nind$get(*env0*)
//
(* ****** ****** *)
(* ****** ****** *)
//
#implfun
i0parsed_xc0emit
  (ipar, filr) = let
//
val stadyn =
i0parsed_stadyn$get(ipar)
val nerror =
i0parsed_nerror$get(ipar)
val source =
i0parsed_source$get(ipar)
val parsed =
i0parsed_parsed$get(ipar)
//
val
env0 = envxcc0_make_out(filr)
//
in//let
(
  envxcc0_free_nil(env0)) where
{ val () =
  i0dclistopt_xc0emit(parsed, env0) }
end(*let*)//end-of-[i0parsed_xc0emit(filr,ipar)]
//
(* ****** ****** *)
(* ****** ****** *)
//
#impltmp
<x0>(*tmp*)
list_xc0emit_fnp
( xs, e1, fopr ) =
(
list_foritm$e1nv
<  x0  ><  e1  >(xs, e1)) where
{
#vwtpdef e1 = envxcc0
#impltmp
foritm$e1nv$work
<  x0  ><  e1  >(x0, e1) = fopr(x0, e1)
}(*where*)//endof[list_xc0emit_fnp(e1,xs,fopr)]
//
(* ****** ****** *)
//
#impltmp
<x0>(*tmp*)
optn_xc0emit_fnp
( xs, e1, fopr ) =
(
case+ xs of
|
optn_nil() =>
(  (*0*)  ) | optn_cons(x1) => fopr(x1, e1)
)(*case+*)//endof[optn_xc0emit_fnp(e1,xs,fopr)]
//
(* ****** ****** *)
(* ****** ****** *)
//
#implfun
i0explst_xc0emit
  (i0es, env0) =
(
  list_xc0emit_fnp(i0es, env0, i0exp_xc0emit))
(*where*)//end-of-[i0explst_xc0emit(i0es,env0)]
//
#implfun
i0expopt_xc0emit
  (iopt, env0) =
(
  optn_xc0emit_fnp(iopt, env0, i0exp_xc0emit))
(*where*)//end-of-[i0expopt_xc0emit(i0es,env0)]
//
(* ****** ****** *)
(* ****** ****** *)
//
#implfun
fiarglst_xc0emit
  (fias, env0) =
(
  list_xc0emit_fnp(fias, env0, fiarg_xc0emit))
(*where*)//end-of-[fiarglst_xc0emit(fias,env0)]
//
(* ****** ****** *)
(* ****** ****** *)
//
#implfun
i0dclist_xc0emit
  (dcls, env0) =
(
  list_xc0emit_fnp(dcls, env0, i0dcl_xc0emit))
(*where*)//end-of-[i0dclist_xc0emit(dcls,env0)]
//
(* ****** ****** *)
(* ****** ****** *)
//
#implfun
i0valdclist_xc0emit
 (i0vs, env0) =
(
  list_xc0emit_fnp(i0vs, env0, i0valdcl_xc0emit))
//
#implfun
i0vardclist_xc0emit
 (i0vs, env0) =
(
  list_xc0emit_fnp(i0vs, env0, i0vardcl_xc0emit))
//
(* ****** ****** *)
//
#implfun
i0fundclist_xc0emit
 (i0fs, env0) =
(
  list_xc0emit_fnp(i0fs, env0, i0fundcl_xc0emit))
//
(* ****** ****** *)
(* ****** ****** *)
//
#implfun
i0dclistopt_xc0emit
  (dopt, env0) =
(
  optn_xc0emit_fnp(dopt, env0, i0dclist_xc0emit))
//
(* ****** ****** *)
(* ****** ****** *)
//
(***********************************************************************)
(***********************************************************************)
(* end of [ATS3/XANADU_srcgen2_xats2xc_srcgen1_DATS_xc0emit.dats] *)
(***********************************************************************)
(***********************************************************************)

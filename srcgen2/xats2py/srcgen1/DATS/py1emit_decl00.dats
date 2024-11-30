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
(*
Fri Nov 29 04:23:24 PM EST 2024
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
/HATS/xatsopt_dats.hats"
(* ****** ****** *)
#include
"./../HATS/mytmplib00.hats"
(* ****** ****** *)
(* ****** ****** *)
//
#include
"./../HATS/libxatsopt.hats"
#include
"./../HATS/libxats2js.hats"
//
(* ****** ****** *)
(* ****** ****** *)
//
#staload "./../SATS/py1emit.sats"
//
(* ****** ****** *)
//
#staload
_(*DATS*)="./../DATS/py1emit.dats"
//
(* ****** ****** *)
(* ****** ****** *)
//
fun
fprintln
(filr: FILR): void =
(
 strn_fprint(filr,"\n"))//endfun
//
(* ****** ****** *)
//
fun
lctnfpr
(filr: FILR
,loc0: loc_t): void =
(
 loctn_fprint(filr,loc0))//endfun
//
(* ****** ****** *)
(* ****** ****** *)
//
#implfun
py1emit_i1dcl
( env0,dcl0 ) =
let
(*
//
val () =
prerrsln
("py1emit_i1dcl: dcl0 = ", dcl0))
//
*)
in//let
//
case+
dcl0.node() of
//
(* ****** ****** *)
(* ****** ****** *)
|_(*otherwise*) => xats2js_i1dcl(env0, dcl0)
(* ****** ****** *)
(* ****** ****** *)
//
end where
{
}(*where*)//end-of-[py1emit_i1dcl(env0,dcl0)]
//
(* ****** ****** *)
(* ****** ****** *)
//
#implfun
py1emit_i1dclist
  (env0, dcls) =
(
  list_py1emit_fnp(env0, dcls, py1emit_i1dcl))
(*where*)//end-of-[py1emit_i1dclist(env0,dcl0)]
//
(* ****** ****** *)
(* ****** ****** *)
//
#implfun
py1emit_i1valdclist
  (env0, i1vs) =
(
  list_py1emit_fnp(env0, i1vs, py1emit_i1valdcl))
//
(* ****** ****** *)
//
#implfun
py1emit_i1vardclist
  (env0, i1vs) =
(
  list_py1emit_fnp(env0, i1vs, py1emit_i1vardcl))
//
(* ****** ****** *)
(* ****** ****** *)
//
#implfun
py1emit_i1fundclist
  (env0, i1fs) =
(
  list_py1emit_fnp(env0, i1fs, py1emit_i1fundcl))
//
(* ****** ****** *)
(* ****** ****** *)
//
#implfun
py1emit_i1dclistopt
  (env0, dopt) =
(
  optn_py1emit_fnp(env0, dopt, py1emit_i1dclist))
//
(* ****** ****** *)
(* ****** ****** *)

(***********************************************************************)
(* end of [ATS3/XANADU_srcgen2_xats2js_srcgen1_DATS_py1emit_dynexp.dats] *)
(***********************************************************************)

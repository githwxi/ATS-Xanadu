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
//
|I1Dextern _ =>
(
  f0_extern(env0, dcl0))
|I1Dstatic _ =>
(
  f0_static(env0, dcl0))
//
(* ****** ****** *)
(* ****** ****** *)
|_(*otherwise*) => xats2js_i1dcl(env0, dcl0)
(* ****** ****** *)
(* ****** ****** *)
//
end where
{
//
(* ****** ****** *)
(* ****** ****** *)
//
fun
f0_extern
( env0:
! envx2js
, dcl0: i1dcl): void =
let
//
val filr = env0.filr()
val nind = env0.nind()
//
val loc0 = dcl0.lctn()
//
val-
I1Dextern
(tknd, dcl1) = dcl0.node()
//
val
(  ) =
let
//
#impltmp
g_print$out<>() = filr
//
in//let
nindfpr(filr, nind);
prints
("## I1Dextern(",loc0,")\n")
end//let
//
val (  ) =
(
  xats2js_i1dcl( env0, dcl1 ))
//
end(*let*)//end-of-[f0_extern(env0,dcl0)]
//
(* ****** ****** *)
//
fun
f0_static
( env0:
! envx2js
, dcl0: i1dcl): void =
let
//
val filr = env0.filr()
val nind = env0.nind()
//
val loc0 = dcl0.lctn()
//
val-
I1Dstatic
(tknd, dcl1) = dcl0.node()
//
val
(  ) =
let
//
#impltmp
g_print$out<>() = filr
//
in//let
nindfpr(filr, nind);
prints
("## I1Dstatic(",loc0,")\n")
end//let
//
val (  ) =
(
  xats2js_i1dcl( env0, dcl1 ))
//
end(*let*)//end-of-[f0_static(env0,dcl0)]
//
(* ****** ****** *)
(* ****** ****** *)
//
fun
f0_local0
( env0:
! envx2js
, dcl0: i1dcl): void =
let
//
val filr = env0.filr()
val nind = env0.nind()
//
val loc0 = dcl0.lctn()
//
val-
I1Dlocal0
(head, body) = dcl0.node()
//
val
(  ) =
let
//
#impltmp
g_print$out<>() = filr
//
in//let
(
nindfpr(filr, nind);
prints
("## I1Dlocal0(",loc0,")\n"))
end//let
//
val () =
(
  py1emit_i1dclist(env0, head))
val () =
(
  py1emit_i1dclist(env0, body))
//
end(*let*)//end-of-[f0_local0(env0,dcl0)]
//
(* ****** ****** *)
(* ****** ****** *)
//
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

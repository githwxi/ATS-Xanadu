(***********************************************************************)
(*                                                                     *)
(*                         Applied Type System                         *)
(*                                                                     *)
(***********************************************************************)

(*
** ATS/Xanadu - Unleashing the Potential of Types!
** Copyright (C) 2025 Hongwei Xi, ATS Trustful Software, Inc.
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
Sun Apr 27 02:29:07 PM EDT 2025
*)
Authoremail: gmhwxiATgmailDOTcom
*)
//
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
#include
"./../HATS/libxatsopt.hats"
#include
"./../HATS/libxats2js.hats"
//
(* ****** ****** *)
(* ****** ****** *)
#staload "./../SATS/xats2py.sats"
(* ****** ****** *)
(* ****** ****** *)
#staload
_(*DATS*)="./../DATS/xats2py.dats"
(* ****** ****** *)
(* ****** ****** *)
//
fun
fprintln
(out0: FILR): void =
(
 strn_fprint("\n",out0))//endfun
//
(* ****** ****** *)
(* ****** ****** *)
//
fun
i1bndfpr
( out0: FILR
, ibnd: i1bnd): void =
(
 i1bnd_fprint(ibnd, out0))//endfun
//
fun
i1gptfpr
(out0: FILR
,igpt: i1gpt): void =
(
 i1gpt_fprint(igpt, out0))//endfun
//
(* ****** ****** *)
(* ****** ****** *)
//
fun
i1valfpr
( filr: FILR
, ival: i1val): void =
(
 i1val_fprint(ival, filr))//endfun
//
(* ****** ****** *)
(* ****** ****** *)
//
#impltmp
xats2py_i1let
( env0,ilet ) =
let
//
val filr =
envx2py_get_filr(env0)
val nind =
envx2py_get_nind(env0)
//
in//let
nindfpr(filr, nind);
strnfpr(filr, "## ");
i1letfpr(env0, ilet); fprintln(filr)
end where
{
//
fun
i1letfpr
( env0:
! envx2py
, ilet: i1let): void =
(
i1let_fprint(ilet, filr)
) where
{
  val filr = envx2py_get_filr(env0) }
//
}(*where*)//end-of-[xats2py_i1let(env0,ilet)]
//
(* ****** ****** *)
//
fun
xats2py_i1letlst
( env0:
! envx2py
, ilts: i1letlst): void =
(
  list_xats2py_fnp(env0, ilts, xats2py_i1let))
//
(* ****** ****** *)
(* ****** ****** *)
//
#implfun
xats2py_i1bnd
( env0,ibnd ) =
let
//
val filr =
envx2py_get_filr(env0)
val nind =
envx2py_get_nind(env0)
//
in//let
(
nindfpr(filr, nind);
strnfpr(filr, "## ");
i1bndfpr(filr, ibnd); fprintln(filr))
end(*let*)//end-of-[xats2py_i1bnd(env0,ibnd)]
//
(* ****** ****** *)
(* ****** ****** *)
//
#implfun
xats2py_i1cmp
( env0,icmp ) =
let
//
val filr =
envx2py_get_filr(env0)
val nind =
envx2py_get_nind(env0)
//
in//let
//
case+ icmp of
|
I1CMPcons
(ilts, ival) =>
(
nindfpr(filr, nind);
strnfpr
(filr,"## I1CMP:start\n");
//
(
nindfpr(filr, nind);
strnfpr
(filr, "## I1CMP(ival):");
i1valfpr(  filr , ival  )) where
{
val () =
(
  xats2py_i1letlst(env0, ilts)) };
//
strnfpr(filr, " ## I1CMP:return\n");
)
//
end(*let*)//end-of-[xats2py_i1cmp(env0,icmp)]
//
(* ****** ****** *)(* ****** ****** *)(* ****** ****** *)
(* ****** ****** *)(* ****** ****** *)(* ****** ****** *)
//
(***********************************************************************)
(* end of [ATS3/XANADU_srcgen2_xats2py_srcgen1_DATS_xats2py_dynexp.dats] *)
(***********************************************************************)

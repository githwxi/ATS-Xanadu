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
//
(*
Author: Hongwei Xi
//
Tue 19 Mar 2024 01:12:23 PM EDT
//
Authoremail: gmhwxiATgmailDOTcom
*)
//
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
/HATS/xatsopt_dats.hats"
(* ****** ****** *)
#include
"./../HATS/xats2js_dats.hats"
(* ****** ****** *)
//
#staload "./../SATS/intrep0.sats"
#staload "./../SATS/intrep1.sats"
//
#staload "./../SATS/trxi0i1.sats"
//
(* ****** ****** *)
(* ****** ****** *)
//
#staload
_(*DATS*)="./../DATS/trxi0i1.dats"
//
(* ****** ****** *)
(* ****** ****** *)
#symload lctn with i0dcl_get_lctn
#symload node with i0dcl_get_node
(* ****** ****** *)
(* ****** ****** *)
//
#implfun
trxi0i1_i0dcl
(env0 , dcl0) =
(
case+
dcl0.node() of
//
|I0Dvaldclst _ =>
(
  f0_valdclst(env0, dcl0))
(*
|I0Dvardclst _ =>
(
  f0_vardclst(env0, dcl0))
*)
//
|_(* otherwise *) => i1dcl_none1(dcl0)
//
) where
{
//
(* ****** ****** *)
//
val
loc0 = dcl0.lctn((*0*))
//
(* ****** ****** *)
(* ****** ****** *)
//
fun
f0_valdclst
( env0:
! envi0i1
, dcl0: i0dcl): i1dcl =
let
//
val-
I0Dvaldclst
(tknd, i0vs) = dcl0.node()
//
val
i1vs =
trxi0i1_i0valdclist(env0, i0vs)
//
in//let
  i1dcl(loc0, I1Dvaldclst(tknd, i1vs))
end where
{
//
val loc0 = dcl0.lctn()
//
(*
val (  ) =
prerrln("f0_valdclst(di): d3cl = ", d3cl)
*)
//
}(*where*) // end of [f0_valdclst(env0,d3cl)]
//
(* ****** ****** *)
//
fun
f0_vardclst
( env0:
! envi0i1
, dcl0: i0dcl): i1dcl =
let
//
val-
I0Dvardclst
(tknd, i0vs) = dcl0.node()
//
val
i0vs =
trxi0i1_i0vardclist(env0, i0vs)
//
in//let
  i1dcl(loc0, I1Dvardclst(tknd, i0vs))
end where
{
//
val loc0 = dcl0.lctn()
//
(*
val (  ) =
prerrln("f0_vardclst(di): dcl0 = ", dcl0)
*)
//
}(*where*) // end of [f0_vardclst(env0,dcl0)]
//
(* ****** ****** *)
(* ****** ****** *)
//
val () =
(
  prerrln("trxi0i1_i0dcl: dcl0 = ", dcl0) )
//
(* ****** ****** *)
(* ****** ****** *)
//
} (*where*) // end of [trxi0i1_i0dcl(env0,...)]
//
(* ****** ****** *)
(* ****** ****** *)
//
#implfun
trxi0i1_i0dclist
( env0, dcls ) =
(
  list_trxi0i1_fnp(env0, dcls, trxi0i1_i0dcl))
//
(* ****** ****** *)
(* ****** ****** *)
//
#implfun
trxi0i1_i0valdclist
  ( env0 , i0vs ) =
(
  list_trxi0i1_fnp(env0, i0vs, trxi0i1_i0valdcl))
//
#implfun
trxi0i1_i0vardclist
  ( env0 , i0vs ) =
(
  list_trxi0i1_fnp(env0, i0vs, trxi0i1_i0vardcl))
//
(* ****** ****** *)
(* ****** ****** *)
//
#implfun
trxi0i1_i0dclistopt
  (env0, dopt) =
(
  optn_trxi0i1_fnp(env0, dopt, trxi0i1_i0dclist))
//
(* ****** ****** *)
(* ****** ****** *)

(***********************************************************************)
(* end of [ATS3/XANADU_srcgen2_xats2js_srcgen1_DATS_trxi0i1_decl00.dats] *)
(***********************************************************************)

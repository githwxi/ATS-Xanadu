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
Sat Oct 31 02:55:03 PM EDT 2026
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
#staload "./../SATS/trxi0i1.sats"
//
(* ****** ****** *)
(* ****** ****** *)
//
#implfun
i0dcl_trxi0i1
(
  dcl0, env0) =
(
case+
dcl0.node() of
//
(* ****** ****** *)
//
|I0Dd3ecl _ =>
let
val
loc0 = dcl0.lctn()
in//let
i1dcl_make_node
(loc0, I1Di0dcl(dcl0))
end//let//end(I0Dd3ecl)
//
(* ****** ****** *)
(* ****** ****** *)
//
|I0Dextern _ =>
(
  f0_extern(dcl0, env0))
//
|I0Dstatic _ =>
(
  f0_static(dcl0, env0))
//
(* ****** ****** *)
//
|I0Ddclst0 _ =>
(
  f0_dclst0(dcl0, env0))
|I0Dlocal0 _ =>
(
  f0_local0(dcl0, env0))
//
(* ****** ****** *)
//
|I0Dinclude _ =>
(
  f0_include(dcl0, env0))
//
(* ****** ****** *)
//
|I0Dsexpdef _ =>
(
  f0_sexpdef(dcl0, env0))
|I0Dabstype _ =>
(
  f0_abstype(dcl0, env0))
//
(* ****** ****** *)
//
|I0Dvaldclst _ =>
(
  f0_valdclst(dcl0, env0))
|I0Dvardclst _ =>
(
  f0_vardclst(dcl0, env0))
//
(* ****** ****** *)
(* ****** ****** *)
//
|_(* otherwise *) => i1dcl_none1(dcl0)
//
(* ****** ****** *)
(* ****** ****** *)
) where
{
//
(* ****** ****** *)
//
fun
f0_extern
(
dcl0: i0dcl,
env0: !envi0i1): i1dcl =
let
//
val
loc0 = dcl0.lctn((*0*))
val-
I0Dextern
(tknd, dcl1) = dcl0.node()
//
val dcl1 =
(
  i0dcl_trxi0i1(dcl1, env0))
//
in//let
(
i1dcl(loc0, I1Dextern(tknd, dcl1)))
end(*let*)//end-of-[f0_extern(d3cl,env0)]
//
fun
f0_static
(
dcl0: i0dcl,
env0: !envi0i1): i1dcl =
let
//
val
loc0 = dcl0.lctn((*0*))
val-
I0Dstatic
(tknd, dcl1) = dcl0.node()
//
val dcl1 =
(
  i0dcl_trxi0i1(dcl1, env0))
//
in//let
(
i1dcl(loc0, I1Dstatic(tknd, dcl1)))
end(*let*)//end-of-[f0_static(d3cl,env0)]
//
(* ****** ****** *)
//
fun
f0_dclst0
(
dcl0: i0dcl,
env0: !envi0i1): i1dcl =
let
//
val
loc0 = dcl0.lctn((*0*))
val-
I0Ddclst0
(   dcls   ) = dcl0.node()
//
val dcls =
i0dclist_trxi0i1(dcls, env0)
//
in//let
(
  i1dcl(loc0, I1Ddclst0( dcls ) ) )
end(*let*)//end-of-[f0_dclst0(d3cl,env0)]
//
(* ****** ****** *)
//
fun
f0_local0
(
dcl0: i0dcl,
env0: !envi0i1): i1dcl =
let
//
val
loc0 = dcl0.lctn((*0*))
val-
I0Dlocal0
(head, body) = dcl0.node()
//
(*
val (  ) =
envi0i1_pshloc1(env0)
val (  ) =
envi0i1_pshloc2(env0)
*)
val head =
i0dclist_trxi0i1(head, env0)
val body =
i0dclist_trxi0i1(body, env0)
(*
val (  ) = envi0i1_locjoin(env0)
*)
//
in//let
(
  i1dcl(loc0, I1Dlocal0(head, body)))
end(*let*)//end-of-[f0_local0(d3cl,env0)]
//
(* ****** ****** *)
//
fun
f0_include
(
dcl0: i0dcl,
env0: !envi0i1): i1dcl =
let
//
val
loc0 = dcl0.lctn((*0*))
val-
I0Dinclude
(knd0
,tknd, gsrc
,fopt, dopt) = dcl0.node()
//
val dopt =
(
case+ dopt of
|
optn_nil() => optn_nil(*nil*)
|
optn_cons(dcls) =>
optn_cons
(i0dclist_trxi0i1(dcls, env0)))
//
in//let
(
  i1dcl_make_node
  ( loc0
  , I1Dinclude
    (knd0, tknd, gsrc, fopt, dopt)))
end(*let*)//end-of-[f0_include(d3cl,env0)]
//
(* ****** ****** *)
//
fun
f0_sexpdef
(
dcl0: i0dcl,
env0: !envi0i1): i1dcl =
let
val
loc0 = dcl0.lctn()
val-
I0Dsexpdef _ = dcl0.node()
in//let
i1dcl_make_node(loc0, I1Di0dcl(dcl0))
end(*let*)//end-of-[f0_sexpdef(d3cl,env0)]
//
fun
f0_abstype
(
dcl0: i0dcl,
env0: !envi0i1): i1dcl =
let
val
loc0 = dcl0.lctn()
val-
I0Dabstype _ = dcl0.node()
in//let
i1dcl_make_node(loc0, I1Di0dcl(dcl0))
end(*let*)//end-of-[f0_abstype(d3cl,env0)]
//
(* ****** ****** *)
//
fun
f0_valdclst
(
dcl0: i0dcl,
env0: !envi0i1): i1dcl =
let
//
val
loc0 = dcl0.lctn((*0*))
val-
I0Dvaldclst
(tknd, i0vs) = dcl0.node()
//
val
i1vs =
i0valdclist_trxi0i1(i0vs, env0)
//
in//let
  i1dcl(loc0, I1Dvaldclst(tknd, i1vs))
end where
{
//
(*
val loc0 = dcl0.lctn()
val (  ) =
(
  prerrsln
  ("f0_valdclst(i0i1): d3cl = ", d3cl))
*)
//
}(*where*)//end-of-[f0_valdclst(dcl0,env0)]
//
(* ****** ****** *)
//
fun
f0_vardclst
(
dcl0: i0dcl,
env0: !envi0i1): i1dcl =
let
//
val
loc0 = dcl0.lctn((*0*))
val-
I0Dvardclst
(tknd, i0vs) = dcl0.node()
//
val
i0vs =
i0vardclist_trxi0i1(i0vs, env0)
//
in//let
  i1dcl(loc0, I1Dvardclst(tknd, i0vs))
end where
{
//
(*
val loc0 = dcl0.lctn()
val (  ) =
(
  prerrsln
  ("f0_vardclst(i0i1): dcl0 = ", dcl0))
*)
//
}(*where*)//end-of-[f0_vardclst(dcl0,env0)]
//
(* ****** ****** *)
(* ****** ****** *)
//
val loc0 = dcl0.lctn((*0*))
//
// (*
val (  ) =
(
  prerrsln("i0dcl_trxi0i1: loc0 = ", loc0))
val (  ) =
(
  prerrsln("i0dcl_trxi0i1: dcl0 = ", dcl0))
// *)
//
(* ****** ****** *)
(* ****** ****** *)
//
}(*where*)//end-of-[trxi0i1_i0dcl(dcl0,env0)]
//
(* ****** ****** *)
(* ****** ****** *)
//
(***********************************************************************)
(***********************************************************************)
(* end of [ATS3/XANADU_srcgen2_xats2cc_srcgen2_DATS_trxi0i1_decl00.dats] *)
(***********************************************************************)
(***********************************************************************)

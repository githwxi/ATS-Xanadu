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
Fri 29 Mar 2024 04:35:26 PM EDT
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
/HATS/xatsopt_dats.hats"
(* ****** ****** *)
#include
"./../HATS/xats2js_dats.hats"
(* ****** ****** *)
(* ****** ****** *)
//
#staload "./../SATS/intrep0.sats"
#staload "./../SATS/intrep1.sats"
#staload "./../SATS/xats2js.sats"
//
(* ****** ****** *)
//
#staload
_(*DATS*)="./../DATS/xats2js.dats"
//
(* ****** ****** *)
(* ****** ****** *)
#symload lctn with i1dcl_get_lctn
#symload node with i1dcl_get_node
(* ****** ****** *)
(* ****** ****** *)
//
fun
fprintln
(filr: FILR): void =
(
 strn_fprint(filr,"\n"))//end-fun
//
(* ****** ****** *)
(* ****** ****** *)
//
#implfun
xats2js_i1dcl
( env0,dcl0 ) =
let
(*
//
val () =
prerrln
("xats2js_i1dcl: dcl0 = ", dcl0))
//
*)
in//let
//
case+
dcl0.node() of
//
|I1Dvaldclst _ =>
(
  f0_valdclst(env0, dcl0))
//
|I1Dfundclst _ =>
(
  f0_fundclst(env0, dcl0))
//
|
_(* otherwise *) =>
let
val filr =
envx2js_get_filr(env0)
val nind =
envx2js_get_nind(env0)
in//let
nindfpr(filr, nind);
strnfpr(filr, "// ");
i1dcl_fprint(filr, dcl0); fprintln(filr)
end//let
//
end where
{
//
(* ****** ****** *)
//
fun
f0_valdclst
( env0:
! envx2js
, dcl0: i1dcl): void =
let
//
val-
I1Dvaldclst
( tknd, i1vs) = dcl0.node()
//
val
(  ) =
xats2js_i1valdclist(env0, i1vs)
//
end where
{
//
(*
//
val loc0 = dcl0.lctn((*void*))
//
val (  ) =
prerrln("f0_valdclst(x2js): dcl0 = ", dcl0)
*)
//
}(*where*) // end of [f0_valdclst(env0,dcl0)]
//
(* ****** ****** *)
//
fun
f0_fundclst
( env0:
! envx2js
, dcl0: i1dcl): void =
let
//
val-
I1Dfundclst
( tknd
, d2cs, i1fs) = dcl0.node()
//
val
(  ) =
xats2js_i1fundclist(env0, i1fs)
//
end where
{
//
(*
//
val loc0 = dcl0.lctn((*void*))
//
val (  ) =
prerrln("f0_fundclst(x2js): dcl0 = ", dcl0)
*)
//
}(*where*) // end of [f0_fundclst(env0,dcl0)]
//
(* ****** ****** *)
//
}(*where*)//end-of-[xats2js_i1dcl(env0,dcl0)]
//
(* ****** ****** *)
(* ****** ****** *)
//
#implfun
xats2js_i1valdcl
  (env0, ival) = let
//
(* ****** ****** *)
//
val dpat =
i1valdcl_get_dpat(ival)
val tdxp =
i1valdcl_get_tdxp(ival)
//
(* ****** ****** *)
//
val (  ) =
let
val filr =
envx2js_get_filr(env0)
val nind =
envx2js_get_nind(env0)
in//let
nindfpr(filr, nind);
strnfpr(filr, "// I1VALDCL\n")
end//let//end-of-[val()]
//
(* ****** ****** *)
//
val (  ) =
xats2js_i1bnd(env0, dpat)
//
(* ****** ****** *)
//
(*
val (  ) = prerrln
("xats2js_i1valdcl: dpat = ", dpat)
val (  ) = prerrln
("xats2js_i1valdcl: tdxp = ", tdxp)
*)
//
(* ****** ****** *)
//
val (  ) =
(
case+ tdxp of
|
TEQI1CMPnone
( (*void*) ) => ((*void*))
|
TEQI1CMPsome
(teq1, icmp) =>
let
val (  ) =
(
  xats2js_i1cmp(env0, icmp))
end//let
) (*case+*) // end-of-( teqi1exp )
//
(* ****** ****** *)
//
end//let
(*let*)//end-of-[xats2js_i1valdcl(env0,ival)]
//
(* ****** ****** *)
(* ****** ****** *)
//
#implfun
xats2js_i1fundcl
  (env0, ifun) = let
//
(* ****** ****** *)
//
val dvar =
i1fundcl_get_dpid(ifun)
val fjas =
i1fundcl_get_farg(ifun)
val tdxp =
i1fundcl_get_tdxp(ifun)
//
(* ****** ****** *)
//
val (  ) =
let
val filr =
envx2js_get_filr(env0)
val nind =
envx2js_get_nind(env0)
in//let
nindfpr(filr, nind);
strnfpr(filr, "// I1FUNDCL\n")
end//let//end-of-[val()]
//
(* ****** ****** *)
//
val (  ) =
xats2js_d2var(env0, dvar)
(*
val (  ) = prerrln
("xats2js_i1fundcl: dvar = ", dvar)
val (  ) = prerrln
("xats2js_i1fundcl: fjas = ", fjas)
val (  ) = prerrln
("xats2js_i1fundcl: tdxp = ", tdxp)
*)
//
(* ****** ****** *)
//
val (  ) = // enter
(
  envx2js_pshlam0(env0) )
//
val (  ) =
xats2js_fjarglst(env0, fjas)
//
val (  ) =
(
case+ tdxp of
|
TEQI1CMPnone
( (*void*) ) => ((*void*))
|
TEQI1CMPsome
(teq1, icmp) =>
let
val (  ) =
(
  xats2js_i1cmp(env0, icmp))
end//let
) (*case+*) // end-of-( teqi1exp )
//
val (  ) = envx2js_poplam0(env0)//leave
//
end//let
(*let*)//end-of-[xats2js_i1fundcl(env0,ifun)]
//
(* ****** ****** *)
(* ****** ****** *)
//
#implfun
xats2js_i1dclist
  (env0, dcls) =
(
  list_xats2js_fnp(env0, dcls, xats2js_i1dcl))
//
(* ****** ****** *)
(* ****** ****** *)
//
#implfun
xats2js_i1valdclist
  (env0, i1vs) =
(
  list_xats2js_fnp(env0, i1vs, xats2js_i1valdcl))
//
(* ****** ****** *)
//
#implfun
xats2js_i1vardclist
  (env0, i1vs) =
(
  list_xats2js_fnp(env0, i1vs, xats2js_i1vardcl))
//
(* ****** ****** *)
//
#implfun
xats2js_i1fundclist
  (env0, i1fs) =
(
  list_xats2js_fnp(env0, i1fs, xats2js_i1fundcl))
//
(* ****** ****** *)
(* ****** ****** *)
//
#implfun
xats2js_i1dclistopt
  (env0, dopt) =
(
  optn_xats2js_fnp(env0, dopt, xats2js_i1dclist))
//
(* ****** ****** *)
(* ****** ****** *)

(***********************************************************************)
(* end of [ATS3/XANADU_srcgen2_xats2js_srcgen1_DATS_xats2js.dats] *)
(***********************************************************************)

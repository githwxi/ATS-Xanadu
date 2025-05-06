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
#implfun
xats2py_i1dcl
  (env0, idcl) =
let
//
val
filr = envx2py_get_filr(env0)
in//let
//
strnfpr(filr, "## ");
i1dcl_fprint(idcl,filr);fprintln(filr)
//
end(*let*)//end-of-[xats2py_i1dcl(...)]
//
(* ****** ****** *)
(* ****** ****** *)
//
#implfun
xats2py_i1valdcl
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
xats2py_i1bnd(env0, dpat)
//
(* ****** ****** *)
//
(*
val (  ) = prerrsln
("xats2py_i1valdcl: dpat = ", dpat)
val (  ) = prerrsln
("xats2py_i1valdcl: tdxp = ", tdxp)
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
  xats2py_i1cmp(env0, icmp))
end//let
) (*case+*) // end-of-( teqi1exp )
//
(* ****** ****** *)
//
end where
{
//
val (  ) =
let
val filr =
envx2py_get_filr(env0)
val nind =
envx2py_get_nind(env0)
in//let
(
nindstrnfpr(filr, nind, "## I1VALDCL\n"))
end//let
//
}(*where*)//end[xats2py_i1valdcl(env0,ival)]
//
(* ****** ****** *)
(* ****** ****** *)
//
//
#implfun
xats2py_i1fundcl
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
envx2py_get_filr(env0)
val nind =
envx2py_get_nind(env0)
in//let
nindfpr(filr,nind);
strnfpr(filr,"## ");
d2varfpr(filr,dvar);fprintln(filr)
end//let
//
(* ****** ****** *)
//
(*
val (  ) = prerrsln
("xats2py_i1fundcl: dvar = ", dvar)
val (  ) = prerrsln
("xats2py_i1fundcl: fjas = ", fjas)
val (  ) = prerrsln
("xats2py_i1fundcl: tdxp = ", tdxp)
*)
//
(* ****** ****** *)
//
val (  ) = // enter
(
  envx2py_pshlam0(env0) )
//
val (  ) =
(
xats2py_fjarglst(env0,fjas)
)
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
  xats2py_i1cmp(env0, icmp) )
end // end-of-[let]
) (*case+*) // end-of-( teqi1exp )
//
val (  ) = envx2py_poplam0(env0)//leave
//
end where
{
//
val (  ) =
let
val filr =
envx2py_get_filr(env0)
val nind =
envx2py_get_nind(env0)
in//let
(
nindstrnfpr(filr, nind, "## I1FUNDCL\n"))
end//let
//
}(*where*)//end-of-[xats2py_i1fundcl(env0,ifun)]
//
(* ****** ****** *)
(* ****** ****** *)
//
#implfun
xats2py_i1dclist
  (env0, dcls) =
(
  list_xats2py_fnp(env0, dcls, xats2py_i1dcl))
//
(* ****** ****** *)
(* ****** ****** *)
//
#implfun
xats2py_i1valdclist
  (env0, i1vs) =
(
  list_xats2py_fnp(env0, i1vs, xats2py_i1valdcl))
//
(* ****** ****** *)
(* ****** ****** *)
//
#implfun
xats2py_i1fundclist
  (env0, i1fs) =
(
  list_xats2py_fnp(env0, i1fs, xats2py_i1fundcl))
//
(* ****** ****** *)(* ****** ****** *)(* ****** ****** *)
(* ****** ****** *)(* ****** ****** *)(* ****** ****** *)
//
(***********************************************************************)
(* end of [ATS3/XANADU_srcgen2_xats2py_srcgen1_DATS_xats2py_decl00.dats] *)
(***********************************************************************)

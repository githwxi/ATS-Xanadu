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
Wed Jun 24 11:41:06 AM EDT 2026
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
#staload "./../SATS/xats2cm.sats"
(* ****** ****** *)
(* ****** ****** *)
#staload
_(*DATS*)="./../DATS/xats2cm.dats"
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
xats2cm_i1dcl
  (env0, idcl) =
let
//
val
filr = envx2cm_filr$get(env0)
in//let
//
strnfpr(filr, ";; ");
i1dcl_fprint(idcl,filr);fprintln(filr)
//
end(*let*)//end-of-[xats2cm_i1dcl(...)]
//
(* ****** ****** *)
(* ****** ****** *)
//
#implfun
xats2cm_i1valdcl
  (env0, ival) = let
//
(* ****** ****** *)
//
val dpat =
i1valdcl_dpat$get(ival)
val tdxp =
i1valdcl_tdxp$get(ival)
//
(* ****** ****** *)
//
val (  ) =
xats2cm_i1bnd(env0, dpat)
//
(* ****** ****** *)
//
(*
val (  ) = prerrsln
("xats2cm_i1valdcl: dpat = ", dpat)
val (  ) = prerrsln
("xats2cm_i1valdcl: tdxp = ", tdxp)
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
  xats2cm_i1cmp(env0, icmp))
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
envx2cm_filr$get(env0)
val nind =
envx2cm_nind$get(env0)
in//let
(
nindstrnfpr(filr, nind, ";; I1VALDCL\n"))
end//let
//
}(*where*)//end[xats2cm_i1valdcl(env0,ival)]
//
(* ****** ****** *)
(* ****** ****** *)
//
#implfun
xats2cm_i1vardcl
  (env0, ivar) = let
//
(* ****** ****** *)
//
val dpid =
i1vardcl_dpid$get(ivar)
val tdxp =
i1vardcl_dini$get(ivar)
//
(* ****** ****** *)
//
val (  ) =
xats2cm_i1bnd(env0, dpid)
//
(* ****** ****** *)
//
(*
val (  ) = prerrsln
("xats2cm_i1vardcl: dvar = ", dvar)
val (  ) = prerrsln
("xats2cm_i1vardcl: dini = ", tdxp)
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
  xats2cm_i1cmp(env0, icmp))
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
envx2cm_filr$get(env0)
val nind =
envx2cm_nind$get(env0)
in//let
(
nindstrnfpr(filr, nind, "// I1VARDCL\n"))
end//let
//
}(*where*)//end-of-[xats2cm_i1vardcl(env0,ival)]
//
(* ****** ****** *)
(* ****** ****** *)
//
#implfun
xats2cm_i1fundcl
  (env0, ifun) = let
//
(* ****** ****** *)
//
val dvar =
i1fundcl_dpid$get(ifun)
val fjas =
i1fundcl_farg$get(ifun)
val tdxp =
i1fundcl_tdxp$get(ifun)
//
(* ****** ****** *)
//
val (  ) =
let
val filr =
envx2cm_filr$get(env0)
val nind =
envx2cm_nind$get(env0)
in//let
nindfpr(filr,nind);
strnfpr(filr,";; ");
d2varfpr(filr,dvar);fprintln(filr)
end//let
//
(* ****** ****** *)
//
(*
val (  ) = prerrsln
("xats2cm_i1fundcl: dvar = ", dvar)
val (  ) = prerrsln
("xats2cm_i1fundcl: fjas = ", fjas)
val (  ) = prerrsln
("xats2cm_i1fundcl: tdxp = ", tdxp)
*)
//
(* ****** ****** *)
//
val (  ) = // enter
(
  envx2cm_pshlam0(env0) )
//
val (  ) =
(
xats2cm_fjarglst(env0,fjas)
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
  xats2cm_i1cmp(env0, icmp) )
end // end-of-[let]
) (*case+*) // end-of-( teqi1exp )
//
val (  ) = envx2cm_poplam0(env0)//leave
//
end where
{
//
val (  ) =
let
val filr =
envx2cm_filr$get(env0)
val nind =
envx2cm_nind$get(env0)
in//let
(
nindstrnfpr(filr, nind, ";; I1FUNDCL\n"))
end//let
//
#define xats2cm_fjarglst = xats2js_fjarglst
//
}(*where*)//end-of-[xats2cm_i1fundcl(env0,ifun)]
//
(* ****** ****** *)
(* ****** ****** *)
//
#implfun
xats2cm_i1dclist
  (env0, dcls) =
(
  list_xats2cm_fnp(env0, dcls, xats2cm_i1dcl))
//
(* ****** ****** *)
(* ****** ****** *)
//
#implfun
xats2cm_i1valdclist
  (env0, i1vs) =
(
  list_xats2cm_fnp(env0, i1vs, xats2cm_i1valdcl))
//
(* ****** ****** *)
//
#implfun
xats2cm_i1vardclist
  (env0, i1vs) =
(
  list_xats2cm_fnp(env0, i1vs, xats2cm_i1vardcl))
//
(* ****** ****** *)
(* ****** ****** *)
//
#implfun
xats2cm_i1fundclist
  (env0, i1fs) =
(
  list_xats2cm_fnp(env0, i1fs, xats2cm_i1fundcl))
//
(* ****** ****** *)(* ****** ****** *)(* ****** ****** *)
(* ****** ****** *)(* ****** ****** *)(* ****** ****** *)
//
(***********************************************************************)
(* end of [ATS3/XANADU_srcgen2_xats2cm_srcgen1_DATS_xats2cm_decl00.dats] *)
(***********************************************************************)

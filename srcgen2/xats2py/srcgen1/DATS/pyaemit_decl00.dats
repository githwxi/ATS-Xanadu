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
#staload "./../SATS/pyaemit.sats"
(* ****** ****** *)
(* ****** ****** *)
#staload
_(*DATS*)="./../DATS/pyaemit.dats"
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
pyaemit_i1dcl
  (env0, idcl) =
let
//
val
filr = envx2py_filr$get(env0)
in//let
//
strnfpr(filr, "## ");
i1dcl_fprint(idcl,filr);fprintln(filr)
//
end(*let*)//end-of-[pyaemit_i1dcl(...)]
//
(* ****** ****** *)
(* ****** ****** *)
//
#implfun
pyaemit_i1valdcl
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
pyaemit_i1bnd(env0, dpat)
//
(* ****** ****** *)
//
(*
val (  ) = prerrsln
("pyaemit_i1valdcl: dpat = ", dpat)
val (  ) = prerrsln
("pyaemit_i1valdcl: tdxp = ", tdxp)
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
  pyaemit_i1cmp(env0, icmp))
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
envx2py_filr$get(env0)
val nind =
envx2py_nind$get(env0)
in//let
(
nindstrnfpr(filr, nind, "## I1VALDCL\n"))
end//let
//
}(*where*)//end[pyaemit_i1valdcl(env0,ival)]
//
(* ****** ****** *)
(* ****** ****** *)
//
#implfun
pyaemit_i1vardcl
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
pyaemit_i1bnd(env0, dpid)
//
(* ****** ****** *)
//
(*
val (  ) = prerrsln
("pyaemit_i1vardcl: dvar = ", dvar)
val (  ) = prerrsln
("pyaemit_i1vardcl: dini = ", tdxp)
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
  pyaemit_i1cmp(env0, icmp))
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
envx2py_filr$get(env0)
val nind =
envx2py_nind$get(env0)
in//let
(
nindstrnfpr(filr, nind, "// I1VARDCL\n"))
end//let
//
}(*where*)//end-of-[pyaemit_i1vardcl(env0,ival)]
//
(* ****** ****** *)
(* ****** ****** *)
//
#implfun
pyaemit_i1fundcl
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
envx2py_filr$get(env0)
val nind =
envx2py_nind$get(env0)
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
("pyaemit_i1fundcl: dvar = ", dvar)
val (  ) = prerrsln
("pyaemit_i1fundcl: fjas = ", fjas)
val (  ) = prerrsln
("pyaemit_i1fundcl: tdxp = ", tdxp)
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
pyaemit_fjarglst(env0,fjas)
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
  pyaemit_i1cmp(env0, icmp) )
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
(
  envx2py_filr$get(env0))
val nind =
(
  envx2py_nind$get(env0))
in//let
(
nindstrnfpr(filr, nind, "## I1FUNDCL\n"))
end//let
//
#define pyaemit_fjarglst = xats2js_fjarglst
//
}(*where*)//end-of-[pyaemit_i1fundcl(env0,ifun)]
//
(* ****** ****** *)
//
#implfun
pyaemit_i1tfndcl
  (env0, itfn) = let
//
val dvar =
i1fundcl_dpid$get(itfn)
//
val filr =
(
  envx2py_filr$get(env0))
val nind =
(
  envx2py_nind$get(env0))
//
in//let
(
nindstrnfpr
(filr, nind, "## I1TFNDCL: ");
d2var_fprint(dvar, filr); fprintln(filr))
end(*let*)//end-of-[pyaemit_i1tfndcl(env0,itfn)]
//
(* ****** ****** *)
(* ****** ****** *)
//
#implfun
pyaemit_i1dclist
  (env0, dcls) =
(
  list_pyaemit_fnp(env0, dcls, pyaemit_i1dcl))
//
(* ****** ****** *)
(* ****** ****** *)
//
#implfun
pyaemit_i1valdclist
  (env0, i1vs) =
(
  list_pyaemit_fnp(env0, i1vs, pyaemit_i1valdcl))
//
(* ****** ****** *)
//
#implfun
pyaemit_i1vardclist
  (env0, i1vs) =
(
  list_pyaemit_fnp(env0, i1vs, pyaemit_i1vardcl))
//
(* ****** ****** *)
(* ****** ****** *)
//
#implfun
pyaemit_i1fundclist
  (env0, i1fs) =
(
  list_pyaemit_fnp(env0, i1fs, pyaemit_i1fundcl))
//
(* ****** ****** *)
//
#implfun
pyaemit_i1tfndclist
  (env0, i1fs) =
(
  list_pyaemit_fnp(env0, i1fs, pyaemit_i1tfndcl))
//
(* ****** ****** *)
(* ****** ****** *)
//
(***********************************************************************)
(* end of [ATS3-XANADU/srcgen2/xats2py/srcgen1/DATS/pyaemit_decl00.dats] *)
(***********************************************************************)

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
Sat May  9 11:06:36 AM EDT 2026
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
#include
"./../../..\
/HATS/xatsopt_sats.hats"
#include
"./../../..\
/HATS/xatsopt_dpre.hats"
(* ****** ****** *)
(* ****** ****** *)
#include
"./../HATS/mytmplib00.hats"
(* ****** ****** *)
(* ****** ****** *)
//
#staload
"./../../../SATS/xbasics.sats"
#staload
"./../../../SATS/xsymbol.sats"
//
#staload
"./../../../SATS/lexing0.sats"
//
#staload
"./../../../SATS/dynexp2.sats"
//
(* ****** ****** *)
(* ****** ****** *)
//
#staload ".\
/../../../xats2cc\
/srcgen1/SATS/intrep0.sats"//...
//
#staload "./../SATS/intrep1.sats"
#staload "./../SATS/trxi0i1.sats"
#staload "./../SATS/xats2js.sats"
//
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
valtok_prvq
(tok: token) =
(
case-
tok.node() of
|T_VAL
( vlk ) => valkind_prvq(vlk))
(*case-*)//end(valtok_prvq(tok))
//
fun
funtok_prfq
(tok: token) =
(
case-
tok.node() of
|T_FUN
( fnk ) => funkind_prfq(fnk))
(*case-*)//end(funtok_prfq(tok))
//
(* ****** ****** *)
(* ****** ****** *)
//
#implfun
i1dcl_xats2js
(dcl0, env0) =
let
// (*
//
val () =
prerrsln("\
i1dcl_xats2js: dcl0 = ", dcl0)
//
// *)
in//let
//
case+
dcl0.node() of
//
(* ****** ****** *)
(* ****** ****** *)
//
|I1Ddclenv _ =>
(
  f0_dclenv(dcl0, env0))
//
(* ****** ****** *)
(* ****** ****** *)
//
|I1Dvaldclst _ =>
(
  f0_valdclst(dcl0, env0))
|I1Dvardclst _ =>
(
  f0_vardclst(dcl0, env0))
//
|I1Dfundclst _ =>
(
  f0_fundclst(dcl0, env0))
//
(* ****** ****** *)
(* ****** ****** *)
//
|
_(* otherwise *) =>
let
val filr =
(
  envx2js_filr$get( env0 ))
val nind =
(
  envx2js_nind$get( env0 ))
in//let
//
nindfpr(filr, nind);
strnfpr(filr, "// ");
i1dcl_fprint(dcl0, filr); fprintln(filr)
//
end//let
//
(* ****** ****** *)
(* ****** ****** *)
//
end where
{
//
(* ****** ****** *)
//
fun
f0_dclenv
(
dcl0: i1dcl,
env0: !envx2js): void =
let
//
val-
I1Ddclenv
(dcl1, i0ws) = dcl0.node()
//
val (  ) =
(
  i1dcl_xats2js(dcl1, env0))
//
end where // end-of-[let]
{
//
(*
//
val loc0 = dcl0.lctn((*void*))
//
val (  ) =
prerrsln("\
f0_dclenv(xats2js): dcl0 = ", dcl0)
*)
//
}(*where*)//end-of-[f0_dclenv(dcl0,env0)]
//
(* ****** ****** *)
//
fun
f0_valdclst
(
dcl0: i1dcl,
env0: !envx2js): void =
let
//
val-
I1Dvaldclst
(tknd, i1vs) = dcl0.node()
//
val (  ) =
if // if
valtok_prvq(tknd)
then//then
i1prvdclist_xats2js(i1vs, env0)
else//else
i1valdclist_xats2js(i1vs, env0)
//
end where // end-of-[let]
{
//
(*
//
val loc0 = dcl0.lctn((*void*))
//
val (  ) =
prerrsln("\
f0_valdclst(xats2js): dcl0 = ", dcl0)
*)
//
}(*where*)//end-of-[f0_valdclst(dcl0,env0)]
//
(* ****** ****** *)
//
fun
f0_vardclst
( 
dcl0: i1dcl,
env0: !envx2js): void =
let
//
val-
I1Dvardclst
(tknd, i1vs) = dcl0.node()
//
val (  ) =
i1vardclist_xats2js(i1vs, env0)
//
end where
{
//
(*
//
val loc0 = dcl0.lctn((*void*))
//
val (  ) =
prerrsln("\
f0_vardclst(xats2js): dcl0 = ", dcl0)
*)
//
}(*where*)//end-of-[f0_vardclst(dcl0,env0)]
//
(* ****** ****** *)
//
fun
f0_fundclst
(
dcl0: i1dcl,
env0: !envx2js): void =
let
//
val-
I1Dfundclst
( tknd
, lvl0
, tqas
, d2cs, i1fs) = dcl0.node()
//
val (  ) =
if // if
funtok_prfq(tknd)
then//then
i1prfdclist_xats2js(i1fs, env0)
else//else
(
case+ tqas of
|
list_nil() =>
i1fundclist_xats2js(i1fs, env0)
|
list_cons _ =>
i1tfndclist_xats2js(i1fs, env0))
//
end where // end-of-[let]
{
//
(*
//
val loc0 = dcl0.lctn((*void*))
//
val (  ) =
prerrsln("\
f0_fundclst(xats2js): dcl0 = ", dcl0)
*)
//
}(*where*) // end of [f0_fundclst(dcl0,env0)]
//
(* ****** ****** *)
//
}(*where*)//end-of-[i1dcl_xats2js(dcl0,env0)]
//
(* ****** ****** *)
(* ****** ****** *)
//
#implfun
i1fundcl_xats2js
  (ifun, env0) = let
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
(*
val (  ) = prerrsln
("i1fundcl_xats2js: dvar = ", dvar)
val (  ) = prerrsln
("i1fundcl_xats2js: fjas = ", fjas)
val (  ) = prerrsln
("i1fundcl_xats2js: tdxp = ", tdxp)
*)
//
(* ****** ****** *)
//
val (  ) =
let
val filr =
envx2js_filr$get(env0)
val nind =
envx2js_nind$get(env0)
in//let
(
nindfpr(filr,nind);
strnfpr(filr,"// ");
d2varfpr//HX:name+offset
(filr,dvar);strnfpr(filr,"(...)\n"))
end//let
//
(* ****** ****** *)
//
val (  ) = // enter
(
  envx2js_pshlam0(env0) )
//
val (  ) =
(
fjarglst_xats2js(fjas, env0))
//
val (  ) =
(
case+ tdxp of
|
TEQI1CMPnone
( (*void*) ) => ( (*void*) )
|
TEQI1CMPsome
(teq1, icmp) =>
let
val (  ) =
(
  i1cmp_xats2js(icmp, env0) )
end // end-of-[let]
) (*case+*) // end-of-( teqi1exp )
//
val (  ) = envx2js_poplam0(env0)//leave
//
end where
{
//
val (  ) =
let
val filr =
envx2js_filr$get(env0)
val nind =
envx2js_nind$get(env0)
//
val dvar =
i1fundcl_dpid$get(ifun)
//
in//let
nindstrnfpr
(filr, nind, "// I1FUNDCL: ");
d2var_fprint(dvar, filr); fprintln(filr)
end//let
//
}(*where*)//end-of-[i1fundcl_xats2js(ifun,env0)]
//
(* ****** ****** *)
//
#implfun
i1tfndcl_xats2js
  (itfn, env0) = let
//
val filr =
envx2js_filr$get(env0)
val nind =
envx2js_nind$get(env0)
//
val dvar =
i1fundcl_dpid$get(itfn)
//
in//let
nindstrnfpr
(filr, nind, "// I1TFNDCL: ");
d2var_fprint(dvar, filr); fprintln(filr)
end(*let*)//end-of-[i1tfndcl_xats2js(itfn,env0)]
//
(* ****** ****** *)
(* ****** ****** *)
//
(***********************************************************************)
(* end of [ATS3/XANADU_srcgen2_xats2js_srcgen2_DATS_xats2js_decl00.dats] *)
(***********************************************************************)

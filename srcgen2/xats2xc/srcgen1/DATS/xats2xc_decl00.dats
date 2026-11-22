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
Fri Nov 20 10:21:34 PM EST 2026
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
#staload
"./../../../SATS/xbasics.sats"
#staload
"./../../../SATS/xsymbol.sats"
//
(* ****** ****** *)
//
#staload // LOC =
"./../../../SATS/locinfo.sats"
#staload // FIL =
"./../../../SATS/filpath.sats"
#staload // LEX =
"./../../../SATS/lexing0.sats"
#staload // D2E =
"./../../../SATS/dynexp2.sats"
//
(* ****** ****** *)
(* ****** ****** *)
//
#staload "./../SATS/intrep0.sats"
#staload "./../SATS/intrep1.sats"
#staload "./../SATS/xats2xc.sats"
//
(* ****** ****** *)
//
#staload
_(*DATS*)="./../DATS/xats2xc.dats"
//
(* ****** ****** *)
(* ****** ****** *)
#symload lctn with i1dcl_lctn$get
#symload node with i1dcl_node$get
(* ****** ****** *)
#symload node with t1imp_node$get
#symload stmp with t1imp_stmp$get
(* ****** ****** *)
(* ****** ****** *)
//
fun
endlnfpr
(out0: FILR): void =
(
 strn_fprint("\n",out0))//endfun
//
(* ****** ****** *)
(* ****** ****** *)
//
fun
tjagsfpr
( out0: FILR
, t2js: t2jaglst): void =
let
#impltmp
g_print$out
< (*tmp*) >
( (*nil*) ) = out0 in
  g_print<t2jaglst>(t2js) end
//let//endof(tjagsfpr(out0,t2js))
//
(* ****** ****** *)
(* ****** ****** *)
//
fun
valtok_prvq
( tok
: token): bool =
(
case-
tok.node() of
|T_VAL
( vlk ) => valkind_prvq(vlk))
(*case-*)//endof(valtok_prvq(tok))
//
fun
funtok_prfq
( tok
: token): bool =
(
case-
tok.node() of
|T_FUN
( fnk ) => funkind_prfq(fnk))
(*case-*)//endof(funtok_prfq(tok))
//
(* ****** ****** *)
(* ****** ****** *)
//
#implfun
i1dcl_xcaemit
(dcl0, env0) =
let
(*
//
val () =
prerrsln("\
i1dcl_xcaemit: dcl0 = ", dcl0)
//
*)
in//let
//
case+
dcl0.node() of
//
(* ****** ****** *)
//
|I1Dfundclst _ =>
(
  f0_fundclst(dcl0, env0))
//
//
(* ****** ****** *)
//
|
_(* otherwise *) =>
let
val filr =
envx2cc_filr$get(env0)
val nind =
envx2cc_nind$get(env0)
in//let
nindfpr(filr, nind);
strnfpr(filr, "// ");
i1dcl_fprint(dcl0, filr);endlnfpr(filr)
end//let
//
(* ****** ****** *)
//
end where
{
//
(* ****** ****** *)
(* ****** ****** *)
val loc0 = dcl0.lctn()
(* ****** ****** *)
(* ****** ****** *)
//
val (  ) =
let
val filr =
envx2cc_filr$get(env0)
val nind =
envx2cc_nind$get(env0)
in//let
nindfpr(filr, nind);
strnfpr(filr, "// ");
loctn_fprint(loc0, filr);endlnfpr(filr)
end//let
//
(* ****** ****** *)
(* ****** ****** *)
//
fun
f0_fundclst
(
dcl0: i1dcl,
env0: !envx2cc): void =
let
//
val-
I1Dfundclst
( lvl0
, tknd
, tqas
, d2cs, i1fs) = dcl0.node()
//
val (  ) =
if // if
funtok_prfq(tknd)
then//then
i1prfdclist_xcaemit(i1fs, env0)
else//else
(
case+ tqas of
|
list_nil() =>
i1fundclist_xcaemit(i1fs, env0)
|
list_cons _ =>
i1tfndclist_xcaemit(i1fs, env0))
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
f0_fundclst(xcaemit): dcl0 = ", dcl0)
*)
//
}(*where*)//end-of-[f0_fundclst(dcl0,env0)]
//
(* ****** ****** *)
//
}(*where*)//end-of-[i1dcl_xcaemit(dcl0,env0)]
//
(* ****** ****** *)
(* ****** ****** *)
//
#implfun
i1prvdcl_xcaemit
  (iprv, env0) = let
//
val filr =
envx2cc_filr$get(env0)
val nind =
envx2cc_nind$get(env0)
//
val dpat =
i1valdcl_dpat$get(iprv)
//
in//let
nindstrnfpr
(filr, nind, "// I1PRVDCL: ");
i1bnd_fprint(dpat, filr); endlnfpr(filr)
end(*let*)//end-of-[i1prvdcl_xcaemit(iprv,env0)]
//
(* ****** ****** *)
//
#implfun
i1valdcl_xcaemit
  (ival, env0) = let
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
i1bnd_xcaemit(dpat, env0)
//
(* ****** ****** *)
//
(*
val (  ) = prerrsln
("i1valdcl_xcaemit: dpat = ", dpat)
val (  ) = prerrsln
("i1valdcl_xcaemit: tdxp = ", tdxp)
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
  i1cmp_xcaemit(icmp, env0))
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
envx2cc_filr$get(env0)
val nind =
envx2cc_nind$get(env0)
in//let
(
nindstrnfpr(filr, nind, "// I1VALDCL\n"))
end//let
//
}(*where*)//end-of-[i1valdcl_xcaemit(ival,env0)]
//
(* ****** ****** *)
//
#implfun
i1vardcl_xcaemit
  (ivar, env0) = let
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
i1bnd_xcaemit(dpid, env0)
//
(* ****** ****** *)
//
(*
val (  ) = prerrsln
("i1vardcl_xcaemit: dvar = ", dvar)
val (  ) = prerrsln
("i1vardcl_xcaemit: dini = ", tdxp)
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
  i1cmp_xcaemit(icmp, env0))
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
envx2cc_filr$get(env0)
val nind =
envx2cc_nind$get(env0)
in//let
(
nindstrnfpr(filr, nind, "// I1VARDCL\n"))
end//let
//
}(*where*)//end-of-[i1vardcl_xcaemit(ivar,env0)]
//
(* ****** ****** *)
(* ****** ****** *)
//
#implfun
i1prfdcl_xcaemit
  (iprf, env0) = let
//
val filr =
envx2cc_filr$get(env0)
val nind =
envx2cc_nind$get(env0)
//
val dvar =
i1fundcl_dpid$get(iprf)
//
in//let
//
(
nindstrnfpr
(filr, nind, "// I1PRFDCL: ");
d2var_fprint(dvar, filr);endlnfpr(filr))
//
end(*let*)//end-of-[i1prfdcl_xcaemit(iprf,env0)]
//
(* ****** ****** *)
//
#implfun
i1fundcl_xcaemit
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
("i1fundcl_xcaemit: dvar = ", dvar)
val (  ) = prerrsln
("i1fundcl_xcaemit: fjas = ", fjas)
val (  ) = prerrsln
("i1fundcl_xcaemit: tdxp = ", tdxp)
*)
//
(* ****** ****** *)
//
val (  ) =
let
val filr =
envx2cc_filr$get(env0)
val nind =
envx2cc_nind$get(env0)
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
  envx2cc_pshlam0(env0) )
//
val (  ) =
(
fjarglst_xcaemit(fjas, env0))
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
  i1cmp_xcaemit(icmp, env0) )
end // end-of-[let]
) (*case+*) // end-of-( teqi1exp )
//
val (  ) = envx2cc_poplam0(env0)//leave
//
end where
{
//
val (  ) =
let
val filr =
envx2cc_filr$get(env0)
val nind =
envx2cc_nind$get(env0)
//
val dvar =
i1fundcl_dpid$get(ifun)
//
in//let
//
(
nindfpr(filr, nind);
strnfpr(
filr, "// I1FUNDCL: ");
d2var_fprint(dvar, filr); endlnfpr(filr))
end//let
//
}(*where*)//end-of-[i1fundcl_xcaemit(ifun,env0)]
//
(* ****** ****** *)
//
#implfun
i1tfndcl_xcaemit
  (itfn, env0) = let
//
val filr =
envx2cc_filr$get(env0)
val nind =
envx2cc_nind$get(env0)
//
val dvar =
i1fundcl_dpid$get(itfn)
//
in//let
//
(
nindfpr(filr, nind);
strnfpr(
filr, "// I1TFNDCL: ");
d2var_fprint(dvar, filr); endlnfpr(filr))
//
end(*let*)//end-of-[i1tfndcl_xcaemit(itfn,env0)]
//
(* ****** ****** *)
(* ****** ****** *)
//
(***********************************************************************)
(***********************************************************************)
(* end of [ATS3-XANADU/srcgen2/xats2xc/srcgen1/DATS/xats2xc_decl00.dats] *)
(***********************************************************************)
(***********************************************************************)

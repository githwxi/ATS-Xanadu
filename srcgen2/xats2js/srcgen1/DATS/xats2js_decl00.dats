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
(*
#include
"./../../..\
/HATS/xatsopt_dats.hats"
*)
#include
"./../../..\
/HATS/xatsopt_dpre.hats"
(* ****** ****** *)
#include
"./../HATS/mytmplib00.hats"
(* ****** ****** *)
(* ****** ****** *)
//
#staload // LOC =
"./../../../SATS/locinfo.sats"
#staload // FIL =
"./../../../SATS/filpath.sats"
#staload // D2E =
"./../../../SATS/dynexp2.sats"
//
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
#symload node with t1imp_get_node
#symload stmp with t1imp_get_stmp
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
#implfun
xats2js_i1dcl
( env0,dcl0 ) =
let
(*
//
val () =
prerrsln("\
xats2js_i1dcl: dcl0 = ", dcl0))
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
//
|I1Ddclst0 _ =>
(
  f0_dclst0(env0, dcl0))
|I1Dlocal0 _ =>
(
  f0_local0(env0, dcl0))
//
(* ****** ****** *)
//
|I1Dtmpsub _ =>
(
  f0_tmpsub(env0, dcl0))
//
(* ****** ****** *)
//
|I1Dinclude _ =>
(
  f0_include(env0, dcl0))
//
(* ****** ****** *)
//
|I1Dvaldclst _ =>
(
  f0_valdclst(env0, dcl0))
//
|I1Dvardclst _ =>
(
  f0_vardclst(env0, dcl0))
//
|I1Dfundclst _ =>
(
  f0_fundclst(env0, dcl0))
//
(* ****** ****** *)
//
|I1Dimplmnt0 _ =>
(
  f0_implmnt0(env0, dcl0))
//
(* ****** ****** *)
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
i1dcl_fprint(dcl0, filr); fprintln(filr)
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
envx2js_get_filr(env0)
val nind =
envx2js_get_nind(env0)
in//let
nindfpr(filr, nind);
strnfpr(filr, "// ");
loctn_fprint
(loc0, filr); fprintln(filr) end
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
val
filr =
envx2js_get_filr(env0)
val
nind =
envx2js_get_nind(env0)
//
val-
I1Dextern
(tknd, dcl1) = dcl0.node()
//
local
#impltmp
g_print$out<>() = filr
in//local
val (  ) =
( print("// I1Dextern(")
; prints(tknd, "...", ")\n"))
end//local
//
val (  ) =
(
  xats2js_i1dcl(env0, dcl1))
//
end where
{
//
(*
//
val loc0 = dcl0.lctn((*void*))
//
val (  ) =
prerrsln("f0_extern(x2js): dcl0 = ", dcl0)
*)
//
}(*where*) // end of [f0_extern(env0,dcl0)]
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
val
filr =
envx2js_get_filr(env0)
val
nind =
envx2js_get_nind(env0)
//
val-
I1Dstatic
(tknd, dcl1) = dcl0.node()
//
local
#impltmp
g_print$out<>() = filr
in//local
val (  ) =
( print("// I1Dstatic(")
; prints(tknd, "...", ")\n"))
end//local
//
val (  ) =
(
  xats2js_i1dcl(env0, dcl1))
//
end where
{
//
(*
//
val loc0 = dcl0.lctn((*void*))
//
val (  ) =
prerrsln("f0_static(x2js): dcl0 = ", dcl0)
*)
//
}(*where*) // end of [f0_static(env0,dcl0)]
//
(* ****** ****** *)
(* ****** ****** *)
//
fun
f0_dclst0
( env0:
! envx2js
, dcl0: i1dcl): void =
let
//
val-
I1Ddclst0
(   dcls   ) = dcl0.node()
//
val () =
(
  xats2js_i1dclist(env0, dcls))
//
end where
{
//
(*
//
val loc0 = dcl0.lctn((*void*))
//
val (  ) =
prerrsln("f0_dclst0(x2js): dcl0 = ", dcl0)
*)
//
}(*where*) // end of [f0_dclst0(env0,dcl0)]
//
(* ****** ****** *)
//
fun
f0_local0
( env0:
! envx2js
, dcl0: i1dcl): void =
let
//
val
filr =
envx2js_get_filr(env0)
val
nind =
envx2js_get_nind(env0)
//
val-
I1Dlocal0
(head, body) = dcl0.node()
//
val
(  ) =
(
nindfpr
(filr, nind); // indentation
strnfpr(filr, "// I1Dlocal0\n")
)
//
val () =
(
  xats2js_i1dclist(env0, head))
//
val
(  ) =
(
nindfpr
(filr, nind); // indentation
strnfpr(filr, "// I1Dlocal0(in)\n"))
//
val () =
(
  xats2js_i1dclist(env0, body))
//
val
(  ) =
(
nindfpr
(filr, nind); // indentation
strnfpr(filr, "// I1Dlocal0(end)\n"))
//
end where
{
//
(*
//
val loc0 = dcl0.lctn((*void*))
//
val (  ) =
prerrsln("f0_local0(x2js): dcl0 = ", dcl0)
*)
//
}(*where*) // end of [f0_local0(env0,dcl0)]
//
(* ****** ****** *)
(* ****** ****** *)
//
fun
f0_tmpsub
( env0:
! envx2js
, dcl0: i1dcl): void =
let
//
val
filr =
envx2js_get_filr(env0)
val
nind =
envx2js_get_nind(env0)
//
val-
I1Dtmpsub
(svts, dcl1) = dcl0.node()
//
val
(  ) =
let
#impltmp
g_print$out<>() = filr
in//let
(
nindfpr
(filr, nind); // indentation
prints
("// I1Dtmpsub(", svts, ")\n"))
end//let
//
in//let
xats2js_i1dcl(env0,dcl1(*tmp*))
end where
{
//
(*
//
val loc0 = dcl0.lctn((*void*))
//
val (  ) =
prerrsln("f0_tmpsub(x2js): dcl0 = ", dcl0)
*)
//
}(*where*) // end of [f0_tmpsub(env0,dcl0)]
//
(* ****** ****** *)
(* ****** ****** *)
//
fun
f0_include
( env0:
! envx2js
, dcl0: i1dcl): void =
let
//
val
filr =
envx2js_get_filr(env0)
val
nind =
envx2js_get_nind(env0)
//
val-
I1Dinclude
( knd0
, tknd, gsrc
, fopt, dopt) = dcl0.node()
//
val
(  ) =
let
#impltmp
g_print$out<>() = filr
in//let
(
nindfpr
(filr, nind); // indentation
prints
("// I1Dinclude(","...",")\n"))
end//let
//
in//let
(
case+ dopt of
|optn_nil() => ( (*void*) )
|optn_cons(dcls) =>
(
  xats2js_i1dclist(env0, dcls)))
end where
{
//
(*
//
val loc0 = dcl0.lctn((*void*))
//
val (  ) =
prerrsln("f0_include(x2js): dcl0 = ", dcl0)
*)
//
}(*where*) // end of [f0_include(env0,dcl0)]
//
(* ****** ****** *)
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
val (  ) =
if
valtok_prvq(tknd)
then
xats2js_i1prvdclist(env0, i1vs)
else
xats2js_i1valdclist(env0, i1vs)
//
end where // end-of-[let]
{
//
(*
//
val loc0 = dcl0.lctn((*void*))
//
val (  ) =
prerrsln("f0_valdclst(x2js): dcl0 = ", dcl0)
*)
//
}(*where*) // end of [f0_valdclst(env0,dcl0)]
//
(* ****** ****** *)
//
fun
f0_vardclst
( env0:
! envx2js
, dcl0: i1dcl): void =
let
//
val-
I1Dvardclst
( tknd, i1vs) = dcl0.node()
//
val
(  ) =
xats2js_i1vardclist(env0, i1vs)
//
end where
{
//
(*
//
val loc0 = dcl0.lctn((*void*))
//
val (  ) =
prerrsln("f0_vardclst(x2js): dcl0 = ", dcl0)
*)
//
}(*where*) // end of [f0_vardclst(env0,dcl0)]
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
val (  ) =
if
funtok_prfq(tknd)
then
xats2js_i1prfdclist(env0, i1fs)
else
xats2js_i1fundclist(env0, i1fs)
//
end where // end-of-[let]
{
//
(*
//
val loc0 = dcl0.lctn((*void*))
//
val (  ) =
prerrsln("f0_fundclst(x2js): dcl0 = ", dcl0)
*)
//
}(*where*) // end of [f0_fundclst(env0,dcl0)]
//
(* ****** ****** *)
(* ****** ****** *)
//
fun
f0_implmnt0
( env0:
! envx2js
, dcl0: i1dcl): void =
let
//
val
filr =
envx2js_get_filr(env0)
val
nind =
envx2js_get_nind(env0)
//
val-
I1Dimplmnt0
( tknd
, stmp, dimp
, fjas, icmp) = dcl0.node()
//
//
val
(  ) =
let
#impltmp
g_print$out<>() = filr
in//let
(
nindfpr
(filr, nind); // indent
prints
("// I1Dimplmnt0(","...",")\n"))
end//let
//
val (  ) =
(
  xats2js_dimpl(env0, dimp))
//
in//let
//
let
//
val (  ) = // enter
(
  envx2js_pshlam0(env0) )
//
val (  ) =
(
  xats2js_i1cmp(env0, icmp)
) where
{ val () =
  xats2js_fjarglst(env0, fjas)}
//
val (  ) = envx2js_poplam0(env0)
//
val (  ) =
(
nindfpr
(filr, nind); // indentation
strnfpr(filr, "// I1Dimplmnt0(end)\n"))
//
end//let
//
end where
{
//
(*
//
val loc0 = dcl0.lctn((*void*))
//
val (  ) =
prerrsln("f0_implmnt0(x2js): dcl0 = ", dcl0)
*)
//
}(*where*) // end of [f0_fundclst(env0,dcl0)]
//
(* ****** ****** *)
(* ****** ****** *)
//
}(*where*)//end-of-[xats2js_i1dcl(env0,dcl0)]
//
(* ****** ****** *)
(* ****** ****** *)
//
#implfun
xats2js_dimpl
( env0,dimp ) =
(
//
nindfpr(filr, nind);
strnfpr(filr, "// ");
dimpl_fprint
(dimp, filr); fprintln(filr)
//
) where
{
//
val filr = envx2js_get_filr(env0)
val nind = envx2js_get_nind(env0)
//
val (  ) =
(
  prerrsln("xats2js_dimp: dimp = ", dimp))
}(*where*)//end-of-[xats2js_dimpl(env0,dimp)]
//
(* ****** ****** *)
(* ****** ****** *)
//
#implfun
xats2js_t1imp
( env0,timp ) =
(
case+
timp.node() of
//
|T1IMPall1
(dcst
,t2js, dopt) =>
(
//
nindfpr(filr, nind);
strnfpr(filr,"// T1IMPall1(");
d2cstfpr(filr, dcst);strnfpr(filr, "<");
tjagsfpr(filr, t2js);strnfpr(filr, ">");strnfpr(filr, ")\n"(*end*));
//
case+ dopt of
|
optn_nil() => (  (*void*)  )
|
optn_cons(idcl) =>
xats2js_i1dcl(env0,idcl(*tmp*))
//
)//end-of-[T1IMPall1(dcst,dopt)]
//
|T1IMPallx
(dcst
,t2js, dopt) =>
(
//
nindfpr(filr, nind);
strnfpr(filr,"// T1IMPallx(");
d2cstfpr(filr, dcst);strnfpr(filr, "<");
tjagsfpr(filr, t2js);strnfpr(filr, ">");strnfpr(filr, ")\n"(*end*));
//
case+ dopt of
|
optn_nil() => (  (*void*)  )
|
optn_cons(idcl) =>
xats2js_i1dcl(env0,idcl(*tmp*))
//
)//end-of-[T1IMPall1(dcst,dopt)]
//
) where
{
//
val filr = envx2js_get_filr(env0)
val nind = envx2js_get_nind(env0)
//
val (  ) =
(
  prerrsln("xats2js_t1imp: timp = ", timp))
//
}(*where*)//end-of-[xats2js_t1imp(env0,timp)]
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
xats2js_i1bnd(env0, dpat)
//
(* ****** ****** *)
//
(*
val (  ) = prerrsln
("xats2js_i1valdcl: dpat = ", dpat)
val (  ) = prerrsln
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
end where
{
//
val (  ) =
let
val filr =
envx2js_get_filr(env0)
val nind =
envx2js_get_nind(env0)
in//let
(
nindstrnfpr(filr, nind, "// I1VALDCL\n"))
end//let
//
}(*where*)//end-of-[xats2js_i1valdcl(env0,ival)]
//
(* ****** ****** *)
//
#implfun
xats2js_i1prvdcl
  (env0, iprv) = let
//
val filr =
envx2js_get_filr(env0)
val nind =
envx2js_get_nind(env0)
//
val dpat =
i1valdcl_get_dpat(iprv)
//
in//let
nindstrnfpr
(filr, nind, "// I1PRVDCL: ");
i1bnd_fprint(dpat, filr); fprintln(filr)
end(*let*)//end-of-[xats2js_i1prvdcl(env0,iprv)]
//
(* ****** ****** *)
(* ****** ****** *)
//
#implfun
xats2js_i1vardcl
  (env0, ivar) = let
//
(* ****** ****** *)
//
val dpid =
i1vardcl_get_dpid(ivar)
val tdxp =
i1vardcl_get_dini(ivar)
//
(* ****** ****** *)
//
val (  ) =
xats2js_i1bnd(env0, dpid)
//
(* ****** ****** *)
//
(*
val (  ) = prerrsln
("xats2js_i1vardcl: dvar = ", dvar)
val (  ) = prerrsln
("xats2js_i1vardcl: dini = ", tdxp)
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
end where
{
//
val (  ) =
let
val filr =
envx2js_get_filr(env0)
val nind =
envx2js_get_nind(env0)
in//let
(
nindstrnfpr(filr, nind, "// I1VARDCL\n"))
end//let
//
}(*where*)//end-of-[xats2js_i1vardcl(env0,ival)]
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
nindfpr(filr,nind);
strnfpr(filr,"// ");
d2varfpr(filr,dvar);fprintln(filr)
end//let
//
(* ****** ****** *)
//
(*
val (  ) = prerrsln
("xats2js_i1fundcl: dvar = ", dvar)
val (  ) = prerrsln
("xats2js_i1fundcl: fjas = ", fjas)
val (  ) = prerrsln
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
(
xats2js_fjarglst(env0,fjas)
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
  xats2js_i1cmp(env0, icmp) )
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
envx2js_get_filr(env0)
val nind =
envx2js_get_nind(env0)
in//let
(
nindstrnfpr(filr, nind, "// I1FUNDCL\n"))
end//let
//
}(*where*)//end-of-[xats2js_i1fundcl(env0,ifun)]
//
(* ****** ****** *)
//
#implfun
xats2js_i1prfdcl
  (env0, iprf) = let
//
val filr =
envx2js_get_filr(env0)
val nind =
envx2js_get_nind(env0)
//
val dvar =
i1fundcl_get_dpid(iprf)
//
in//let
nindstrnfpr
(filr, nind, "// I1PRFDCL: ");
d2var_fprint(dvar, filr); fprintln(filr)
end(*let*)//end-of-[xats2js_i1prfdcl(env0,iprf)]
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
xats2js_i1prvdclist
  (env0, i1vs) =
(
  list_xats2js_fnp(env0, i1vs, xats2js_i1prvdcl))
//
(* ****** ****** *)
//
#implfun
xats2js_i1prfdclist
  (env0, i1fs) =
(
  list_xats2js_fnp(env0, i1fs, xats2js_i1prfdcl))
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
(* end of [ATS3/XANADU_srcgen2_xats2js_srcgen1_DATS_xats2js_decl00.dats] *)
(***********************************************************************)

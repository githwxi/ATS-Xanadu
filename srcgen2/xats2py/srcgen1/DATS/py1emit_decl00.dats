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
Fri Nov 29 04:23:24 PM EST 2024
*)
Authoremail: gmhwxiATgmailDOTcom
*)
//
(* ****** ****** *)
(* ****** ****** *)
#include
"./../../..\
/HATS/xatsopt_sats.hats"
#include
"./../../..\
/HATS/xatsopt_dats.hats"
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
//
#staload "./../SATS/py1emit.sats"
//
(* ****** ****** *)
//
#staload
_(*DATS*)="./../DATS/py1emit.dats"
//
(* ****** ****** *)
(* ****** ****** *)
//
fun
fprintln
(filr: FILR): void =
(
 strn_fprint(filr,"\n"))//endfun
//
(* ****** ****** *)
//
fun
lctnfpr
(filr: FILR
,loc0: loc_t): void =
(
 loctn_fprint(filr,loc0))//endfun
//
(* ****** ****** *)
(* ****** ****** *)
//
fun
dicstfpr
(filr: FILR
,dimp: dimpl): void =
(
case+
dimp.node() of
|DIMPLone1
(  dcst  ) =>
(
  d2cstfpr(filr, dcst))
|DIMPLone2
(dcst, svts) =>
(
  d2cstfpr(filr, dcst))
|DIMPLall1
(dqid, d2cs) =>
(
  d1qid_fprint(filr, dqid))
|DIMPLopt2
(dqid, _, _) =>
(
  d1qid_fprint(filr, dqid)))
//
(* ****** ****** *)
//
fun
dimplfpr
(filr: FILR
,dimp: dimpl): void =
(
 dimpl_fprint(filr,dimp))//endfun
//
(* ****** ****** *)
(* ****** ****** *)
//
#implfun
py1emit_i1dcl
( env0,dcl0 ) =
let
(*
//
val () =
prerrsln
("py1emit_i1dcl: dcl0 = ", dcl0))
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
(* ****** ****** *)
|_(*otherwise*) => xats2js_i1dcl(env0, dcl0)
(* ****** ****** *)
(* ****** ****** *)
//
end where
{
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
val filr = env0.filr()
val nind = env0.nind()
//
val loc0 = dcl0.lctn()
//
val-
I1Dextern
(tknd, dcl1) = dcl0.node()
//
val
(  ) =
let
//
#impltmp
g_print$out<>() = filr
//
in//let
nindfpr(filr, nind);
prints
("## I1Dextern(",loc0,")\n")
end//let
//
val (  ) =
(
  xats2js_i1dcl( env0, dcl1 ))
//
end(*let*)//end-of-[f0_extern(env0,dcl0)]
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
val filr = env0.filr()
val nind = env0.nind()
//
val loc0 = dcl0.lctn()
//
val-
I1Dstatic
(tknd, dcl1) = dcl0.node()
//
val
(  ) =
let
//
#impltmp
g_print$out<>() = filr
//
in//let
nindfpr(filr, nind);
prints
("## I1Dstatic(",loc0,")\n")
end//let
//
val (  ) =
(
  xats2js_i1dcl( env0, dcl1 ))
//
end(*let*)//end-of-[f0_static(env0,dcl0)]
//
(* ****** ****** *)
(* ****** ****** *)
//
fun
f0_local0
( env0:
! envx2js
, dcl0: i1dcl): void =
let
//
val filr = env0.filr()
val nind = env0.nind()
//
val loc0 = dcl0.lctn()
//
val-
I1Dlocal0
(head, body) = dcl0.node()
//
val
(  ) =
let
//
#impltmp
g_print$out<>() = filr
//
in//let
(
nindfpr(filr, nind);
prints
("## I1Dlocal0(",loc0,")\n"))
end//let
//
val () =
(
  py1emit_i1dclist(env0, head))
val () =
(
  py1emit_i1dclist(env0, body))
//
end(*let*)//end-of-[f0_local0(env0,dcl0)]
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
val filr = env0.filr()
val nind = env0.nind()
//
val loc0 = dcl0.lctn()
//
val-
I1Dinclude
( knd0
, tknd, gsrc
, fopt, dopt) = dcl0.node()
//
val (  ) =
let
//
#impltmp
g_print$out<>() = filr
//
in//let
(
nindfpr(filr, nind);
prints
("## I1Dinclude(",loc0,")\n"))
end//let
//
in//let
(
case+ dopt of
|optn_nil() => ( (*void*) )
|optn_cons(dcls) =>
(
  py1emit_i1dclist(env0, dcls)))
end(*let*)//end-of-[f0_include(env0,dcl0)]
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
val filr =
  env0.filr((*void*))
val nind =
  env0.nind((*void*))
val loc0 =
  dcl0.lctn((*void*))
//
val-
I1Dvaldclst
(tknd, i1vs) = dcl0.node()
//
val
prvq =
(
  valtok_prvq( tknd ))
//
val (  ) =
let
//
#impltmp
g_print$out<>() = filr
//
in//let
//
(
  nindfpr(filr, nind));
//
if
prvq
then prints
("## I1Dprvdclist(",loc0,")\n")
else prints
("## I1Dvaldclist(",loc0,")\n")
//
end//let
//
val (  ) =
if
prvq
then
(
 xats2js_i1valdclist(env0, i1vs))
else
(
 py1emit_i1valdclist(env0, i1vs))
//
end(*let*)//end-of-[f0_valdclst(env0,dcl0)]
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
val filr = env0.filr()
val nind = env0.nind()
//
val loc0 = dcl0.lctn()
//
val-
I1Dvardclst
(tknd, i1vs) = dcl0.node()
//
val (  ) =
let
//
#impltmp
g_print$out<>() = filr
//
in//let
nindfpr(filr, nind);
prints
("## I1Dvardclist(",loc0,")\n")
end//let
//
val (  ) =
(
 py1emit_i1vardclist(env0, i1vs))
//
end(*let*)//end of [f0_vardclst(env0,dcl0)]
//
(* ****** ****** *)
(* ****** ****** *)
//
fun
f0_fundclst
( env0:
! envx2js
, dcl0: i1dcl): void =
let
//
val filr =
  env0.filr((*void*))
val nind =
  env0.nind((*void*))
val loc0 =
  dcl0.lctn((*void*))
//
val-
I1Dfundclst
(tknd
,d2cs, i1fs) = dcl0.node()
//
val prfq =
(
  funtok_prfq( tknd ))
//
val (  ) =
let
//
#impltmp
g_print$out<>() = filr
//
in//let
//
(
  nindfpr(filr, nind));
//
if
prfq
then prints
("## I1Dprfdclist(",loc0,")\n")
else prints
("## I1Dfundclist(",loc0,")\n")
//
end//let
//
val (  ) =
if
prfq
then
(
 xats2js_i1fundclist(env0, i1fs))
else
(
 py1emit_i1fundclist(env0, i1fs))
//
end(*let*)//end-of-[f0_fundclst(env0,dcl0)]
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
val filr = env0.filr()
val nind = env0.nind()
//
val loc0 = dcl0.lctn()
//
val-
I1Dimplmnt0
( tknd
, stmp, dimp
, fjas, icmp) = dcl0.node()
//
in//let
//
let
//
fun
f1_i1cmpret
( env0:
! envx2js
, icmp: i1cmp): void =
let
val filr = envx2js_get_filr(env0)
val nind = envx2js_get_nind(env0)
in//let
let
val ival = icmp.ival()
val (  ) = py1emit_i1cmp(env0, icmp)
in//let
nindstrnfpr
(filr, nind, "return ");i1valpy1(filr, ival);fprintln(filr)
end//let
end//let//end-of-[f1_i1cmpret(...)]
//
in//let
//
nindstrnfpr
(filr,nind,"## I1Dimplmnt0(");
lctnfpr(filr,loc0);strnfpr(filr,")\n");
//
if
dimpl_tempq(dimp)
then
(
nindstrnfpr
(filr,nind,"## I1Dimplmnt0(");
dimplfpr(filr,dimp);strnfpr(filr,"):timp\n"))
else
(
//
(
nindstrnfpr
(filr, nind, "let ");dicstfpr(filr, dimp);
strnfpr(filr," = function ");fjas1py1(filr, fjas));
(
strnfpr(filr," { // impl\n");
(envx2js_incnind(env0,2(*++*))
;py1emit_fjarglst(env0, fjas);f1_i1cmpret(env0, icmp));
(envx2js_decnind(env0,2(*--*))
;nindstrnfpr(filr, nind, "} // endfun(impl)");fprintln(filr)))
//
)//endif
//
end(*let*)
//
end(*let*)//end-of-[f0_implmnt0(env0,dcl0)]
//
(* ****** ****** *)
(* ****** ****** *)
//
}(*where*)//end-of-[py1emit_i1dcl(env0,dcl0)]
//
(* ****** ****** *)
(* ****** ****** *)
//
#implfun
py1emit_i1dclist
  (env0, dcls) =
(
  list_py1emit_fnp(env0, dcls, py1emit_i1dcl))
(*where*)//end-of-[py1emit_i1dclist(env0,dcl0)]
//
(* ****** ****** *)
(* ****** ****** *)
//
#implfun
py1emit_i1valdclist
  (env0, i1vs) =
(
  list_py1emit_fnp(env0, i1vs, py1emit_i1valdcl))
//
(* ****** ****** *)
//
#implfun
py1emit_i1vardclist
  (env0, i1vs) =
(
  list_py1emit_fnp(env0, i1vs, py1emit_i1vardcl))
//
(* ****** ****** *)
(* ****** ****** *)
//
#implfun
py1emit_i1fundclist
  (env0, i1fs) =
(
  list_py1emit_fnp(env0, i1fs, py1emit_i1fundcl))
//
(* ****** ****** *)
(* ****** ****** *)
//
#implfun
py1emit_i1dclistopt
  (env0, dopt) =
(
  optn_py1emit_fnp(env0, dopt, py1emit_i1dclist))
//
(* ****** ****** *)
(* ****** ****** *)

(***********************************************************************)
(* end of [ATS3/XANADU_srcgen2_xats2js_srcgen1_DATS_py1emit_dynexp.dats] *)
(***********************************************************************)

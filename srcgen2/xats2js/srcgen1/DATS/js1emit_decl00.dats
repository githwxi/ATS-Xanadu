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
Sun 26 May 2024 09:32:10 AM EDT
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
"./../HATS/xats2js_dats.hats"
(* ****** ****** *)
(* ****** ****** *)
//
#staload // SYM =
"./../../../SATS/xsymbol.sats"
//
#staload // LOC =
"./../../../SATS/locinfo.sats"
//
#staload // D2E =
"./../../../SATS/dynexp2.sats"
//
(* ****** ****** *)
(* ****** ****** *)
//
#staload "./../SATS/intrep0.sats"
#staload "./../SATS/intrep1.sats"
#staload "./../SATS/xats2js.sats"
#staload "./../SATS/js1emit.sats"
//
(* ****** ****** *)
//
#staload
_(*DATS*)="./../DATS/js1emit.dats"
//
(* ****** ****** *)
#symload lctn with i1dcl_get_lctn
#symload node with i1dcl_get_node
(* ****** ****** *)
#symload filr with envx2js_get_filr
#symload nind with envx2js_get_nind
(* ****** ****** *)
#symload
js1emit_fjas1 with js1emit_fjarglst
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
#implfun
js1emit_i1dcl
( env0,dcl0 ) =
let
(*
//
val () =
prerrln
("js1emit_i1dcl: dcl0 = ", dcl0))
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
|I1Dlocal0 _ =>
(
  f0_local0(env0, dcl0))
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
|I1Dvardclst _ =>
(
  f0_vardclst(env0, dcl0))
//
(* ****** ****** *)
//
|I1Dfundclst _ =>
(
  f0_fundclst(env0, dcl0))
//
(* ****** ****** *)
|_(*otherwise*) => xats2js_i1dcl(env0, dcl0)
(* ****** ****** *)
//
end where
{
//
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
print
("// I1Dextern(",loc0,")\n")
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
print
("// I1Dstatic(",loc0,")\n")
end//let
//
val (  ) =
(
  xats2js_i1dcl( env0, dcl1 ))
//
end(*let*)//end-of-[f0_static(env0,dcl0)]
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
print
("// I1Dlocal0(",loc0,")\n"))
end//let
//
val () =
(
  js1emit_i1dclist(env0, head))
val () =
(
  js1emit_i1dclist(env0, body))
//
end(*let*)//end-of-[f0_local0(env0,dcl0)]
//
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
print
("// I1Dinclude(",loc0,")\n"))
end//let
//
in//let
(
case+ dopt of
|optn_nil() => ( (*void*) )
|optn_cons(dcls) =>
(
  js1emit_i1dclist(env0, dcls)))
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
val filr = env0.filr()
val nind = env0.nind()
//
val loc0 = dcl0.lctn()
//
val-
I1Dvaldclst
( tknd, i1vs) = dcl0.node()
//
val (  ) =
let
//
#impltmp
g_print$out<>() = filr
//
in//let
nindfpr(filr, nind);
print
("// I1Dvaldclist(",loc0,")\n")
end//let
//
val (  ) =
(
 js1emit_i1valdclist(env0, i1vs))
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
( tknd, i1vs) = dcl0.node()
//
val (  ) =
let
//
#impltmp
g_print$out<>() = filr
//
in//let
nindfpr(filr, nind);
print
("// I1Dvardclist(",loc0,")\n")
end//let
//
val (  ) =
(
 js1emit_i1vardclist(env0, i1vs))
//
end(*let*)//end of [f0_vardclst(env0,dcl0)]
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
val filr = env0.filr()
val nind = env0.nind()
//
val loc0 = dcl0.lctn()
//
val-
I1Dfundclst
( tknd
, d2cs, i1fs) = dcl0.node()
//
val (  ) =
let
//
#impltmp
g_print$out<>() = filr
//
in//let
nindfpr(filr, nind);
print
("// I1Dfundclist(",loc0,")\n")
end//let
//
val (  ) =
(
 js1emit_i1fundclist(env0, i1fs))
//
end(*let*)//end-of-[f0_fundclst(env0,dcl0)]
//
(* ****** ****** *)
(* ****** ****** *)
//
}(*where*)//end-of-[js1emit_i1dcl(env0,dcl0)]
//
(* ****** ****** *)
(* ****** ****** *)
//
#implfun
js1emit_i1valdcl
  (env0, ival) =
(
  xats2js_i1valdcl(env0, ival))
(*where*)//end-of-[js1emit_i1valdcl(env0,dcl0)]
//
(* ****** ****** *)
//
#implfun
js1emit_i1vardcl
  (env0, ivar) =
(
  xats2js_i1vardcl(env0, ivar))
(*where*)//end-of-[js1emit_i1vardcl(env0,dcl0)]
//
(* ****** ****** *)
//
#implfun
js1emit_i1fundcl
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
val filr = env0.filr()
val nind = env0.nind()
in//let
(
nindfpr(filr, nind); // indent
strnfpr(filr, "// I1FUNDCL\n"))
end//let
//
(* ****** ****** *)
//
val (  ) =
let
val filr = env0.filr()
val nind = env0.nind()
in//let
(
nindfpr(filr, nind);
strnfpr(filr, "function ");
d2varfpr(filr, dvar);
fjas1js1(filr, fjas);fprintln(filr))
end//let
//
(* ****** ****** *)
//
val ( ) =
let
val filr = env0.filr()
val nind = env0.nind()
val (  ) =
(
nindfpr(filr, nind);strnfpr(filr, "{ // fun\n"))
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
case+ tdxp of
|
TEQI1CMPnone
( (*void*) ) => ((*void*))
|
TEQI1CMPsome
(teq1, icmp) =>
let
//
val ival = icmp.ival()
//
val (  ) =
(
  js1emit_fjas1(env0, fjas))
val (  ) =
(
  js1emit_i1cmp(env0, icmp))
//
(* ****** ****** *)
//
val (  ) =
let
val filr = env0.filr()
val nind = env0.nind()
in//let
(
nindfpr(filr, nind);
strnfpr(filr, "return ");i1valjs1(filr, ival);fprintln(filr))
end//let
//
(* ****** ****** *)
end//let
(* ****** ****** *)
) (*case+*) // end-of-(teqi1exp)
//
val (  ) = envx2js_poplam0(env0)//leave
//
(* ****** ****** *)
//
val (  ) =
let
val filr = env0.filr()
val nind = env0.nind()
in//let
(
nindfpr(filr, nind);
strnfpr(filr, "} // endfun\n")) end//let
//
(* ****** ****** *)
//
end//let
(*let*)//end-of-[js1emit_i1fundcl(env0,ifun)]
//
(* ****** ****** *)
(* ****** ****** *)
//
#implfun
js1emit_i1dclist
  (env0, dcls) =
(
  list_js1emit_fnp(env0, dcls, js1emit_i1dcl))
(*where*)//end-of-[js1emit_i1dclist(env0,dcl0)]
//
(* ****** ****** *)
(* ****** ****** *)
//
#implfun
js1emit_i1valdclist
  (env0, i1vs) =
(
  list_js1emit_fnp(env0, i1vs, js1emit_i1valdcl))
//
(* ****** ****** *)
//
#implfun
js1emit_i1vardclist
  (env0, i1vs) =
(
  list_js1emit_fnp(env0, i1vs, js1emit_i1vardcl))
//
(* ****** ****** *)
(* ****** ****** *)
//
#implfun
js1emit_i1fundclist
  (env0, i1fs) =
(
  list_js1emit_fnp(env0, i1fs, js1emit_i1fundcl))
//
(* ****** ****** *)
(* ****** ****** *)
//
#implfun
js1emit_i1dclistopt
  (env0, dopt) =
(
  optn_js1emit_fnp(env0, dopt, js1emit_i1dclist))
//
(* ****** ****** *)
(* ****** ****** *)

(***********************************************************************)
(* end of [ATS3/XANADU_srcgen2_xats2js_srcgen1_DATS_js1emit_dynexp.dats] *)
(***********************************************************************)

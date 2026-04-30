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
//
(*
Author: Hongwei Xi
//
Sat Apr 11 02:37:21 PM EDT 2026
//
Authoremail: gmhwxiATgmailDOTcom
*)
//
(* ****** ****** *)
(* ****** ****** *)
#include
"./../../..\
/HATS/xatsopt_sats.hats"
(* ****** ****** *)
(* ****** ****** *)
//
#staload ".\
/../../../xats2cc\
/srcgen1/SATS/intrep0.sats"//...
#staload "./../SATS/intrep1.sats"
//
(* ****** ****** *)
(* ****** ****** *)
//
#impltmp
{ x0:t0 }
g_cmp<i1lab(x0)>
(  ilx1, ilx2  ) =
(
g_cmp<label>(l1, l2) where
{
val+I1LAB(l1, itm1) = ilx1
val+I1LAB(l2, itm2) = ilx2} )
//
(* ****** ****** *)
(* ****** ****** *)
//
#impltmp
< x0:t0 >
i1lab_fprint
 (lab, out) = let
//
#impltmp
g_print$out<>() = out
//
in//let
case+ lab of
|
I1LAB(l01, x02) =>
prints("I1LAB(",l01,";",x02,")")
end(*let*)//end-of-[i1lab_fprint]
//
#impltmp
{ x0:t0 }
g_print<i1lab(x0)>(ilab) =
i1lab_fprint(ilab, g_print$out<>())
//
(* ****** ****** *)
(* ****** ****** *)
//
#impltmp
g_print
<i1opr>(iopr) =
i1opr_fprint(iopr, g_print$out<>())
//
#impltmp
g_print
<i1tnm>(itnm) =
i1tnm_fprint(itnm, g_print$out<>())
//
(* ****** ****** *)
(* ****** ****** *)
//
#impltmp
g_print
<i1let>(ilet) =
i1let_fprint(ilet, g_print$out<>())
//
(* ****** ****** *)
//
#impltmp
g_print
<i1bnd>(ibnd) =
i1bnd_fprint(ibnd, g_print$out<>())
#impltmp
g_print
<i1cmp>(icmp) =
i1cmp_fprint(icmp, g_print$out<>())
//
#impltmp
g_print
<i1ins>(iins) =
i1ins_fprint(iins, g_print$out<>())
//
(* ****** ****** *)
//
#impltmp
g_print
<i1val>(ival) =
i1val_fprint(ival, g_print$out<>())
//
(* ****** ****** *)
(* ****** ****** *)
//
(*
HX-2026-04-11:
These are from [xats2cc_tmplib]:
*)
//
(* ****** ****** *)
//
#impltmp
g_print
<i0cal>(ical) =
i0cal_fprint(ical, g_print$out<>())
//
(* ****** ****** *)
//
#impltmp
g_print
<i0pat>(ipat) =
i0pat_fprint(ipat, g_print$out<>())
//
(* ****** ****** *)
//
#impltmp
g_print
<i0exp>(iexp) =
i0exp_fprint(iexp, g_print$out<>())
//
(* ****** ****** *)
//
#impltmp
g_print
<i0dcl>(idcl) =
i0dcl_fprint(idcl, g_print$out<>())
//
(* ****** ****** *)
(* ****** ****** *)
//
#impltmp
g_print
<fjarg>(farg) =
fjarg_fprint(farg, g_print$out<>())
//
(* ****** ****** *)
(* ****** ****** *)
//
#impltmp
g_print
<i1gua>(gua) =
i1gua_fprint(gua, g_print$out<>())
//
#impltmp
g_print
<i1gpt>(gpt) =
i1gpt_fprint(gpt, g_print$out<>())
//
#impltmp
g_print
<i1cls>(cls) =
i1cls_fprint(cls, g_print$out<>())
//
(* ****** ****** *)
(* ****** ****** *)
//
#impltmp
g_print
<i1dcl>(idcl) =
i1dcl_fprint(idcl, g_print$out<>())
//
(* ****** ****** *)
(* ****** ****** *)
//
#impltmp
g_print<i0valdcl>(ival) =
i0valdcl_fprint(ival, g_print$out<>())
#impltmp
g_print<i0vardcl>(ivar) =
i0vardcl_fprint(ivar, g_print$out<>())
#impltmp
g_print<i0fundcl>(ifun) =
i0fundcl_fprint(ifun, g_print$out<>())
//
(* ****** ****** *)
(* ****** ****** *)
//
#impltmp
g_print<i1valdcl>(ival) =
i1valdcl_fprint(ival, g_print$out<>())
#impltmp
g_print<i1vardcl>(ivar) =
i1vardcl_fprint(ivar, g_print$out<>())
#impltmp
g_print<i1fundcl>(ifun) =
i1fundcl_fprint(ifun, g_print$out<>())
//
(* ****** ****** *)
(* ****** ****** *)
//
#impltmp
g_print
<teqi0exp>(tdxp) =
let
(*
#impltmp
g_print$out<>() = out
*)
in//let
(
case+ tdxp of
|
TEQI0EXPnone() =>
prints("TEQI0EXPnone(", ")")
|
TEQI0EXPsome(tok0, i0e1) =>
prints("TEQI0EXPsome(",tok0,";",i0e1,")"))
endlet // end-of-[g_print<teqi0exp>(tdxp)]
//
(* ****** ****** *)
//
#impltmp
g_print
<teqi1cmp>(tdxp) =
let
(*
#impltmp
g_print$out<>() = out
*)
in//let
(
case+ tdxp of
|
TEQI1CMPnone() =>
prints("TEQI1CMPnone(", ")")
|
TEQI1CMPsome(tok0, icmp) =>
prints("TEQI1CMPsome(",tok0,";",icmp,")"))
endlet // end-of-[g_print<teqi1cmp>(tdxp)]
//
(* ****** ****** *)
(* ****** ****** *)
//
#impltmp
g_print
<i0parsed>(ipar) =
let
val () =
i0parsed_fprint(ipar, g_print$out<>())end
//
(* ****** ****** *)
//
#impltmp
g_print
<i1parsed>(ipar) =
let
val () =
i1parsed_fprint(ipar, g_print$out<>())end
//
(* ****** ****** *)
(* ****** ****** *)
//
(***********************************************************************)
(* end of [ATS3/XANADU_srcgen2_xats2js_srcgen2_DATS_xats2js_tmplib.dats] *)
(***********************************************************************)

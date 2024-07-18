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
//
(*
Author: Hongwei Xi
//
Wed 13 Mar 2024 06:29:06 PM EDT
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
#staload "./../SATS/intrep0.sats"
#staload "./../SATS/intrep1.sats"
(* ****** ****** *)
(* ****** ****** *)
//
#impltmp
<x0>
i0lab_fprint
  (out, lab) = let
//
#impltmp
g_print$out<>() = out
//
in//let
case+ lab of
|
I0LAB(l01, x02) =>
print("I0LAB(",l01,";",x02,")")
end(*let*)//end-of-[i0lab_fprint]
//
#impltmp
{x0:t0}
g_print<i0lab(x0)>(ilab) =
i0lab_fprint(g_print$out<>(), ilab)
//
(* ****** ****** *)
(* ****** ****** *)
//
#impltmp
g_print
<i0pat>(i0p) =
i0pat_fprint(g_print$out<>(), i0p)
//
#impltmp
g_print
<i0exp>(i0e) =
i0exp_fprint(g_print$out<>(), i0e)
//
(* ****** ****** *)
(* ****** ****** *)
//
#impltmp
g_print
<fiarg>(fia) =
fiarg_fprint(g_print$out<>(), fia)
//
(* ****** ****** *)
//
#impltmp
g_print
<i0gua>(gua) =
i0gua_fprint(g_print$out<>(), gua)
//
#impltmp
g_print
<i0gpt>(gpt) =
i0gpt_fprint(g_print$out<>(), gpt)
//
#impltmp
g_print
<i0cls>(cls) =
i0cls_fprint(g_print$out<>(), cls)
//
(* ****** ****** *)
(* ****** ****** *)
//
#impltmp
g_print<t0imp>(timp) =
t0imp_fprint(g_print$out<>(), timp)
//
(* ****** ****** *)
//
#impltmp
g_print
<i0dcl>(idcl) =
i0dcl_fprint(g_print$out<>(), idcl)
//
(* ****** ****** *)
(* ****** ****** *)
//
#impltmp
<x0>
i1lab_fprint
  (out, lab) = let
//
#impltmp
g_print$out<>() = out
//
in//let
case+ lab of
|
I1LAB(l01, x02) =>
print("I1LAB(",l01,";",x02,")")
end(*let*)//end-of-[i1lab_fprint]
//
#impltmp
{x0:t0}
g_print<i1lab(x0)>(ilab) =
i1lab_fprint(g_print$out<>(), ilab)
//
(* ****** ****** *)
(* ****** ****** *)
//
(*
#impltmp
g_print
<i1arg>(iarg) =
i1arg_fprint(g_print$out<>(), iarg)
*)
//
#impltmp
g_print
<i1opr>(iopr) =
i1opr_fprint(g_print$out<>(), iopr)
//
#impltmp
g_print
<i1tnm>(itnm) =
i1tnm_fprint(g_print$out<>(), itnm)
//
(* ****** ****** *)
//
#impltmp
g_print
<i1val>(ival) =
i1val_fprint(g_print$out<>(), ival)
//
(* ****** ****** *)
//
#impltmp
g_print
<i1let>(ilet) =
i1let_fprint(g_print$out<>(), ilet)
#impltmp
g_print
<i1ins>(iins) =
i1ins_fprint(g_print$out<>(), iins)
//
#impltmp
g_print
<i1bnd>(ibnd) =
i1bnd_fprint(g_print$out<>(), ibnd)
#impltmp
g_print
<i1cmp>(icmp) =
i1cmp_fprint(g_print$out<>(), icmp)
//
(* ****** ****** *)
//
#impltmp
g_print
<fjarg>(farg) =
fjarg_fprint(g_print$out<>(), farg)
//
(* ****** ****** *)
//
#impltmp
g_print
<i1gua>(gua) =
i1gua_fprint(g_print$out<>(), gua)
//
#impltmp
g_print
<i1gpt>(gpt) =
i1gpt_fprint(g_print$out<>(), gpt)
//
#impltmp
g_print
<i1cls>(cls) =
i1cls_fprint(g_print$out<>(), cls)
//
(* ****** ****** *)
//
#impltmp
g_print<t1imp>(timp) =
t1imp_fprint(g_print$out<>(), timp)
//
(* ****** ****** *)
//
#impltmp
g_print
<i1dcl>(idcl) =
i1dcl_fprint(g_print$out<>(), idcl)
//
(* ****** ****** *)
(* ****** ****** *)
//
#impltmp
g_print<i0valdcl>(ival) =
i0valdcl_fprint(g_print$out<>(), ival)
#impltmp
g_print<i0vardcl>(ivar) =
i0vardcl_fprint(g_print$out<>(), ivar)
#impltmp
g_print<i0fundcl>(ifun) =
i0fundcl_fprint(g_print$out<>(), ifun)
//
(* ****** ****** *)
//
#impltmp
g_print<i1valdcl>(ival) =
i1valdcl_fprint(g_print$out<>(), ival)
#impltmp
g_print<i1vardcl>(ivar) =
i1vardcl_fprint(g_print$out<>(), ivar)
#impltmp
g_print<i1fundcl>(ifun) =
i1fundcl_fprint(g_print$out<>(), ifun)
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
print("TEQI0EXPnone(", ")")
|
TEQI0EXPsome(tok0, i0e1) =>
print("TEQI0EXPsome(",tok0,";",i0e1,")"))
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
print("TEQI1CMPnone(", ")")
|
TEQI1CMPsome(tok0, icmp) =>
print("TEQI1CMPsome(",tok0,";",icmp,")"))
endlet // end-of-[g_print<teqi1cmp>(tdxp)]
//
(* ****** ****** *)
//
#impltmp
g_print
<i0parsed>(ipar) =
let
val () =
i0parsed_fprint(g_print$out<>(), ipar)end
//
(* ****** ****** *)
//
#impltmp
g_print
<i1parsed>(ipar) =
let
val () =
i1parsed_fprint(g_print$out<>(), ipar)end
//
(* ****** ****** *)
(* ****** ****** *)

(***********************************************************************)
(* end of [ATS3/XANADU_srcgen2_xats2js_srcgen1_DATS_xats2js_tmplib.dats] *)
(***********************************************************************)

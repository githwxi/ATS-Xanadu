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
Wed Mar 11 01:27:57 PM EDT 2026
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
(* ****** ****** *)
(* ****** ****** *)
//
#impltmp
g_cmp<i0var>
  (x1, x2) =
(
g_cmp<
d2var>(x1.dvar(), x2.dvar()))
//
(* ****** ****** *)
(* ****** ****** *)
//
#impltmp
< x0:t0 >
i0lab_fprint
 (lab, out) = let
//
#impltmp
g_print$out<>() = out
//
in//let
case+ lab of
|
I0LAB(l01, x02) =>
prints("I0LAB(",l01,";",x02,")")
end(*let*)//end-of-[i0lab_fprint]
//
#impltmp
{ x0:t0 }
g_print<i0lab(x0)>(ilab) =
i0lab_fprint(ilab, g_print$out<>())
//
(* ****** ****** *)
(* ****** ****** *)
//
#impltmp
g_print
<i0typ>(ityp) =
i0typ_fprint(ityp, g_print$out<>())
//
(* ****** ****** *)
//
#impltmp
g_print
<i0jag>(ijag) =
i0jag_fprint(ijag, g_print$out<>())
//
(* ****** ****** *)
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
<i0cal>(ical) =
i0cal_fprint(ical, g_print$out<>())
//
#impltmp
g_print
<i0var>(ivar) =
i0var_fprint(ivar, g_print$out<>())
//
#impltmp
g_print
<i0exp>(iexp) =
i0exp_fprint(iexp, g_print$out<>())
//
(* ****** ****** *)
(* ****** ****** *)
//
#impltmp
g_print
<fiarg>(fia0) =
fiarg_fprint(fia0, g_print$out<>())
//
(* ****** ****** *)
//
#impltmp
g_print
<i0gua>(gua0) =
i0gua_fprint(gua0, g_print$out<>())
//
#impltmp
g_print
<i0gpt>(gpt0) =
i0gpt_fprint(gpt0, g_print$out<>())
//
#impltmp
g_print
<i0cls>(cls0) =
i0cls_fprint(cls0, g_print$out<>())
//
(* ****** ****** *)
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
prints("\
TEQI0EXPsome(",tok0,";",i0e1,")"))
endlet // end-of-[g_print<teqi0exp>(tdxp)]
//
(* ****** ****** *)
(* ****** ****** *)
//
#impltmp
g_print<i0parsed>(ipar) =
let
val () =
i0parsed_fprint(ipar, g_print$out<>())end
//
(* ****** ****** *)
(* ****** ****** *)
//
#impltmp
g_print
<i0varfst>
(   ivst   ) =
let
val () =
i0varfst_fprint(ivst, g_print$out<>())end
//
(* ****** ****** *)
(* ****** ****** *)
//
(***********************************************************************)
(* end of [ATS3/XANADU_srcgen2_xats2js_srcgen1_DATS_xats2js_tmplib.dats] *)
(***********************************************************************)

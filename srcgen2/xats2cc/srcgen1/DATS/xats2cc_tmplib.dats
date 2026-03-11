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
<i0pat>(i0p0) =
i0pat_fprint(i0p0, g_print$out<>())
//
#impltmp
g_print
<i0exp>(i0e0) =
i0exp_fprint(i0e0, g_print$out<>())
//
(* ****** ****** *)
(* ****** ****** *)
//
(*
#impltmp
g_print
<fiarg>(fia0) =
fiarg_fprint(fia0, g_print$out<>())
*)
//
(* ****** ****** *)
//
(*
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
*)
//
(* ****** ****** *)
(* ****** ****** *)
//
#impltmp
g_print<t0imp>(timp) =
t0imp_fprint(timp, g_print$out<>())
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
(***********************************************************************)
(* end of [ATS3/XANADU_srcgen2_xats2js_srcgen1_DATS_xats2js_tmplib.dats] *)
(***********************************************************************)

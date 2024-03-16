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
g_print<i0lab(x0)>(dlab) =
i0lab_fprint(g_print$out<>(), dlab)
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
g_print
<i0dcl>(dcl) =
i0dcl_fprint(g_print$out<>(), dcl)
//
(* ****** ****** *)
(* ****** ****** *)
//
#impltmp
g_print
<i1val>(i1v) =
i1val_fprint(g_print$out<>(), i1v)
//
(* ****** ****** *)
(* ****** ****** *)

(***********************************************************************)
(* end of [ATS3/XANADU_srcgen2_xinterp_srcgen1_DATS_xinterp_tmplib.dats] *)
(***********************************************************************)

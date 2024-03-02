(***********************************************************************)
(*                                                                     *)
(*                         Applied Type System                         *)
(*                                                                     *)
(***********************************************************************)

(*
** ATS/Xanadu - Unleashing the Potential of Types!
** Copyright (C) 2023 Hongwei Xi, ATS Trustful Software, Inc.
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
Sun Nov 26 18:34:25 EST 2023
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
#staload "./../SATS/xinterp.sats"
(* ****** ****** *)
(* ****** ****** *)
//
#impltmp
<x0>
irlab_fprint
  (out, lab) = let
//
#impltmp
g_print$out<>() = out
//
in//let
case+ lab of
|
IRLAB(l01, x02) =>
print("IRLAB(",l01,";",x02,")")
end(*let*)//end-of-[irlab_fprint]
//
#impltmp
{x0:t0}
g_print<irlab(x0)>(dlab) =
irlab_fprint(g_print$out<>(), dlab)
//
(* ****** ****** *)
(* ****** ****** *)
//
#impltmp
g_print
<irpat>(irp) =
irpat_fprint(g_print$out<>(), irp)
//
#impltmp
g_print
<irexp>(ire) =
irexp_fprint(g_print$out<>(), ire)
//
(* ****** ****** *)
//
#impltmp
g_print
<irgua>(gua) =
irgua_fprint(g_print$out<>(), gua)
//
#impltmp
g_print
<irgpt>(gpt) =
irgpt_fprint(g_print$out<>(), gpt)
//
#impltmp
g_print
<ircls>(dcl) =
ircls_fprint(g_print$out<>(), dcl)
//
(* ****** ****** *)
//
#impltmp
g_print
<irdcl>(ird) =
irdcl_fprint(g_print$out<>(), ird)
//
(* ****** ****** *)
//
#impltmp
g_print
<irval>(irv) =
irval_fprint(g_print$out<>(), irv)
//
#impltmp
g_print
<irlft>(lft) =
irlft_fprint(g_print$out<>(), lft)
//
(* ****** ****** *)
//
#impltmp
g_print
<fiarg>(fia0) =
let
(*
#impltmp
g_print$out<>() = out
*)
in//let
(
case+ fia0 of
|FIARG
(irps) => print("FIARG(",irps,")"))
endlet // end-of-[g_print<fiarg>(fia0)]
//
(* ****** ****** *)
//
#impltmp
g_print
<teqirexp>(tdxp) =
let
(*
#impltmp
g_print$out<>() = out
*)
in//let
(
case+ tdxp of
|
TEQIREXPnone() =>
print("TEQIREXPnone(", ")")
|
TEQIREXPsome(tok0, ire1) =>
print("TEQIREXPsome(",tok0,";",ire1,")"))
endlet // end-of-[g_print<teqirexp>(tdxp)]
//
(* ****** ****** *)
(* ****** ****** *)
#impltmp
g_print
<irvaldcl>(dval) =
(
 irvaldcl_fprint(g_print$out<>(), dval))
(* ****** ****** *)
#impltmp
g_print
<irvardcl>(dvar) =
(
 irvardcl_fprint(g_print$out<>(), dvar))
(* ****** ****** *)
#impltmp
g_print
<irfundcl>(dfun) =
(
 irfundcl_fprint(g_print$out<>(), dfun))
(* ****** ****** *)
(* ****** ****** *)

(***********************************************************************)
(* end of [ATS3/XANADU_srcgen2_xinterp_srcgen1_DATS_xinterp_tmplib.dats] *)
(***********************************************************************)

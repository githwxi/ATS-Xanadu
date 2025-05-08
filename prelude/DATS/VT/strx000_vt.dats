(***********************************************************************)
(*                                                                     *)
(*                         Applied Type System                         *)
(*                                                                     *)
(***********************************************************************)

(*
** ATS/Xanadu - Unleashing the Potential of Types!
** Copyright (C) 2025 Hongwei Xi, ATS Trustful Software, Inc.
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
(*
Wed May  7 09:33:41 AM EDT 2025
*)
Authoremail: gmhwxiATgmailDOTcom
*)
//
(* ****** ****** *)
(* ****** ****** *)
//
(*
HX:
This one is also
implemented in [gdbg000.dats]:
*)
#impltmp
{ vt:vt }
g_ptcon
<strx_vt(vt)>
( (*void*) ) =
(
pstrn("strx_vt"))
//
#impltmp
{ vt:vt }
g_ptype
<strx_vt(vt)>
( (*void*) ) =
(
pstrn("strx_vt(");
g_ptype<vt>((*0*)); pstrn(")"))
//
(* ****** ****** *)
(* ****** ****** *)
//
#impltmp
< a: vt >
strx_vt_cons(x0, xs) =
$llazy
(strxcon_vt_cons(x0, xs))
//
(* ****** ****** *)
(* ****** ****** *)
//
#impltmp
{ x0:vt }
g_free//~xs
<strx_vt(x0)>(xs) = $free(xs)
//
(* ****** ****** *)
(* ****** ****** *)
//
(*
HX-2024-07-17:
Wed 17 Jul 2024 10:27:26 PM EDT
*)
//
#impltmp
{ x0:vt }
gseq_sep
<strx_vt(x0)><x0>() = ","
#impltmp
{ x0:vt }
gseq_end
<strx_vt(x0)><x0>() = ")"
#impltmp
{ x0:vt }
gseq_beg
<strx_vt(x0)><x0>() = "strx_vt("
//
(* ****** ****** *)
//
#impltmp
{ x0:vt }
g_print0
<strx_vt(x0)>(xs) =
(
gseq_print0<strx_vt(x0)><x0>(xs)
)(*let*)//end-[g_print0<strx_vt>]
//
(* ****** ****** *)
(* ****** ****** *)
//
#impltmp
< x0:vt >
strx_vt_free(xs) = $free(xs)
#impltmp
< x0:vt >
strx_vt_eval(xs) = $eval(xs)
//
(* ****** ****** *)
(* ****** ****** *)
//
#impltmp
< x0:vt >
strx_vt_head0
  ( xs ) =
( case+ !xs of
| ~
strxcon_vt_cons(x1, xs) =>
let val () = $free(xs) in x1 end)
//
#impltmp
< x0:vt >
strx_vt_tail0
  ( xs ) =
( case+ !xs of
| ~
strxcon_vt_cons(x1, xs) =>
let val () = g_free<x0>(x1) in xs end)
//
(* ****** ****** *)
(* ****** ****** *)
//
(***********************************************************************)
(* end of [ATS3/XANADU_prelude_DATS_VT_strx000_vt.dats] *)
(***********************************************************************)
